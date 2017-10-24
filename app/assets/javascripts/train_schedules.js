$(document).ready(function docReadyFunc(){
  var availableTrains = app.trainList,
    trainIds = _.map(availableTrains, function(train) {return train.id} );

  app.showCorrectTrainDetails = function(event) {
    var selectedTrainId = $(event.target).val();
    if(selectedTrainId === "0") {
      hideTrainDetails();
      return;
    } else {
      updateTrainDetails(selectedTrainId);
      showTrainDetails();
    }
  }

  app.submitTrainSchedule = function(event) {
    if (!isValid()) return;
    var trainSchedule = {
      train_id: $('#train-id').val(),
      departs: $('#source').val(),
      departs_time: $('#departure-time-hh').val() + ':' + $('#departure-time-mm').val(),
      arrives: $('#destination').val(),
      arrives_time: $('#arrival-time-hh').val() + ':' + $('#arrival-time-mm').val(),
      days: _.map($('.days:checked'), function(el) { return $(el).val(); }),
    };
    $.ajax({
      type: "POST",
      url: '/train_schedules.json',
      data: {train_schedule: trainSchedule},
      success: function success(response) {

      },
      dataType: 'json '
    });
  }

  function isValid() {
    // validate source and destination are not same
    //validate and show errors
    return true;
  }

  function hideTrainDetails() {
    $('.train-details').addClass('invisible');
  }

  function showTrainDetails() {
    $('.train-details').removeClass('invisible');
  }

  function updateTrainDetails(selectedTrainId) {
    var trainDetails = _.findWhere(availableTrains, {id: parseInt(selectedTrainId)}),
      sourceOptions = _.union(trainDetails.stops, [trainDetails.source]),
      destinationOptions = _.union(trainDetails.stops, [trainDetails.destination]);
    addOptionsTo(sourceOptions.sort(), $('#source'));
    addOptionsTo(destinationOptions.sort(), $('#destination'));
  }

  function addOptionsTo(options, el) {
    var optionsEl = _.map(options, function(option) {
      return '<option value="' + option + '">' + option + '</option>';
    });
    el.empty();
    el.append(optionsEl.join(''));
  }

  $('#train-id').on('change', app.showCorrectTrainDetails);

  $('#submit-schedule').on('click', app.submitTrainSchedule);
});
