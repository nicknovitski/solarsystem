require 'sinatra'
require 'haml'

class String
  def humanize
    self.split("-").each{|w| w.capitalize! unless ["and", "the", "of", "a"].include? w}.join(" ")
  end
  def snake_case
    self.downcase.gsub(" ", "-").delete(",?'")
  end
end

module SolSys
  Struct.new("Chapter", :name, :sections)
  TOC = Struct::Chapter.new("Table of Contents")
  FOREWORD = Struct::Chapter.new("Foreword")
  CHAPTER1 = Struct::Chapter.new("Starting a Game", ["Choosing a Setting",
                                                     "Focal Points",
                                                     "Overview of the Game",
                                                     "Introducing Crunch",
                                                     "Initial Crunch"])
  CHAPTER2 = Struct::Chapter.new("Character Creation", ["Abilities",
                                                        "Heroic Event",
                                                        "Character Background",
                                                        "Cultural Identity",
                                                        "Passive Abilities",
                                                        "Dividing Pools",
                                                        "Choosing Secrets and Keys",
                                                        "Finalizing the character",
                                                        "Initial situation",
                                                        "Player character party"])
  CHAPTER3 = Struct::Chapter.new("Playing the Game", ["Starting up the session",
                                                       "Scenes",
                                                       "Tasks in Free Play",
                                                       "Choice as content",
                                                       "Conflicts",
                                                       "Consequences",
                                                       "Pool Refreshment",
                                                       "Harm",
                                                       "Bird's eye view"])
  CHAPTER4 = Struct::Chapter.new("Ability Check", ["Timing and stakes",
                                                   "Narrating success",
                                                   "No suitable Ability?",
                                                   "Bonus and penalty dice",
                                                   "Circumstance penalties",
                                                   "Supporting a check",
                                                   "Recording Effects",
                                                   "Using Effects"])
  CHAPTER5 = Struct::Chapter.new("Conflict Resolution", ["Initiating conflict",
                                                         "Conflict stakes",
                                                         "Leverage, propriety and scope",
                                                         "Selecting Abilities",
                                                         "Resolving the conflict",
                                                         "Ability checks in conflict",
                                                         "Several characters in conflict",
                                                         "Solo conflicts",
                                                         "Secondary characters in conflict"])
  CHAPTER6 = Struct::Chapter.new("Extended Conflict", ["Why extend?",
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
  CHAPTER7 = Struct::Chapter.new("Keys and Experience", ["Gaining and Using Advances",
                                                         "Advance Debt",
                                                         "Losing Benefits",
                                                         "Transcendence",
                                                         "Wrapping up the campaign"])
  CHAPTER8 = Struct::Chapter.new("Secrets and Crunch", ["Learning Secrets",
                                                        "Developing new Secrets",
                                                        "Advanced Crunch",
                                                        "Equipment ratings",
                                                        "Drugs",
                                                        "Werewolves",
                                                        "Martial Arts"])
  CHAPTER9 = Struct::Chapter.new("Story Guide", ["Preparing for play",
                                                 "Elements of preparation",
                                                 "Adventure map",
                                                 "Framing Scenes",
                                                 "Secondary Characters",
                                                 "Running Conflicts",
                                                 "Rules Arbitration",
                                                 "Running a campaign"])
  AFTERWORD = Struct::Chapter.new("Afterword")
  APPENDICES= Struct::Chapter.new("Appendices", ["Example Abilities", "Example Keys", "Example Secrets"])

  CHAPTERS = [FOREWORD,
              CHAPTER1,
              CHAPTER2,
              CHAPTER3,
              CHAPTER4,
              CHAPTER5,
              CHAPTER6,
              CHAPTER7,
              CHAPTER8,
              CHAPTER9,
              AFTERWORD,
              APPENDICES]

end



before do
  cache_control :public, :max_age => 21600 if ENV['RACK_ENV']=="production"
  @chapters = SolSys::CHAPTERS
  @book = "solarsystem"
end

get '/tsoy' do
  @title = "World of Near"
  haml :worldofnear
end

get '/solarsystem/onepage' do
  @title = "The Solar System"
  haml :onepage
end

get "/solarsystem/:chapter" do |chap_name|
  @title = chap_name.humanize
  i = @chapters.find_index{|o| o.name == @title }
  if i
    @chapter = @chapters[i]
    @page_left = i==0 ? nil : @chapters[i-1].name
    begin
      @page_right = @chapters[i+1].name
    rescue NoMethodError
      @page_right = nil
    end

    haml :chapter, {:locals=>{:chapter=>@chapters[i]}}
  else
    redirect to("/solarsystem")
  end
end

get '/solarsystem' do
  haml :toc, {:locals=>{:chapter=>SolSys::TOC}}
end

get "/solarsystem/" do
  redirect to("/solarsystem")
end

get '/' do
  redirect to('/solarsystem')
end