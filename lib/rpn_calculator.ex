defmodule RPNCalculator do
  def calculate!(stack, operation) do 
      operation.(stack)
  end

  def calculate(stack, operation) do
      try do
         {:ok, operation.(stack)}
      rescue
         RuntimeError -> :error
      end  
  end

  def calculate_verbose(stack, operation) do
     try do
         {:ok, operation.(stack)}
      rescue          
        message in ArgumentError -> {:error, Map.fetch!(message, :message)}
      end  
  end
end
