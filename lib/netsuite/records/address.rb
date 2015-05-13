module NetSuite
  module Records
    class Address
      include Support::Fields
      include Support::Records
      include Namespaces::PlatformCommon

      fields :attention, :addressee, :addrPhone, :addr1, :addr2,
        :addr3, :city, :state, :zip, :country

      def initialize(attrs = {})
        initialize_from_attributes_hash(attrs)
      end

    end
  end
end
