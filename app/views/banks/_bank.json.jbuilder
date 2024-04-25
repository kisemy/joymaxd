json.extract! bank, :id, :bank_name, :bank_acc_no, :posting_group, :balance, :created_at, :updated_at
json.url bank_url(bank, format: :json)
