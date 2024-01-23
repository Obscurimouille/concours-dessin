const TimeService = {

    getDeltaTime(date, referenceDate = null) {
        const dateA = referenceDate ? referenceDate : new Date();
        const dateB = new Date(date);
        return dateA - dateB;
    },

    getDeltaDays(date, referenceDate = null) {
        const timeDifference = this.getDeltaTime(date, referenceDate)
        const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
        return daysDifference;
    },

    formatTimeDifference(i18nService, date) {
        const daysDifference = TimeService.getDeltaDays(date)

        // Format the result
        if (daysDifference === 0) return i18nService('closedDateFormatToday');
        else if (daysDifference === 1) return i18nService('closedDateFormatYesterday');
        else return i18nService('closedDateFormatDays', { days: daysDifference });
    },

    formatTimeLeft(i18nService, endDate) {
        const timeDifference = -TimeService.getDeltaTime(endDate);
        const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
        const hoursDifference = Math.floor(timeDifference / (1000 * 60 * 60));
        const minutesDifference = Math.floor(timeDifference / (1000 * 60));
        const secondsDifference = Math.floor(timeDifference / (1000));

        // Format the result
        if (daysDifference > 0) return i18nService('timeLeftFormatDays', { days: daysDifference });
        else if (hoursDifference > 0) return i18nService('timeLeftFormatHours', { hours: hoursDifference });
        else if (minutesDifference > 0) return i18nService('timeLeftFormatMinutes', { minutes: minutesDifference });
        else if (secondsDifference > 0) return i18nService('timeLeftFormatSeconds', { seconds: secondsDifference });
        else return i18nService('timeLeftFormatNow');
    },

};

export default TimeService;
