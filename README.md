# gaugeClio
Medido de RPM para mi Clio
        Timer {
            interval: 100
            running: true
            repeat: true
            onTriggered: {
                rpmValue += 100
                if (rpmValue > 8000) rpmValue = 0
            }
        }

        property int rpmValue: 0
    }