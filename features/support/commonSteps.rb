#Then I should see the title {title}
Then('I should see the title {string}') do |title|
    expect(page).to have_selector('h1', text: title)
  end