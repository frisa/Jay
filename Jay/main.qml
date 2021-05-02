import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 500
    height: 250
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
        id: phoneDelegateExt
        Text {
            readonly property ListView __lv: ListView.view
            width: parent.width
            text: '<b>Name:</b> ' + model.name + '<b>number:<b>' + model.number
            font.pixelSize: 12
            MouseArea{
                anchors.fill: parent
                onClicked: __lv.currentIndex = model.index
            }
        }
    }

    ListView{
        anchors.fill: parent
        model: phoneNumbers
        delegate: phoneDelegateExt
        header: Rectangle{
            height: 5
            anchors {left: parent.left; right: parent.right }
            color: 'green'
        }
        footer:Rectangle{
            height: 5
            anchors {left: parent.left; right: parent.right }
            color: 'blue'
        }

        highlight: Rectangle {
            anchors {left: parent.left; right: parent.right }
            color: "lightsteelblue"; radius: 2
        }
        focus: true
        flickableDirection: Flickable.AutoFlickDirection
    }
}
