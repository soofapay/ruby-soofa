# Ruby Soofa
This package is aimed at simplifying the process of integrating soofapay payment solution to your ruby systems. You can check our 
[website] for more
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'soofapay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install soofapay

## Usage
##### 1. Checking for a transaction
```ruby
require 'soofapay'

soofa = Soofa.new("your_till_number", 'your_client_secret')
puts "soofa balance is:  ",soofa.get_balance.class
exist = soofa.find("QTMB6")
if exist
  @trx = soofa.get_transaction
  puts @trx.tid
  puts @trx.gross_amount
  puts @trx.as_json['reference']
  puts @trx.as_string
end

```
The expected response for transaction check is  `Transaction` 
object with various keys and methods

There is an additional method for getting the entire JSON object.

> transaction.json()

[website]: <https://www.soofapay.com>

```JSON
{
    "status": "SUCCESSFUL",
    "sender_currency": "KES",
    "receiver_currency": "KES",
    "tid": "QTMB3",
    "reference": "T5004",
    "receipt_no": "NFQ6U45W28",
    "timestamp": 1561499777.715254,
    "gross_amount": 5,
    "net_amount": 4.8605,
    "transacted_via": "mpesa",
    "is_money_in": true,
    "sender": "+254701234567",
    "receiver": "Dev Market"
}
```

The table below describes all the attributes of the transaction object.


| Key | Description |
| ------ | ------ |
| status | The state of the transaction, either `SUCCESSFUL` or `PENDING` |
| sender_currency | The currency of the person who performed the transaction  |
| receiver_currency | The currency of the business, if the transaction was Money in for the business |
| reference | The transaction reference passed when making a transaction |
| timestamp | Unix timestamp for the transaction |
| gross_amount | The amount of the transaction |
| net_amount | The amount received after deducting soofa |
| transacted_via | The service provider which facilitated the transaction eg. mpesa, visa, airtelmoney, mastercard, tkash ... |
| is_money_in | A boolean indicating if the money was to the business or out of the business |
| sender | The performer of transaction |
| receiver | The receiver of the transaction which is the business if the transaction was inbound |

##### 2. Checking your soofa business account balance
```ruby
require 'soofapay'

soofa = Soofa.new("you_soofa_till_number", "your_client_secret_here")
balance = soofa.get_balance()
print(balance)
```

The expected response for checking balance is a JSON with three fields:

[website]: <https://www.soofapay.com>


```JSON
{
    "balance": "1587.49",
    "currency": "KES",
    "timestamp": 1561820831.623298
}
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soofapay/ruby-soofa/issues

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Soofa project’s codebases and issue trackers is expected to follow the [code of conduct](https://github.com/soofapay/ruby-soofa/blob/master/CODE_OF_CONDUCT.md).