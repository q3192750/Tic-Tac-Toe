class Board
    def initialize
        @positions = ["1","2","3","4","5","6","7","8","9"]
        @turns = ["X","O","X","O","X","O","X","O","X"]
        @turnno = 0
    end

    def draw
        #draws the board
        puts ""
        puts "| #{@positions[0]} | #{@positions[1]} | #{@positions[2]} |"
        puts "  -   -   -"
        puts "| #{@positions[3]} | #{@positions[4]} | #{@positions[5]} |"
        puts "  -   -   -"
        puts "| #{@positions[6]} | #{@positions[7]} | #{@positions[8]} |"
        puts ""
    end

    def set(pos,marker)
        #set a mark on the board
        @positions[pos-1] = marker
    end

    def checkwin
        #checks for win condition
        if @positions[0] == @positions[1] and @positions[0] == @positions[2]
            return "win"
        elsif @positions[3] == @positions[4] and @positions[3] == @positions[5]
            return "win"
        elsif @positions[6] == @positions[7] and @positions[6] == @positions[8]
            return "win"
        elsif @positions[0] == @positions[3] and @positions[0] == @positions[6]
            return "win"
        elsif @positions[1] == @positions[4] and @positions[1] == @positions[7]
            return "win"
        elsif @positions[2] == @positions[5] and @positions[2] == @positions[8]
            return "win"
        elsif @positions[0] == @positions[4] and @positions[0] == @positions[8]
            return "win"
        elsif @positions[2] == @positions[4] and @positions[2] == @positions[6]
            return "win"
        end
    end

    def round(player)
        puts "#{player}, your turn! Which position do you choose?"
        @pos = gets.chomp.to_i
        until (@pos >= 1 && @pos <= 9 && @pos.is_a?(Integer) && not(@positions[@pos-1] == "X") && not(@positions[@pos-1] == "O"))
            puts "#{player}, concentrate! Which position do you choose?"
            @pos = gets.chomp.to_i
        end
        self.set(@pos,@turns[@turnno])
        self.draw
    end

    def start_game
        #Greeting & Initialization
        puts "Hi, welcome to a round of Tic-Tac-Toe!"
        self.draw
        #Loop through turns and break out in case of win
        while @turnno < 9
            self.round(@turns[@turnno])
            if self.checkwin == "win"
                break
            end
            @turnno += 1
        end
        #Announce win or draw
        if self.checkwin == "win"
            puts "Congratulations, #{@turns[@turnno]} won the game!"
        elsif puts "That was a draw!"
        end
        #Restart Loop
        while true
            puts "Do you want to play another game? (Y/N)"
            restart = gets.chomp
            if restart == "y" || restart == "Y"
                self.initialize
                self.start_game
            elsif restart == "n" || restart == "N"
                puts "OK, bye!"
                break
            end
        end
    end
    
end

board = Board.new
board.start_game