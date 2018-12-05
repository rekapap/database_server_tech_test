feature 'Get key' do
  scenario 'get a key value from the datastore' do
    key = 'apple'
    value = 'green'
    visit("/set?#{key}=#{value}")
    visit("/get?key=#{key}")
    expect(page).to have_content "green"
  end
  scenario 'invlaid key' do
    key = 'apple'
    value = 'green'
    visit("/set?#{key}=#{value}")
    visit("/get?key=")
    expect(page).to have_content "Invalid parameters"
  end
end
