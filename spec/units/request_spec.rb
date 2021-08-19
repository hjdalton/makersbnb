require 'request'

describe Request do
  describe '.made' do
    it 'returns any booking requests that the user has made' do

      made = Request.made(user_id: 2)

      expect(made).to be_a Request
      expect(made.user_id).to eq '2'

    end
  end

  describe '.received' do
    it 'returns any requests that have been made for a homeowners space' do
      receive = Request.received(user_id: 1)
      expect(receive.space_id).to eq '1'
    end
  end
end
