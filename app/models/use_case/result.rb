module UseCase
  class Result
    def initialize(options)
      @success = options.fetch(:success) { !options[:errors].present? }
      @errors = options[:errors]
      @data = options[:data]
    end

    def successful?
      !!@success
    end

    def errors
      @errors
    end

    def data
      @data
    end
  end
end
