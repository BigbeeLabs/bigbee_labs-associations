module BigbeeLabs
  module Associations
    module ClassMethods
      module PoroHasOne

        def poro_has_one(class_sym, options={})
          
          klass_name = options[:class_name] || class_sym.to_s.singularize.camelize
          klass = klass_name.constantize
          if options[:as]
            as_id = "#{options[:as]}_id".to_sym
            as_type = "#{options[:as]}_type".to_sym
          end

          define_method(class_sym) do 
            if options[:as]
              if options[:polymorphic]
                klass.find_by(as_id => self.id, as_type => self.class.name)
              else
                klass.find_by(as_id => self.id)
              end
            else
            end
          end # define_method

        end # poro_has_one

      end
    end
  end
end