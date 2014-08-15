json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :slogan, :control, :wealth, :income, :power, :inflluence, :morale, :security, :orthodoxy, :violence, :slant, :authority, :sector, :criminality, :zeal, :strangeness
  json.url organization_url(organization, format: :json)
end
