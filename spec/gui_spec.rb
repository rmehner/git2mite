require File.dirname(__FILE__) + '/spec_helper'
require 'gui'

describe Gui do
  describe "get date" do
    before(:each) do
      @gui = Gui.new
    end
    it "should use entered date" do
      date = inject_input("2008-09-11"){@gui.get_date('start date')}
      date.should == Date.parse('2008-09-11')
    end
    
    it "should use the current date if no date entered" do
      date = inject_input("\n"){@gui.get_date('start date')}
      date.should == Date.today
    end
    
    def inject_input(string, &block) 
      org_in = $stdin
      $stdin = StringIO.new(string)
      result = yield
      $stdin = org_in
      result
    end
  end
end
