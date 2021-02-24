pipeline {
    agent { label 'master' }
    stages {
        stage('PROD') {
            environment {
                committerEmail = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
            }
            steps {
              sh '''#!/bin/bash
                    echo $BUILD_ID
                    echo "GIT_COMMITTER_EMAIL ${committerEmail}"
                    echo "GIT_COMMITTER_EMAIL $committerEmail"
                   '''
            }
        }
    }
}
