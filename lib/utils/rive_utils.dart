import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {stateMachineName = "State Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(controller!);
    return controller;
  }

  static void triggerInput(StateMachineController controller, String inputName) {
    final input = controller.findInput<bool>(inputName);
    if (input is SMIBool) {
      input.value = !input.value;
    }
  }

}
