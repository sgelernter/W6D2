require "byebug"

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      getter = "#{name}"
      setter = "#{name}="
      name_sym = "@#{name}"
      define_method(getter) { instance_variable_get(name_sym) }
      define_method(setter) do |val|
        instance_variable_set(name_sym, val)
      end
    end
  end
end
