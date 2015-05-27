module NetSuite
  module Records
    # Adding a Customer Deposit example. The customer associated with the sales
    # order would be linked to the deposit.
    #
    #   deposit = CustomerDeposit.new
    #   deposit.sales_order = RecordRef.new(internal_id: 7279)
    #   deposit.payment = 20
    #   deposit.add
    #
    class CustomerDeposit
      include Support::Actions
      include Support::RecordRefs
      include Support::Fields
      include Support::Records
      include Namespaces::TranCust

      actions :add, :get, :upsert, :update

      fields :custom_form, :auth_code, :auto_apply, :cc_approved, :cc_avs_street_match, :cc_avs_zip_match,
             :cc_expire_date, :cc_name, :cc_number, :cc_security_code, :cc_security_code_match, :cc_street, :cc_zip_code,
             :charge_it, :check_num, :created_date, :currency_name, :debit_card_issue_no, :exchange_rate, :ignore_avs,
             :last_modified_date, :memo, :payment, :pn_ref_num, :status, :three_d_status_code, :tran_date,
             :undep_funds, :valid_from

      field :custom_field_list, CustomFieldList

      record_refs :customer, :sales_order, :account, :payment_method

      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

      def to_record
        rec = super
        if rec["#{record_namespace}:customFieldList"]
          rec["#{record_namespace}:customFieldList!"] = rec.delete("#{record_namespace}:customFieldList")
        end
        rec
      end

    end
  end
end
