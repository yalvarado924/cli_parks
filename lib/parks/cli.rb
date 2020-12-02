class Cli

    def start
        puts ""
        puts "-------------------------------------------------"
        puts "Welcome to the National Parks Campground Finder!"
        puts "-------------------------------------------------"
        sleep(1)
        puts "Please type in a state abbreviation for the state where you need to find National Parks campgrounds (i.e. CA, MT)."
        puts ""
        input = gets.chomp.downcase
        Api.get_camps(input)
        display_names
        more_info
        more_options_or_exit
    end

    def display_names
        puts ""
        Campground.all.each.with_index(1) do |p,index|
            puts "#{index}. #{p.name}"
        end
    end

    def more_info
        input = nil
        while input != "exit"
            puts ""
            puts "Please type the number associated with the campground you would like more information on or type exit."
            puts ""
            input = gets.chomp.downcase
            if input.to_i.between?(1,Campground.all.length)
                user_input = Campground.all[input.to_i - 1]
                puts ""
                puts "Description: #{user_input.description}"
                sleep(1)
                more_options_or_exit
            elsif input == "exit"
                puts ""
                puts "Thanks! Have a good day!"
                exit
            else
                puts "Sorry, that's an invalid input. Please type campgrounds to see list of campgrounds again or type exit"
                    input = gets.chomp.downcase
                    if input == "campgrounds"
                        display_names
                    else
                    exit
                    end
            end
        end
    end

    def more_options_or_exit
        puts ""
        puts "Would you like to search for another state's campgrounds? Enter Y or N."
        puts ""
        input = gets.chomp.downcase
        if input == "y"
            Campground.clear
            start 
        elsif input == "n"
            puts ""
            puts "Thanks for using the National Parks Campground Finder!"
            puts ""
            exit
        else
            puts ""
            puts "Sorry, we don't understand that answer."
            Campground.clear
            start
        end
    end
end