
# FoodFest_SwiftUI

This is POC is demonstrating SwiftUI with MVVM Architecture.




## API Reference
https://www.themealdb.com/api.php

#### Get all categories 

```http
  GET /api/json/v1/1/categories.php
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `NA` | `NA` | **To get all categories** |

#### Get Menu Items From Category

```http
  GET /api/json/v1/1/filter.php?c=${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Id of Category to fetch related Menu Items** |

#### Get Item Details

```http
  GET /api/json/v1/1/lookup.php?i=${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Id of Menu Item to fetch related Menu Item Details** |




## 🛠 Skills
Swift, SwiftUI, iOS

