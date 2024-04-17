-- create information object
Information = Object:extend()

-- information constructor
function Information:new()
    -- dimensions of Information Box
    self.x = 720
    self.y = 2
    self.width = 555
    self.height = 715

    -- sets a new font size to variable title
    title = love.graphics.newFont(18)
end

-- information draw function
function Information:draw()
    -- draws the rectangle border with the set color and line width
    love.graphics.setColor(.019607,.28627,.02745)
    love.graphics.setLineWidth(5)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

    -- draws the information box with a different color
    love.graphics.setColor(.34901,.52156,.337254)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    -- Prints the title of the box (Should be changed in future) with the earlier font size
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(title)
    love.graphics.print("Information Box", 935, 10)
end
