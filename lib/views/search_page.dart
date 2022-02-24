import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/style.dart';

import '../models/product.dart';
import '../network/product_api.dart';
import '../providers/navigation_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/grid_content.dart';
import '../widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    final NavigationProvider provider = context.read<NavigationProvider>();

    return AppLayout(
      searchBar: true,
      title: SearchBar(
        readOnly: false,
        controller: _searchController,
        onSubmitted: (value) {
          provider.setSearch(value);
        },
      ),
      body: _searchResult(provider),
    );
  }

  Widget _searchResult(NavigationProvider provider) {
    return FutureBuilder(
      future: ProductApi.searchProduct(name: provider.text),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            return _searchContent(snapshot.data);
          } else {
            return Center(
              child: Text(
                snapshot.data.message,
                style: lightText(13),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong!',
              style: lightText(13),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  Widget _searchContent(Product product) {
    final data = product.data;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6.0 / 10.0,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(10),
      itemCount: data!.length,
      itemBuilder: (BuildContext context, int index) {
        return GridContent(
          image: data[index].image,
          name: data[index].name,
          category: data[index].category,
          price: int.parse(data[index].price),
          discount: int.parse(data[index].discount),
          onTapArgs: <String, dynamic>{
            'product': data[index],
          },
        );
      },
    );
  }
}
