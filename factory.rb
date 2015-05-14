class Factory
def self.new(*arg, &block)
Class.new do
arg.each do |i|
attr_accessor i
end
define_method :initialize do |*field|
arg.each_with_index do |val, index|
instance_variable_set "@#{val}", field[index]
end
end
def [](key)
return instance_variable_get(instance_variables[key]) if key.kind_of?(Str)
return self.send(key)
end
class_eval &block if block_given?
end
end
end
Customer = Factory.new(:name,:address,:city) do
def greeting
"Hello #{name}!"
end
end
Dave = Customer.new("Dave"," 123, 5th Avenu"," NY")
