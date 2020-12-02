class Cli

    def start
        puts ""
        puts "--------------------------------------------------"
        puts "Welcome to the National Parks Campground Finder!"
        puts "--------------------------------------------------"
        sleep(1)
        puts "Please type in a state abbreviation for the state in which you need to find National Parks campgrounds (i.e. CA, MT)."
        puts ""
        input = gets.chomp
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
        puts ""
        puts "If you would like to see more information about a specific campground, please enter the number associated with that campground name or type exit."
        puts ""
        input = gets.chomp.to_i
        input != "exit"
        index = input - 1
        user_input = Campground.all[index]
        puts "Description: #{user_input.description}"
    end

    def more_options_or_exit
        puts ""
        puts "Would you like to search for another state's campground? Enter Y or N."
        input = gets.chomp.downcase
        if input == "y"
            Campground.clear
            start 
        elsif input == "n"
            puts "Thanks for using the National Parks Campground Finder!"
            exit
        else
            puts "Sorry, we don't understand that answer. Have a good day!"
            exit
        end
    end
end