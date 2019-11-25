pipeline
{
    agent any

    stages
    {
        stage('Setup')
        {
            steps
            {
                sh "./setup.sh"
            }
        }
        stage('Test')
        {
            steps
            {
                sh "./run_robot.sh"
            }
        }
        stage('Publish')
        {
            steps
            {
                robot logFileName: '*log.html',
                    onlyCritical: false,
                    outputFileName: '*output.xml',
                    outputPath: 'robot_logs',
                    reportFileName: '*report.html',
                    passThreshold: 100.0,
                    unstableThreshold: 90.0
            }
        }
    }
}