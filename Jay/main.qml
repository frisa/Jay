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
            name: "Jan"
            number: "0786496667"
            country: "CH"
        }
        ListElement{
            name: "Marketa"
            number: "0774473315"
            country: "CH"
        }
        ListElement{
            name: "Jan"
            number: "0755102783"
            country: "CZ"
        }
        ListElement{
            name: "Marketa"
            number: "0755102788"
            country: "CZ"
        }
    }

    Component {
        id: phoneDelegateExt
        Text {
            readonly property ListView __lv: ListView.view
            width: parent.width
            text: '<b>Name:</b> ' + model.name + '   <b>number:<b>' + model.number
            font.pixelSize: 12
            MouseArea{
                anchors.fill: parent
                onClicked: __lv.currentIndex = model.index
            }
        }
    }

    ListView{
        id: lvPhones
        anchors.fill: parent
        model: phoneNumbers
        delegate: phoneDelegateExt
        section.property: "country"
        section.criteria: ViewSection.FullString
        section.delegate: Rectangle{
            color: "#b0dfb0"
            width: parent.width
            implicitHeight: textSection.implicitHeight + 4
            Text{
                id: textSection
                anchors.centerIn: parent
                font.pixelSize: 10
                font.bold: true
                text: section
            }
        }

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
    Text{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 8
        text: "<b>Current Item</b>:   " + lvPhones.currentItem.text
    }
}
