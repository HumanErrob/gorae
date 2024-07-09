
### 서버
간단한 로그인 서버를 구현해뒀습니다. 

3개의 container로 구성되어있습니다.  
    - flask : 간단한 로그인을 구현해둔 flask app 입니다.  
    - postgres : postgres 데이터베이스입니다.  
    - pgadmin : postgres 데이터베이스에 접근 가능한 admin 기능입니다.  

docker-compose.yaml : 3개의 컨테이너에 대한 설정입니다.   
Dockerfile : flask app을 만들 base Dockerfile 입니다.  
app.py : flask app 이 정의되어있습니다.  
templates: flask app의 로그인 기능을 보여줄 화면입니다.  
requirements.txt : flask app을 위해 설치해야 하는 파이썬 package 입니다. 
.env: db 비밀번호, pgadmin 비밀번호 등이 들어있는 환경변수파일입니다.  

---
### pre-requisite
저는 os 우분투 에서 테스트 했습니다. 
[docker](https://docs.docker.com/engine/install/), [docker-compose](https://docs.docker.com/compose/install/)
를 설치해주세요

### howto 
1. 이 리포지토리를 복사합니다. 
    git clone https://github.com/HumanErrob/gorae.git

2. 클론한 경로에서 서비스를 띄웁니다.
    docker-compose up -d 
    
3. pgadmin 이미지의 기본 유저 아이디가 5050으로 되어있어, 폴더의 사용자 권한을 변경해줘야 합니다. 
    sudo chown -R 5050:5050 ./pgadmin-data/pgadmin

4. 서비스를 다시 띄웁니다. 
    docker-compose up -d

### setup 
#### 1. pgadmin 접속 (.env 파일참고)
    - http://localhost:5000/register
        PGADMIN_MAIL=gorae@univ.com
        PGADMIN_PW=goraepwd

#### 2. pgadmin 설정 (.env 파일참고)
    - General>name : goraedb
    - 연결>host name: goraeuniv-postgres
    - 연결>user name: goraeuniv
    - 연결>password : goraepwd

#### 3. pgadmin query console 연결
    - 연결된 db의 데이터베이스 우클릭 > 쿼리도구 선택 
    - SELECT * from users (현재 users 테이블에 등록된 유저 리스트 확인)

#### 4. [flask simple web](http://localhost:5000) 페이지에서 로그인 기능을 테스트 해볼수 있습니다. 
    - http://localhost:5000/register
    