import Pkg
Pkg.activate(".")
println("installing packages")
Pkg.instantiate()

using Genie

println("write secret file")
Genie.Generator.write_secrets_file()

println("done")
exit()
