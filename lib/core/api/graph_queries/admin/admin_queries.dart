class AdminQueries {
  factory AdminQueries() => instance;

  const AdminQueries._();

  static const AdminQueries instance = AdminQueries._();

  Map<String, dynamic> getProductsNumberQuery() {
    return {
      'query': '''
       {
         products {
           title
         }
       }
''',
    };
  }

  Map<String, dynamic> getUsersNumberQuery() {
    return {
      'query': '''
       {
         users {
           name
         }
       }
''',
    };
  }

  Map<String, dynamic> getCategoryNumberQuery() {
    return {
      'query': '''
       {
         categories {
           id
         }
       }
''',
    };
  }

  Map<String, dynamic> getAllCategoriesQuery() {
    return {
      'query': '''
       {
         categories {
           id
           name
           image
         }
       }
''',
    };
  }

  Map<String, dynamic> createCategoryQuery({
    required String name,
    required String image,
  }) {
    return {
      'query': r'''
mutation CreateCategory($name: String!, $image: String!) {
  addCategory(data: { name: $name, image: $image }) {
    id
    name
    image
  }
}
''',
      'variables': {
        'name': name,
        'image': image,
      },
    };
  }
}
