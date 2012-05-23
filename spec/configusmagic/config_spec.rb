require 'spec_helper'

describe Configusmagic::Config, "test" do
  it "Simple build with to_hash" do
    environment = :production

    builder = Configusmagic::Builder.new do
      env :production do
          key_A "a"
          key_B "b"
      end
    end

    builder.build
    config = builder.get environment
    result = Configusmagic::Config.new config

    result.to_hash.should eq({:key_A => "a", :key_B => "b"})
  end

  it "Dificult build to hash" do
    environment = :production

    builder = Configusmagic::Builder.new do
      env :production do
        key_A do
          key_C "c"
        end
        key_B "b"
      end
    end

    builder.build
    config = builder.get environment
    result = Configusmagic::Config.new config

    result.to_hash.should eq({
      :key_A => {
        :key_C => "c"
      },
      :key_B => "b"
    })
  end
end
