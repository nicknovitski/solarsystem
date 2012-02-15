require 'sinatra'
require 'haml'

class String
  def humanize
    readable = self.split("-").each{|w| w.capitalize! unless ["and", "the", "of", "a"].include? w}.join(" ")
    readable[0] = readable[0].upcase
    readable
  end
  def snake_case
    self.downcase.gsub(" ", "-").delete(",?'")
  end
end

require_relative 'book'
require_relative 'solarsystem'
require_relative 'tsoy'

def get_const(url)
  Kernel.const_get url.capitalize
end

before do
  cache_control :public, :max_age => 21600 if ENV['RACK_ENV']=="production"
end

get '/:book/onepage' do |book|
  @book = get_const(book)
  @title = @book.title
  haml :onepage
end

get "/:book/:chapter" do |book, chap_name|
  @book = get_const(book)
  @title = chap_name.humanize
  i = @book.chapters.find_index{|o| o.name == @title }
  if i
    @chapter = @book.chapters[i]
    @page_left = i==0 ? nil : @book.chapters[i-1].name
    begin
      @page_right = @book.chapters[i+1].name
    rescue NoMethodError
      @page_right = nil
    end

    haml :chapter
  else
    puts "received request for unknown chapter #{@chapter} in book #{@book}"
    redirect to("/#{book}")
  end
end

get '/:book' do |book|
  @book = get_const(book)
  @title = @book.title
  haml :toc
end

get "/:book/" do |book|
  redirect to("/#{book}")
end

get '/' do
  @books = Book.all
  haml :shelf
end