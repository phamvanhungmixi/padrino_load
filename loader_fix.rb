require 'padrino-core'
Padrino::Logger::Config[:development]      = { :log_level => :devel, :stream => STDOUT }
Padrino.require_dependencies(
  Padrino.root("lib/*")
)
Padrino.require_dependencies(
  Padrino.root("an_app/app.rb")
)

ModelWithNoDepOnLib.hello
