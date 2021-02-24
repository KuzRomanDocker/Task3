pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
              sh '''#!/bin/bash
                    committerEmail = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
                    echo $BUILD_ID
                    echo "GIT_COMMITTER_EMAIL ${committerEmail}"
                   '''
            }
        }
    }
}
