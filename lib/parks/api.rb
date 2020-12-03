class Api

    def self.get_camps(state_code)
        key = "1SDIGW8OXNOHnLrqfKYghZY0cCSlOuRMmvg37Oed"
        url = "https://developer.nps.gov/api/v1/campgrounds?stateCode=#{state_code}&api_key=#{key}"
        response = HTTParty.get(url)
        if !response["data"].empty?
            response["data"].each do |c|
                name = c["name"]
                description = c["description"]
                Campground.new(name, description)
            end
            else
                puts ""
                puts "Sorry, we couldn't find that state. Please check state abbreviation and re-enter."
                puts ""
                input = gets.chomp
                self.get_camps(input)
        end
    end
end