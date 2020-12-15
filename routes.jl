using Genie.Router
using BooksController
using BundlesController
using WelcomeController

route("/books") do 
    queryString = haskey(@params, :q) ? @params(:q) : nothing
    println("Query: ", queryString)
    return BooksController.bookslist(queryString)
end

route("/bundles") do 
    queryString = haskey(@params, :q) ? @params(:q) : nothing
    println("Query: ", queryString)
    return BundlesController.bundleslist(queryString)
end

route("/", WelcomeController.welcome)
