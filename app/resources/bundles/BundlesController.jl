module BundlesController
using Books
using Genie.Renderer.Html

@enum BundleSeverity Mandatory Preferred Optional
struct Bundle
    name::String
    books::Array{String}
    type::BundleSeverity
end

bundles = [
    Bundle("Year 1", ["1", "2", "4"], Mandatory)
    Bundle("Year 2", ["1", "4", "3"], Mandatory)
    Bundle("Year 3", ["1", "2", "5"], Mandatory)
]

function bundleslist()
    html(:bundles, :bundleslist, bundles=bundles)
end

end
