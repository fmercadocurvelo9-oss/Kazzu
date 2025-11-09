-- Script avanzado para Delta Executor en LatinRot

-- Función para desincronizarse del servidor por 10 segundos
local function desincronizar()
    local tiempo_desincronizado = 10 -- Tiempo en segundos
    local tiempo_inicio = tick()

    while tick() - tiempo_inicio < tiempo_desincronizado do
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        -- Detener el movimiento del jugador
        humanoid:MoveTo(character.HumanoidRootPart.Position)
        wait(0.1) -- Esperar 0.1 segundos para evitar detección
    end
end

-- Función para permitir atravesar objetos
local function atravesar_objetos()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    while true do
        for _, part in ipairs(workspace:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "Floor" then -- Ignorar el piso
                part.CanCollide = false
                part.Transparency = 0.5 -- Hacer los objetos semi-transparentes para mayor efectividad
            end
        end

        wait(0.1) -- Esperar 0.1 segundos para evitar detección
    end
end

-- Función para hacer la interfaz movable
local function interfaz_movable()
    local ui = game:GetService("CoreGui"):FindFirstChild("PlayerGui")
    if ui then
        ui.Draggable = true
        ui.Active = true -- Asegurar que la interfaz esté activa
    end
end

-- Ejecutar las funcionez
desincronizar()
atravesar_objetos()
interfaz_movable()
