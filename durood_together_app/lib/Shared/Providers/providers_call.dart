import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:provider/provider.dart';

class Providers {
  dynamic duroodCountVM_provider;

  Providers([_context]) {
    if (_context != null) {
      duroodCountVM_provider = Provider.of<DuroodCountVM>(_context);
      print(this.duroodCountVM_provider);
    }
  }

  dynamic getDurood() {
    return this.duroodCountVM_provider;
  }
}
