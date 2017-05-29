defmodule Birdy.Sms.Message do
    @moduledoc """
    This object represents a message at MessageBird.com
    """
    defstruct id:                   nil,            # A unique random ID which is created on the MessageBird platform and is returned upon creation of the object.
              href:                 nil,            # The URL of the created object.
              direction:            nil,            # Tells you if the message is sent or received.
              type:                 nil,            # The type of message. Values can be:sms,binary,premium, or flash.
              originator:           nil,            # The sender of the message. This can be a telephone number (including country code) or an alphanumeric string. In case of an alphanumeric string, the maximum length is 11 characters.
              body:                 nil,            # The body of the SMS message.
              reference:            nil,            # A client reference.
              validity:             nil,            # The amount of seconds that the message is valid. If a message is not delivered within this time, the message will be discarded.
              gateway:              nil,            # The SMS route that is used to send the message.
              datacoding:           nil,            # The datacoding used, can be plain (GSM 03.38 characters only), unicode (contains non-GSM 03.38 characters) or auto, we will then set unicode or plain depending on the body content.
              mClass:               nil,            # Indicated the message type. 1 is a normal message, 0 is a flash message. (0-3 are valid values)
              scheduledDatetime:    nil,            # The scheduled date and time of the message in RFC3339 format (Y-m-d\TH:i:sP).
              createdDatetime:      nil,            # The date and time of the creation of the message in RFC3339 format (Y-m-d\TH:i:sP).
              recipients:           nil             # The hash with recipient information. Further explanation in the table below.

    @type t :: %Birdy.Sms.Message{
        id:                 String.t,
        href:               String.t,
        direction:          String.t,
        type:               String.t,
        originator:         String.t,
        body:               String.t,
        reference:          String.t,
        validity:           integer,
        gateway:            integer,
        datacoding:         String.t,
        mClass:             integer,
        scheduledDatetime:  String.t,
        createdDatetime:    String.t,
        recipients:         Birdy.Sms.Recipients.t,
    }
end