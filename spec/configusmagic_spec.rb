require 'spec_helper'

describe Configusmagic, "Configus" do
  it "Configusmagic.buid mast can build" do
    config = Configusmagic.build do
      key_a "string"
      key_b 1
    end

    #raise config.inspect

    config.key_a.should eq("string")
    config.key_b.should eq(1)

  end
end
