pipeline {
agent { dockerfile true }
    environment{ 
            DATABRICKS_TOKEN_TEST= credentials('adb-token1')
      		DATABRICKS_TOKEN_QA= credentials('adb-token1')
            }
    
    stages {
          
        stage ('build-prerequsities-test'){
          
          			when { branch 'test' }
                 steps{          
                     // Configure databricks
                    sh '''
                        
                        echo "${DATABRICKS_HOST_TEST}\n${DATABRICKS_TOKEN_TEST}' |  databricks configure --token --profile test"
                        
                    ''' 
        } 
          
    }
      
      stage('build-prerequsities-QA'){
        when {
                // Define conditions for deployment, e.g., branch name
                branch 'QA'
            }
                 steps{          
                     // Configure databricks
                    sh '''
                        
                        echo "${DATABRICKS_HOST_QA}\n${DATABRICKS_TOKEN_QA}' |  databricks configure --token"
                        
                    ''' 
        } }
      
        stage('deploy') {
//             when {
                // Define conditions for deployment, e.g., branch name
//                branch 'main'
//            }
            steps {    

                // DDL deployment
                     sh '''
                         DDL_FOLDER=/Workspace/Shared/DDL
                         echo $DDL_FOLDER
                         databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                     '''
                // DML deployment
                    sh '''
                        DML_FOLDER=/Workspace/Users/
                        echo $DML_FOLDER
                        databricks workspace import_dir Demo_DML $DML_FOLDER --exclude-hidden-files --overwrite
                    '''
            }
        }
    }
    

    post {
        always {
            echo "Pipeline execution completed..!!"
        }
    }
}
