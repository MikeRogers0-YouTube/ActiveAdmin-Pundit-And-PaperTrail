RSpec.describe 'Rails.application' do
  describe '#load_seed' do
    subject { Rails.application.load_seed }

    it do
      expect { subject }.to change(Post, :count)
        .and change(User, :count)
    end
  end
end
