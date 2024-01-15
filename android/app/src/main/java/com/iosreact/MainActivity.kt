package com.iosreact

import android.os.Bundle
import android.util.Log
import com.clear.studio.csdocs.entries.CSDocumentoscopy
import com.clear.studio.csdocs.entries.CSDocumentoscopySDK
import com.clear.studio.csdocs.entries.CSDocumentoscopySDKError
import com.clear.studio.csdocs.entries.CSDocumentoscopySDKListener
import com.clear.studio.csdocs.entries.CSDocumentoscopySDKResult
import com.facebook.react.ReactActivity
import com.facebook.react.ReactActivityDelegate
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.fabricEnabled
import com.facebook.react.defaults.DefaultReactActivityDelegate

class MainActivity : ReactActivity() {

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  override fun getMainComponentName(): String = "iOSReact"

  /**
   * Returns the instance of the [ReactActivityDelegate]. We use [DefaultReactActivityDelegate]
   * which allows you to enable New Architecture with a single boolean flags [fabricEnabled]
   */
  override fun createReactActivityDelegate(): ReactActivityDelegate =
      DefaultReactActivityDelegate(this, mainComponentName, fabricEnabled)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        CSDocumentoscopySDK.initialize(this, CSDocumentoscopy(clientID = "TAG", clientSecret = "TAG", cpf = "TAG", identifierId = "TAG"), object:
            CSDocumentoscopySDKListener {
            override fun didOpen(){
                Log.d("TAG", "SDK Foi Aberto")
            }
            override fun didTapClose(){
                Log.d("TAG", "Usuário encerrou manualmente o fluxo")
            }
            override fun didReceiveError(error : CSDocumentoscopySDKError){
                val errorText = "${error.text} - errorCode: ${error.errorCode}"
                Log.d("TAG", "Error: $errorText")
            }
            override fun didFinishCapture(result: CSDocumentoscopySDKResult){
                val sessionIdText = "Session Id: " + result.sessionId
            }
        })
    }
}
