require('spec_helper')

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it("must have a name") do
    store_test = Store.new({:name => ""})
    expect(store_test.save).to(eq(false))
  end

  it("will always be in title case") do
    store_test = Store.create({:name => "Zapateria Margarita"})
    expect(store_test.name()).to(eq("Zapateria Margarita"))
  end

end
