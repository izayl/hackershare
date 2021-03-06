# frozen_string_literal: true

# == Schema Information
#
# Table name: taggings
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bookmark_id :bigint
#  tag_id      :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_taggings_on_bookmark_id             (bookmark_id)
#  index_taggings_on_tag_id                  (tag_id)
#  index_taggings_on_tag_id_and_bookmark_id  (tag_id,bookmark_id) UNIQUE
#  index_taggings_on_user_id                 (user_id)
#
require "test_helper"

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
