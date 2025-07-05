import tables

type
  Badge* = object
    id*: string          # Unique identifier, e.g., "TOPIC_MASTER_01_VARIABLES"
    name*: string         # Display name, e.g., "Master of Variables"
    description*: string  # How to earn it or what it means
    emoji*: string        # A representative emoji (optional)

# Using a Table for easy lookup by ID
var allBadges*: Table[string, Badge] = initTable[string, Badge]()

proc defineBadge(id: string, name: string, description: string, emoji: string = "🏆") =
  allBadges[id] = Badge(id: id, name: name, description: description, emoji: emoji)

import lessons # Corrected import
import state
import strutils

# --- Define All Badges ---

# Point Collector Badges
defineBadge("POINT_COLLECTOR_BRONZE", "Point Collector - Bronze", "Reach 50 points.", "🥉")
defineBadge("POINT_COLLECTOR_SILVER", "Point Collector - Silver", "Reach 100 points.", "🥈")
defineBadge("POINT_COLLECTOR_GOLD", "Point Collector - Gold", "Reach 200 points.", "🥇")

# Specific Milestones
defineBadge("FIRST_STEPS", "First Steps Taken", "Complete all exercises in the '00_introduction' topic.", "👣")
defineBadge("CLI_NAVIGATOR", "CLI Navigator", "Complete all exercises in the '00_cli_basics' topic.", "🧭")

# Exercise Count Milestones
defineBadge("NOVICE_NIMBLER_3", "Novice Nimbler (3)", "Complete 3 different exercises.", "🌱")
defineBadge("NOVICE_NIMBLER_5", "Novice Nimbler (5)", "Complete 5 different exercises.", "🌿")


# Helper to get a badge by ID
proc getBadge*(id: string): Option[Badge] =
  if id in allBadges:
    return some(allBadges[id])
  else:
    return none[Badge]()

proc checkAndAwardBadges*(userState: var state.UserState, allExercises: seq[lessons.Exercise]): seq[Badge] =
  ## Checks all badge conditions and awards new badges to the user.
  ## Modifies userState directly if new badges are earned.
  ## Returns a sequence of newly awarded badges.
  result = @[]
  var newBadgesFound = false

  # 1. Point Collector Badges
  let pointBadges = [
    ("POINT_COLLECTOR_BRONZE", 50),
    ("POINT_COLLECTOR_SILVER", 100),
    ("POINT_COLLECTOR_GOLD", 200)
  ]
  for (badgeId, requiredPoints) in pointBadges:
    if userState.points >= requiredPoints and badgeId notin userState.earnedBadges:
      userState.earnedBadges.incl(badgeId)
      result.add(allBadges[badgeId])
      newBadgesFound = true

  # 2. Exercise Count Milestones
  let completedCount = userState.completedExercises.len
  let countBadges = [
    ("NOVICE_NIMBLER_3", 3),
    ("NOVICE_NIMBLER_5", 5)
    # Add more here: ("NOVICE_NIMBLER_10", 10) etc.
  ]
  for (badgeId, requiredCount) in countBadges:
    if completedCount >= requiredCount and badgeId notin userState.earnedBadges:
      userState.earnedBadges.incl(badgeId)
      result.add(allBadges[badgeId])
      newBadgesFound = true

  # 3. Topic Master Badges & Specific Topic Milestones (FIRST_STEPS, CLI_NAVIGATOR)
  var exercisesByTopic = newTable[string, seq[lessons.Exercise]]()
  for ex in allExercises:
    exercisesByTopic.mgetOrPut(ex.topic, @[]).add(ex)

  for topic, topicExercises in exercisesByTopic:
    var allInTopicCompleted = true
    if topicExercises.len == 0: allInTopicCompleted = false # Cannot master an empty topic

    for exInTopic in topicExercises:
      if exInTopic.path notin userState.completedExercises:
        allInTopicCompleted = false
        break

    if allInTopicCompleted:
      # Specific named topic badges
      if topic == "00_introduction":
        let badgeId = "FIRST_STEPS"
        if badgeId notin userState.earnedBadges:
          userState.earnedBadges.incl(badgeId)
          result.add(allBadges[badgeId])
          newBadgesFound = true
      elif topic == "00_cli_basics":
        let badgeId = "CLI_NAVIGATOR"
        if badgeId notin userState.earnedBadges:
          userState.earnedBadges.incl(badgeId)
          result.add(allBadges[badgeId])
          newBadgesFound = true

      # Generic Topic Master badge
      # Sanitize topic name for ID: replace non-alphanum with underscore, uppercase.
      let topicIdPart = topic.mapChars(proc(c: char): char =
        if c.isAlphaNumeric(): c.toUpperAscii() else: '_'
      ).filterChars(proc(c: char): bool = c.isAlphaNumeric() or c == '_')

      let masterBadgeId = "TOPIC_MASTER_" & topicIdPart
      if masterBadgeId notin allBadges: # Dynamically define if not predefined
        defineBadge(masterBadgeId, "Master of " & topic, "Complete all exercises in the '" & topic & "' topic.", "🌟")

      if masterBadgeId notin userState.earnedBadges:
        userState.earnedBadges.incl(masterBadgeId)
        result.add(allBadges[masterBadgeId]) # Assumes it's now defined
        newBadgesFound = true

  # if newBadgesFound:
  #   state.saveState(userState) # The caller (runExercise) should save the state.

when isMainModule:
  echo "Defined Badges:"
  for id, badge in allBadges:
    echo badge.emoji, " ", badge.id, ": ", badge.name, " - ", badge.description

  echo "\nGetting badge 'FIRST_STEPS':"
  let fs = getBadge("FIRST_STEPS")
  if fs.isSome:
    echo fs.get.name
  else:
    echo "Not found."
