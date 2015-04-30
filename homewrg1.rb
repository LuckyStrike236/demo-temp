class BookOrder
  attr_reader :book_name, :name, :order_date

  def initialize(book_name, name, order_date = Time.now)
    @book_name, @name, @order_date = book_name, name, order_date 
  end
end

class Library
  def initialize
    @orders = []
  end

  # who often takes the book
  def best_reader(book)
    readers = Hash.new(0)
    @orders.each { |order| readers[order.name] += 1 if order.book_name == book }  
    readers.max_by{ |key, value| value }.first
  end

  # what is the most popular book
  def popular_book
    books = Hash.new(0)
    @orders.each { |order| books[order.book_name] += 1 }  
    book = books.max_by{ |key, value| value }.first
  end

  # how many people ordered one of the __number__ most popular books.
  def peoples_count_ordered_one_popular_book(num)
    books = Hash.new(0)
    @orders.each { |order| books[order.book_name] += 1 }
    books = books.sort_by(&:last).take(num).map(&:first)
    readers = []
    @orders.each { |order| readers << order.name if books.include? order.book_name }
    readers.uniq.size
  end

  def add(book_record)
    @orders << book_record
  end
end
