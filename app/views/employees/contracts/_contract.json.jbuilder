json.extract! contract, :id, :start_date, :end_date, :salary, :active, :position_id
json.url employee_contract_url(contract, format: :json)
