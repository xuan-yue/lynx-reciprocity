Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, '86tcgx3lqy8txp', '2CO3cJJZKolfxrDG'
  provider :facebook, '1943304002565965', '23fb433db9dd3e77694648933bf9485e', scope: 'email', info_fields: 'email, first_name, last_name'
  provider :google_oauth2, '687873540467-ik7koj528rpf22jihmjnmp9pbhrbbljs.apps.googleusercontent.com', 'g2FaDy7HwVjcUQj2CiOZgwdF', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
