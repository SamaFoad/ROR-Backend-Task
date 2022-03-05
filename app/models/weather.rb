# --------------+-----------------------------+-----------+----------+--------------------------------------
#  id           | bigint                      |           | not null | nextval('weathers_id_seq'::regclass)
#  date         | date                        |           |          |
#  lat          | double precision            |           |          |
#  lon          | double precision            |           |          |
#  city         | character varying           |           |          |
#  state        | character varying           |           |          |
#  temperatures | double precision[]          |           |          | '{}'::double precision[]
#  created_at   | timestamp without time zone |           | not null |
#  updated_at   | timestamp without time zone |           | not null |

class Weather < ApplicationRecord
    before_save :downcase_fields

    def downcase_fields
        self.city.downcase!
    end
end
