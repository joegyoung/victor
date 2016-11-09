module Victor

  class DEFS
    attr_reader :attributes

    def initialize(attributes={})
      @attributes = attributes
    end

    def to_s
      convert_hash attributes
    end

    private 

    def convert_hash(hash, indent=2)
      return hash unless hash.is_a? Hash

      result = []
      hash.each do |key, value|
        key = key.to_s.tr '_', '-'
        if value.is_a? Hash
          #result.push " " * indent + "<pattern id='#{key}' width='#{value[:width]}' height='#{value[:height]} ' patternUnits='userSpaceOnUse'> "
          result.push " " * indent + value[:details] #convert_hash(value, indent+2)

        else
          result.push " " * indent + "#{key}: #{value};"
        end
      end

      result.join "\n"
    end
  end

end