require 'spec_helper'

describe Promotion do
  let(:promotion) { FactoryGirl.build :promotion }
  subject { promotion }

  it { should respond_to(:product_name) }
  it { should respond_to(:lat) }
  it { should respond_to(:lon) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :price }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should belong_to :user }

end
