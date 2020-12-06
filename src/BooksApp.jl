module BooksApp

using Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = BooksApp))

  include(joinpath("..", "genie.jl"))

  Base.eval(Main, :(const Genie = BooksApp.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end
