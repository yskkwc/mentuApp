RSpec.describe User, type: :model do
  it "is valid with username, email, and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without username" do
    user = FactoryBot.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate username" do
    FactoryBot.create(:user, username: "bob")
    user = FactoryBot.build(:user, username: "bob", email: "karen@example.com")
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "bob@example.com")
    user = FactoryBot.build(:user, username: "karen", email: "bob@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
