using Genie.Router
using BooksController
using BundlesController

route("/books", BooksController.bookslist)

route("/bundles", BundlesController.bundleslist)

route("/") do 
    serve_static_file("welcome.html")
end
