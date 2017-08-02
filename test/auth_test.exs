defmodule Birdy.AuthTest do
    @moduledoc false
    use ExUnit.Case
    alias Birdy.Auth

    @app_name :birdy
    @test_access_key "test_gshuPaZoeEG6ovbc8M79w0QyM"

    setup context do
        if context[:key] do
            Application.put_env(@app_name, :access_key, @test_access_key)
            on_exit fn -> Application.delete_env(@app_name, :access_key) end
        end
        :ok
    end

    @tag key: true
    test "access key is available" do
        expected = @test_access_key
        assert Auth.access_key! == expected
    end

    @tag key: true
    test "return right request headers" do
        expected = [Authorization: "AccessKey #{@test_access_key}"]
        assert Auth.headers == expected
    end

    @tag key: false
    test "raise RuntimeError" do
        assert_raise RuntimeError, "Undefined Access Key for #{@app_name}", fn -> 
            Auth.access_key!()
        end
    end
end