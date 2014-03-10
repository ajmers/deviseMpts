class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities, dependent: :destroy

    scope :activities_to_rate, lambda {|user| where("user_id !=? AND NOT EXISTS (SELECT 1 FROM ratings WHERE ratings.activity_id = activities.id AND ratings.rater_id = ?", user, user)}

  def update_user_points!
    update(points_won: activities.where("num_times_ranked >= 1").average(:avg_score))
  end

end
