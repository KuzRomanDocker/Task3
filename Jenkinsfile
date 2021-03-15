pipeline {
    agent { label 'master' }
    stages {
        stage('PROD') {
            environment {
                BUILD_REQUESTEDFOREMAIL = sh (script: 'git --no-pager show -s --format=\'%ae\'', returnStdout: true).trim()
                BUILD_REQUESTEDFOR = sh (script: 'git --no-pager show -s --format=\'%an\'', returnStdout: true).trim()
                   }
            steps {
                    git remote -v
                    git remote add upstream https://github.com/KuzRomanDocker/Task2.git
                    git remote -v
                    git fetch upstream
                    git checkout master
                    git merge upstream/master
                    git push
            }
        }
    }
}
