import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    title: qsTr("qqc2-demo")
    width: columnLayout.implicitWidth + 40
    height: columnLayout.implicitHeight + 40
    visible: true

    ColumnLayout {
        id: columnLayout
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: qsTr("Text")
        }

        ColumnLayout {
            RadioButton {
                checked: true
                text: qsTr("First")
            }

            RadioButton {
                text: qsTr("Second")
            }

            RadioButton {
                text: qsTr("Third")
            }
        }

        ComboBox {
            model: [ "First", "Second", "Third" ]
        }

        Slider {
            from: 1
            value: 25
            to: 100
        }

        RangeSlider {
            from: 1
            to: 100
            first.value: 25
            second.value: 75
        }

        ProgressBar {
            value: 0.5
            Layout.fillWidth: true
        }

        Button {
            text: qsTr("Push Me")
        }
    }
}
