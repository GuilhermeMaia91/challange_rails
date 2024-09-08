module ApplicationManager
  class Lister
    DEFAULT_PAGE = 1
    DEFAULT_PER_PAGE = 20

    def initialize(page, per_page, filters = {})
      self.page = page
      self.per_page = per_page
      @filters = filters.with_indifferent_access
    end

    def build
      filter.page(@page).per(@per_page)
    end

    def filter
      raise NotImplementedError
    end

    private

    def page=(page)
      @page = page.to_i
      @page = DEFAULT_PAGE if @page.zero?
    end

    def per_page=(per_page)
      @per_page = per_page.to_i
      @per_page = DEFAULT_PER_PAGE if @per_page.zero?
    end
  end
end
