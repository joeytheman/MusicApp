module JsonHelper
  def json_content_headers
    { 'Accept' => 'application/vnd.api+json', 'Content-Type' => 'application/vnd.api+json' }
  end

  def json_data
    json_response['data']
  end

  def json_pagination
    json_response['links']
  end

  def json_pagination_params_for key
    uri = URI.parse(json_pagination[key])
    Rack::Utils.parse_query(uri.query)
  end

  def json_response
    @json_response ||= JSON.parse response.body
  end

  def validate_pagination_for key, page_number, page_size
    link = json_pagination_params_for key
    expect(link['page[number]']).to eq page_number.to_s
    expect(link['page[size]']).to eq page_size.to_s
  end

  def validate_objects json_objects, objects, expected_attrs=[], expected_objects=[]
    json_objects.each_with_index do |json_object, index|
      object = objects[index]
      expect(json_object['id']).to eq object.id.to_json
      expect(json_object['type']).to eq object.class.to_s.pluralize.underscore
      attrs = json_object['attributes']
      expect(attrs.count).to eq (expected_attrs.count+expected_objects.count)
      expected_attrs.each do |expected_attr|
        expect(attrs[expected_attr.to_s]).to eq(object.send(expected_attr)), "expected #{expected_attr} to \n equal: #{object.send(expected_attr)}\n got: #{attrs[expected_attr.to_s]}"
      end
      expected_objects.each do |expected_object|
        attr_object = if attrs[expected_object.to_s].has_key? 'model'
                        attrs[expected_object.to_s]['model']
                      else
                        attrs[expected_object.to_s]
                      end
        expect(attr_object).to eq JSON.parse(object.send(expected_object).to_json)
      end
    end
  end
end
