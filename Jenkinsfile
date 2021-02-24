pipeline {
    agent { label 'master' }
    stages {
        stage('PROD') {
            environment {
                BUILD_REQUESTEDFOREMAIL = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
                BUILD_REQUESTEDFOR = sh (script: 'git --no-pager show -s --format=\'%an\'', returnStdout: true).trim()
            }
            steps {
              sh '''#!/bin/bash
                    echo "BUILD_BUILDNUMBER $BUILD_ID"
                    echo "GIT_COMMITTER_EMAIL ${BUILD_REQUESTEDFOREMAIL}"
                    echo "GIT_COMMITTER_Name ${BUILD_REQUESTEDFOR}"
                   '''
            }
        }
    }
}
