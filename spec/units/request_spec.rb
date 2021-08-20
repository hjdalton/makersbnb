require 'request'

describe Request do
  describe '.made' do
    it 'returns any booking requests that the user has made' do

      made = Request.made(current_user: 2)

      expect(made.first.current_user).to eq '2'

    end
  end

  describe '.received' do
    it 'returns any requests that have been made for a homeowners space' do
      receive = Request.received(current_user: 1)
      expect(receive.first.space_id).to eq '1'
    end
  end
end
