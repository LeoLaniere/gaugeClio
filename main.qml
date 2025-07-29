import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 500
    height: 500
    title: "Tacómetro Simulado"

    Rectangle {
        anchors.fill: parent
        color: "#1e1e1e" // fondo visible
        z:-1 // Fondo detrás de todo
    }

    FuelBar {
        id: fuelBar
        anchors.centerIn: parent
        fuelLevel: 1  // 75% de combustible
    }
    RpmBar {
        id: rpmBar
        anchors.centerIn: parent
        value: RpmBridge.rpm
    }

}

