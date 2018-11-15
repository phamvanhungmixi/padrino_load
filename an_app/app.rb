Padrino.require_dependencies(
  Padrino.root("an_app/models/model_with_no_dep_on_lib.rb"),
  Padrino.root("an_app/models/model_that_depends_on_lib.rb"),
  Padrino.root("an_app/models/model_cache.rb")
)
