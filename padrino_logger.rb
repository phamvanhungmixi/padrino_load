require 'padrino-core'

module Padrino
  class << self
    alias :require_dependencies_without_log :require_dependencies
    def require_dependencies(*path)
      require_dependencies_without_log(*path)
    rescue NameError, LoadError => e
      puts "require_dependencies: caught #{e.class}: #{e}"
      raise
    end
  end

  module Reloader
    class << self
      alias :remove_constant_without_print :remove_constant
      def remove_constant(const)
        if constant_excluded?(const)
          puts "remove_constant(excluded): #{const}"
        else
          puts "remove_constant: #{const}"
        end
        remove_constant_without_print(const)
      end

      alias :with_silence_without_log :with_silence
      def with_silence(&block)
        with_silence_without_log(&block)
      rescue Exception => e
        puts "error: #{e}"
        raise
      end

      alias :safe_load_without_log :safe_load
      def safe_load(file, options={})
        puts "safe_load: #{file}"
        safe_load_without_log(file, options)
      end

      alias :file_changed_without_log :file_changed?
      def file_changed?(file)
        result = file_changed_without_log(file)
        puts "file_changed?: #{result}"
        result
      end

      alias :feature_excluded_without_log :feature_excluded?
      def feature_excluded?(file)
        result = feature_excluded_without_log(file)
        puts "feature_excluded?: #{result}"
        result
      end
    end

    module Storage
      class << self
        alias :prepare_without_log :prepare
        def prepare(name)
          puts "prepare: #{name}"
          prepare_without_log(name)
        end

        alias :commit_without_log :commit
        def commit(name)
          puts "commit: #{name}"
          commit_without_log(name)
        end

        alias :rollback_without_log :rollback
        def rollback(name)
          puts "rollback: #{name}"
          rollback_without_log(name)
        end
      end
    end
  end
end

Module.class_eval do
  alias :remove_const_without_log :remove_const
  def remove_const(name)
    puts "remove_const: #{name}"
    remove_const_without_log(name)
  end
end

Kernel.module_eval do
  alias :require_without_log :require
  def require(name)
    puts "require: #{name}"
    require_without_log(name)
  end
end
