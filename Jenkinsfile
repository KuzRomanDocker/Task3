pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
                script {
                    committerEmail = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
                }
              sh '''#!/bin/bash
                    echo $BUILD_ID
                    echo GIT_COMMITTER_EMAIL ${committerEmail}
                   '''
            }
        }
    }
}
