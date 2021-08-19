require 'request'
require 'booking'

describe Request do

  describe '.received' do
    it 'returns any requests that have been made for a homeowners space' do
    
      received = Request.received(user_id: 1)
      
      expect(received).to be_a Request
      expect(receive.space_id).to eq '1'
    end
  end

  describe '.made' do
    it 'returns any booking requests that the user has made' do

      make = Request.made(user_id: 2)

      expect(make).to be_a Request
      expect(made.user_id).to eq '2'

    end
  end

end
