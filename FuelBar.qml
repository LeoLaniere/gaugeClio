import QtQuick 2.15

Item {
    id: root
    z: 10  // asegúrate que esté sobre rpmBar
    width: 400
    height: 400
    scale:2
    property real fuelLevel: 0.5 // de 0.0 a 1.0



Canvas {
    id: canvas
    anchors.fill: parent
    onPaint: {
        var ctx = getContext("2d");
        ctx.clearRect(0, 0, width, height);

        var radius = width / 3.2;
        var startAngle = -Math.PI * 0.98;
        var endAngle = -Math.PI * 13/35;
        var angle = startAngle + (endAngle - startAngle) * root.fuelLevel;

        ctx.beginPath();
        ctx.arc(width / 2, height / 2, radius - 15, startAngle, angle);
        ctx.lineWidth = 15;
        ctx.strokeStyle = "#3db1ffff";
        ctx.lineCap = "square";
        ctx.stroke();
    }

    Connections {
        target: root
        function onFuelLevelChanged() {
            canvas.requestPaint();
        }
    }
}

    // Imagen por encima de todo
    Image {
        source: "assets/Comb_1.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }
}
