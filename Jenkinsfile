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
                    git clone --bare https://github.com/KuzRomanDocker/Task3.git
                    git config user.email ${BUILD_REQUESTEDFOREMAIL}
                    git config user.name ${BUILD_REQUESTEDFOR}
                   '''
            }
        }
    }
}
