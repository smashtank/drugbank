module Drugbank
  class Base
    def method_missing(method, *args, &block)
      if self.attributes.keys.include?(method.to_s)
        self.class.send(:define_method, method,lambda{ self[method.to_s]})
        return self[method.to_s]
      elsif self.relations.keys.include?(method.to_s)
        self.class.send(:define_method, method,lambda{ self.relations[method.to_s]})
        return self.relations[method.to_s]
      else
        super
      end
    end
  end
end