require 'spec_helper'

describe Account do

  it "should create a new instance given valid attributes" do
    account = Factory.create(:account)
  end

  it "should not create a new instance given invalid attributes" do
    account = Account.new
    account.should_not be_valid
    account.errors.on(:bank_account_id).should_not be_blank
    account.errors.on(:kind).should_not be_blank
    account.errors.on(:document).should_not be_blank
    account.errors.on(:person_id).should_not be_blank
    account.errors.on(:price).should_not be_blank
    account.errors.on(:maturity_date).should_not be_blank
    account.errors.on(:box_id).should_not be_blank
  end
  
  it "should not save situation ok when not inform date and price payment" do
    account = Factory.create(:account)
    account.situation = Situation.find_by_name("Realizada")
    account.save_payment
    account.errors.on(:payment_date).should_not be_blank
    account.errors.on(:payment_price).should_not be_blank
    Account.find(account.id).situation.should == nil
  end
  
  it "should save situation cancel" do
    account = Factory.create(:account)
    account.situation = Situation.find_by_name("Cancelada")
    account.save_payment
    account.errors.on(:payment_date).should be_blank
    account.errors.on(:payment_price).should be_blank
    Account.find(account.id).situation.should == Situation.find_by_name("Cancelada")
  end
  
  it "should not create an account to date less than the initial balance" do
    bank_account = Factory(:bank_account, :opening_balance_date => "1/1/2010")
    account = Factory.build(:account, :maturity_date => "1/1/2009", :bank_account => bank_account)
    account.should_not be_valid
  end

end

