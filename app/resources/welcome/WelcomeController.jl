module WelcomeController
using Genie.Renderer.Html  
function welcome()
    return html(
        :welcome, :welcome
    )
end
end
