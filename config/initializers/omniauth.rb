Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, '86tcgx3lqy8txp', '2CO3cJJZKolfxrDG'
  provider :facebook, '1943304002565965', '23fb433db9dd3e77694648933bf9485e', scope: 'email', info_fields: 'email, first_name, last_name'
end
