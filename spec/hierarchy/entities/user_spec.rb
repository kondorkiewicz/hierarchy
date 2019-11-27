RSpec.describe User, type: :entity do
  it 'has man? method' do
    user = User.new(name: "Josh", surname: "Wayne", man: true)
    expect(user.man?).to be true
  end
end
