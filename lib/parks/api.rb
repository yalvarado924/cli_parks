class Api

    def self.get_camps(state_code)
        key = "1SDIGW8OXNOHnLrqfKYghZY0cCSlOuRMmvg37Oed"
        url = "https://developer.nps.gov/api/v1/campgrounds?stateCode=#{state_code}&api_key=#{key}"
        response = HTTParty.get(url)
        response["data"].each do |c|
            name = c["name"]
            description = c["description"]
            Parks.new(name, description)
        end
    end
end