using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using School.Service;
using School.Model;
using School.WebApi.Filter;

namespace School.WebApi.Controllers
{
    [AllowAnonymous]
    [CustomExceptionFilter]
    public class ValuesController : ApiController
    {
        // GET api/values
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        public UserProfile Get(long id)
        {
            var obj = new UserProfileService();
            var data = obj.GetUserProfile(id);
            return data;

        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }



    }
}
