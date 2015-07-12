import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: addItemPage
    onAccepted: addItem()
    property LedgerModel ledgerModel

    function checkAndSetAccept() {
        addItemPage.canAccept = purpose.text.length > 0 &&
                cost.text.length > 0;
    }

    function addItem() {
        var newItem = ledgerModel.createItem(purpose.text, cost.text, balance.currentItem.text, Date.now());
        ledgerModel.addItem(newItem)
    }

    SilicaFlickable {
        anchors.fill: parent
        Column {
            anchors.fill: parent
            anchors.topMargin: Theme.paddingLarge
            anchors.leftMargin: Theme.paddingLarge
            anchors.rightMargin: Theme.paddingLarge
            spacing: Theme.paddingMedium

            PageHeader {
                title: qsTr("Add item")
            }

            TextField {
                id: purpose
                width: parent.width
                placeholderText: qsTr("Purpose")
                focus: true
                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: cost.focus = true
                onTextChanged: checkAndSetAccept()
            }

            TextField {
                id: cost
                placeholderText: qsTr("Cost")
                width: parent.width
                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: balance.focus = true
                validator: DoubleValidator { decimals: 2 }
                onTextChanged: checkAndSetAccept()
            }

            ComboBox {
                id: balance
                width: parent.width
                label: qsTr("Balancing account")

                menu: ContextMenu {
                    MenuItem { text: qsTr("Wallet") }
                    MenuItem { text: qsTr("Bank account") }
                    MenuItem { text: qsTr("Credit card") }
                }
            }
        }
    }    
}
