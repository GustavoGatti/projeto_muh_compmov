import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/Drawer/IconTile.dart';
import 'package:projeto_muh_compmov/screens/CadastroFzd.dart';
import 'package:projeto_muh_compmov/screens/fazendas_screen.dart';


class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTile(
          label: "Inicio",
          iconData: Icons.home,
          onTap: (){

          },
          high: false,
        ),
            IconTile(
            label: "Meu perfil",
            iconData: Icons.perm_identity,
            onTap: (){

            },
            high: false,
            ),
            IconTile(
              label: "Minha Fazenda",
              iconData: Icons.filter_hdr,
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => FazendasScreen()),
              );
              },
            high: false,
          ),
            IconTile(
              label: "Buscar",
              iconData: Icons.search,
              onTap: (){

                },
              high: false,
            ),
            IconTile(
            label: "DashBoard",
            iconData: Icons.assessment,
            onTap: (){

            },
            high: false,
            ),
//        IconTile(
//          label: "Minha Fazenda",
//          iconData: Icons.pets,
//          onTap: (){
//            Navigator.push(context,
//              MaterialPageRoute(builder: (context) => CadastroFzd()),
//            );
//          },
          //high: false,
//        Row(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.fromLTRB(20,0,10,0),
//           child: Row(
//             children: <Widget>[
//               Image.asset("assets/icone_ajuda.png"),
//                Text(
//                "Minha Fazenda",
//                  style: TextStyle(
//                  fontWeight: FontWeight.w600,
//                    letterSpacing: 0.8,
//                color: Colors.black,
//             ),
//                ),
//             ],
//           ),

      ],
    );
  }
}
