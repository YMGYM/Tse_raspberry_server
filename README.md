# TSE_Server

TSE의 WAS 를 위해 작성된 파일입니다.

## Task 관리

현재 작업 상황의 관리를 위한 통신 규약입니다.

### 모든 작업 상황 보기

`/tasks` 로 GET 요청을 보내 현재 모든 작업 상황을 불러 옵니다.

GET `서버주소/tasks`

~~~json

[
    {
        "id": 2,
        "title": "Hello",
        "dueDate": "2020-11-30T00:00:00.000+09:00",
        "user_id": 1,
        "finish": null,
        "created_at": "2020-11-21T21:58:10.322+09:00",
        "updated_at": "2020-11-21T21:59:20.183+09:00"
    },
    {
        "id": 3,
        "title": "Hello2",
        "dueDate": "2020-11-30T00:00:00.000+09:00",
        "user_id": 1,
        "finish": null,
        "created_at": "2020-11-24T21:42:02.252+09:00",
        "updated_at": "2020-11-24T21:42:02.252+09:00"
    }
]

~~~

#### 결과값

- id : 큰 업무의 번호입니다. 구별을 위해 사용합니다.
- title : 업무의 이름입니다.
- dueDate: 목표시간입니다. "YYYYMMDDHHMMSS" 로 반환합니다.
- user_id : 사용자 아이디입니다. admin계정에서 확인 가능합니다.
- finish: 작업이 끝난 상태인지 알려줍니다 (true : 완료, false: 미완료)

### 새 작업 상황 생성하기

`/tasks` 로  POST 요청을 보내 새로운 작업을 만듭니다.

주소 뒤에 `?title=[title 이름]&dueDate=[날짜]&user_id=[user_id]&finish=false`

*예시*

POST `서버주소/tasks?title=Hello2&dueDate=20201130&user_id=1&finish=false`

생성한 데이터가 반환됩니다

~~~json
{
    "id": 3,
    "title": "Hello2",
    "dueDate": "2020-11-30T00:00:00.000+09:00",
    "user_id": 1,
    "finish": null,
    "created_at": "2020-11-24T21:42:02.252+09:00",
    "updated_at": "2020-11-24T21:42:02.252+09:00"
}

~~~



#### 파라미터

- id : 큰 업무의 번호입니다. 구별을 위해 사용합니다.
- title : 업무의 이름입니다.
- dueDate: 목표시간입니다. "YYYYMMDDHHMMSS" 로 전송합니다.
- user_id : 사용자 아이디입니다. admin계정에서 확인 가능합니다.
- finish: 작업이 끝난 상태인지 알려줍니다 (true : 완료, false: 미완료)



### 작업 수정하기

`/task/:id `로 PUT 또는 PATCH 요청을 보내 작업을 수정합니다.

*예시*

PUT `서버주소/tasks/2?finish=true`

수정한 데이터가 반환됩니다

```json
{
    "id": 3,
    "title": "Hello2",
    "dueDate": "2020-11-30T00:00:00.000+09:00",
    "user_id": 1,
    "finish": true,
    "created_at": "2020-11-24T21:42:02.252+09:00",
    "updated_at": "2020-11-24T21:42:02.252+09:00"
}
```

#### 파라미터

- id : 내용을 수정할 작업의 id입니다.
- title : 작업의 전체적인 타이틀입니다. string 형 정보입니다.
- writer : 작업의 담당자를 나타냅니다. string 형 정보입니다.
- duetime : 작업의 마감 날짜를 나타냅니다. ruby datetime 형 정보입니다.
- finish: 작업이 끝난 상태인지 알려줍니다 (true : 완료, false: 미완료)



### 작업 삭제하기

`/destroy` 로 DELETE 요청을 보내 현재 작업 상황을 삭제합니다.

DELETE `서버주소/tasks/2/`

#### 파라미터

- id : 내용을 수정할 작업의 id입니다.

결과값은 남은 업무 데이터들을 반환합니다

DELETE `서버주소/tasks/2`

~~~JSON
[
    {
        "id": 2,
        "title": "Hello",
        "dueDate": "2020-11-30T00:00:00.000+09:00",
        "user_id": 1,
        "finish": null,
        "created_at": "2020-11-21T21:58:10.322+09:00",
        "updated_at": "2020-11-21T21:59:20.183+09:00"
    },
    {
        "id": 3,
        "title": "Hello2",
        "dueDate": "2020-11-30T00:00:00.000+09:00",
        "user_id": 1,
        "finish": null,
        "created_at": "2020-11-24T21:42:02.252+09:00",
        "updated_at": "2020-11-24T21:42:02.252+09:00"
    }
]
~~~







## 세부 업무 보기

세부 업무 상황을 관리하는 통신 규약입니다.

### 모든 업무 상황 보기

`/tasks/[작업번호]/works 로 GET 요청을 보내 현재 모든 작업 상황을 불러 옵니다.

GET `서버주소/tasks/works`

~~~json
[
    {
        "id": 2,
        "title": "Hello",
        "dueDate": "2020-11-30T00:00:00.000+09:00",
        "user_id": 1,
        "finish": null,
        "created_at": "2020-11-21T21:58:10.322+09:00",
        "updated_at": "2020-11-21T21:59:20.183+09:00"
    },
    {
        "id": 3,
        "title": "Hello2",
        "dueDate": "2020-11-30T00:00:00.000+09:00",
        "user_id": 1,
        "finish": null,
        "created_at": "2020-11-24T21:42:02.252+09:00",
        "updated_at": "2020-11-24T21:42:02.252+09:00"
    }
]

~~~

#### 결과값

- id : 큰 업무의 번호입니다. 구별을 위해 사용합니다.
- title : 업무의 이름입니다.
- dueDate: 목표시간입니다. "YYYYMMDDHHMMSS" 로 반환합니다.
- user_id : 사용자 아이디입니다. admin계정에서 확인 가능합니다.
- finish: 작업이 끝난 상태인지 알려줍니다 (true : 완료, false: 미완료)

### 새 업무 상황 생성하기

`/tasks` 로  POST 요청을 보내 새로운 작업을 만듭니다.

`/tasks/[작업번호]/works?title=[이름]&finish=false&dueDate=[완료날짜]` 형태입니다.

*예시*

POST `서버주소/tasks/1/works?title=test&finish=false&dueDate=202011300000`

~~~json
{
    "id": 9,
    "title": "test",
    "dueDate": "2020-11-20T22:00:00.000+09:00",
    "finish": false,
    "task_id": 10,
    "created_at": "2020-11-25T23:00:07.463+09:00",
    "updated_at": "2020-11-25T23:00:07.463+09:00"
}

~~~



#### 파라미터

- id : 큰 업무의 번호입니다. 구별을 위해 사용합니다.
- title : 업무의 이름입니다.
- dueDate: 목표시간입니다. "YYYYMMDDHHMMSS" 로 전송합니다.
- user_id : 사용자 아이디입니다. admin계정에서 확인 가능합니다.
- finish: 작업이 끝난 상태인지 알려줍니다 (true : 완료, false: 미완료)



### 업무 수정하기

`/task/:id `로 PUT 또는 PATCH 요청을 보내 작업을 수정합니다.

`/tasks/[작업번호]/works/[업무보고]?title=[이름]&finish=[완료여부]&dueDate=[완료날짜]` 형태입니다.

*예시*

PUT `서버주소/tasks/10/works/9?title=수정&finish=true&dueDate=202011202200`

```json
{
    "task_id": 10,
    "id": 9,
    "title": "수정",
    "dueDate": "2020-11-20T22:00:00.000+09:00",
    "finish": true,
    "created_at": "2020-11-25T23:00:07.463+09:00",
    "updated_at": "2020-11-25T23:01:35.554+09:00"
}
```

결과값으로 수정한 작업이 날아옵니다.

#### 파라미터

- id : 내용을 수정할 작업의 id입니다.
- title : 작업의 전체적인 타이틀입니다. string 형 정보입니다.
- writer : 작업의 담당자를 나타냅니다. string 형 정보입니다.
- duetime : 작업의 마감 날짜를 나타냅니다. ruby datetime 형 정보입니다.
- finish: 작업이 끝난 상태인지 알려줍니다 (true : 완료, false: 미완료)



### 업무 삭제하기

`/task/[작업번호]/works/[업무번호]` 로 DELETE 요청을 보내 현재 작업 상황을 삭제합니다.

#### 파라미터

- id : 내용을 수정할 작업의 id입니다.

DELETE `서버주소/tasks/10/works/10`

결과값은 남은 업무 데이터들을 반환합니다

```JSON
[
    {
        "id": 9,
        "title": "수정",
        "dueDate": "2020-11-20T22:00:00.000+09:00",
        "finish": false,
        "task_id": 10,
        "created_at": "2020-11-25T23:00:07.463+09:00",
        "updated_at": "2020-11-25T23:01:35.554+09:00"
    }
]
```





