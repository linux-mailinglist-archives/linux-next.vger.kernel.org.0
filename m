Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4B6FC6BC
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 13:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfKNM6z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 07:58:55 -0500
Received: from mail-eopbgr150078.outbound.protection.outlook.com ([40.107.15.78]:11397
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726139AbfKNM6z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 07:58:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPw5PH/Jp8F2XUM+lJJGiN0rUbl6K7SP1TQCLEuRVSvkQlLbClMAXA7Jq3y/+AO+axtOcMZt7p1VgaifbTLk/hEMErHwv84Lpkm5dXdi9bGZqYrcKc5oMYN5w9GRQlBBlkuLl1MrFr2Kn6v9b7gVQ79g2/35FXBvHAOoaazVpufnRZzkcAeOeWs6Py8hJTPPuI8U3MUTLtKFFv9dbltBnVceGUHeK69MaSqAAlimekiHL2ddwmZkDi4chu5YVmGPfnQtes2KqxU2YzSYpLrqVUKT+97q8ZylQLA/RimBgPBhyobRL2QqwN4M3GpriIRixR31T6SOCyqmzXdSAa6F/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zJ//esVPodjJaoeobhXq09SRlPzNkCJW8Danz3SzhE=;
 b=BnNTKd3UzhPsQjbCZJhZTgZ1bVZwsIJJiywrU4SlE+95701H+vDZFEvzYz0cIo9ON0Q4k0K526dcBAYnjHXO9omhSoO0nMMQaIRgFQUQFPhHq57VxItuz+Pc78N+fXDtowGqUVU7z3IEiMHlQJcAon7x7y34+kcirb8VaS+J14Vf5Xu4Bq26T2CvNw9+H+ypSYy63ufhTFiIVAKdEa8b4OTUNLVr7Nztvo1SJi2pZenZZTjjakwTC7qaCa8tQSbw0JDiYGnlDIATLHq20fn0MFoRSwdNgbl1rtWY9YwZg25rYKbVCWZgG36xPn+WDD/XHIZSY1XzAKhUGztFANWMBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zJ//esVPodjJaoeobhXq09SRlPzNkCJW8Danz3SzhE=;
 b=Npmz04U+ceYmuwA2VmJZTbZ9vxNHQS2BbRMELsotRLMJjhQFHjXXc85rtRVuAvN6zY8GgvPB6APDxK8SNTOgWHWrU7oytOaBnnmqUX763I/+uCoelLBH72UoWVgjamDV+ZaRfVdZm8/8FdWPt8o05cB7MNw52I6NwLGm/amAUME=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5935.eurprd05.prod.outlook.com (20.178.126.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Thu, 14 Nov 2019 12:58:48 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 12:58:48 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hmm tree
Thread-Topic: linux-next: build failure after merge of the hmm tree
Thread-Index: AQHVmq03k5u9m0Gc1Ei8rJpUBgOCyKeKoR+A
Date:   Thu, 14 Nov 2019 12:58:47 +0000
Message-ID: <20191114125841.GO21728@mellanox.com>
References: <20191114163435.6273b6a1@canb.auug.org.au>
In-Reply-To: <20191114163435.6273b6a1@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:208:fc::15) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22a1e1d4-6527-418f-e3ea-08d76902638f
x-ms-traffictypediagnostic: VI1PR05MB5935:
x-microsoft-antispam-prvs: <VI1PR05MB59350243302A28D95C9AF4C7CF710@VI1PR05MB5935.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(53754006)(199004)(189003)(71190400001)(186003)(54906003)(26005)(81156014)(86362001)(81166006)(76176011)(5660300002)(8936002)(4326008)(316002)(2906002)(11346002)(66946007)(66556008)(66476007)(476003)(6246003)(99286004)(6116002)(3846002)(25786009)(486006)(6512007)(2616005)(8676002)(66446008)(52116002)(64756008)(6506007)(386003)(1076003)(102836004)(446003)(6436002)(6486002)(36756003)(66066001)(14444005)(229853002)(71200400001)(7736002)(256004)(305945005)(14454004)(33656002)(6916009)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5935;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vwUDj4aKlycvfPT/eCI1ifW80u1Rr0XVqr4gMSVJKNgv34bUavLOj0g3MAIIl9pWGb+w+oAJymnlIYhCp/vwjcr5zc2nBO21wTwC9M799Yx2WCuJQD72fXur+n4vBIJDASIhxpjV9ZM4avyo0zz9zcWU3osfkyvRTR9KXjKJn0BxQgDT3AKJBE4+FFdf1qWHj8YEkjgGoVtFEEal08RUFPrGNV8dcTmUlk+wGAqG/1cbZMvr0Rux7YUVcEjgJ1aey46MGS4twm3KtSfXBwdWBWkDa+xuGE+TnsWRSNyDAW6Gi4Q4jEFF4dE+3cZksIA5pnd4GIA6h73rsU1lq9pb6aZpL6E4P1tOEAWnn6UpFffB7hxuqAiZOWqUspS4jt/TTRxmJdpXPZydGi7DClwTic9PONdtdONXsrnesDWd+1ctJY7ffzhD4xQdQGLzPTAp
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89C6F450F1FDD8449CF24158202D94C2@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a1e1d4-6527-418f-e3ea-08d76902638f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 12:58:47.9938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FTWUYSYWq7Rr+ywIrfIaM21N0BWeTKs2f/VnnBZ/fpzywn4aYPvjoev+419QCwzqvfUFqbO6EgEaDEaY66BVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5935
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 14, 2019 at 04:34:35PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the hmm tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>=20
> drivers/infiniband/hw/hfi1/user_exp_rcv.c: In function 'set_rcvarray_entr=
y':
> drivers/infiniband/hw/hfi1/user_exp_rcv.c:768:33: warning: passing argume=
nt 2 of 'mmu_interval_notifier_insert' makes pointer from integer without a=
 cast [-Wint-conversion]
>   768 |    &node->notifier, tbuf->vaddr + (pageidx * PAGE_SIZE),
>       |                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>       |                                 |
>       |                                 long unsigned int
> In file included from include/rdma/ib_verbs.h:59,
>                  from include/rdma/ib_hdrs.h:53,
>                  from drivers/infiniband/hw/hfi1/hfi.h:68,
>                  from drivers/infiniband/hw/hfi1/mmu_rb.h:50,
>                  from drivers/infiniband/hw/hfi1/user_exp_rcv.c:50:
> include/linux/mmu_notifier.h:295:24: note: expected 'struct mm_struct *' =
but argument is of type 'long unsigned int'
>   295 |      struct mm_struct *mm, unsigned long start,
>       |      ~~~~~~~~~~~~~~~~~~^~
> drivers/infiniband/hw/hfi1/user_exp_rcv.c:769:26: warning: passing argume=
nt 4 of 'mmu_interval_notifier_insert' makes integer from pointer without a=
 cast [-Wint-conversion]
>   769 |    npages * PAGE_SIZE, fd->mm);
>       |                        ~~^~~~
>       |                          |
>       |                          struct mm_struct *
> In file included from include/rdma/ib_verbs.h:59,
>                  from include/rdma/ib_hdrs.h:53,
>                  from drivers/infiniband/hw/hfi1/hfi.h:68,
>                  from drivers/infiniband/hw/hfi1/mmu_rb.h:50,
>                  from drivers/infiniband/hw/hfi1/user_exp_rcv.c:50:
> include/linux/mmu_notifier.h:296:20: note: expected 'long unsigned int' b=
ut argument is of type 'struct mm_struct *'
>   296 |      unsigned long length,
>       |      ~~~~~~~~~~~~~~^~~~~~
> drivers/infiniband/hw/hfi1/user_exp_rcv.c:767:9: error: too few arguments=
 to function 'mmu_interval_notifier_insert'
>   767 |   ret =3D mmu_interval_notifier_insert(
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/rdma/ib_verbs.h:59,
>                  from include/rdma/ib_hdrs.h:53,
>                  from drivers/infiniband/hw/hfi1/hfi.h:68,
>                  from drivers/infiniband/hw/hfi1/mmu_rb.h:50,
>                  from drivers/infiniband/hw/hfi1/user_exp_rcv.c:50:
> include/linux/mmu_notifier.h:294:5: note: declared here
>   294 | int mmu_interval_notifier_insert(struct mmu_interval_notifier *mn=
i,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   c90dad714405 ("RDMA/hfi1: Use mmu_interval_notifier_insert for user_exp=
_rcv")
>=20
> I have used the hmm tree from next-20191113 for today.

Another case of 0-day missing stuff, it gave this branch an OK :(=20

I'll fix it for tomorrow

Thanks,
Jason
