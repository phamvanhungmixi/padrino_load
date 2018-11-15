require 'padrino-core'
Padrino::Logger::Config[:development]      = { :log_level => :devel, :stream => STDOUT }
Padrino.require_dependencies(
  Padrino.root("lib/a_lib.rb"),
  Padrino.root("lib/dependent_lib.rb"),
  Padrino.root("an_app/app.rb")
)
rs = []
ObjectSpace.each_object(Class) do |klass|
  rs << klass if klass.to_s == "ModelWithNoDepOnLib"
end
puts rs
ModelWithNoDepOnLib.hello
