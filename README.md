# Pet Store API [![Build Status](https://travis-ci.org/azbshiri/pet-store.svg?branch=master)](https://travis-ci.org/azbshiri/pet-store) [![codecov](https://codecov.io/gh/azbshiri/pet-store/branch/master/graph/badge.svg)](https://codecov.io/gh/azbshiri/pet-store)

This is a simple pet store REST API that simplifies interaction between pet owners and customers.

## Sign up
Register as a new user

`POST` http://localhost:3000/sign_up?as=:role

#### Path Parameters
| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| role | String | User role. `pet_owner`, `manager`, `customer`   |

#### Result Format - Sign up
```
{
	"email": "test+customer@gmail.com",
	"role": "customer",
	"created_at": "2018-06-20T20:30:15.425Z",
	"updated_at": "2018-06-20T20:30:15.425Z"
}
```

## View pets
View the details of multiple pets

`GET` http://localhost:3000/pets?limit=:limit&offset=:offset

#### Path Parameters
| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| limit | String | How many pets to return. Default is 10   |
| offset | String | Result offset. Default is 0.  |

#### Result Format - View pets
```
[
	{
		"id": "6YEfR6",
		"name": "foo",
		"pet_type": "cat",
		"created_at": "2018-06-20T20:28:52.561Z",
		"updated_at": "2018-06-20T20:29:54.801Z",
		"owner": {
			"email": "test+owner@gmail.com",
			"role": "pet_owner",
			"created_at": "2018-06-20T20:27:23.013Z",
			"updated_at": "2018-06-20T20:27:23.013Z"
		}
	},
	{
		"id": "6YFfR6",
		"name": "bar",
		"pet_type": "cat",
		"created_at": "2018-06-20T20:28:53.561Z",
		"updated_at": "2018-06-20T20:29:56.801Z",
		"owner": {
			"email": "test+manager@gmail.com",
			"role": "manager",
			"created_at": "2018-06-20T20:27:23.013Z",
			"updated_at": "2018-06-20T20:27:23.013Z"
		}
	}
]
```



## View pet
View the details of a single pet


`GET` http://localhost:3000/pets/:id

#### Path Parameters
| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| id | String | **REQUIRED** Pet ID   |



#### Body Parameters - Add a pet 

| name | type    | description    |
| ---- | ------- | -------------- |
| email | String | **REQUIRED** Email address   |
| password | String | **REQUIRED** Password   |
| password | String | **REQUIRED** Password confirmation   |

#### Result Format - Add a pet
```
{
	"id": "673fL6",
	"name": "foo",
	"pet_type": "cat",
	"created_at": "2018-06-19T20:37:38.442Z",
	"updated_at": "2018-06-19T21:03:01.976Z",
	"owner": {
		"email": "test@gmail.com",
		"created_at": "2018-06-19T20:36:16.703Z",
		"updated_at": "2018-06-19T20:36:16.703Z"
	}
}
```

## Add a pet
Add a new pet to your collection

`POST` http://localhost:3000/pets

#### Body Parameters - Add a pet 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| name | String | **REQUIRED** Pet name   |
| pet_type | String | **REQUIRED** Pet type. `dog`, `cat` |

#### Result Format - Add a pet
```
{
	"id": "673fL6",
	"name": "foo",
	"pet_type": "cat",
	"created_at": "2018-06-19T20:37:38.442Z",
	"updated_at": "2018-06-19T21:03:01.976Z",
	"owner": {
		"email": "test@gmail.com",
		"created_at": "2018-06-19T20:36:16.703Z",
		"updated_at": "2018-06-19T20:36:16.703Z"
	}
}
```

## Update a pet

Update an existing pet


`PUT` http://localhost:3000/pets/:id

#### Path Parameters - Update a pet 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| id | String | **REQUIRED** Pet ID   |

#### Body Parameters - Update a pet 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| name | String | **REQUIRED** Pet name   |
| pet_type | String | **REQUIRED** Pet type. `dog`, `cat` |


#### Result Format - Update a pet
```
{}
```

## Delete a pet
Delete an existing pet


`DELETE` http://localhost:3000/pets/:id

#### Body Parameters - Add a pet 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| id | String | **REQUIRED** Pet ID   |

#### Result Format - Delete a pet
```
{}
```

## View categories
View the details of multiple categories

`GET` http://localhost:3000/categories?limit=:limit&offset=:offset

#### Path Parameters
| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| limit | String | How many categories to return. Default is 10   |
| offset | String | Result offset. Default is 0.  |

#### Result Format - View pets
```
[
	{
		"id": 1,
		"name": "foo",
		"created_at": "2018-06-20T23:15:33.008Z",
		"updated_at": "2018-06-20T23:15:33.008Z",
		"user": {
			"email": "azbshiri+manager@gmail.com",
			"role": "manager",
			"created_at": "2018-06-20T20:27:23.013Z",
			"updated_at": "2018-06-20T20:27:23.013Z"
		},
		"pets": []
	},
	{
		"id": 2,
		"name": "bar",
		"created_at": "2018-06-20T23:15:33.008Z",
		"updated_at": "2018-06-20T23:15:33.008Z",
		"user": {
			"email": "azbshiri+manager@gmail.com",
			"role": "manager",
			"created_at": "2018-06-20T20:27:23.013Z",
			"updated_at": "2018-06-20T20:27:23.013Z"
		},
		"pets": []
	}
]
```



## View category
View the details of a single category


`GET` http://localhost:3000/categories/:id

#### Path Parameters
| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| id | String | **REQUIRED** Category ID   |

#### Result Format - View pet
```
{
	"id": 1,
	"name": "foo",
	"created_at": "2018-06-20T23:15:33.008Z",
	"updated_at": "2018-06-20T23:15:33.008Z",
	"user": {
		"email": "azbshiri+manager@gmail.com",
		"role": "manager",
		"created_at": "2018-06-20T20:27:23.013Z",
		"updated_at": "2018-06-20T20:27:23.013Z"
	},
	"pets": []
}
```

## Add a category
Add a new category to your collection

`POST` http://localhost:3000/categories

#### Body Parameters - Add a category 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| name | String | **REQUIRED** Category name   |

#### Result Format - Add a category
```
{
	"id": 1,
	"name": "foo",
	"created_at": "2018-06-20T23:15:33.008Z",
	"updated_at": "2018-06-20T23:15:33.008Z",
	"user": {
		"email": "azbshiri+manager@gmail.com",
		"role": "manager",
		"created_at": "2018-06-20T20:27:23.013Z",
		"updated_at": "2018-06-20T20:27:23.013Z"
	},
	"pets": []
}
```

## Update a category

Update an existing category


`PUT` http://localhost:3000/categories/:id

#### Path Parameters - Update a category 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| id | String | **REQUIRED** Category ID   |


#### Body Parameters - Update a category 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| name | String | **REQUIRED** Category name   |
| pet_ids | Array | **REQUIRED** IDs of pets that belongs to the category.   |


#### Result Format - Update a category
```
{}
```

## Delete a category
Delete an existing category


`DELETE` http://localhost:3000/categories/:id

#### Body Parameters - Delete a category 

| Parameter | Type    | Description    |
| ---- | ------- | -------------- |
| id | String | **REQUIRED** Category ID   |

#### Result Format - Delete a category
```
{}
```