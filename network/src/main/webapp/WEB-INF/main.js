<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!-- <link href='./inputStyle.css' rel='stylesheet' type='text/css'> -->
    <title>MmM</title>
</head>
<body>

    <div class="container">
        <header>
        <div class='logo'>
        <h1><a href='./main.html'>MmM</a></h1>
        </div>
        </header>
        <body class="body">
            <article class="article">
            <div class="calendar">
                <div class="header">
                    <div class="nav">
                        <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                        <button class="nav-btn go-today"><div class="year-month"></div></button>
                        <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                </div>
            </div>
            <div class="main">
                <div class="days">
                    <div class="empty"></div>
                    <div class="day-sunday">일</div>
                    <div class="empty"></div>
                    <div class="day">월</div>
                    <div class="empty"></div>
                    <div class="day">화</div>
                    <div class="empty"></div>
                    <div class="day">수</div>
                    <div class="empty"></div>
                    <div class="day">목</div>
                    <div class="empty"></div>
                    <div class="day">금</div>
                    <div class="empty"></div>
                    <div class="day-saturday">토</div>
                    <div class="empty"></div>
                </div>
                <div class="dates"></div>
                <div class="empty"></div>
            </div>
             </div>
            </article>

            <aside class="aside">
                <div class="incomeInputField">
                    <div class="aside_title">데이터를 입력해주세요</div> 
                    <label><input type="radio" name="selectBtn" value="수입" checked> 수입 </label>
                    <label><input type="radio" name="selectBtn" value="지출"> 지출 </label>
                    <div id="dateInputBox">
                        날짜
                        <input id="dateInput" type="text" placeholder="ex) 2022년 11월 08일" value="" autocomplete="off" required>
                    </div>
                    <div id="typeInputBox" >
                        종류
                        <select name ="optionList">
                            <option> 월급 및 용돈</option>
                            <option> 여가 생활비 </option>
                            <option> 교통비 </option>
                            <option> 식비 </option>
                            <option> 병원비 </option>
                            <option> 금융거래 </option>
                            <option> 기타 </option>
                        </select>
                    </div>
                    <div id="contentsInputBox">
                        내용
                        <input id="contentsInput" type="text" placeholder="ex) 편의점" value="" autocomplete="off" required>
                    </div>
                    <div id="costInputBox">
                        금액
                        <input id="costInput" type="text" placeholder="ex) 10,500" value="" autocomplete="off" required>
                    </div>
                    <div id="addDataInput">
                        <input id="deleteData" type="button" value="삭제하기" onClick="localStorageRemove()">
                        <input id="addData" type="button" value="추가하기" onClick="localStorageSave(); localStorageImport()">
                    </div>
                </div>
                <div class="analysisField">
                    <div id="analysisBox">
                        이번달 소비 및 지출 </br>
                        <input id="analysisButton" type="button" value="한눈에 보기" onClick="deleteAndCreateAnalysisDiv()">
                    </div>
                </div>
            </aside>
        </body>
        <footer>
            가계부 웹 어플리케이션에 대해 문제가 발생할 시  연락주십시오(MMM가계부 문의 : chobyeonggyu03@gmail.com)
        </footer>
    </div>

<script>
    let storageArr = [ ];        // 달력 데이터를 저장할 전역배열
    let date = new Date();       // 달력그릴때 필요한 날짜를 저장할 전역변수

    const renderCalender = () => {                 // 달력을 만드는 함수
        const viewYear = date.getFullYear();
        const viewMonth = date.getMonth();  
        
        const prevLast = new Date(viewYear, viewMonth, 0);
        const thisLast = new Date(viewYear, viewMonth + 1, 0);
        
        const PLDate = prevLast.getDate();
        const PLDay = prevLast.getDay();
        
        const TLDate = thisLast.getDate();
        const TLDay = thisLast.getDay();

        const prevDates = [];
        const thisDates = [...Array(TLDate + 1).keys()].slice(1);
        const nextDates = [];

        document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

        if (PLDay !== 6) {
            for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
            }
        }

        for (let i = 1; i < 7 - TLDay; i++) {
            nextDates.push(i);
        }
        
        let dates = prevDates.concat(thisDates, nextDates);
        const firstDateIndex = dates.indexOf(1);
        const lastDateIndex = dates.lastIndexOf(TLDate);
        
        for(let i = 0; i < dates.length; i++) {
            let today = new Date();
            const condition = i >= firstDateIndex && i < lastDateIndex + 1 ? 'this' : 'other';

            
            if( viewYear === today.getFullYear() && viewMonth === today.getMonth() && today.getDate() === dates[i]) {
                dates[i] = '<div class=empty></div>'+'<div class="today" >'+'<span class='+condition+'>'+dates[i]+') '+'</span>'+'</div>'+'</div>';
            }
            else {
                dates[i] = '<div class=empty></div>'+'<div class="date'+i+'" >'+'<span class='+condition+'>'+dates[i]+') '+'</span>'+'</div>';
            }
        }
        
        document.querySelector('.dates').innerHTML = dates.join('');
        ReloadDataSave();        // 새로고침시 localstorage 데이터 불러오기
    };
    
    renderCalender();       // 이번달 초기 테이블 생성
    
    const prevMonth = () => {           // 저번달 초기 테이블 생성
        date.setDate(1);
        date.setMonth(date.getMonth() - 1);
        renderCalender();
    };                      
    
    const nextMonth = () => {           // 다음달 초기 테이블 생성
        date.setDate(1);
        date.setMonth(date.getMonth() + 1);
        renderCalender();       
    };
    
    function saveDataToArr(calendardata) {          // calendardata 객체를 배열에 저장하는 함수
        console.log(storageArr.push(calendardata));
    }
    
    function localStorageRemove(calendardata){      // localstorage와 배열를 비우는 함수
        window.localStorage.clear();
        storageArr=[];
    }

    function localStorageSave(){                    // localstorage에 배열을 저장하는 함수
        
        const calendardata = { 
            selectBtn : (document.querySelector('input[name="selectBtn"]:checked').value),
            inputDate : (document.getElementById('dateInput').value),
            contents : contents = (document.getElementById('contentsInput').value),
            cost : (document.getElementById('costInput').value),
            type : (document.getElementsByName('optionList')[0].options[document.getElementsByName('optionList')[0].selectedIndex].value),
        }
        let calendarCost = document.getElementById('costInput').value.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

        saveDataToArr(calendardata);        
        window.localStorage.setItem('달력 데이터', JSON.stringify(storageArr));
        window.localStorage.setItem('달력표시 비용', calendarCost);
    }
    
    function localStorageImport(){                  // localstorage에 금액의 값을 저장 후 달력에 표시하는 함수
        if(document.getElementById('dateInput').value === ""){
            alert("날짜을 입력해주세요");
        }
        else if(document.getElementById('contentsInput').value === ""){
            alert("내용을 입력해주세요");
        }
        else if(document.getElementById('costInput').value === ""){
            alert("금액을 입력해주세요");
        }
        else{
            const viewYear = date.getFullYear();
            const viewMonth = date.getMonth();  

            const prevLast = new Date(viewYear, viewMonth, 0);
            const thisLast = new Date(viewYear, viewMonth + 1, 0);
            
            const PLDate = prevLast.getDate();
            const PLDay = prevLast.getDay();

            const TLDate = thisLast.getDate();
            const TLDay = thisLast.getDay();

            const prevDates = [];
            const thisDates = [...Array(TLDate + 1).keys()].slice(1);
            const nextDates = [];
            
            let today = new Date();
            let dates = prevDates.concat(thisDates, nextDates);
            var regex = /[^0-9]/g;
            let compareDate = (document.getElementById('dateInput').value).replace(regex, "");
            let addTemporaryCost = window.localStorage.getItem('달력표시 비용');

            if((document.querySelector('input[name="selectBtn"]:checked').value) === "수입") {     // 수입버튼으로 +부호결정
               for(let j=0; j<dates.length; j++){
                    if( viewYear == compareDate.substr(0, 4) && viewMonth +1 == compareDate.substr(4, 2) && dates[j] == compareDate.substr(6, 2)){
                        if(compareDate.substr(6, 2) == today.getDate()){document.getElementsByClassName('today')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 1) {document.getElementsByClassName('date2')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 2) {document.getElementsByClassName('date3')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 3) {document.getElementsByClassName('date4')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 4) {document.getElementsByClassName('date5')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 5) {document.getElementsByClassName('date6')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 6) {document.getElementsByClassName('date7')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 7) {document.getElementsByClassName('date8')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 8) {document.getElementsByClassName('date9')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 9) {document.getElementsByClassName('date10')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 10) {document.getElementsByClassName('date11')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 11) {document.getElementsByClassName('date12')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 12) {document.getElementsByClassName('date13')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 13) {document.getElementsByClassName('date14')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 14) {document.getElementsByClassName('date15')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 15) {document.getElementsByClassName('date16')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 16) {document.getElementsByClassName('date17')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 17) {document.getElementsByClassName('date18')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 18) {document.getElementsByClassName('date19')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 19) {document.getElementsByClassName('date20')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 20) {document.getElementsByClassName('date21')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 21) {document.getElementsByClassName('date22')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 22) {document.getElementsByClassName('date23')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 23) {document.getElementsByClassName('date24')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 24) {document.getElementsByClassName('date25')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 25) {document.getElementsByClassName('date26')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 26) {document.getElementsByClassName('date27')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 27) {document.getElementsByClassName('date28')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 28) {document.getElementsByClassName('date29')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 29) {document.getElementsByClassName('date30')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 30) {document.getElementsByClassName('date31')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 31) {document.getElementsByClassName('date32')[0].innerHTML += '+'+ addTemporaryCost+'</br>'; break;}
                    }
               }
            }
            else if((document.querySelector('input[name="selectBtn"]:checked').value) === "지출") {   // 지출버튼으로 -부호결정
                for(let j=0; j<dates.length; j++){     
                    if( viewYear == compareDate.substr(0, 4) && viewMonth +1 == compareDate.substr(4, 2) && dates[j] == compareDate.substr(6, 2)){
                        if(compareDate.substr(6, 2) == today.getDate()){document.getElementsByClassName('today')[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 1) {(document.getElementsByClassName('date2'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 2) {(document.getElementsByClassName('date3'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 3) {(document.getElementsByClassName('date4'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 4) {(document.getElementsByClassName('date5'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 5) {(document.getElementsByClassName('date6'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 6) {(document.getElementsByClassName('date7'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 7) {(document.getElementsByClassName('date8'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 8) {(document.getElementsByClassName('date9'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 9) {(document.getElementsByClassName('date10'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 10) {(document.getElementsByClassName('date11'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 11) {(document.getElementsByClassName('date12'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 12) {(document.getElementsByClassName('date13'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 13) {(document.getElementsByClassName('date14'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 14) {(document.getElementsByClassName('date15'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 15) {(document.getElementsByClassName('date16'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 16) {(document.getElementsByClassName('date17'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 17) {(document.getElementsByClassName('date18'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 18) {(document.getElementsByClassName('date19'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 19) {(document.getElementsByClassName('date20'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 20) {(document.getElementsByClassName('date21'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 21) {(document.getElementsByClassName('date22'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 22) {(document.getElementsByClassName('date23'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 23) {(document.getElementsByClassName('date24'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 24) {(document.getElementsByClassName('date25'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 25) {(document.getElementsByClassName('date26'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 26) {(document.getElementsByClassName('date27'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 27) {(document.getElementsByClassName('date28'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 28) {(document.getElementsByClassName('date29'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 29) {(document.getElementsByClassName('date30'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 30) {(document.getElementsByClassName('date31'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                        else if(compareDate.substr(6, 2) == 31) {(document.getElementsByClassName('date32'))[0].innerHTML += '-'+ addTemporaryCost+'</br>'; break;}
                    }
                }
            }
        }
    }
    
    function ReloadDataSave() {                 // 새로고침시 localstorage 데이터 새로추가시 리셋방지
            let prevData = JSON.parse(window.localStorage.getItem('달력 데이터'));
            storageArr = prevData;
            callPrevCost();
        
    }

    function callPrevCost() {       // 전에 입혁한 cost값 호출함수
        const viewYear = date.getFullYear();
        const viewMonth = date.getMonth();  

        const prevLast = new Date(viewYear, viewMonth, 0);
        const thisLast = new Date(viewYear, viewMonth + 1, 0);
        
        const PLDate = prevLast.getDate();
        const PLDay = prevLast.getDay();

        const TLDate = thisLast.getDate();
        const TLDay = thisLast.getDay();

        const prevDates = [];
        const thisDates = [...Array(TLDate + 1).keys()].slice(1);
        const nextDates = [];
        
        let today = new Date();
        let dates = prevDates.concat(thisDates, nextDates);
        var regex = /[^0-9]/g;
        
        for(let i=0; i<storageArr.length; i++){ // 전에 입혁한 cost값 호출
            var result = storageArr[i].inputDate.replace(regex, "");
            var prevCost = storageArr[i].cost.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            if((storageArr[i].selectBtn === "수입")) {     // 수입버튼으로 +부호결정
                for(let j=0; j<dates.length; j++) {
                    if( viewYear == result.substr(0, 4) && viewMonth +1 == result.substr(4, 2) && dates[j] == result.substr(6, 2)){
                        if(result.substr(6, 2) == today.getDate()){document.getElementsByClassName('today')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 1) {document.getElementsByClassName('date2')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 2) {document.getElementsByClassName('date3')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 3) {document.getElementsByClassName('date4')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 4) {document.getElementsByClassName('date5')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 5) {document.getElementsByClassName('date6')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 6) {document.getElementsByClassName('date7')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 7) {document.getElementsByClassName('date8')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 8) {document.getElementsByClassName('date9')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 9) {document.getElementsByClassName('date10')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 10) {document.getElementsByClassName('date11')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 11) {document.getElementsByClassName('date12')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 12) {document.getElementsByClassName('date13')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 13) {document.getElementsByClassName('date14')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 14) {document.getElementsByClassName('date15')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 15) {document.getElementsByClassName('date16')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 16) {document.getElementsByClassName('date17')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 17) {document.getElementsByClassName('date18')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 18) {document.getElementsByClassName('date19')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 19) {document.getElementsByClassName('date20')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 20) {document.getElementsByClassName('date21')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 21) {document.getElementsByClassName('date22')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 22) {document.getElementsByClassName('date23')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 23) {document.getElementsByClassName('date24')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 24) {document.getElementsByClassName('date25')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 25) {document.getElementsByClassName('date26')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 26) {document.getElementsByClassName('date27')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 27) {document.getElementsByClassName('date28')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 28) {document.getElementsByClassName('date29')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 29) {document.getElementsByClassName('date30')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 30) {document.getElementsByClassName('date31')[0].innerHTML += '+'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 31) {document.getElementsByClassName('date32')[0].innerHTML += ''+ prevCost+'</br>'; break;}
                    }
                }
            }
            else if((storageArr[i].selectBtn === "지출")) {   // 지출버튼으로 -부호결정
                for(let j=0; j<dates.length; j++) {
                    if( viewYear == result.substr(0, 4) && viewMonth +1 == result.substr(4, 2) && dates[j] == result.substr(6, 2)){
                        if(result.substr(6, 2) == today.getDate()){document.getElementsByClassName('today')[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 1) {(document.getElementsByClassName('date2'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 2) {(document.getElementsByClassName('date3'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 3) {(document.getElementsByClassName('date4'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 4) {(document.getElementsByClassName('date5'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 5) {(document.getElementsByClassName('date6'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 6) {(document.getElementsByClassName('date7'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 7) {(document.getElementsByClassName('date8'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 8) {(document.getElementsByClassName('date9'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 9) {(document.getElementsByClassName('date10'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 10) {(document.getElementsByClassName('date11'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 11) {(document.getElementsByClassName('date12'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 12) {(document.getElementsByClassName('date13'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 13) {(document.getElementsByClassName('date14'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 14) {(document.getElementsByClassName('date15'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 15) {(document.getElementsByClassName('date16'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 16) {(document.getElementsByClassName('date17'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 17) {(document.getElementsByClassName('date18'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 18) {(document.getElementsByClassName('date19'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 19) {(document.getElementsByClassName('date20'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 20) {(document.getElementsByClassName('date21'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 21) {(document.getElementsByClassName('date22'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 22) {(document.getElementsByClassName('date23'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 23) {(document.getElementsByClassName('date24'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 24) {(document.getElementsByClassName('date25'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 25) {(document.getElementsByClassName('date26'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 26) {(document.getElementsByClassName('date27'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 27) {(document.getElementsByClassName('date28'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 28) {(document.getElementsByClassName('date29'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 29) {(document.getElementsByClassName('date30'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 30) {(document.getElementsByClassName('date31'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                        else if(result.substr(6, 2) == 31) {(document.getElementsByClassName('date32'))[0].innerHTML += '-'+ prevCost+'</br>'; break;}
                    }
                }
            }
        }
    }

    function deleteAndCreateAnalysisDiv() {             //페이지 삭제하고 새로운 분석화면 띄우는함수
        let calendar = document.getElementsByClassName("calendar")[0];
        let incomeInputField = document.getElementsByClassName("incomeInputField")[0];
        let analysisField = document.getElementsByClassName("analysisField")[0];
        
        calendar.remove();                      
        incomeInputField.remove();                 
        analysisField.remove();     //      article, aside 내부 요소들 삭제
        
        let body_analysis = document.getElementsByClassName("body")[0];        // body 이용해서 body_analysis 생성
        body_analysis.setAttribute('class', 'body_analysis')

        let article_analysis = document.getElementsByClassName("article")[0];        // article 이용해서 article_anavlysis 생성
        article_analysis.setAttribute('class', 'article_analysis')

        let doughnut_chart = document.createElement('canvas');       // article안에 chart라는 canvas추가
        doughnut_chart.setAttribute('class', 'doughnut_chart');
        article_analysis.appendChild(doughnut_chart);
        
        let doughnut_chart_2 = document.createElement('canvas');        // article_analysis안에 doughnut_chart_2라는 canvas생성
        doughnut_chart_2.setAttribute('class', 'doughnut_chart_2');
        article_analysis.appendChild(doughnut_chart_2);

        let chartText = document.createElement('div');          // doughnut_chart 안에 chartText라는 텍스트 표시할 div 생성
        chartText.setAttribute('class', 'chartText');
        article_analysis.appendChild(chartText);

        let chartText_2 = document.createElement('div');          // doughnut_chart_2 안에 chartText_2라는 텍스트 표시할 div 생성
        chartText_2.setAttribute('class', 'chartText_2');
        article_analysis.appendChild(chartText_2);       

        let chartTextInput= document.createElement('input');           // chartText라는 div안에 chartTextInput라는 input생성
        chartTextInput.setAttribute('class', 'chartTextInput');
        chartTextInput.setAttribute('type', 'text');
        chartTextInput.setAttribute('value', '수입 및 지출 비율'); 
        chartTextInput.readOnly = true;
        chartText.appendChild(chartTextInput);
  
        let chartTextInput_2= document.createElement('input');           // chartText_2라는 div안에 chartTextInput_2라는 input생성
        chartTextInput_2.setAttribute('class', 'chartTextInput_2');
        chartTextInput_2.setAttribute('type', 'text');
        chartTextInput_2.setAttribute('value', '소비 유형 비율'); 
        chartTextInput_2.readOnly = true;
        chartText_2.appendChild(chartTextInput_2);
        //////////////////////////////////////////////////// 도넛차트 세팅은 밑에 있음

        let aside_analysis = document.getElementsByClassName("aside")[0];   // aside 가져와서 클래스명 변경
        aside_analysis.setAttribute('class', 'aside_analysis')

        let incomeAnalysis = document.createElement('div');       // aside안에 incomeAnalysis라는 div 생성
        incomeAnalysis.setAttribute('class', 'incomeAnalysis');
        incomeAnalysis.innerHTML += "이달의 총 수입  </br>";
        aside_analysis.appendChild(incomeAnalysis);
        
        let spendingAnalysis = document.createElement('div');       // aside안에 spendinfAnalyysis라는 div 생성
        spendingAnalysis.setAttribute('class', 'spendingAnalysis');
        spendingAnalysis.innerHTML += "이달의 총 지출 </br>";
        aside_analysis.appendChild(spendingAnalysis);
        
        let spendingTypeAnalysis= document.createElement('div');       // aside안에 spendingTypeAnalysis라는 div 생성
        spendingTypeAnalysis.setAttribute('class', 'spendingTypeAnalysis');
        spendingTypeAnalysis.innerHTML += "가장 많은 소비 유형</br>";
        aside_analysis.appendChild(spendingTypeAnalysis);

        let incomeTypeAnalysis= document.createElement('div');       // aside안에 incomeTypeAnalysis라는 div 생성
        incomeTypeAnalysis.setAttribute('class', 'incomeTypeAnalysis');
        incomeTypeAnalysis.innerHTML += "가장 많은 소득 유형</br>";
        aside_analysis.appendChild(incomeTypeAnalysis);
        
        let backButtonAnalysis = document.createElement('div');         // aside안에 backButtonAnalysis라는 div생성
        backButtonAnalysis.setAttribute('class', 'backButtonAnalysis');
        aside_analysis.appendChild(backButtonAnalysis);
        
        
        let incomeInput= document.createElement('input');       // incomeAnalysis안에 incomeInput라는 input생성
        incomeInput.setAttribute('class', 'incomeInput');
        incomeInput.setAttribute('type', 'text');
        incomeInput.setAttribute('value', '데이터를 입력하세요');
        incomeInput.readOnly = true;
        incomeAnalysis.appendChild(incomeInput);
        
        let spendingInput = document.createElement('input');       //  spendingAnalysis안에 spendingInput라는 input생성
        spendingInput.setAttribute('class', 'spendingInput');
        spendingInput.setAttribute('type', 'text');
        spendingInput.setAttribute('value', '데이터를 입력하세요');
        spendingInput.readOnly = true;
        spendingAnalysis.appendChild(spendingInput);
        
        let spendingTypeInput = document.createElement('input');       // spendingTypeAnalysis안에 spendingTypeInput라는 input생성
        spendingTypeInput.setAttribute('class', 'spendingTypeInput');
        spendingTypeInput.setAttribute('type', 'text');
        spendingTypeInput.setAttribute('value', '데이터를 입력하세요');
        spendingTypeInput.readOnly = true;
        spendingTypeAnalysis.appendChild(spendingTypeInput);

        let incomeTypeInput = document.createElement('input');       //incomeTypeAnalysis안에 incomeTypeInput라는 input생성
        incomeTypeInput.setAttribute('class', 'incomeTypeInput');
        incomeTypeInput.setAttribute('type', 'text');
        incomeTypeInput.setAttribute('value', '데이터를 입력하세요');
        incomeTypeInput.readOnly = true;
        incomeTypeAnalysis.appendChild(incomeTypeInput);
        
        let backButton = document.createElement('input');       // backButtonAnalysis안에 backButton라는 input생성
        backButton.setAttribute('class', 'backButton');
        backButton.setAttribute('type', 'button');
        backButton.setAttribute('value', '돌아가기');
        backButton.addEventListener('click', () => { location.href="./main.html"});
        backButtonAnalysis.appendChild(backButton);
       
        
        let sumIncome = 0;
        let sumIncomeChart = 0;
        let sumSpending = 0;
        let sumSpendingChart = 0;
        let today= new Date();
        var regex = /[^0-9]/g;
        let thisMonth = today.getMonth()+1;
        
        
        for(let i=0; i<storageArr.length; i++) {           
            inputDateNum = storageArr[i].inputDate.replace(regex, "")

            if(thisMonth == inputDateNum.substr(4, 2)) {
                if(storageArr[i].selectBtn === '수입'){
                    sumIncome += Number(storageArr[i].cost.replace(regex, ""));
                    sumIncomeChart += Number(storageArr[i].cost.replace(regex, ""));
                }
                else if(storageArr[i].selectBtn === '지출'){
                    sumSpending += Number(storageArr[i].cost.replace(regex, ""));
                    sumSpendingChart += Number(storageArr[i].cost.replace(regex, ""));
                }
            }
        }
        
        
        sumIncome = sumIncome.toLocaleString();
        sumSpending = sumSpending.toLocaleString();

        incomeInput.value = '+ ' + sumIncome + '원';
        spendingInput.value = '- ' + sumSpending +'원';

            new Chart(document.getElementsByClassName("doughnut_chart")[0], {  // sumIncome, sumSpending 값 이용해서 chart 그리기
            type: 'doughnut',
            data: {
                labels: ["수입", "지출" ],
                datasets: [
                {
                    backgroundColor: ["#dae7ff", "#c1d8ff"],
                    data: [sumIncomeChart, sumSpendingChart]
                }
                ]
            },
            options: {
                responsive: false,
                title: {
                display: true,
                }
            }
            });

        let type_1 = Number(0);
        let type_2 = Number(0);
        let type_3 = Number(0);
        let type_4 = Number(0);
        let type_5 = Number(0);
        let type_6 = Number(0);
        let mostSpendingType = 0;
        for(let i=0; i<storageArr.length; i++) {
            if(storageArr[i].selectBtn === "지출"){
                let type = storageArr[i].type;
                if( type == "여가 생활비") {
                    type_1 += Number(storageArr[i].cost.replace(regex, ""))
                }
                else if( type == "교통비") {
                    type_2 += Number(storageArr[i].cost.replace(regex, ""))
                }
                else if( type == "식비") {
                    type_3 += Number(storageArr[i].cost.replace(regex, ""))
                }
                else if( type == "병원비") {
                    type_4 += Number(storageArr[i].cost.replace(regex, ""))
                }
                else if( type == "금융거래") {
                    type_5 += Number(storageArr[i].cost.replace(regex, ""))
                }
                else if( type == "기타") {
                    type_6 += Number(storageArr[i].cost.replace(regex, ""))
                }
            }
        } 

        let compareArr=[            // sort함수를 활용한 대소비교 후 가장 많은 소비유형 구하기
            type_1, type_2, type_3, type_4, type_5, type_6
        ];
//////////////////////////////////////////////////////////////////
        new Chart(document.getElementsByClassName("doughnut_chart_2")[0], {  // compareArr[] 값 이용해서 chart 그리기
            type: 'doughnut',
            data: {
                labels: ["여가 생활비", "교통비", "식비", "병원비", "금융거래","기타" ],
                datasets: [
                {
                    backgroundColor: ["#e0afff","#e6bdff","#eac9ff","#f1dbfe",  "#f7e8ff","#fbf4ff"],
                    data: [type_1, type_2, type_3, type_4, type_5, type_6]
                }
                ]
            },
            options: {
                responsive: false,
                title: {
                display: true,
                }
            }
            });
////////////////////////////////////////////////////////////////////
        compareArr.sort(function(a, b)  {   //sort함수를 이용해서 내림차순정렬
            return b -a;
        });

        if(compareArr[0] == type_1) {
            mostSpendingType = "여가 생활비";
        }
        else if(compareArr[0] == type_2) {
            mostSpendingType = "교통비";
        }
        else if(compareArr[0] == type_3) {
            mostSpendingType = "식비";
        }
        else if(compareArr[0] == type_4) {
            mostSpendingType = "병원비";
        }
        else if(compareArr[0] == type_5) {
            mostSpendingType = "금융거래";
        }
        else if(compareArr[0] == type_6) {
            mostSpendingType = "기타";
        }

        spendingTypeInput.value = mostSpendingType;

        // let type_01= Number(0);
        // let type_02= Number(0);
        // let type_03= Number(0);
        // let mostIncomeType = 0;

        // for(let i=0; i<storageArr.length; i++) {
        //     if(storageArr[i].selectBtn === "수입"){
        //         let type = storageArr[i].type;
        //         if( type == "월급 및 용돈") {
        //             type_01++;
        //         }
        //         else if( type == "금융거래") {
        //             type_02++;
        //         }
        //         else if( type == "기타") {
        //             type_03++;
        //         }
        //     }
        // }

        // let compareArr2=[            // sort함수를 활용한 대소비교 후 가장 많은 소득유형 구하기
        //     type_01, type_02, type_03
        // ];
        // compareArr.sort(function(a, b)  {   //sort함수를 이용해서 내림차순정렬
        //     return b -a;
        // });

        // if(compareArr2[0] == type_01) {
        //     mostIncomeType = "월급 및 용돈";
        // }
        // else if(compareArr2[0] == type_02) {
        //     mostIncomeType = "금융거래";
        // }
        // else if(compareArr2[0] == type_03) {
        //     mostIncomeType = "기타";
        // }
        // incomeTypeInput.value = mostIncomeType;
    }
</script>

<style>
* {
    margin: 0;
    padding: 0;
}
body {
    margin:0; 
    background: #40e0d07e; 
    width: 100%; 
    height: 100%;

}
a:link, a:visited {
    color: #e7ffec; 
    color: #ffffff; 
    text-decoration: none; 
    font-weight: bolder; 
}
a:hover {
    color: #6f6f7d;
}
header h1 {
    margin-top: 15px; 
    margin-bottom: 25px; 
    text-align : center;
    font-size : 45px; 
}

article {
    display: inline-block;
    animation: fadein 1.5s;
    -webkit-animation: fadein 2s;
    /* float:left;  */
    text-align: center;
    width:57%; 
    height: 720px; 
    margin:0% 0.5% 1% 4%; 
    background-color: #ddf5fada; 
    outline : solid 4.5px white;
    border-radius:10px;
}
.year-month , .nav , .nav-btn, .go-today {
    margin-top: 7px; 
    font-size : 40px; 
    text-align : center;
    color: #1489a7;  
    border: none;
    background: none;
}
.days {
    display: flex;
    margin-top: 27px;
}
.empty{
    width: calc(100% / 8 / 8)
}
.day , .day-saturday , .day-sunday {
    width: calc(100% / 8);
    text-align: center;
    justify-content: space-around;
    color: #04685e; 
    border: 2px solid white;   
    border-radius: 5px;
    background: #6bf8e860; 
}
.day-sunday {
    color: red;
    background: #f7dcdce2; 
}
.day-saturday {
    color: blue;
    background: #bddcfbe2;  
}
.dates {
    display: flex;
    width: 100%;
    height: 580px;
    flex-flow: row wrap;
}
.date0, .date1, .date2, .date3, .date4, .date5, .date6, 
.date7, .date8, .date9, .date10, .date11, .date12, .date13, 
.date14, .date15, .date16, .date17, .date18, .date19, .date20,
.date21, .date22, .date23, .date24, .date25, .date26, .date27, 
.date28, .date29, .date30, .date31, .date32, .date33, .date34, 
.date35, .date36, .date37, .date38, .date39, .date40, .date41 {
    width: calc(100% / 8.3);
    margin-top: 9px;
    color: #1489a7;  
    text-align: left;
    border: 2px solid white; 
    border-radius: 5px;
    background: #81eee21d; 
}
.date0, .date7, .date14, .date21, .date28, .date35, .date42 {
    color: #D13E3E;
    background: #faf1f1ab; 
}
.date6, .date13, .date20, .date27, .date34, .date41, .date48 {
    color: #396EE2;
    background: #e2f8ffe2; 
}
.other {
    opacity: 0.3;
}
.today{
   width: calc(100% / 8.3);
    margin-top: 9px;
    color: #ad651dab;  
    text-align: left;
    border: 2px solid white; 
    border-radius: 5px;
    background: #fff3e76d; 
}
label {
    font-size:24px;
}
[type="radio"] {
    margin: 0 0 0 30px;
    vertical-align: middle;
    appearance: none;
    background-color: white;
    border: 0.1em solid lightgray; 
    border-radius: 50%;
    width: 2em;
    height: 2em;
    transition: border 0.5s ease-in-out;
}
[type="radio"]:checked {
    border: 0.4em solid #9accfee2; 
}
[type="radio"]:hover {
    box-shadow: 0 0 0 max(2px, 0.1em) #9accfee2; 
    cursor: pointer;
}
div#dateInputBox{
    margin-top: 30px ;
    font-size: 22px;
    color:#6c6c6c;
}
div#contentsInputBox {
    margin-top: 30px ;
    font-size: 22px;
    color:#6c6c6c;
}
div#costInputBox {
    margin-top: 30px ;
    font-size: 22px;
    color:#6c6c6c;
}
div#typeInputBox {
    margin-top: 30px ;
    font-size: 22px;
    color:#6c6c6c;
}
div#addDataInput{
    text-align: right;
    margin-right: 65px;
}
div#analysisBox{
    vertical-align: middle;
    margin-top: 30px;
    font-size: 27px;
    color:#6c6c6c;
}
input#dateInput {
    margin: 0px 10px 0px 10px;
    font-size: 25px;
    vertical-align: middle;
    text-align: center;
    border: none;
    width:  300px;
    color:#6c6c6c;
    border-radius: 10px;
    border-width: 0px;
}
input#contentsInput{
    margin: 0px 10px 0px 10px;
    font-size: 25px;
    vertical-align: middle;
    text-align: center;
    border-radius: 10px;
    border-width: 0px;
    width:  300px;
    color:#6c6c6c;
}
input#costInput{
    margin: 0px 10px 0px 10px;
    font-size: 25px;
    vertical-align: middle;
    text-align: center;
    border: none;
    width:  300px;
    color:#6c6c6c;
    border-radius: 10px;
    border-width: 0px;
}
#addData,#deleteData {
    font-size: 18px;
    padding: 3px 8px;
    color:#6c6c6c;
    margin: 30px 20px 0px 20px;
    background-color: #ddf5fada; 
    border: 4px solid white;
    border-radius: 10px;
}
#addData:active, #deleteData:active, #analysisButton:active,
#addData:hover, #deleteData:hover, #analysisButton:hover {
    border-color: #d3d3d379;
}
#analysisButton {
    font-size: 24px;
    padding: 5px 24px;
    color:#6c6c6c;
    margin: 20px 0px 0px 0px;
    background-color: #ddf5fada; 
    border: 4px solid white;
    border-radius: 10px;
}
select {
    margin: 0px 10px 0px 10px;
    width: 300px; 
    height: 30px;
    font-size: 25px;
    text-align: center;
    vertical-align: middle;
    border: 1px solid lightgray; 
    color:#6c6c6c;
    border-radius: 10px;
    border-width: 0px;
}
.body_analysis{
    margin:0; 
    color: #6E6E7F; 
    background: #40e0d07e;
    width: 100%; 
    height: 100%;
}
.article_analysis {
    display: inline-block;
    animation: fadein 2s;
    -webkit-animation: fadein 2s;
    float: left; 
    text-align: center;
    width:57%; 
    height: 720px; 
    margin:0% 0.5% 1% 4%; 
    background-color: #ddf5fada; 
    outline : solid 4.5px white;
    border-radius:10px;
}
.doughnut_chart {
    margin-top: 80px;
    margin-left: 9px;
    float: left;
    width: 400px;
    height: 423px;
    background-color: none;
}
.doughnut_chart_2 {
    margin-top: 80px;
    margin-right: 2px;
    float: right;
    background-color: none;
    width: 400px;
    height: 430px;
}
.chartTextInput{
    float: left;
    margin-top: 50px;
    margin-left: 105px;
    font-size: 28px;
    text-align: center;
    font-weight: bold;
    width:230px;
    background-color: #ddf5fada; 
    color:#b0b0b0;
    border-radius: 10px;
    border: none;
}
.chartTextInput_2{
    float: right;
    margin-top: 50px;
    margin-right: 100px;
    font-size: 30px;
    font-weight: bold;
    text-align: center;
    width: 230px;
    background-color: #ddf5fada; 
    color:#b0b0b0;
    border-radius: 10px;
    border: none;
}
.aside {
    float:right; 
    width:30%; 
    height: 720px; 
    margin:0% 4% 0% 0%; 
}
.aside_analysis {
    display: inline-block;
    animation: fadein 1.5s;
    -webkit-animation: fadein 2s;
    float:right; 
    width:30%; 
    height: 720px; 
    margin:0% 4% 0% 0%; 
    background:#ddf5fada;  
    outline : solid 4.5px white; 
    border-radius:10px;
}
.incomeInputField{
    display: inline-block;
    animation: fadein 3s;
    -webkit-animation: fadein 3s;
    height: 530px; 
    background: #ddf5fada; 
    outline : solid 4.5px white; 
    border-radius:10px;
    font-size: 20px;
    width: 100%;
    text-align: center;
}
.aside_title {
    font-size: 30px;
    margin-top: 50px;
    margin-bottom: 30px;
}
.analysisField {
    display: inline-block;
    animation: fadein 3s;
    -webkit-animation: fadein 3s;
    margin-top: 30px;
    height: 160px; 
    background: #ddf5fada; 
    outline : solid 4.5px white; 
    vertical-align: middle;
    text-align: center;
    border-radius:10px;
    font-size: 20px;
    width: 100%;
}
.incomeAnalysis {
    margin-top: 40px;
    margin-bottom: 20px;
    font-size: 28px;
    text-align: center;
}
.spendingAnalysis {
    margin-top: 40px;
    margin-bottom: 20px;
    font-size: 28px;
    text-align: center;
}
.spendingTypeAnalysis {
    margin-top: 40px;
    margin-bottom: 20px;
    font-size: 26px;
    text-align: center;
}
.incomeTypeAnalysis {
    margin-top: 40px;
    margin-bottom: 20px;
    font-size: 26px;
    text-align: center;
}
.backButtonAnalysis {
    margin-top: 40px;
    margin-bottom: 20px;
    font-size: 28px;
    text-align: center;
}
.incomeInput {
    color:#6E6E7F;
    opacity: 0.8;
    border: 0px; 
    font-size: 25px;
    text-align: center;
    width: 360px;
    height: 40px;
    margin-top: 30px;
    border-radius: 10px;
    line-height :70px;
}
.spendingInput {
    color:#6E6E7F;
    opacity: 0.8;
    border: 0px; 
    font-size: 25px;
    text-align: center;
    width: 360px;
    height: 40px;
    margin-top: 30px;
    border-radius: 10px;
    line-height :70px;
}
.spendingTypeInput {
    color:#6E6E7F;
    opacity: 0.8;
    border: 0px; 
    font-size: 25px;
    text-align: center;
    width: 360px;
    height: 40px;
    margin-top: 30px;
    border-radius: 10px;
    line-height :70px;
}
.incomeTypeInput {
    color:#6E6E7F;
    opacity: 0.8;
    border: 0px; 
    font-size: 25px;
    text-align: center;
    width: 360px;
    height: 40px;
    margin-top: 30px;
    border-radius: 10px;
    line-height :70px;
}
.backButton {
    font-size: 24px;
    padding: 5px 30px;
    color:#6c6c6c;
    background-color: #ddf5fada; 
    border: 4px solid white;
    border-radius: 10px;
}
.backButton:hover, .backButton:active {
    border-color: #d3d3d379;
}
footer {
    clear:both; 
    width:100%;
    color : white; 
    text-align : center;
    font-size:15px;
}

@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}



</style>
    
</body>
</html>
