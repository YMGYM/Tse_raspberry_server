# TSE_Server

TSE의 WAS 를 위해 작성된 파일입니다.

## Task 관리

현재 작업 상황의 관리를 위한 통신 규약입니다.

### 모든 작업 상황 보기

`/index` 로 GET 요청을 보내 현재 모든 작업 상황을 불러 옵니다.

### 새 작업 상황 생성하기

`/create` 로  POST 요청을 보내 새로운 작업을 만듭니다.

#### 파라미터

- title : 작업의 전체적인 타이틀입니다. string 형 정보입니다.
- writer : 작업의 담당자를 나타냅니다. string 형 정보입니다.
- duetime : 작업의 마감 날짜를 나타냅니다. ruby datetime 형 정보입니다.



### 작업 수정하기

`/update` 로 PUT/PATCH 요청을 보내 작업을 수정합니다.

#### 파라미터

- id : 내용을 수정할 작업의 id입니다.
- title : 작업의 전체적인 타이틀입니다. string 형 정보입니다.
- writer : 작업의 담당자를 나타냅니다. string 형 정보입니다.
- duetime : 작업의 마감 날짜를 나타냅니다. ruby datetime 형 정보입니다.



### 작업 삭제하기

`/destroy` 로 DELETE 요청을 보내 현재 작업 상황을 삭제합니다.

#### 파라미터

- id : 내용을 수정할 작업의 id입니다.



