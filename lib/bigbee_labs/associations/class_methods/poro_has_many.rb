module BigbeeLabs
  module Associations
    module ClassMethods
      module PoroHasMany
        def poro_has_many(class_sym, options={})
          klass_name = options[:class_name]
          klass_name ||= class_sym.to_s.singularize.camelize

          define_method(class_sym) do 
            klass = klass_name.constantize
            collection = nil
            if options[:as]
              as_id = "#{options[:as]}_id".to_sym
              as_type = "#{options[:as]}_type".to_sym
              collection = klass.where(as_id => self.id, as_type => self.class.name)
            end
            collection
          end

        end
      end
    end
  end
end