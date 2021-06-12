# frozen_string_literal: true

require_relative "base"

module RSpec
  module ExpectationTarget
    # Wraps the target of an expectation with a value.
    #
    # @example
    #   expect(something) # => ExpectationTarget::Value wrapping something
    #
    #   # used with `to`
    #   expect(actual).to be(42)
    #
    #   # with `not_to`
    #   expect(actual).not_to be(4)
    #
    # @note `RSpec::ExpectationTarget::Value` is not intended to be instantiated
    #   directly by users. Use `expect` instead.
    class Value < Base
      protected

      # @param matcher  [#matches?] The matcher.
      # @param negate   [Boolean]   The assertion is positive or negative.
      #
      # @return [nil] Write a message to STDOUT.
      #
      # @raise [SystemExit] Terminate execution immediately by calling
      #   `Kernel.exit(false)` with a failure message written to STDERR.
      def absolute_requirement(matcher:, negate:)
        valid = negate ^ matcher.matches? { @actual }

        result(
          actual:  @actual,
          error:   nil,
          got:     valid,
          matcher: matcher,
          negate:  negate,
          valid:   valid
        )
      end
    end
  end
end
