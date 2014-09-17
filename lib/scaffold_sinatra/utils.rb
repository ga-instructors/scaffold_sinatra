require_relative 'scaffolds'

module ScaffoldSinatra
  module Utils
    include ScaffoldSinatra::Scaffolds

    def self.add_scaffold_methods
      module_function(:scaffolds)
      scaffolds.each_key do |level_of|
        level = const_get(level_of.upcase)
        define_method(:"#{level_of}_scaffold?") { @value >= level }
      end
    end

    add_scaffold_methods

    def scaffold=(scaffold)
      @value = value_of(scaffold)
    end

    def scaffold
      scaffold_with_value(@value)
    end

    def is_scaffold?(scaffold)
      !ScaffoldSinatra::Scaffolds.const_get(scaffold.upcase).nil?
    end

    def include_in_scaffold?(file_name)
      scaffold = ScaffoldSinatra::Scaffolds::FILE_SCAFFOLD[file_name.to_s]
      ScaffoldSinatra::Scaffolds.const_get(scaffold.upcase) <= @value unless scaffold.nil?
    end
  end
end
