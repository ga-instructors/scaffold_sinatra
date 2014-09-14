module ScaffoldSinatra
  module Scaffolds
    BASIC    = 1
    STANDARD = 2
    FULL     = 3

    def scaffolds
      context = ScaffoldSinatra::Scaffolds
      @@scaffolds ||= context.constants.reduce({}) do |hash, constant|
        hash[constant.to_s.downcase] = context.const_get(constant)
        hash
      end
    end

    def value_of(scaffold)
      scaffolds[scaffold]
    end

    def scaffold_with_value(value)
      scaffolds.key(value)
    end
  end
end
