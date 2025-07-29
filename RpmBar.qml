import QtQuick 2.15
import QtQuick.Controls 2.15


Item {
    id: root
    width: 400
    height: 400
    property int value: 0

    // Ángulos
    property real minAngle: -Math.PI
    property real maxAngle: Math.PI / 4
    property real angle: minAngle + (value / 6000) * (maxAngle - minAngle)

    // Centro de rotación
    property real centerX: width / 2
    property real centerY: height / 2

    // Imagen de fondo general
    Image {
        id: fondoBase
        source: "assets/fondo_general.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }



    // Imagen del gauge
    Image {
        id: background
        source: "assets/gauge.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    Text {
        text: Math.round(root.value) + " RPM"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.verticalCenterOffset: -26
        color: "white"
        font.pixelSize: 22
        font.bold: true
    }

    Slider {
        id: rpmSlider
        from: 0
        to: 6000
        value: root.value
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: -20
        }
        width: parent.width * 0.6

        onValueChanged: {
            root.value = rpmSlider.value
        }
    }

    Item {
        id: needlePivot
        width: 0
        height: 0
        anchors.centerIn: parent
        rotation: angle * 180 / Math.PI

        Image {
            id: needle
            source: "assets/needle2.png"
            width: 200
            height: 200
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }

        Behavior on rotation {
            NumberAnimation {
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
    }

    Image {
        id: centroGauge
        source: "assets/gauge3.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
           /* // // Aguja del tacómetro
            var length = 130;

            var x = centerX + length * Math.cos(-Math.PI / 2 + angle);
            var y = centerY + length * Math.sin(-Math.PI / 2 + angle);

            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(x, y);
            ctx.strokeStyle = "#ffffffff";
            ctx.lineWidth = 4;
            ctx.stroke(); 

            ctx.font = "bold 24px sans-serif";
            ctx.fillStyle = "white";
            ctx.textAlign = "left";
            ctx.fillText(value + " RPM", width / 2, height - 20);

            ctx.beginPath();
            ctx.arc(centerX, centerY, 3, 0, 2 * Math.PI);
            ctx.fillStyle = "white";
            ctx.fill(); */
        }

        Connections {
            target: root
            function onValueChanged() {
                canvas.requestPaint();
            }
        }
    }
}
