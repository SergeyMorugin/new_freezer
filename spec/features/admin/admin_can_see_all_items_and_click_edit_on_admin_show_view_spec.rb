require 'rails_helper'

describe "Admin visits /admin/dashboard" do
  context "and Admin clicks link to view all items" do
    context "Admin should see a table with all items" do
      scenario "Admin should see all attributes of all items with option to edit" do
        admin = create(:user, role: 'admin')
        category = create(:category, title: "Guitars")
        item_1 = create(:item, category: category)

        visit login_path

        fill_in "session[username]", with: admin.username
        fill_in "session[password]", with: admin.password
        click_button "Login"

        visit admin_dashboard_path

        click_on "View Items"

        expect(current_path).to be(admin_items_path)

        expect(page).to have_content(item_1.title)
        expect(page).to have_content(item_1.description)
        expect(page).to have_content(item_1.status)
        expect(page).to have_link("Edit")
      end
    end
  end
end

# -As an Admin
# -When I visit “/admin/dashboard”
# -Then I should see a link for viewing all items
# -And when I click that link
# -Then my current path should be “/admin/items”
# -Then I should see a table with all items (active and inactive)
# -And each item should have:
#
# A thumbnail of the image
# Title that links to the item
# Description
# Status
# Actions (Edit)