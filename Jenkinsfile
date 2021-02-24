pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
              sh '''#!/bin/bash
                    echo $BUILD_ID
                    echo ${BUILD_REQUESTEDFOREMAIL}
                   '''
            }
        }
    }
}
