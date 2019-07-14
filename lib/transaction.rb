#transaction class for soofa requests
class Transaction
  attr_reader :status, :sender_currency, :receiver_currency, :tid, :reference, :sender, :receiver,
              :receipt_no, :timestamp, :gross_amount, :net_amount, :transacted_via, :is_money_in
  def initialize(data)
    @sender = data['sender']
    @sender_currency = data['sender_currency']
    @status = data['status']
    @receiver_currency = data['receiver_currency']
    @tid = data['tid']
    @reference = data['reference']
    @receiver = data['receiver']
    @receipt_no = data['receipt_no']
    @timestamp = data['timestamp']
    @gross_amount = data['gross_amount']
    @net_amount = data['net_amount']
    @transacted_via = data['transacted_via']
    @is_money_in=data['is_money_in']
    @as_json = data
  end
  def json
    return @as_json
  end
end
