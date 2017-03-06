require 'rails_helper'

RSpec.describe "lists/show", type: :view do
  before(:each) do
    @list = assign(:list, List.create!(
      :user => "",
      :name => "Name",
      :privacy => "Privacy",
      :description => "MyText",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Privacy/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
  end
end
