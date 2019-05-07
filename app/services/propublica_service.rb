class PropublicaService
  def initialize(filter)
    @state = filter[:state]
  end

  def get_members
    get_json("members/house/#{@state}/current.json")
  end

  private

    def get_json(url)
      response = conn.get(url)
      data = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new("https://api.propublica.org/congress/v1/") do |f|
        f.headers["X-Api-Key"] = ENV["propublica_key"]
        f.adapter Faraday.default_adapter
      end
    end
end
