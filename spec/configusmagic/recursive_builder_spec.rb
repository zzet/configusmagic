require 'spec_helper'

describe Configusmagic::RecursiveBuilder, "tests " do
  it "Simple build" do
    builder = Configusmagic::RecursiveBuilder.new  do
      keyA "a"
      keyB "b"
    end

    config = builder.build

    config.should eq({:keyA => "a", :keyB => "b"})
  end

  it "Dificult build" do
    builder = Configusmagic::RecursiveBuilder.new  do
      keyA do
        keyC "c"
      end
      keyB "b"
    end

    config = builder.build

    config.should eq({
      :keyA => {
        :keyC => "c"
      },
      :keyB => "b"
    })
  end


end
