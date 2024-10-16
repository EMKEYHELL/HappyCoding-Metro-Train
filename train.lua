local function activateTrain(trackId)
    -- Attiva il servizio ferroviario su un binario specifico
    SwitchTrainTrack(trackId, true)
    SetRandomTrains(true)
end

local function deactivateTrain(trackId)
    -- Disattiva il servizio ferroviario su un binario specifico
    SwitchTrainTrack(trackId, false)
    SetRandomTrains(false)
end

local function activateMetro(trackId)
    -- Attiva il servizio metropolitano su un binario specifico
    SwitchTrainTrack(trackId, true)
    SetRandomTrains(true)
end

local function deactivateMetro(trackId)
    -- Disattiva il servizio metropolitano su un binario specifico
    SwitchTrainTrack(trackId, false)
    SetRandomTrains(false)
end

Citizen.CreateThread(function()
    while true do
        -- Attiva i treni sui binari
        activateTrain(0) -- Treni binario 0
        Citizen.Wait(3000) -- Aspetta 3 secondi
        deactivateTrain(0)

        activateTrain(3) -- Treni binario 3
        Citizen.Wait(3000) -- Aspetta 3 secondi
        deactivateTrain(3)

        -- Aspetta 5 minuti (300000 millisecondi) prima di riattivare i treni
        Citizen.Wait(60000)
    end
end)

Citizen.CreateThread(function()
    while true do
        -- Attiva le metropolitane sui binari
        activateMetro(1) -- Metro binario 1
        Citizen.Wait(3000) -- Aspetta 3 secondi
        deactivateMetro(1)

        activateMetro(2) -- Metro binario 2
        Citizen.Wait(3000) -- Aspetta 3 secondi
        deactivateMetro(2)

        -- Aspetta 5 minuti (300000 millisecondi) prima di riattivare le metropolitane
        Citizen.Wait(60000)
    end
end)
