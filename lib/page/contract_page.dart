import 'package:chat/model/user_info.dart';
import 'package:chat/widget/contract_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 需要从后台数据库查询用户数量及姓名信息
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ContractView(
              userName: "wes",
            );
          }),
    );
  }
}
