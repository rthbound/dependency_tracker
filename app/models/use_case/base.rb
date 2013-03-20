module UseCase
  class Base
    def load_option(option, options)
      instance_variable_set("@#{option}", options.fetch(option.to_sym) { raise "Missing required option: #{option}" } )
    end

    def load_options(*option_names, options)
      option_names.each{|o| load_option(o, options) }
      @errors ||= []
    end

    def errors
      @errors
    end
  end
end



