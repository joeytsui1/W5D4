# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :enrolled_courses,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :courses,
        through: :enrolled_courses,
        source: :course
end
