class Chapter
  attr_reader :name, :sections
  def initialize (title, sections=nil)
    @name, @sections = title, sections
  end
end

class Book
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
  def self.chapter(title, sections=nil)
    @chapters ||= []
    @chapters << Chapter.new(title, sections)
  end
end