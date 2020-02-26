require 'rails_helper'

RSpec.feature "Charges" , type: :feature do
  scenario "User Can Visit root path page and see HeadLine" do
    visit root_path
    expect(page).to have_text("Rails Challenge ShowMojo")
  end

  scenario "There are Failed list in the page" do
    visit root_path
    within('.failed') do
      page.all(:css, '.failed-row').each do |row|
        expect(row).to have_css('failed_row')
      end
    end  
  end

  scenario "There are Successful list in the page" do
    visit root_path
    within('.successful') do
      page.all(:css, '.successful-row').each do |row|
        expect(row).to have_css('.successful-row')
      end
    end
  end

  scenario "There are Disputed list in the page" do
    visit root_path
    within('.disputed') do
      page.all(:css, '.disputed-row').each do |row|
        expect(row).to have_css('.disputed-row')
      end
    end  
  end

  scenario "There are 10 successful entries in the page" do
    visit root_path
    within('.successful') do
      page.all(:css, '.successful-row').each do |row|
        expect(page).to have_css('.successful-row', count: 10, visible: :all)
      end
    end
  end

  scenario "There are 5 failed entries in the page" do
    visit root_path
    within('.failed') do
      page.all(:css, '.failed-row').each do |row|
        expect(page).to have_css('.failed-row', count: 5, visible: :all)
      end
    end
  end

  scenario "There are 1 failed entry in the disputed  list" do
    visit root_path
    within('.disputed') do
      expect(page).to have_css('.failed-row', count: 1, visible: :all)
    end
  end
end