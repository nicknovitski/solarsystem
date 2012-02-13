module Tsoy
  def self.title
    "The World of Near"
  end
  def self.url
    "tsoy"
  end
  def self.credit
    "Arkenstone Press 2009"
  end
  @frontmatter = Struct::Chapter.new("Front Matter", ["Introduction", "Campaigning", "Abilities",
                                                      "Secrets", "Keys", "Equipment"])
  @firstmovement = Struct::Chapter.new("The Shorter Near", ["Near", "Maldor", "Sun & Moon",
                                                            "Warcraft", "Three-Corner", "Ratkin",
                                                            "Myth of the Skyfire"])
  @secondmovement = Struct::Chapter.new("Matter of Ammeni", ["Ammeni", "Alchemy", "Trade",
                                                             "Zaru", "Zu", "Khale", "Qek",
                                                             "Knotwork", "Spiritwork",
                                                             "The Idea of Ammeni"])
  @thirdmovement = Struct::Chapter.new("Southern Initiative", ["Goren", "Sky God Faith",
                                                               "Witchcraft", "Vulfen", "Vulfland",
                                                               "Dreaming", "Second Wolf Age"])
  @fourthmovment = Struct::Chapter.new("Species of Near", ["Human Equation", "Elves", "Goblins"])
  @fifthmovment = Struct::Chapter.new("Margin Notes", ["Orania", "Inselburg", "Pere-di-Fey",
                                                       "Seafaring", "Nine Celestials",
                                                       "The Horned God", "Sireap Valley",
                                                       "First City", "Going Out",
                                                       "A Love Letter to a Storygamer"])
  def self.chapters
    [@frontmatter, @firstmovement, @secondmovement, @thirdmovement, @fourthmovment, @fifthmovment]
  end
end