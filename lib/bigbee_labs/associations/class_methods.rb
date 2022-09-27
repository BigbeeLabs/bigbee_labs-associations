require_dependency 'bigbee_labs/associations/class_methods/has_many'
require_dependency 'bigbee_labs/associations/class_methods/poro_has_many'
require_dependency 'bigbee_labs/associations/class_methods/poro_has_one'

module BigbeeLabs
  module Associations
    module ClassMethods
      include HasMany
      include PoroHasMany
      include PoroHasOne
    end
  end
end