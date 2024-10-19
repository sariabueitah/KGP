json.extract! employee, :id, :first_name, :father_name, :grandfather_name, :family_name, :ar_first_name, :ar_father_name, :ar_grandfather_name, :ar_family_name, :nid, :email, :phone_number, :e_phone_number, :created_at, :updated_at
json.url employee_url(employee, format: :json)
