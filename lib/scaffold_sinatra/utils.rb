require_relative 'scaffolds'
require 'pry'
module ScaffoldSinatra
  module Utils
    include ScaffoldSinatra::Scaffolds

    def self.add_scaffolds
      module_function(:scaffolds)
      scaffolds.each_key do |level_of|
        level = const_get(level_of.upcase)
        define_method(:"#{level_of}_scaffold?") { @value >= level }
      end
    end

    add_scaffolds

    def scaffold=(scaffold)
      @value = value_of(scaffold)
    end

    def scaffold
      scaffold_with_value(@value)
    end
  end
end
