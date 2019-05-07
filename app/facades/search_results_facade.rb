class SearchResultsFacade

  def initialize(state)
    @state = state
  end

  def header
    "#{members.count} Results"
  end


  def members
    service = PropublicaService.new(state: @state)

    data = service.get_members

    data[:results].map do |member_data|
      Member.new(member_data)
    end




    conn = Faraday.new("https://api.propublica.org/congress/v1/members/house/#{@state}/current.json") do |f|
      f.headers["X-Api-Key"] = ENV["propublica_key"]
      f.adapter Faraday.default_adapter
    end

    response = conn.get

    data = JSON.parse(response.body, symbolize_names: true)

    data[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end
