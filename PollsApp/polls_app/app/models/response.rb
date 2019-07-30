class Response < ApplicationRecord
    validate :no_duplicate_resopnse
    validate :cannot_answer_own_questions

    belongs_to :respondent, 
    primary_key: :id, 
    foreign_key: :user_id, 
    class_name: :User

    belongs_to :answer_choice,
    primary_key: :id, 
    foreign_key: :answer_choice_id, 
    class_name: :AnswerChoice 

    has_one :question,
    through: :answer_choice,
    source: :question

    has_one :question_author,
    through: :question,
    source: :author
    ## ruby will turn a nil if its not saved??


    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        !self.sibling_responses.empty?
    end

    private
    def no_duplicate_resopnse
        if respondent_already_answered?
            errors[:answer_choice_id] << 'question already answered'
        end
    end

    def cannot_answer_own_questions
        if self.question.poll.id = self.user_id
            errors[:user_id] << 'cannot answer a question they authored'
        end
        
    end
    

end