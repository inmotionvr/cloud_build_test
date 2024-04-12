using JetBrains.Annotations;
using UnityEditor;
using UnityEngine;

namespace CloudBuildTest
{
    internal static class CommandLineBuild
    {
        #region Public

        // Method invoked by a CI script 
        [UsedImplicitly]
        public static void SetEnvironment()
        {
#if UNITY_ANDROID
	        var buildTargetGroup = BuildTargetGroup.Android;
#elif UNITY_IOS
            var buildTargetGroup = BuildTargetGroup.iOS;
#endif
			Debug.Log(buildTargetGroup);
        }

        #endregion
    }
}