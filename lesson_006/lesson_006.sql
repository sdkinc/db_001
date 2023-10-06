--
--Разблокировать юзеров из France и Germany с положительным балансом
--
db.users.updateMany(
  { balance: { $ gt: 0 },
  country: { $ in: ['Germany', 'France'] } },
  { $ unset: { is_blocked: null } }
) --
--Вывести названия двух произвольных видео-роликов
--
db.videos.aggregate(
  [
    { $sample: { size: 2 } },
    { $project: { _id: 0, title: 1 } }
]
) --
--Вывести юзеров, у которых есть видео-ролики
--
db.videos.aggregate(
  [
    {
        $lookup:
            {
                from: 'users',
                localField: 'author_id',
                foreignField: '_id',
                as: 'users'
            }
    },

    { $project: { _id: 0, users: 1 } }
]
) --- OR
db.users.aggregate(
  [
    {
        $lookup: {
            from: 'videos',
            localField: '_id',
            foreignField: 'author_id',
            as: 'videos'
        }
    },
    { $match: { videos: {$ne:[] } } },
  { $ project: { _id :0,
  videos :1 } } ]
) --
--Используя метод aggregate(), вывести ко-во юзеров без видео-роликов
--
db.users.aggregate(
  [
    {
        $lookup: {
            from: 'videos',
            localField: '_id',
            foreignField: 'author_id',
            as: 'videos'
        }
    },
    { $match: { videos: [] } },
  { $ count: 'users_without_videos' } ]
)