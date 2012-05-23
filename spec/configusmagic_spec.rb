require 'spec_helper'

describe Configusmagic, "Configus" do
  it "Configusmagic.buid should build simple config" do
    config = Configusmagic.build :test do
      env :production do
          key_a "a"
          key_b "b"
      end
      env :test, :parent => :production do
          key_b "d"
          key_c "c"
      end
    end

    config.key_a.should eq("a")
    config.key_b.should eq("d")
    config.key_c.should eq("c")
  end

  it "Configusmagic.buid should build difficult config" do
    config = Configusmagic.build :test do
      env :production do
          key_a "a"
          key_b "b"
      end
      env :test, :parent => :production do
          key_b do
            key_a "e"
            key_d "d"
          end
          key_c "c"
      end
    end

    config.key_a.should eq("a")
    config.key_b.key_a.should eq("e")
    config.key_b.key_d.should eq("d")
    config.key_c.should eq("c")
  end

end
