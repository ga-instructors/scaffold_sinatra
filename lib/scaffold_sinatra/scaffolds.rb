module ScaffoldSinatra
  module Scaffolds
    BASIC    = 1
    JUNIOR   = 2
    STANDARD = 3
    FULL     = 4

    FILE_SCAFFOLD = {
      "server.rb.erb"                    => "basic",
      "config.ru.erb"                    => "basic",
      "public"                           => "basic",
      "public/images"                    => "basic",
      "public/images/ga-favicon.ico"     => "basic",
      "favicon.ico"                      => "basic",
      "public/images/ga-logo-small.png"  => "basic",
      "public/stylesheets"               => "basic",
      "public/stylesheets/style.css.erb" => "basic",
      "readme.md.erb"                    => "basic",
      "views"                            => "basic",
      "views/index.erb.erb"              => "basic",
      "views/default.erb.erb"            => "basic",
      "Gemfile.erb"                      => "standard",
      "Rakefile"                         => "standard",
      "boot.rb"                          => "full",
      "helpers"                          => "full",
      ".env"                             => "full",
      ".gitignore"                       => "full"
    }

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
