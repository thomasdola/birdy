defmodule Birdy.Sms do
    @moduledoc """
    
    """
    alias Birdy.Sms.Message
    alias Birdy.Sms.Recipients
    alias Birdy.Sms.Recipient
    alias Birdy.Auth

    @endpoint "https://rest.messagebird.com/messages"

    @doc """
    Returns the api endpoint
    """
    @spec request_url() :: String.t
    def request_url() do
        @endpoint
    end

    @doc """
    Sends the given %Birdy.Sms.Message{}
    Returns {:ok, {:status, 201}, %Birdy.Sms.Message{}} if successful
            {:error, reason} if failed
    """
    @spec send(Message.t) :: {atom, {atom, integer}, Message.t} | {atom, String.t}
    def send(%Message{originator: originator, body: body, recipients: recipients} = message) 
    when is_bitstring(originator) and is_bitstring(body) and is_list(recipients) 
    do
        message
        |> _cast_arg_to_form
        |> _send
        |> _parse_http_response
    end
    @doc """
    Matches send function calls with any invalid argument
    """
    @spec send(any) :: {atom, atom, any}
    def send(invalid_argument) do
        {:error, :invalid_argument, invalid_argument}
    end

    @spec _send({atom, Keyword.t}) :: HTTPoison.Response.t
    defp _send(data) do
        headers = Auth.headers()
        response = HTTPoison.post(request_url(), data, headers)
        response
    end

    @spec _cast_arg_to_form(Message.t) :: {atom, Keyword.t}
    defp _cast_arg_to_form(%Message{originator: originator, body: body, recipients: [recipient | _recipients]}) do
        {:form, [originator: originator, body: body, recipients: recipient]}
    end

    @spec _parse_http_response({atom, HTTPoison.Response.t}) :: {atom, {atom, integer}, Message.t}
    defp _parse_http_response({:ok, %HTTPoison.Response{} = response}) do
        message = _cast_to_sms_message(response.body)
        {:ok, {:status, response.status_code}, message}
    end
    @spec _parse_http_response({atom, HTTPoison.Error.t}) :: {atom, String.t}
    defp _parse_http_response({:error, %HTTPoison.Error{} = error}) do
        {:error, error.reason}
    end

    @spec _cast_to_sms_message(String.t) :: {atom, Message.t} | {atom, String.t}
    defp _cast_to_sms_message(data) do
        template = %Message{recipients: %Recipients{items: [%Recipient{}]}}
        message = 
            case Poison.decode(data, as: template) do
                {:ok, message} -> message
                {:error, reason} -> reason
            end
        message
    end
end