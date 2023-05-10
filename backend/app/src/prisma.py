from prisma import Prisma

prisma = Prisma()

User = prisma.user
Trail = prisma.trail
Trailbucks = prisma.trailbucks
Transaction = prisma.transactions
TrailOrg = prisma.trailorg
Notification = prisma.notification
