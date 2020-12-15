module BooksController
using Genie.Renderer.Html
using Books
using SearchLight

searchQuery(query) = type ->
    find(
        type,
        SQLWhereExpression(
            "name LIKE ? OR author LIKE ? OR description LIKE ?", 
            fill("%$(query)%", 3)
        )
    )

function bookslist(queryString::Union{String,Nothing})
    getBooks = isnothing(queryString) ? all : searchQuery(queryString)
    return html(
        :books, :bookslist, 
        books=getBooks(Book), 
        query=isnothing(queryString) ? "" : queryString
    )
end

end
