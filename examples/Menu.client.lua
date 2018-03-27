local Roact = require(game.ReplicatedStorage.Roact)
local RoactMaterial = require(game.ReplicatedStorage.RoactMaterial)

local ExampleComponent = Roact.Component:extend("MenuExampleComponent")

function ExampleComponent:init()
    self.state = {
        open = false,
    }
end

function ExampleComponent:render()
    return Roact.createElement(RoactMaterial.ThemeProvider, {
        Theme = RoactMaterial.Themes.Light,
    }, {
        Roact.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        }, {
            Roact.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundColor3 = Color3.new(1, 1, 1),
                BorderSizePixel = 0,
            }, {
                Roact.createElement(RoactMaterial.Button, {
                    Text = "Open Menu",
                    Size = UDim2.new(0, 200, 0, 40),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),

                    onClicked = function(newValue)
                        self:setState({
                            open = not self.state.open,
                        })
                    end,
                }),
                Roact.createElement(RoactMaterial.Menu, {
                    Width = UDim.new(0, 200),
                    Open = self.state.open,
                    Options = {
                        "Test",
                        "Test 2",
                        RoactMaterial.Menu.Divider,
                        "Test 3"
                    },
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    ZIndex = 2,
                })
            })
        })
    })
end

local test = Roact.createElement(ExampleComponent)

Roact.reify(test, game.Players.LocalPlayer:WaitForChild("PlayerGui"), "CheckboxExample")