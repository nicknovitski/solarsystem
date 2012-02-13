module Solarsystem
  def self.title
    "The Solar System"
  end
  def self.url
    "solarsystem"
  end
  def self.credit
    "Arkenstone Press 2008"
  end

  @foreword = Struct::Chapter.new("Foreword")
  @chapter1 = Struct::Chapter.new("Starting a Game", ["Choosing a Setting",
                                                     "Focal Points",
                                                     "Overview of the Game",
                                                     "Introducing Crunch",
                                                     "Initial Crunch"])
  @chapter2 = Struct::Chapter.new("Character Creation", ["Abilities",
                                                        "Heroic Event",
                                                        "Character Background",
                                                        "Cultural Identity",
                                                        "Passive Abilities",
                                                        "Dividing Pools",
                                                        "Choosing Secrets and Keys",
                                                        "Finalizing the character",
                                                        "Initial situation",
                                                        "Player character party"])
  @chapter3 = Struct::Chapter.new("Playing the Game", ["Starting up the session",
                                                       "Scenes",
                                                       "Tasks in Free Play",
                                                       "Choice as content",
                                                       "Conflicts",
                                                       "Consequences",
                                                       "Pool Refreshment",
                                                       "Harm",
                                                       "Bird's eye view"])
  @chapter4 = Struct::Chapter.new("Ability Check", ["Timing and stakes",
                                                   "Narrating success",
                                                   "No suitable Ability?",
                                                   "Bonus and penalty dice",
                                                   "Circumstance penalties",
                                                   "Supporting a check",
                                                   "Recording Effects",
                                                   "Using Effects"])
  @chapter5 = Struct::Chapter.new("Conflict Resolution", ["Initiating conflict",
                                                         "Conflict stakes",
                                                         "Leverage, propriety and scope",
                                                         "Selecting Abilities",
                                                         "Resolving the conflict",
                                                         "Ability checks in conflict",
                                                         "Several characters in conflict",
                                                         "Solo conflicts",
                                                         "Secondary characters in conflict"])
  @chapter6 = Struct::Chapter.new("Extended Conflict", ["Why extend?",
                                                       "Scope and stakes in extended conflict",
                                                       "Negotiation phase",
                                                       "The defensive action",
                                                       "Resolving actions",
                                                       "Rolling a tie",
                                                       "Ending a round",
                                                       "Special actions",
                                                       "Multiple characters in extended conflict",
                                                       "Against Effects",
                                                       "Strategy in Extended Conflict"])
  @chapter7 = Struct::Chapter.new("Keys and Experience", ["Gaining and Using Advances",
                                                         "Advance Debt",
                                                         "Losing Benefits",
                                                         "Transcendence",
                                                         "Wrapping up the campaign"])
  @chapter8 = Struct::Chapter.new("Secrets and Crunch", ["Learning Secrets",
                                                        "Developing new Secrets",
                                                        "Advanced Crunch",
                                                        "Equipment ratings",
                                                        "Drugs",
                                                        "Werewolves",
                                                        "Martial Arts"])
  @chapter9 = Struct::Chapter.new("Story Guide", ["Preparing for play",
                                                 "Elements of preparation",
                                                 "Adventure map",
                                                 "Framing Scenes",
                                                 "Secondary Characters",
                                                 "Running Conflicts",
                                                 "Rules Arbitration",
                                                 "Running a campaign"])
  @afterword = Struct::Chapter.new("Afterword")
  @appendices = Struct::Chapter.new("Appendices", ["Example Abilities", "Example Keys", "Example Secrets"])

  def self.chapters
    [@foreword, @chapter1, @chapter2, @chapter3, @chapter4, @chapter5, @chapter6, @chapter7, @chapter8, @chapter9, @afterword, @appendices]
  end

end
