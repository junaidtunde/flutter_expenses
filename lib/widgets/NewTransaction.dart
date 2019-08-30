import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addNewTransaction;

  const NewTransaction({Key key, this.addNewTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String titleInput, amountInput;
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autocorrect: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                // onChanged: (val) => this.titleInput = val,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                onEditingComplete: () {
                  this.addNewTransaction(titleController.text, double.parse(amountController.text));
                },
                // onChanged: (val) => this.amountInput = val
              ),
              FlatButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {
                  this.addNewTransaction(titleController.text, double.parse(amountController.text));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
