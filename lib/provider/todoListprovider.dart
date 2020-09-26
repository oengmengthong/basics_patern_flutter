import 'package:flutter/material.dart';
import 'package:mchat_app/model/itemMember.dart';
import 'package:mchat_app/model/itemPriority.dart';
import 'package:mchat_app/model/itemStatus.dart';

class ToDoListProvider with ChangeNotifier {
  TextEditingController _startDate = new TextEditingController();
  TextEditingController _endDate = new TextEditingController();
  TextEditingController _title = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  TextEditingController _status = new TextEditingController();
  TextEditingController _priority = new TextEditingController();
  TextEditingController _assignTo = new TextEditingController();

  TextEditingController get startDate => _startDate;
  TextEditingController get endDate => _endDate;
  TextEditingController get title => _title;
  TextEditingController get description => _description;
  TextEditingController get status => _status;
  TextEditingController get priority => _priority;
  TextEditingController get assignTo => _assignTo;

  void setStartDate(String date){
    _startDate.text = date;
    notifyListeners();
  }

  void setEndDate(String date){
    _endDate.text = date;
    notifyListeners();
  }

  void setTitle(String title){
    _title.text = title;
    notifyListeners();
  }

  void setDescription(String des){
    _description.text = des;
    notifyListeners();
  }

  void setStatus(ItemStatus st){
    _status.text = st.name;
    notifyListeners();
  }

  void setPriority(ItemPriority pr){
    _priority.text = pr.name;
    notifyListeners();
  }

  void setAssignTo(ItemMember im){
    _assignTo.text = im.name;
    notifyListeners();
  }
}