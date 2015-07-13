module NetSuite
  module Records
    class Address
      include Support::Fields
      include Support::Records
      include Support::Actions
      include Namespaces::PlatformCommon

      actions :get, :get_list, :add, :update, :upsert, :upsert_list, :delete, :delete_list, :search

      fields :attention, :addressee, :addrPhone, :addr1, :addr2,
             :addr3, :city, :state, :zip, :country, :addr_phone

      field :custom_field_list, CustomFieldList

      attr_reader   :internal_id

      def initialize(attrs = {})
        initialize_from_attributes_hash(attrs)
      end

    end
  end
end
