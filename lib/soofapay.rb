# soofapay intergation library
require_relative '' "soofapay/version"
require 'rest-client'
require 'json'
require_relative 'transaction'
require 'uri'
require_relative 'soofa_error_handler'

class Soofa
  SUCCESSFUL = 200
  LOGGER = Logger.new(STDOUT)

  def initialize(till_no, client_secret)
    @till_no = till_no
    @client_secret = client_secret
    @transaction = nil
    @status = nil
  end

  def find(tid)
    @url = "https://api.soofapay.com/v1/transactions/#{tid}/"
    headers = {"Authorization": @client_secret,
               "X-TILL": @till_no}
    begin
      response = RestClient.get(@url, headers = headers)
      data = JSON.parse(response)
      _status = data["status"]
      if response.code == SUCCESSFUL
        @transaction = Transaction.new(data)
        return true
      end
    rescue RestClient::NotFound
      LOGGER.warn("The transaction %s does not exist" % tid)
      return false
    rescue RestClient::Forbidden
      raise SoofaPermissionError.new("Your are not allowed to perform this action. Please ensure you use your correct till number and client_secret")
    end
  end

  def get_transaction
    if @transaction == nil
      raise Exception("A transaction is not available yet. Please ensure you call find method and verify that one exists before proceeding")
    else
      return @transaction
    end
  end

  def get_balance
    @url = "http://api.soofapay.com/v1/balance/"
    headers = {"Authorization": @client_secret,
               "X-TILL": @till_no}
    begin
      response = RestClient.get(@url, headers = headers)
      data = JSON.parse(response).to_json
      return data
    rescue RestClient::Forbidden
      raise SoofaPermissionError.new("Your are not allowed to perform this action. Please ensure you use your correct till number and client_secret")
    end
  end
end



