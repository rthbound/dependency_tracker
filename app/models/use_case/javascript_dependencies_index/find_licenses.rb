module UseCase
  module JavascriptDependenciesIndex
    class FindLicenses < ::UseCase::Base

      def initialize(options)
        load_options(:file, options)
      end

      # @find_licenses.execute!
      def execute!
        @rets = ""
        begin
          read_for_comment
        rescue EOFError
        end

        if @errors.empty?
          return UseCase::Result.new(data: { license: @rets })
        else
          return UseCase::Result.new(data: { licenses: @rets }, errors: @errors)
        end
      end

      private
      def read_for_comment
        # if line starts with comment (#, ###, /*, //)
        line = @file.readline.lstrip

        case line.first
        when "/"
          block_start(line)         if line.first(2) == "/*"
          single_line_comment(line) if line.first(2) == "//"
        when "#"
          line.first(3) == "###" ? coffee_block_start : single_line_comment(line)
        else
          @rets
        end
      end

      def block_start(line)
        @rets << line
        line[2..-1].include?("*/") ? block_comment_ended : read_for_block_end
      end

      def coffee_block_start(line)
        @rets << line
        line[3..-1].include?("###") ? block_comment_ended : read_for_coffee_block_end
      end

      def read_for_coffee_block_end
        line = @file.readline.lstrip
        @rets << line
        line.include?("###") ? read_for_comment : read_for_coffee_block_end
      end


      def read_for_block_end
        line = @file.readline.lstrip
        @rets << line
        line.include?("*/") ? read_for_comment : read_for_block_end
      end

      def single_line_comment(line)
        @rets << line
        read_for_comment
      end

      def block_comment_ended
        read_for_comment
      end
    end
  end
end
