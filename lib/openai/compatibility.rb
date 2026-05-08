# frozen_string_literal: true

# Ruby 2.3.8 compatibility shims used by ruby-openai when running on the older
# runtime supported by this fork. Each shim is added only when the corresponding
# method is missing, so on Ruby >= 2.5 these definitions are inert.
#
#   * Hash#compact / Hash#compact!  (added in Ruby 2.4)
#   * Hash#transform_values / Hash#transform_values!  (added in Ruby 2.4)
#   * Hash#transform_keys / Hash#transform_keys!  (added in Ruby 2.5)

class Hash
  unless method_defined?(:compact)
    def compact
      reject { |_k, v| v.nil? }
    end
  end

  unless method_defined?(:compact!)
    def compact!
      reject! { |_k, v| v.nil? }
    end
  end

  unless method_defined?(:transform_values)
    def transform_values
      return enum_for(:transform_values) { size } unless block_given?

      result = {}
      each_pair { |k, v| result[k] = yield(v) }
      result
    end
  end

  unless method_defined?(:transform_values!)
    def transform_values!
      return enum_for(:transform_values!) { size } unless block_given?

      each_pair { |k, v| self[k] = yield(v) }
      self
    end
  end

  unless method_defined?(:transform_keys)
    def transform_keys
      return enum_for(:transform_keys) { size } unless block_given?

      result = {}
      each_pair { |k, v| result[yield(k)] = v }
      result
    end
  end

  unless method_defined?(:transform_keys!)
    def transform_keys!
      return enum_for(:transform_keys!) { size } unless block_given?

      keys.each do |k|
        self[yield(k)] = delete(k)
      end
      self
    end
  end
end
