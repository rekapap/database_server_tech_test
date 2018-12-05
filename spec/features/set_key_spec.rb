feature 'Set key' do
  scenario 'set a key pair into a datastore' do
    key = 'apple'
    value = 'green'
    visit("/set?#{key}=#{value}")
    expect(page).to have_content "I wrote '{\"apple\"=>\"green\"}' into the datastore"
  end
  scenario 'raise error if params are invalid' do
    key = 'apple'
    visit("/set?#{key}")
    expect(page).to have_content 'Invalid parameters'
  end
end
