json.extract! bank, :id, :name, :branch, :iban
json.url employee_bank_url(bank, format: :json)
