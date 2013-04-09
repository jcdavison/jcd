require 'spec_helper'

describe User do
  it "requires email, password, does not require password_confirmation " do
    user = build :user
    user.save.should == true
  end
end
