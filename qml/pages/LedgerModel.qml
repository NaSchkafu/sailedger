import QtQuick 2.0
import sailedger 1.0

ListModel {
    id: ledgerModel;
    property JsonStorage jsonStorage: JsonStorage {}
    property string json

    Component.onCompleted: { json = jsonStorage.load_json(); parseJson(); }

    function parseJson() {
        clear();

        if(json === "")
            return;

        var objects = JSON.parse(json);
        for(var o in objects["items"]) {
            append(objects["items"][o]);
        }

        console.log("Count " + count);
    }

    function addItem(newItem) {
        var objects;
        if(json === "")
           objects = { items: [] };
        else
           objects = JSON.parse(json);

        objects["items"].push(newItem);
        json = JSON.stringify(objects);
        parseJson(json);

        jsonStorage.save_json(json);
    }

    function createItem(purpose, cost, balance, date) {
        var newItem = {
            "purpose": purpose,
            "cost": parseFloat(parseFloat(cost).toFixed(2)),
            "balance": balance,
            "date": date
        }

        return newItem;
    }

}
