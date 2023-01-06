require "neat/generator"

module Neat
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      initializer "neat.paths", group: :all do |app|
        app.config.assets.paths << File.expand_path("../core", __dir__)
      end
    end
  else
    begin
      require "sass"
      Sass.load_paths << File.expand_path("../core", __dir__)
    rescue LoadError
    end
  end
end
