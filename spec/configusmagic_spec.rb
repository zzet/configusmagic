require 'spec_helper'

describe Configusmagic, "Configus" do
  it "Configusmagic.buid mast can build" do
    config = Configusmagic.build do
      env :production do
          keyA "a"
          keyB "b"
      end
      env :test, :parent => :production do
          keyB "d"
          keyC "c"
      end
    end

    config.key_a.should eq("string")
    config.key_b.should eq(1)

  end
end
