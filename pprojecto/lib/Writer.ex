defmodule Empresa.Writer do
  defp to_map(%Empresa.Empleado{nombre: n, apellido: a, id: i, sector: s, turno: t, sueldo: sv}) do
    %{"nombre" => n, "apellido" => a, "id" => i, "sector" => s, "turno" => t, "sueldo" => sv}
  end

  defp to_map(_x) do
    nil
  end

  defp to_json(m) do
    {:ok, json_version} = Jason.encode(m)
    json_version
  end


  defp guardado(str) do
    File.write("empleados.json", str)
  end

  def write(empleados) do
    empleados
    |> Enum.map(&to_map/1)
    |> Enum.filter(fn
      nil -> false
      _ -> true
    end)
    |>  to_json
    |> guardado
  end
end
