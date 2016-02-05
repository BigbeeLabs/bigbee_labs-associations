module BigbeeLabs
  module Associations
    module ClassMethods
      module HasMany

        def has_many(class_sym, options={})
          define_method(class_sym) do 
            other_klass = options[:class_name] ? options[:class_name].constantize : class_sym.to_s.camelize.pluralize.constantize
            #puts "in #{my_klass}.#{__method__}, other_klass: #{other_klass}"
            if as = options[:as]
              other_klass.where("#{as.to_s}_type"=>my_klass.name, "#{as.to_s}_id"=> self.id)
            else
              other_klass.where("#{as.to_s}_id"=>self.id)
            end
          end
        end

      end
    end
  end
end