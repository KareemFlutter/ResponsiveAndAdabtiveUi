import 'package:flutter/material.dart';

class LayoutuilderWidget extends StatelessWidget {
  const LayoutuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          if (constrains.maxWidth <= 500) {
            return const MobileLayout();
          } else {
            return const DesktopLayoutWidget();
          }
        },
      ),
    );
  }
}

class DesktopLayoutWidget extends StatefulWidget {
  const DesktopLayoutWidget({super.key});

  @override
  State<DesktopLayoutWidget> createState() => _DesktopLayoutWidgetState();
}

class _DesktopLayoutWidgetState extends State<DesktopLayoutWidget> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  number = index + 1;
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  color: Colors.green,
                  child: ListTile(
                    title: Text('${index + 1}'),
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        ),
        Expanded(
            child: Container(
          child: Center(
            child: Text(number.toString()),
          ),
        ))
      ],
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsView(number: index + 1),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            color: Colors.green,
            child: ListTile(
              title: Text('${index + 1}'),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}

class DetailsView extends StatelessWidget {
  final int number;
  const DetailsView({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
