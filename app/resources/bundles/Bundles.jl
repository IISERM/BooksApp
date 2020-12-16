module Bundles

import SearchLight: AbstractModel, DbId, save!
import Base: @kwdef
import JSON: json, parse

export Bundle, getBooks, getSeverity

@enum BundleSeverity Mandatory Preferred Optional

mutable struct Bundle <: AbstractModel
    id::DbId
    name::String
    books::String
    type::Int
    function Bundle(;name::String="", books::String="[]", type::Int=0)
        new(DbId(), name, books, type)
    end
    function Bundle(name::String, books::Array{String}, severity::BundleSeverity)
        Bundle(name=name, books=json(books), type=Int(severity))
    end
end

getBooks(bundle::Bundle) = parse(bundle.books)
    
getSeverity(bundle::Bundle) = BundleSeverity(bundle.type)

function seed()
    [
        Bundle("Year 1", ["1", "2", "4"], Mandatory)
        Bundle("Year 2", ["1", "4", "3"], Mandatory)
        Bundle("Year 3", ["1", "2", "5"], Mandatory)
    ] .|> save!
end

end
