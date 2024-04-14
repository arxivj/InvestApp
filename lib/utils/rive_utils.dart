import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {String stateMachineName = 'State Machine 1'}) {
    StateMachineController? controller =
    StateMachineController.fromArtboard(artboard, stateMachineName);
    if (controller != null) {
      artboard.addController(controller);
      return controller;
    } else {
      throw Exception('Failed to find the state machine controller');
    }
  }

  static void triggerInput(StateMachineController controller, String inputName) {
    final input = controller.findInput<bool>(inputName);
    if (input is SMIBool) {
      input.value = !input.value;
    }
  }
}