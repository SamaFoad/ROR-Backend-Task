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

FactoryBot.define do
    factory :weather do
        lat { 12.43 }
        lon { 10.18 }
        city { "Alexandria" }
        state { "Cairo" }
    end
end