require 'booking'  

describe '.create' do
  it 'adds a request made to database' do
    booking = Booking.create(space_id: '1', user_id: '2', start_date: '2020/08/19', end_date: "2020/08/20", status: "pending")
  
    expect(booking).to be_a Booking
    expect(booking.start_date).to eq '2020-08-19'
    expect(booking.end_date).to eq '2020-08-20'
    expect(booking.status).to eq 'pending'
  end
end