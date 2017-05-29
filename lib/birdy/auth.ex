defmodule Birdy.Auth do
    @moduledoc """
    
    """
    @app_name :birdy

    def access_key() do
        Application.get_env(@app_name, :access_key)
    end
end