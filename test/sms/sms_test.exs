defmodule Birdy.SmsTest do
    @moduledoc false
    use ExUnit.Case
    use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

    alias Birdy.Sms
    alias Birdy.Sms.Message

    @app_name :birdy
    @endpoint "https://rest.messagebird.com/messages"
    @test_access_key "test_gshuPaZoeEG6ovbc8M79w0QyM"

    setup context do
        if context[:key] do
            Application.put_env(@app_name, :access_key, @test_access_key)
            on_exit fn -> Application.delete_env(@app_name, :access_key) end
        end
        :ok
    end

    @tag key: false
    test "request endpoint" do
        expected = @endpoint
        assert Sms.request_url == expected
    end

    @tag key: true
    test "send sms" do
        use_cassette "sending sms" do
            expected_start = {:ok, {:status, 201}}
            message = %Message{originator: "Org", body: "this is just a test", recipients: ["00233248086578"]}
            {_, _, response_end} = response = Sms.send(message)
            assert Tuple.delete_at(response, 2) == expected_start
            assert is_map(response_end) == true
        end
    end

    @tag key: true
    test "invalid argument" do
        expected = {:error, :invalid_argument}
        message = %Message{originator: "Org", body: "this is just a test", recipients: "00233248084578"}
        response = Sms.send(message)
        assert Tuple.delete_at(response, 2) == expected
    end

    # @tag key: false
    # test "raise runtime error" do
    #     message = %Message{originator: "Org", body: "this is just a test", recipients: "00233244089578"}
    #     assert_raise RuntimeError, "Undefined Access Key for #{@app_name}", fn -> 
    #         Sms.send(message)
    #     end
    # end
end