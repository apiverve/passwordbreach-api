using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.PasswordBreachChecker
{
    /// <summary>
    /// Query options for the Password Breach Checker API
    /// </summary>
    public class PasswordBreachCheckerQueryOptions
    {
        /// <summary>
        /// The password to check. Hashed on receipt and never stored. Send this or hash
        /// </summary>
        [JsonProperty("password")]
        public string Password { get; set; }

        /// <summary>
        /// The 40-character hex SHA-1 of the password, instead of the password itself
        /// </summary>
        [JsonProperty("hash")]
        public string Hash { get; set; }
    }
}
