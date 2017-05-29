defmodule Birdy.SmsTest do
    @moduledoc false
    use ExUnit.Case
    alias Birdy.Sms

    @app_name :birdy
    @test_access_key "test_gshuPaZoeEG6ovbc8M79w0QyM"

    test "request endpoint" do
        expected = "https://rest.messagebird.com/messages"
        assert Sms.request_url == expected
    end
end