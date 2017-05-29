defmodule Birdy.AuthTest do
    @moduledoc false
    use ExUnit.Case
    alias Birdy.Auth

    @app_name :birdy
    @test_access_key "test_gshuPaZoeEG6ovbc8M79w0QyM"

    setup_all do
        Application.put_env(@app_name, :access_key, @test_access_key)
    end

    test "access key is available" do
        expected = @test_access_key
        assert Auth.access_key == expected
    end
end