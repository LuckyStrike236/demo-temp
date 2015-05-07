class Library
  def initialize(book, reader, order)
	@book = book
	@reader = reader
	@order = order
  end
	#who often takes books?
  def biggest_reader(book)
  	reader = Hash.new()
	reader = @reader.max_by{|order| order.count}
	return reader.first
  end
	#What is the most popular book?
  def pop_book
	book = Hash.new()
	book = @book.max_by{|reader| reader.count}
	return book.first
  end
	#How many people ordered one of the three most popular books?
  def one_of_three
	books = Hash.new(0)
    @orders.each { |order| books[order.book_name] += 1 }
    books = books.sort_by(&:last).take(num).map(&:first)
    readers = []
    @orders.each { |order| readers << order.name if books.include? order.book_name }
    readers.uniq.size
  end
end
