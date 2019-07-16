require "json"
#transaction class for soofa requests
class Transaction
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
    @as_string= data.to_json
  end
  def as_json
    return JSON.parse(@as_string)
  end
  def as_string
    return @as_string
  end
  def status
    return @status
  end
  def sender_currency
    return @sender_currency
  end
  def receiver_currency
    return  @receiver_currency
  end
  def tid
    return @tid
    end
  def reference
    return @reference
  end
  def sender
    return @sender
  end
  def receiver
    return  @receiver
  end
  def receipt_no
    return @receipt_no
  end
  def timestamp
    return @timestamp
  end
  def gross_amount
    return @gross_amount
  end
  def net_amount
    return @net_amount
  end
  def transacted_via
    return  @transacted_via
  end
  def is_money_in
    return @is_money_in
  end
end
