class CategoryProductsQueries {
  factory CategoryProductsQueries() {
    return _instance;
  }
  CategoryProductsQueries._();
  static final CategoryProductsQueries _instance = CategoryProductsQueries._();

  Map<String, dynamic> getProductsByCategoryMapQuery({
    required int categoryId,
  }) {
    return {
      'query':
          '''
            {
          products(categoryId: $categoryId) {
              id
              title
              price
              images
              description
              category{
                    id
                    name
                }
          }
        },
      ''',
    };
  }
}
