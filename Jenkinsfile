pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
              sh '''#!/bin/bash
                    echo $BUILD_ID
                    echo GIT_COMMITTER_EMAIL %GIT_COMMITTER_EMAIL%
                   '''
            }
        }
    }
}
