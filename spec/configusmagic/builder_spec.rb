require 'spec_helper'

describe Configusmagic::Builder, "test" do
  it "Should build simple config" do
    builder = Configusmagic::Builder.new do
      env :production do
          keyA "a"
          keyB "b"
      end
      env :test do
          keyC "c"
          keyD "d"
      end
    end

    builder.build

    builder.get(:production).should eq({
        :keyA => "a",
        :keyB => "b"
    })
    builder.get(:test).should eq({
        :keyC => "c",
        :keyD => "d"
    })
  end

  it "Should build config with parent" do
    builder = Configusmagic::Builder.new do
      env :production do
          keyA "a"
          keyB "b"
      end
      env :test, :parent => :production do
          keyB "d"
          keyC "c"
      end
    end

    builder.build

    builder.get(:production).should eq({
        :keyA => "a",
        :keyB => "b"
    })
    builder.get(:test).should eq ({
        :keyA => "a",
        :keyB => "d",
        :keyC => "c"
    })
  end

  it "Should build config with parent loop" do
    builder = Configusmagic::Builder.new do
      env :production, :parent => :test do
          keyA "a"
          keyB "b"
      end
      env :test, :parent => :production do
          keyB "d"
          keyC "c"
      end
    end

    builder.build

    builder.get(:production).should eq({
        :keyA => "a",
        :keyB => "b",
        :keyC => "c",
    })
    builder.get(:test).should eq ({
        :keyA => "a",
        :keyB => "d",
        :keyC => "c"
    })
  end
end
