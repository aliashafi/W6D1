class Question < ApplicationRecord
    validates :text, presence: true

    belongs_to :poll, 
    primary_key: :id, 
    foreign_key: :poll_id, 
    class_name: :Poll

    has_many :answer_choices, 
    primary_key: :id, 
    foreign_key: :question_id, 
    class_name: :AnswerChoice

    has_many :responses,
    through: :answer_choices,
    source: :responses

    has_one :author,
    through: :poll,
    source: :author

    def results
        answer_choices = self.answer_choices
        
        picked_answers = {}
        answer_choices.each do |answer|
            picked_answers[answer.text] = answer.responses.count
        end

        picked_answers


    end

    def better_results
        answer_choices = self.answer_choices.includes(:responses).all
        
        picked_answers = {}

        answer_choices.each do |answer|
            picked_answers[answer.text] = answer.responses.length
        end

        picked_answers

        
    end

    def sql_result
        AnswerChoice.find_by_sql([<<-SQL, self.id])
        SELECT
            answer_choices.text, COUNT(responses.id) as count
        FROM
            questions
        LEFT OUTER JOIN
            answer_choices ON questions.id = answer_choices.question_id
        LEFT OUTER JOIN
            responses ON responses.answer_choice_id = answer_choices.id
        WHERE
            answer_choices.question_id = ?
        GROUP BY
            answer_choices.id
        SQL

    end

    


end