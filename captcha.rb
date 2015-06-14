class Operator
    def initialize(value)
       @value = value 
    end

    def string()
        operator = ['+', '-', '*']
        operator[@value-1] 
    end
end

class Operand
    def initialize(value)
        @value = value
    end
end

class IntegerOperand < Operand
    def string()
       @value.to_s 
    end
end

class StringOperand < Operand
    def string()
        number_string = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]
        number_string[@value-1]    
    end
end

class Captcha
    attr_accessor :right, :left
    def initialize(pattern, left, operator, right)
        @left, @right = operand_builder(pattern, left, right) 
    end

    def operand_builder(pattern, left, right)
        if is_string_integer(pattern)
            return IntegerOperand.new(left), StringOperand.new(right)
        else
            return StringOperand.new(left), IntegerOperand.new(right)
        end
    end

    def is_string_integer(pattern) 
        pattern == 1 
    end
end
