require 'request'

describe Request do
  describe '.made' do
    it 'adds a request made to database' do
      request = Request.made(space_id: '1', user_id: '2', start_date: '2020/08/19', end_date: "2020/08/20", status: "Requested")
    
      expect(request).to be_a Request
      expect(request.start_date).to eq '2020-08-19'
      expect(request.end_date).to eq '2020-08-20'
      expect(request.status).to eq 'Requested'
    end
  end

  describe '.received' do

  end


end

# INSERT INTO bookings (space_id, user_id, start_date, end_date, status) VALUES (
#   (SELECT id FROM spaces WHERE space_name = #{space_name} ),
# (SELECT id FROM users WHERE email = #{email}),
#   start_date, end_date, 'Requested')