defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      # aplicaciones legacy
      legacy? and level == 1 -> :debug
      legacy? and level == 2 -> :info
      legacy? and level == 3 -> :warning
      legacy? and level == 4 -> :error
      legacy? -> :unknown
      # aplicaciones modernas
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    # prueba
    cond do
      label == :error or label == :fatal -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end
