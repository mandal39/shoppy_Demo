import 'package:demo/config/enums.dart';
import 'package:demo/presentation/order_screen.dart';
import 'package:demo/states/order/order_bloc.dart';
import 'package:demo/states/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetProduct());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(state.products[index].name),
                onTap: () {
                  context
                      .read<OrderBloc>()
                      .add(AddProductToOrder(state.products[index]));
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrderScreen(),
            ),
          );
        },
        child: CircleAvatar(
          child:
              Text(context.watch<OrderBloc>().state.totalOrderCount.toString()),
        ),
      ),
    );
  }
}
