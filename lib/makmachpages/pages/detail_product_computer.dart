import 'package:flutter/material.dart';
import '/makmachpages/models/computer_model.dart';
import '../../global_config.dart';

class DetailProductComputer extends StatefulWidget {
  const DetailProductComputer({super.key, required this.data});

  final ComputerModel data;

  @override
  State<DetailProductComputer> createState() => _DetailProductComputerState();
}

class _DetailProductComputerState extends State<DetailProductComputer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Product"),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.red,
            child: Image.network(
              "$apiBaseUrl${widget.data.imges!}",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${widget.data.computerName}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Price: ${widget.data.price}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Ram: ${widget.data.ram}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "Model: ${widget.data.model}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "CPU: ${widget.data.storage}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "CPU: ${widget.data.vGA}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
