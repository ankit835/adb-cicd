pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from your version control system
                git branch: 'main', url: 'https://github.com/ankit835/adb-cicd.git'
            }
        }
        stage('Build') {
            steps {
                // Execute build commands (e.g., dotnet build, npm run build)
                echo 'Building...' // Example for Node.js project
            }
        }
        stage('deploy') {
             when {
                // Define conditions for deployment, e.g., branch name
                branch 'main'
            }
            steps {
                scripts{
                    sh 'pip install databricks-cli'
                    sh "echo '${databricksHost}\n${databricksToken}' | databricks configure --token"
                }

                // DDL deployment
                    sh '''
                        DDL_FOLDER=/Workspace/Shared/DDL
                        echo $FOLDER
                        databricks workspace import_dir /DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                    '''
                // DML deployment
                    sh '''
                        DML_FOLDER=/Workspace/Shared/DML
                        echo $FOLDER
                        databricks workspace import_dir /DML $DML_FOLDER --exclude-hidden-files --overwrite
                    '''
            }
        }
    }
    
    // Optionally, you can define post-build actions
    // post {
    //     always {
    //         // Clean up or perform any post-build tasks
    //     }
    // }
}
