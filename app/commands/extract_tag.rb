# frozen_string_literal: true

class ExtractTag
  prepend SimpleCommand
  include ActiveModel::Validations

  attr_reader :bookmark

  def initialize(bookmark)
    @bookmark = bookmark
  end

  def call
    tags = Tag.find_by_sql(<<~SQL)
      SELECT DISTINCT 
             tags.*, 
             bookmarks.tsv <=> plainto_tsquery('zh', name) AS rev_score
        FROM bookmarks, tags 
       WHERE bookmarks.id = #{bookmark.id} 
             AND plainto_tsquery('zh', tags.name) @@ bookmarks.tsv
    ORDER BY rev_score ASC
       LIMIT 5
    SQL
    tags.map(&:preferred_or_self).uniq
  end
end