class Hash
  def flattened_keys
    each_with_object({}) do |(key, value), new_hash|
      if value.instance_of?(Hash)
        value.flattened_keys.map do |subhash_key, subhash_value|
          if key.instance_of?(Symbol) && subhash_key.instance_of?(Symbol)
            new_hash["#{key}_#{subhash_key}".to_sym] = subhash_value
          else
            new_hash["#{key}_#{subhash_key}"] = subhash_value
          end
        end
      else
        new_hash[key] = value
      end
    end
  end
end
