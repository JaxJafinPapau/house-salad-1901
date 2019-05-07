class SearchResultsFacade

  def initialize(state)
    @state = state
  end

  def header
    "#{members.count} Results"
  end

  def members
    data = service.get_members

    service.get_members[:results].map do |member_data|
      Member.new(member_data)
    end
  end

  private

    def service
      @_service ||= PropublicaService.new(state: @state)
    end
end
