﻿using System;
using System.Runtime.Serialization;
using Merchello.Core.Models.EntityBase;

namespace Merchello.Core.Models
{
    /// <summary>
    /// Defines a product attribute
    /// </summary>
    [Serializable]
    [DataContract(IsReference = true)]
    internal class ProductAttribute : Entity, IProductAttribute
    {
        private string _name;
        private string _sku;
     

        public ProductAttribute(string name, string sku)
        {
            Mandate.ParameterNotNullOrEmpty(name, "name");
            Mandate.ParameterNotNullOrEmpty(sku, "sku");

            _name = name;
            _sku = sku;
        }

        /// <summary>
        /// The id of the option which defines the attribute group this attribute belongs to
        /// </summary>
        [DataMember]
        public Guid OptionKey { get; set; }


        /// <summary>
        /// The name of the attribute
        /// </summary>
        [DataMember]
        public string Name {
            get { return _name; }
            set
            {
                _name = value;
            }
 
        }

        /// <summary>
        /// The suggested sku concatenation
        /// </summary>
        [DataMember]
        public string Sku {
            get { return _sku; }
            set
            {
                _sku = value;
            } 
        }

        /// <summary>
        /// The order in which to list the product attribute with respect to the product option
        /// </summary>
        [DataMember]
        public int SortOrder { get; set; }


    }
}