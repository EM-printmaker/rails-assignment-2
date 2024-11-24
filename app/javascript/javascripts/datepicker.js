var picker = new tempusDominus.TempusDominus(document.getElementById('datetimePicker1'), {
  localization: {
    format: 'yyyy/MM/dd',
    dayViewHeaderFormat: { year: 'numeric', month: 'long' },
    today: '本日',
    close: '閉じる',
    selectMonth: '月を選択',
    previousMonth: '前月',
    nextMonth: '次月',
    selectYear: '年を選択',
    previousYear: '前年',
    nextYear: '次年',
    selectDecade: '期間を選択',
    previousDecade: '前期間',
    nextDecade: '次期間',
    previousCentury: '前世紀',
    nextCentury: '次世紀',
  },
  display: {
    components: {
      clock: false
    },
    buttons: {
      close: false,
    },
  }
}); 

var picker = new tempusDominus.TempusDominus(document.getElementById('datetimePicker2'), {
  localization: {
    format: 'yyyy/MM/dd',
    dayViewHeaderFormat: { year: 'numeric', month: 'long' },
    today: '本日',
    close: '閉じる',
    selectMonth: '月を選択',
    previousMonth: '前月',
    nextMonth: '次月',
    selectYear: '年を選択',
    previousYear: '前年',
    nextYear: '次年',
    selectDecade: '期間を選択',
    previousDecade: '前期間',
    nextDecade: '次期間',
    previousCentury: '前世紀',
    nextCentury: '次世紀',
  },
  display: {
    components: {
      clock: false
    },
    buttons: {
      close: false,
    },
  }
});


