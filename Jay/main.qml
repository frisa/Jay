import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Jay")

    ListModel
    {
        id: phoneNumbers
        ListElement{
            name: "Jan Swiss"
            number: "0786496667"
        }
        ListElement{
            name: "Marketa Swiss"
            number: "0774473315"
        }
        ListElement{
            name: "Jan Czech"
            number: "0774473315"
        }
    }

    Component {
        id: phoneDelegate
        Item {
            height: 40
            width: ListView.view.width
            Column {
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
            }
        }
    }

    ListView{
        anchors.fill: parent
        model: phoneNumbers
        delegate: phoneDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 2 }
        focus: true
    }
}
