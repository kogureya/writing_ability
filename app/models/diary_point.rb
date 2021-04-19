class DiaryPoint

  include ActiveModel::Model
  attr_accessor :title, :text, :point, :user_id, :diary_id

  with_options presence: true do
    validates :title, :text
  end

  def save
    diary = Diary.create(title: title, text: text, user_id: user_id)
    point = Point.create(point: diary.text.length, user_id: diary.user_id, diary_id: diary.id)
  end
end