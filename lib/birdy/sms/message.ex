defmodule Birdy.Sms.Message do
    @moduledoc """
    This object represents a message at MessageBird.com
    """
    defstruct id:                   nil,            # A unique random ID which is created on the MessageBird platform and is returned upon creation of the object.
              originator:           nil,            # The sender of the message. This can be a telephone number (including country code) or an alphanumeric string. In case of an alphanumeric string, the maximum length is 11 characters.
              body:                 nil,            # The body of the SMS message.
              recipients:           nil             # The hash with recipient information. Further explanation in the table below.

    @type t :: %Birdy.Sms.Message{
        id:                 String.t,
        originator:         String.t,
        body:               String.t,
        recipients:         String.t | list(String.t) | Birdy.Sms.Recipients.t,
    }
end