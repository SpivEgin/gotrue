package metering

import (
	uuid "github.com/satori/go.uuid"
	"github.com/sirupsen/logrus"
)

var logger = logrus.StandardLogger().WithField("metering", true)

func RecordLogin(loginType string, userID, instanceID uuid.UUID) {
	logger.WithFields(logrus.Fields{
		"action":       "login",
		"login_method": loginType,
		"instance_id":  instanceID.String(),
		"user_id":      userID.String(),
	}).Info("Login")
}
