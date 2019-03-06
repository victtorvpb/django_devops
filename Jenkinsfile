pipeline {
    agent any

    // triggers {
    //     pollSCM('*/5 * * * 1-5')
    // }

    // options {
    //     skipDefaultCheckout(true)
    //     // Keep the 10 most recent builds
    //     buildDiscarder(logRotator(numToKeepStr: '10'))
    //     timestamps()
    // }

    stages {
        stage ("Code pull"){
            steps {
                checkout scm
            }
        }

        stage('Ensure container is stopped') {
            steps {
                sh 'sudo make ci-stop'
            }
        }

        stage('Build container image') {
            steps {
                sh 'sudo make ci-build'
            }
        }

        stage('Start container') {
            steps {
                sh 'sudo make ci-start'
            }
        }

        stage('Unit tests and Coverage') {
            steps {
                sh 'sudo make ci-coverage-xml'
            }
            post {
                success {
                    // Archive unit tests for the future
                    junit (allowEmptyResults: true,
                          testResults: 'junit.xml')

                    cobertura(coberturaReportFile: 'cobertura.xml',
                              failNoReports: false,
                              maxNumberOfBuilds: 10,
                              sourceEncoding: 'ASCII',
                              enableNewApi: true,
                              autoUpdateHealth: false,
                              autoUpdateStability: false,
                              failUnhealthy: false,
                              failUnstable: false,
                              onlyStable: false,
                              zoomCoverageChart: false)
                }
            }
        }

        // stage('Export xml reports') {
        //     steps {
        //         sh 'make ci-export-xml'
        //     }
            
        // }
    }

    // post {
    //     always {
    //         echo 'Stop existing container'
    //         sh 'make ci-stop'
    //     }
    // }
}