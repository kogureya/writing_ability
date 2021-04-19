class DiaryPoint

  include ActiveModel::Model
  attr_accessor :title, :text, :point, :user_id, :diary_id

  with_options presence: true do
    validates :title, :text, :point
  end

  def save
    diary = Diary.create(title: title, text: text, user_id: current_user.id)
    point = Point.create(point: point, user_id: diary.user_id, diary_id: diary.id)
  end
end