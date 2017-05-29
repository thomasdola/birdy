defmodule Birdy.Sms.Recipient do
    @moduledoc false

    defstruct recipient:            nil,
              status:               nil,
              statusDatetime:       nil

    @type t :: %Birdy.Sms.Recipient{
        recipient:          integer,            #The msisdn of the recipient
        status:             String.t,           #The status of the message sent to the recipient. Possible values: scheduled, sent, buffered, delivered, expired, and delivery_failed
        statusDatetime:     String.t            #The datum time of the last status in RFC3339 format (Y-m-d\TH:i:sP)
    }
end