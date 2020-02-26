require 'rails_helper'

RSpec.describe "Charges" , type: :feature do
  before do
    load "#{Rails.root}/db/seeds.rb"
  end
  describe "page charge" do
    it 'will show title' do
      visit '/'    
      expect(page).to have_text("Rails Challenge ShowMojo")
    end
  end

  describe "There are Failed list in the page" do
    it 'will show failed rows' do
      visit '/'    
      expect(page).to have_css('.failed-row', visible: false)  
    end
  end
  
  describe "There are Successful list in the page" do
    it 'will show successful rows' do
      visit '/'
      expect(page).to have_css('.successful-row', visible: false)
    end
  end

  describe "There are Disputed list in the page" do
    it 'will show disputed rows' do
      visit '/'
      expect(page).to have_css('.disputed-row', visible: false)
    end
  end

  describe "There are 10 successful entries in the page" do
    it 'should a' do
      visit '/'
      expect(page).to have_css('.successful-row', count: 10, visible: false)
    end
  end

  describe "There are 5 failed entries in the page" do
    it 'should a' do
      visit '/'
      within('.failed') do
        expect(page).to have_css('.failed-row', count: 5, visible: false)
      end   
    end
  end

  describe "There are 1 failed entry in the disputed  list" do
    it 'should a' do
      visit '/'
      within('.disputed') do
        expect(page).to have_css('.failed-row', count: 1, visible: false)    
      end  
    end    
  end

end