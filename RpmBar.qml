import QtQuick 2.15

Item {
    id: root
    width: 300
    height: 300
    property int value: 0

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // fondo
            ctx.beginPath();
            ctx.arc(width/2, height/2, 120, 0, 2*Math.PI);
            ctx.strokeStyle = "#333";
            ctx.lineWidth = 20;
            ctx.stroke();

            // barra de RPM
            var angle = (value / 8000) * Math.PI * 1.5;  // desde 0 a 8000 RPM
            ctx.beginPath();
            ctx.arc(width/2, height/2, 120, -Math.PI/2, -Math.PI/2 + angle);
            ctx.strokeStyle = "red";
            ctx.lineWidth = 20;
            ctx.stroke();

            // texto
            ctx.font = "bold 24px sans-serif";
            ctx.fillStyle = "white";
            ctx.textAlign = "center";
            ctx.fillText(value + " RPM", width/2, height/2);
        }

        Connections {
            target: root
            onValueChanged: canvas.requestPaint()
        }
    }
}
