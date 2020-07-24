class TripleOneEmailMailer < ApplicationMailer
    default from: "tripleoneemailaddress@gmail.com"

    def decision_email(update_case)
        @update_case = update_case
        mail(to: "#{update_case.email}", subject: "A decision has been made about your case")
    end
    
end