require('spec_helper')

describe(Brand) do
  it {should have_and_belong_to_many(:stores)}

  it("must have a name") do
    brand_test = Brand.new({:name => ""})
    expect(brand_test.save).to(eq(false))

  end

  it("will always be in titlecase") do
    brand_test = Brand.create({:name => "reebok"})
    expect(brand_test.name()).to(eq("Reebok"))
  end
end
