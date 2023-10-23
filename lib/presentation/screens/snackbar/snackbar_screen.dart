import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();//esta linea hace que cada ves que se presione el boton, el anackbar se cerrara y abrira

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: (){}),
      duration: const Duration(seconds: 2),
      );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Id ut velit voluptate elit duis anim id voluptate fugiat et velit ullamco. Qui excepteur exercitation nulla dolor sunt quis ullamco do pariatur laborum elit veniam. Elit sunt deserunt sint irure elit do in commodo in excepteur consequat officia. Reprehenderit ex cupidatat sit occaecat qui nostrud adipisicing id labore mollit esse ea laboris. Anim culpa duis deserunt aute magna nostrud est ut eu irure ut sint non. Amet ea ipsum sint velit qui occaecat amet sit ad adipisicing in culpa.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),

          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snackbars y Diálogos'),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              FilledButton.tonal(
                onPressed: (){
                  showAboutDialog(
                    context: context,
                    children: [
                      const Text('Mollit id pariatur do ipsum eiusmod. Dolore enim dolore est exercitation culpa mollit. Commodo magna irure aute officia aute esse id nulla labore in ullamco aliqua.')
                    ]
                    );
                }, child: const Text('Licencias usadas')),

                FilledButton.tonal(

                
                onPressed: () => openDialog(context)
                , child: const Text('Mostrar diálogo')
                
                ),
            ],
          ),
        ),


        floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.remove_red_eye_outlined),
            label: const Text('Mostrar Snackbar'),
            onPressed: () => showCustomSnackbar(context)
            )
        );
  }
}
