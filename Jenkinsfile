pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
              sh '''#!/bin/bash
                    echo "${env.J_EMAIL}"
                    echo "${env.J_USERNAME}"
                   '''
            }
        }
    }
}
