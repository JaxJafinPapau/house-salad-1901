class PropublicaService
  def initialize(filter)
    @state = filter[:state]
  end

  def get_members
    conn = Faraday.new("https://api.propublica.org/congress/v1/members/house/#{@state}/current.json") do |f|
      f.headers["X-Api-Key"] = ENV["propublica_key"]
      f.adapter Faraday.default_adapter
    end

    response = conn.get

    data = JSON.parse(response.body, symbolize_names: true)

  end

end
