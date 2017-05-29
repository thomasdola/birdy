defmodule Birdy.Sms.Recipients do
    @moduledoc false

    defstruct totalCount:                 nil,          #The total count of recipients.
              totalSentCount:             nil,          #The count of recipients that have the message pending (status sent, and buffered).
              totalDeliveredCount:        nil,          #The count of recipients where the message is delivered (status delivered).
              totalDeliveryFailedCount:   nil,          #The count of recipients where the delivery has failed (status delivery_failed).
              items:                      []            #An array of recipient 

    @type t :: %Birdy.Sms.Recipients{
        totalCount:                 integer,
        totalSentCount:             integer,
        totalDeliveredCount:        integer,
        totalDeliveryFailedCount:   integer,
        items:                      list(Birdy.Sms.Recipient.t)
    }
end