
#!/bin/ruby
def displayPathtoPrincess(n,grid)
    if grid[0][0] == 'p'
        horz = 'LEFT'
        vert = 'UP'
    else if grid[0][n-1] == 'p'
            horz = 'RIGHT'
            vert = 'UP'
        else if grid[n-1][0] == 'p'
                horz = 'LEFT'
                vert = 'DOWN'
            else
                horz = 'RIGHT'
                vert = 'DOWN'
            end
        end
    end
    m = n/2
    (0...m).each do
        puts(horz)
        puts(vert)
    end
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)

