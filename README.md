# ShopifyMobileApp


Shopify e-commerce Store front graphQL API calling demostration 

[You can download complete store fron code from here](https://appforstore.com/)

Call GraphQL API for get store name 
        
        let query = Storefront.buildQuery { $0
            .shop { $0
                .name()
            }
            
        }
        let task = client.queryGraphWith(query) { response, error in
            if let response = response {
                print(response);
            }else {
                print("Query failed: \(error)")
            }
        }
        task.resume()
        
        
