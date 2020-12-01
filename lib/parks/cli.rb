class Cli

    def start
        puts "Welcome to the National Parks Campground Finder!"
        puts "Please type in a state abbreviation for the state in which you need to find National Parks campgrounds (i.e. CA, MT)."
        input = gets.chomp
        Api.get_camps(input)
        display_names
        more_info
    end

    def display_names
        Parks.all.each.with_index(1) do |p,index|
            puts "#{index}. #{p.name}"
        end
    end

    def more_info
        puts "If you would like to see more information about a specific campground, please enter the number associated with that campground name."
        input = gets.chomp.to_i
        index = input - 1
        user_input = Parks.all[index]
        puts user_input.description
    end
end