import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 480
    height: 480
    title: "Tacómetro Simulado"

    Rectangle {
        anchors.fill: parent
        color: "black"

        RpmBar {
            id: rpmBar
            anchors.centerIn: parent
            value: rpmBridge.rpm
}
}

}
