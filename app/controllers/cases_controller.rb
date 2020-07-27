class CasesController < ApplicationController

    def index
        if current_doctor
            cases = Case.where(decision: "awaiting decision")
            render json: { cases: cases }
        else 
            render json: {error: "nope"}
        end
    end

    def show
        show_case = Case.find_by(case_params[:id])
        render json: { cases: show_case}
    end

    def create
        new_case = Case.create(case_params)
        if new_case.valid?
            render json: new_case
        else
            render json: { error: "Could not create new case", message: new_case.errors.full_messages }
        end
    end

    def update
        doctor = current_doctor
        update_case = Case.find_by(id: params[:id])
        if update_case
            update_case.update(decision: params[:decision], doctor: doctor)
            TripleOneEmailMailer.with(update_case: update_case).decision_email(update_case).deliver_now
            render json: update_case
        else
            render json: { error: "Could not update this case" }
        end
    end

    private

    def case_params
        params.require(:case).permit(:symptoms, :image_url, :email)
    end

end
