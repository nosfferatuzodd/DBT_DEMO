select 
* 
from {{ source('demo', 'bike') }}
LIMIT 10