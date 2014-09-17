module ScaffoldSinatra
  module Scaffolds
    BASIC    = 1
    STANDARD = 2
    FULL     = 3

    FILE_SCAFFOLD = {
      "app.rb.erb"                       => "basic",
      "config.ru.erb"                    => "basic",
      "public"                           => "basic",
      "public/images"                    => "basic",
      "public/images/ga-favicon.ico"     => "basic",
      "public/images/ga-logo-small.png"  => "basic", # FIXME not working... can't put images in a gem?
      "public/stylesheets"               => "basic",
      "public/stylesheets/style.css.erb" => "basic",
      "readme.md.erb"                    => "basic",
      "views"                            => "basic",
      "views/index.erb.erb"              => "basic",
      "views/layout.erb.erb"             => "basic",
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
