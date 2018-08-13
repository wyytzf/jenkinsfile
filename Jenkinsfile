pipeline {
    agent any
    parameters {
        string(name: 'user_answer_repo')
        string(name: 'branch')
        string(name: 'callback_url')
        string(name: 'image')
        string(name: 'answer_path')
    }

    stages {
        stage('checkout homework master') {
            steps {
                script {
                dir("${JOB_NAME}_${BUILD_NUMBER}") {
                        try {
                            checkout([
                                $class: 'GitSCM',
                                branches: [[name: "${params.branch}"]],
                                userRemoteConfigs: [[url: "${params.user_answer_repo}"]]
                            ])
                            sh "sudo chmod -R 777 ../"
                            sh "../build-homework.sh"
                            } catch (e) {
                                env.LOCAL_ERROR = 'error in checkout homework master'
                                error(env.LOCAL_ERROR)
                            }
                        }
                }
            }
        }
        stage('tar answer.zip') {
            steps {
                script {
                    dir("${JOB_NAME}_${BUILD_NUMBER}") {
                        try {
                            sh "../build-answer.sh"
                        } catch(e) {
                            env.LOCAL_ERROR = 'error in tar answer.zip'
                            error(env.LOCAL_ERROR)
                        }
                    }
                }
            }
        }
        stage('pull image') {
            steps {
                script {
                    dir("${JOB_NAME}_${BUILD_NUMBER}") {
                        try {
                            sh "../build-image.sh"
                        } catch(e) {
                            env.LOCAL_ERROR = 'error in pull image'
                            error(env.LOCAL_ERROR)
                        }
                    }
                }
            }
        }
        stage('run script') {
            steps {
                script{
                    dir("${JOB_NAME}_${BUILD_NUMBER}") {
                    try {
                        sh "../run.sh"
                        } catch(e) {
                            //sh "catch error e.message: $e.message"
                            echo "$e"
                            env.LOCAL_ERROR = "error in run script."
                            error(env.LOCAL_ERROR)
                        }
                    }
                }
            }
        }
    }

    post {
        failure{
            sh "echo 'failure'"
            sh "./failure.sh"
            //sh "./cleanup.sh"
        }
        success{
            sh "echo 'success'"
            sh "./success.sh"
            //sh "./cleanup.sh"
        }
    }
}
