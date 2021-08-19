require 'booking'  

describe '.made' do
  it 'adds a request made to database' do
    request = Request.made(space_id: '1', user_id: '2', start_date: '2020/08/19', end_date: "2020/08/20", status: "pending")
  
    expect(request).to be_a Request
    expect(request.start_date).to eq '2020-08-19'
    expect(request.end_date).to eq '2020-08-20'
    expect(request.status).to eq 'pending'
  end
end