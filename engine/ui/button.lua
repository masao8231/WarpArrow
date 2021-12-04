require("engine.ui.box")
require("engine.ui.label")
Button = Box:extend()

--Create the button 
function Button:new(x, y, w, h, color, label, label_color, hover_color, hover_label_color)
    Button.super.new(self, x, y, w, h, color)
    self.label_color = label_color or {1,1,1}
    --colors using for hovering 
    self.hover_color = hover_color or {0, 0, 0}
    self.hover_label_color = hover_label_color or {1, 1, 1}
    
    self.current_btn_color = self.color
    self.label = Label(x, y, label, self.label_color)

end

--Draws the button 
function Button:draw()
    love.graphics.setColor(self.current_btn_color)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height)
    self.label:draw()
end

--Check the mouse hovering 
function Button:isMouseHovering()
    local mouse_x, mouse_y = love.mouse.getPosition()
    return mouse_x > self.position.x and mouse_y > self.position.y and mouse_x < self.position.x + self.width and mouse_y < self.position.y + self.height
end 

--Update the button 
function Button:update()
   if self:isMouseHovering() then
       self.current_btn_color = self.hover_color
       self.label.color = self.hover_label_color
   else
       self.current_btn_color = self.color 
       self.label.color = self.label_color
   end 
end