import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({Key key, this.addNewTransaction}) : super(key: key);
  
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // String titleInput, amountInput;

    void _submitted() {
      if (_titleController.text.isEmpty ||
          double.parse(_amountController.text) <= 0) {
        return;
      }

      this.widget.addNewTransaction(
          _titleController.text, double.parse(_amountController.text));

      Navigator.of(context).pop();
    }

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
                  decoration: InputDecoration(
                    labelText: 'Title',
                    
                  ),
                  controller: _titleController,
                  onSubmitted: (_) => _submitted()
                  // onChanged: (val) => this.titleInput = val,
                  ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  onSubmitted: (_) => _submitted()
                  // onChanged: (val) => this.amountInput = val
                  ),
              FlatButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  onPressed: _submitted),
            ],
          ),
        ),
      ),
    );
  }
}
