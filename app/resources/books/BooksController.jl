module BooksController
using Genie.Renderer.Html
using Books
function bookslist()
    html(:books, :bookslist, books=all(Book))
end

end
