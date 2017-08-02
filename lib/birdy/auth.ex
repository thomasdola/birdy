defmodule Birdy.Auth do
    @moduledoc """
    
    """
    @app_name :birdy

    @doc """
    Returns the api access key token
    Or raises RuntimeError if the access key is not available
    """
    @spec access_key!() :: String.t
    def access_key!() do
        key = 
            case Application.get_env(@app_name, :access_key) do
                nil -> raise("Undefined Access Key for #{@app_name}")
                key -> key
            end
        key
    end

    @doc """
    Builds and returns the http authentication headers
    """
    @spec headers() :: Keyword.t
    def headers() do
        key = access_key!()
        [Authorization: "AccessKey #{key}"]
    end
end