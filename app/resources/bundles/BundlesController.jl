module BundlesController
using Bundles
using Genie.Renderer.Html
using SearchLight

searchQuery(query) = type ->
    find(
        type,
        SQLWhereExpression(
            "name LIKE ?", 
            "%$(query)%"
        )
    )


function bundleslist(queryString::Union{String,Nothing})
    getBundles = isnothing(queryString) ? all : searchQuery(queryString)
    html(
        :bundles, :bundleslist, 
        context=@__MODULE__,
        bundles=getBundles(Bundle), 
        query=isnothing(queryString) ? "" : queryString
    )
end

end
