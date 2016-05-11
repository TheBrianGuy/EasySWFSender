json.array!(@messages) do |message|
  json.extract! message, :id, :fwd_msg_to, :msg_from_site, :msg_from_email, :msg_from_name, :msg_from_ipaddress, :msg_subject, :msg
  json.url message_url(message, format: :json)
end
