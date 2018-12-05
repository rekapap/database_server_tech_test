feature 'Viewing homepage' do
  scenario 'visiting localhost on port 4000, index' do
    visit('http://localhost:4000/')
    expect(page).to have_content 'Welcome to DatabaseServer!'
  end
end
