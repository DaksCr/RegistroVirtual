﻿$(function () {

    $body = $("body");
    $(document).on({
        ajaxStart: function () { $body.addClass("loading"); },
        ajaxStop: function () { $body.removeClass("loading"); }
    });

    GetRelatedClasses($("#selected-subject").val());

    $("#score-search-button").click(function () {
        LoadGridScores();
    });

    $("#selected-subject").on('change', function () {
        GetRelatedClasses($(this).val());
    });

    function GetRelatedClasses(subject) {
        $.ajax({
            url: "/Score/GetRelatedClasses",
            dataType: "json",
            data: { selectedSubject: subject }
        }).done(function (response) {
            if (response.classes.length > 0) {
                $("#selected-class").empty();
                $.each(response.classes, function (index, element) {
                    $('#selected-class')
                        .append($("<option></option>")
                                   .attr("value", element.Id)
                                   .text(element.Name));
                });
            }
        });
    }

    function LoadGridScores() {
        var selectedClass = $("#selected-class").val();
        var selectedYear = $("#selected-year").val();
        var selectedTrimester = $("#selected-trimester").val();
        var selectedSubject = $("#selected-subject").val();

        $.ajax({
            url: "/Score/LoadScores",
            dataType: "html",
            data: { selectedClass: selectedClass, selectedYear: selectedYear, selectedTrimester: selectedTrimester, selectedSubject: selectedSubject }
        }).done(function (response) {
            var jsonResult;
            try {
                jsonResult = JSON.parse(response);
                var errorMessage = $("#error-searching-scores .error-message");
                errorMessage.empty().html(jsonResult.responseText);
                errorMessage.show();
                errorMessage.fadeOut(5000);
            }
            catch (e) {
                $("#scores-container").empty().html(response);
                UpdateZeroAsistanceFields();
                CalculateAllAverageAndConcept();
                bindScoreGridEvents();
            };
        });
    }

    function PointsToCalculateExamPercentageAndScore(examPointsField) {
        var studentEntry = examPointsField.parent().parent();
        var examId = examPointsField.attr('data-exam-id');
        var examPercentageField = studentEntry.find("input.exam-percentage[data-exam-id='" + examId + "']");
        var examScoreField = studentEntry.find("input.exam-score[data-exam-id='" + examId + "']");

        if (examPercentageField != null && examPercentageField != undefined) {
            var examMaxPercentage = examPercentageField.attr('max');
            var examMaxPoints = examPointsField.attr('max');
            var score = Math.round(((parseInt(examPointsField.val()) * 100) / parseInt(examMaxPoints)) * 10) / 10;
            var percentage = Math.round((score * ((parseInt(examMaxPercentage) / 100))) * 10) / 10;
            examScoreField.val(score);
            examPercentageField.val(percentage);
        }
    }

    function ScoreToCalculateExamPercentageAndPoints(examScoreField) {
        var studentEntry = examScoreField.parent().parent();
        var examId = examScoreField.attr('data-exam-id');
        var examPercentageField = studentEntry.find("input.exam-percentage[data-exam-id='" + examId + "']");
        var examPointsField = studentEntry.find("input.exam-points[data-exam-id='" + examId + "']");

        if (examPercentageField != null && examPercentageField != undefined) {
            var examMaxPercentage = examPercentageField.attr('max');
            var examMaxPoints = examPointsField.attr('max');

            var points = Math.round(((parseInt(examScoreField.val()) * parseInt(examMaxPoints)) / 100) * 10) / 10;
            var percentage = Math.round((examScoreField.val() * ((parseInt(examMaxPercentage) / 100))) * 10) / 10;

            examPointsField.val(points);
            examPercentageField.val(percentage);
        }
    }

    function CalculateConcept(studentEntry) {
        var concept = 0;

        var examScoreFields = studentEntry.find("input.exam-score");
        examScoreFields.each(function () {
            concept += parseFloat($(this).val());
        });

        var extraclassPercentageFields = studentEntry.find("input.extraclass-score");
        extraclassPercentageFields.each(function () {
            concept += (parseFloat($(this).val()) * 100) / $(this).attr('max');
        });

        concept += parseFloat(studentEntry.find("#DailyWorkPercentage").val());
        var maxConceptPercentage = parseFloat(studentEntry.find("#ConceptPercentage").attr('max'));

        var roundConcept = Math.round(((concept / 4) * (maxConceptPercentage / 100)) * 10) / 10;

        if (roundConcept > maxConceptPercentage) {
            roundConcept = maxConceptPercentage;
        }

        return roundConcept;
    }

    function CalculateAverage(studentEntry) {
        var average = 0;
        
        var examPercentageFields = studentEntry.find("input.exam-percentage");
        examPercentageFields.each(function () {
            average += parseFloat($(this).val());
        });

        var extraclassPercentageFields = studentEntry.find("input.extraclass-score");
        extraclassPercentageFields.each(function () {
            average += parseFloat($(this).val());
        });

        average += parseFloat(studentEntry.find("#DailyWorkPercentage").val());
        average += parseFloat(studentEntry.find("#ConceptPercentage").val());
        average += parseFloat(studentEntry.find("#AssistancePercentage").val());

        return Math.round(average);
    }

    function CalculateAllAverageAndConcept()
    {
        var studentScores = $(".score-item");

        studentScores.each(function () {
            var concept = CalculateConcept($(this));
            $(this).find("#ConceptPercentage").val(concept);
            var average = CalculateAverage($(this));
            $(this).find("#Average").val(average);
        });
    }

    function CalculateAssitance(assistanceRelatedField) {
        var studentEntry = assistanceRelatedField.parent().parent();
        var Belated = studentEntry.find("#Belated").val();
        var Absences = studentEntry.find("#Absences").val();
        var AssistanceField = studentEntry.find("#AssistancePercentage");
        var NumberOfLessons = studentEntry.find("#NumberOfLessons").val();
            
        var percentage = ((parseInt(Absences) + (parseInt(Belated) / 3)) * 100) / parseInt(NumberOfLessons);
        var assistancePercentage = 0;

        if (percentage === 0)
        {
            assistancePercentage = 5;
        }
        else if (percentage >= 1 && percentage <= 12)
        {
            assistancePercentage = 4;
        }
        else if (percentage >= 13 && percentage <= 25)
        {
            assistancePercentage = 3;
        }
        else if (percentage >= 26 && percentage <= 38)
        {
            assistancePercentage = 2;
        }
        else if (percentage >= 39 && percentage <= 50)
        {
            assistancePercentage = 1;
        }

        AssistanceField.val(assistancePercentage);
    }

    function UpdateZeroAsistanceFields() {
        var studentScores = $(".score-item");

        studentScores.each(function () {
            var studentEntry = $(this);
            var AssistanceField = studentEntry.find("#AssistancePercentage");
            var MaxAssistancePercentage = AssistanceField.attr('max');

            if (AssistanceField.val() === '0' && MaxAssistancePercentage != null) {
                AssistanceField.val(MaxAssistancePercentage);
            }
        });
    }

    function bindScoreGridEvents() {

        $(".assistance-related-field").on('change', function () {
            CalculateAssitance($(this));
        });

        $(".exam-points").on('change', function () {
            PointsToCalculateExamPercentageAndScore($(this));
        });

        $(".exam-score").on('change', function () {
            ScoreToCalculateExamPercentageAndPoints($(this));
        });

        $(".exam-score, .exam-points, .extraclass-score, .assistance-related-field, #DailyWorkPercentage, #AssistancePercentage").on('change', function () {
            var studentEntry = $(this).parent().parent();
            var concept = CalculateConcept(studentEntry);
            studentEntry.find("#ConceptPercentage").val(concept);
            var average = CalculateAverage(studentEntry);
            studentEntry.find("#Average").val(average);
        });

        $('.scores-save-button').on('click', function () {

            var studentScores = $(".score-item");
            var Scores = [];

            studentScores.each(function () {
                var studentEntry = $(this);
                var StudentId = studentEntry.find("#StudentId").val();
                var ScoreId = studentEntry.find("#ScoreId").val();
                var ClassId = $("#selected-class").val();
                var YearCreated = $("#selected-year").val();
                var RegisterProfileId = studentEntry.find("#RegisterProfileId").val();
                var DailyWorkPercentage = studentEntry.find("#DailyWorkPercentage").val();
                var Absences = studentEntry.find("#Absences").val();
                var Belated = studentEntry.find("#Belated").val();
                var AssistancePercentage = studentEntry.find("#AssistancePercentage").val();
                var ConceptPercentage = studentEntry.find("#ConceptPercentage").val();

                var examScoreFields = studentEntry.find(".exam-score");
                var ExamResults = [];

                examScoreFields.each(function () {
                    var examId = $(this).attr('data-exam-id');
                    var examScore = $(this).val();
                    var examPercentageField = studentEntry.find("input.exam-percentage[data-exam-id='" + examId + "']");
                    var examPointsField = studentEntry.find("input.exam-points[data-exam-id='" + examId + "']");

                    var Exam =
                    {
                        "ExamId": examId,
                        "ExamScore": examScore,
                        "ExamPoints": examPointsField.val(),
                        "ExamPercentage": examPercentageField.val(),
                    };

                    ExamResults.push(Exam);
                });


                var extraclassWorkFields = studentEntry.find(".extraclass-score");
                var ExtraclasWorkResults = [];

                extraclassWorkFields.each(function () {
                    var extraclassId = $(this).attr('data-extraclass-id');
                    var extraclassPercentage = $(this).val();

                    var ExtraclassWork =
                    {
                        "ExtraclassWorkId": extraclassId,
                        "ExtraclassWorkPercentage": extraclassPercentage,
                    };

                    ExtraclasWorkResults.push(ExtraclassWork);
                });

                var ScoreModel =
                {
                    "Id": ScoreId,
                    "StudentId": StudentId,
                    "ClassId": ClassId,
                    "YearCreated": YearCreated,
                    "RegisterProfileId": RegisterProfileId,
                    "DailyWorkPercentage": DailyWorkPercentage,
                    "Absences": Absences,
                    "Belated": Belated,
                    "AssistancePercentage": AssistancePercentage,
                    "ConceptPercentage": ConceptPercentage,
                    "ExamResults": ExamResults,
                    "ExtraclasWorkResults": ExtraclasWorkResults
                };

                Scores.push(ScoreModel);
            })

            //Send a list of scores
            $.ajax({
                url: '/Score/Save/',
                data: JSON.stringify(Scores),
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    LoadGridScores();
                }
            });

        });

    }
})