# frozen_string_literal: true

module RSpec
  module Error
    # Exception for undefined described classes.
    #
    # @api private
    class UndefinedDescribedClass < ::RuntimeError
    end
  end
end
