defmodule Birdy.Sms do
    @moduledoc """
    
    """
    @endpoint "https://rest.messagebird.com/messages"
    def request_url() do
        @endpoint
    end
end