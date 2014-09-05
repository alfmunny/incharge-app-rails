require 'rails_helper'

RSpec.describe "transactions/edit", :type => :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :transaction_id => "MyString",
      :status => "MyString",
      :energy => 1.5,
      :bill => 1.5
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_transaction_id[name=?]", "transaction[transaction_id]"

      assert_select "input#transaction_status[name=?]", "transaction[status]"

      assert_select "input#transaction_energy[name=?]", "transaction[energy]"

      assert_select "input#transaction_bill[name=?]", "transaction[bill]"
    end
  end
end
