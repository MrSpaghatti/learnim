import std/json
import std/os
import sets

const AppName = "Nimlings"
const StateFileName = "state.json"

type
  UserState* = object
    completedExercises*: seq[string] # Paths of completed exercises
    points*: int
    earnedBadges*: HashSet[string] # IDs of earned badges for quick lookup and no duplicates

proc getStateFilePath*(): string =
  var configDir = getConfigDir()
  # On Linux, this is typically ~/.config. On Windows, %APPDATA%. On macOS, ~/Library/Application Support.
  # We'll create a subdirectory for our application.
  result = configDir / AppName / StateFileName
  # Ensure the directory exists
  createDir(parentDir(result))

proc loadState*(): UserState =
  let stateFile = getStateFilePath()
  if fileExists(stateFile):
    try:
      let data = readFile(stateFile)
      let j = parseJson(data)
      var completed: seq[string]
      for item in j["completedExercises"]:
        completed.add(item.getStr())
      var earned: seq[string]
      for item in j["earnedBadges"]:
        earned.add(item.getStr())
      result = UserState(
        completedExercises: completed,
        points: j["points"].getInt(),
        earnedBadges: toHashSet(earned)
      )
    except (JsonParsingError, KeyError) as e:
      echo "Warning: Could not parse state file: ", e.msg, ". Starting with a fresh state."
      result = UserState(completedExercises: @[], points: 0, earnedBadges: initHashSet[string]())
    except IOError:
      echo "Warning: Could not read state file. Starting with a fresh state."
      result = UserState(completedExercises: @[], points: 0, earnedBadges: initHashSet[string]())
  else:
    # New user, fresh state
    result = UserState(completedExercises: @[], points: 0, earnedBadges: initHashSet[string]())

proc saveState*(state: UserState) =
  let stateFile = getStateFilePath()
  try:
    var j: JsonNode
    j = %*{"completedExercises": %state.completedExercises, "points": %state.points, "earnedBadges": %toSeq(state.earnedBadges)}
    writeFile(stateFile, j.pretty)
  except IOError:
    echo "Error: Could not write state file to " & stateFile

# Example usage (can be removed or put behind a `when isMainModule` block for testing)
when isMainModule:
  var state = loadState()
  echo "Loaded state: ", state.completedExercises

  if "exercises/01_variables/variables1.nim" notin state.completedExercises:
    state.completedExercises.add("exercises/01_variables/variables1.nim")

  saveState(state)
  echo "Saved state: ", state.completedExercises

  # Test loading it back
  let newState = loadState()
  echo "Reloaded state: ", newState.completedExercises
