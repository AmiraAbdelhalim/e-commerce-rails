require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  store = Store.new
  store.name="aaaaaaa"
  store.summary="Sssssssssssssss"
  store.admin_user_id=1
  assert store.save
end
