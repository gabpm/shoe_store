class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  before_save(:title_case)
  validates(:name, {:presence => true})

  private

  define_method(:title_case) do
    self.name=(name().titleize())
  end

end
