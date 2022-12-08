# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
      through: :enrollments,
      source: :student

    has_one :prerequisite,
      # as an accessor to get to the prereq_id
      primary_key: :prereq_id,

      #the foreign key is to help us navigate to the row of the id
      foreign_key: :id, 
      class_name: :Course
end
