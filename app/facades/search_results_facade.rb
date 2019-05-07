class SearchResultsFacade

  def initialize(state)
    @state = state
  end

  def header
    "#{member_data.count} Results"
  end

  def members
    member_data.map do |member_data|
      Member.new(member_data)
    end
  end

  private

    def member_data
      @_member_data ||= service.get_members[:results]
    end

    def service
      @_service ||= PropublicaService.new(state: @state)
    end
end
