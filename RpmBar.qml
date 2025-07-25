import QtQuick 2.15

Item {
    id: root
    width: 300
    height: 300
    property int value: 0

    // Fondo base general
    Image {
        id: fondoBase
        source: "assets/fondo_general.png"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }


    // gauge rpm
    Image {
        id: background
        source: "assets/gauge.png"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Aguja del tacómetro
            var minAngle = -Math.PI;       // ángulo para 0 RPM
            var maxAngle = Math.PI / 4;   // ángulo para 6000 RPM (135° de recorrido)
            var angle = minAngle + (value / 6000) * (maxAngle - minAngle);
            var centerX = width / 2;
            var centerY = height / 2;
            var length = 100;

            var x = centerX + length * Math.cos(-Math.PI / 2 + angle);
            var y = centerY + length * Math.sin(-Math.PI / 2 + angle);

            ctx.beginPath();
            ctx.moveTo(centerX, centerY);
            ctx.lineTo(x, y);
            ctx.strokeStyle = "red";
            ctx.lineWidth = 4;
            ctx.stroke();

            // RPM en texto
            ctx.font = "bold 24px sans-serif";
            ctx.fillStyle = "white";
            ctx.textAlign = "center";
            ctx.fillText(value + " RPM", width / 2, height - 20);
        }

        Connections {
            target: root
            function onValueChanged() {
                canvas.requestPaint();
            }
        }
    }
}