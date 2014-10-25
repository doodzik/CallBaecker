require "CallBaecker/version"

module CallBaecker
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def method_added(name)
      return if @__last_methods_added && @__last_methods_added.include?(name)
      with = :"#{name}_with_before_each_method"
      without = :"#{name}_without_before_each_method"
      @__last_methods_added = [name, with, without]
      define_method with do |*args, &block|
        @__last_args = *args
        catch :CallBaeckerDone do
          send without, *args, &block
        end
      end
      alias_method without, name
      alias_method name, with
      @__last_methods_added = nil
    end

    def singleton_method_added(name)
      return if @__last_methods_added && @__last_methods_added.include?(name)
      with = :"#{name}_with_before_each_method"
      without = :"#{name}_without_before_each_method"
      @__last_methods_added = [name, with, without]

      define_singleton_method with do |*args, &block|
        @__last_args = *args
        catch :CallBaeckerDone do
          send without, *args, &block
        end
      end
      singleton_class.send(:alias_method, without, name.to_sym)
      singleton_class.send(:alias_method, name.to_sym, with)
      @__last_methods_added = nil
    end
  end
end
