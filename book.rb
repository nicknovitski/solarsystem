class Chapter
  attr_reader :name, :sections
  def initialize(title, sections=nil, &block)
    @name = title
    if block_given?
      @sections = []
      instance_eval &block
    else
      @sections = sections
    end
  end
  def section(title)
    @sections << title
  end
end

class Book
  @descendants = []
  def self.title(title)
    @title = title
    def self.title
      @title
    end
  end
  def self.url(url)
    @url = url
    def self.url
      @url
    end
  end
  def self.credit(credit)
    @credit = credit
    def self.credit
      @credit
    end
  end
  def self.chapters
    @chapters
  end
  def self.chapter(title, sections=nil, &block)
    @chapters ||= []
    @chapters << Chapter.new(title, sections, &block)
  end
  def self.inherited(child)
    @descendants << child
  end
  def self.all
    @descendants
  end
end