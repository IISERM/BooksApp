module Books

import SearchLight: AbstractModel, DbId, save!
import Base: @kwdef

export Book

@kwdef mutable struct Book <: AbstractModel
    id::DbId = DbId()
    name::String = ""
    author::String = ""
    description::String = ""
    has_inlinks::Bool = false
    has_ocr::Bool = false
    has_index::Bool = false
end

function seed()
    [
        Book(name="Intro to ED", author="Griff")
        Book(name="Intro to QM", author="griff")
        Book(name="Feyn Lecture 1", author="feyn", description="The raddest book ever!")
    ] .|> save!
end

end
