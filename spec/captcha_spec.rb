require 'spec_helper'
require_relative '../captcha'
describe Operator do
    it "should return +" do
        @operator = Operator.new(1)
        expect(@operator.string()).to eql '+'
    end
    it "should return -" do
        @operator = Operator.new(2)
        expect(@operator.string()).to eql '-'
    end
    it "should return *" do
        @operator = Operator.new(3)
        expect(@operator.string()).to eql '*'
    end
end

describe IntegerOperand do
    it "should return 1" do
        @operand = IntegerOperand.new(1)
        expect(@operand.string()).to eql "1"
    end
end

describe StringOperand do
    it "should return Nine" do
        @operand = StringOperand.new(9)
        expect(@operand.string()).to eql "Nine"
    end        
    it "should return One" do
        @operand = StringOperand.new(1)
        expect(@operand.string()).to eql "One"
    end        
end

describe Captcha do
    context "with second pattern right operand" do
        FIRST_PATTERN, DUMMY_OPERATOR, DUMMY_RIGHT = 1
        SECOND_PATTERN = 2
        it "should be 1" do
            @captcha = Captcha.new(SECOND_PATTERN, DUMMY_LEFT, DUMMY_OPERATOR, 1)
            expect(@captcha.right.string()).to eql '1'
        end
    end
    context "with second pattern left operand" do
        it "should be One" do
            @captcha = Captcha.new(SECOND_PATTERN, 1, DUMMY_OPERATOR, DUMMY_RIGHT)
            expect(@captcha.left.string()).to eql 'One'
        end
    end
    context "with first pattern left operand" do
        it "should be 9" do
            @captcha = Captcha.new(FIRST_PATTERN, 9, DUMMY_OPERATOR, DUMMY_RIGHT)
            expect(@captcha.left.string()).to eql '9'
        end 
        it "should be 2" do
            @captcha = Captcha.new(FIRST_PATTERN, 2, DUMMY_OPERATOR, DUMMY_RIGHT)
            expect(@captcha.left.string()).to eql '2'
        end 
    end 
    context "with first pattern right operand" do
        DUMMY_LEFT = 1
        it "should be Nine" do
            @captcha = Captcha.new(FIRST_PATTERN, DUMMY_LEFT, DUMMY_OPERATOR, 9)
            expect(@captcha.right.string()).to eql 'Nine'
        end 
        it "should be Three" do
            @captcha = Captcha.new(FIRST_PATTERN, DUMMY_LEFT, DUMMY_OPERATOR, 3)
            expect(@captcha.right.string()).to eql 'Three'
        end 
        it "should be Two" do
            @captcha = Captcha.new(FIRST_PATTERN, DUMMY_LEFT, DUMMY_OPERATOR, 2)
            expect(@captcha.right.string()).to eql 'Two'
        end 
    end 

    context "operator" do
        it "should be +" do
            @captcha = Captcha.new(FIRST_PATTERN, DUMMY_LEFT, 1, DUMMY_RIGHT)
            expect(@captcha.operator.string()).to eql '+'
        end
    end

    context "string" do
        it "should be 1 + One" do
            @captcha = Captcha.new(1, 1, 1, 1)
            expect(@captcha.string()).to eql '1 + One'
        end 
        it "should be 2 + One" do
            @captcha = Captcha.new(1, 2, 1, 1)
            expect(@captcha.string()).to eql '2 + One'
        end 
    end
end
