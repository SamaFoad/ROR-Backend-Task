class Api::V1::EmployeesController < ApplicationController
    def index
        records = execute_statement("select employees.id as id, name, uin from employees 
                                     left join employee_uins on employees.id = employee_uins.id")
        render json: records.to_a, status: 200
    end    

    private

    def execute_statement(sql)
        results = ActiveRecord::Base.connection.execute(sql)
        
        if results.present?
            return results
        else
            return nil
        end
    end
end
