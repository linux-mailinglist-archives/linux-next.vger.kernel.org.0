Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7708134366
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 14:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgAHNHW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 08:07:22 -0500
Received: from mail-am6eur05on2070.outbound.protection.outlook.com ([40.107.22.70]:6213
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726964AbgAHNHW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 08:07:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtFY+CpwA9mRoxGcUTBo0PMA7XtuW9xxELqdH1Pj77ygKH1WCgw3Cwl/nu4KogXjuX3mYcl12l88t1yHmfXtXatL0iD9jI3nBzyyMBgEnrmDmPhsaTonKmFsov4Qgnfu0D/sP4IeyfSYQqVXlk5E7K4PoiCZKBFZyozQtDhlh80/6Q7tLtXCoZiBy1MD33Cg3SANjtYHok4tkYDd3pa/9TJ0sjoAT6YFnbuU8mFdYZzS6mz1vS+wKX3F4Hb6nls1jqCaMJDcf4382QIbumnvteZPAhHjQm3gvjp1HUI9rgzJb+zfQa3uXqLlTqYwnGWj/Gfp6pODqvLbRyHMd3IUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMr4BuBd/DOpbkHJL/6yDme2xlhVgK6pU7f5J/bnfMs=;
 b=R1k2BY0F6yNJUeuGLCpUB/GFmHC7yP0bdkMAzusQi1LvUbvMg8eNeSRiODzT9uSnfyjOJ+roYjRwk8CqWk7mDj3eEhD9zPSYK6I+20O34HLVTRSZY+f7X5bLJPzYOqwIfhrGRoyqeA+LCVf4xVo+wXlzlPHy0MjpD7aJB0DsABxPApsuFwnCfOEo0+/ML0h1z9CExOxbNEJ930GR1xDNcU0NaSkjIEadxItL4nyfrNxaqJBThuSK1EjRP7WW0sx0edG/Rp9BDUVJaQ7PGtFHQuWZlZzlCKQV5JbsvgjpNr17wtPBoVCfIDdBnrIU8Pkq5f6GPPNGKNWT1S4FNnTw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMr4BuBd/DOpbkHJL/6yDme2xlhVgK6pU7f5J/bnfMs=;
 b=biukn3fRSGKNPSw/bW4HKwOm2dmZ1qg3HYejJXWe1i6hDsFkITFBWyqGXEFATNC9MkCsrBD+zmzovF7ucPuwDUqxZrEKvW0WR375GCNIcWrAh/KSbmeI7gocP0MK/S64UyObrxm2vg8cgj0ushBURHipO2YAav7vc1oK/nz+Nqo=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6541.eurprd05.prod.outlook.com (20.179.27.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Wed, 8 Jan 2020 13:07:18 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2623.008; Wed, 8 Jan 2020
 13:07:18 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by MN2PR20CA0038.namprd20.prod.outlook.com (2603:10b6:208:235::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend Transport; Wed, 8 Jan 2020 13:07:17 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)     (envelope-from <jgg@mellanox.com>)      id 1ipB3H-0000LF-8W; Wed, 08 Jan 2020 09:07:11 -0400
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Dennis Dalessandro <dennis.dalessandro@intel.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Kaike Wan <kaike.wan@intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma tree
Thread-Topic: linux-next: Fixes tag needs some work in the rdma tree
Thread-Index: AQHVxZnM6xrS5wXROke/lPn95MBwKKfgvYgAgAAAV4A=
Date:   Wed, 8 Jan 2020 13:07:17 +0000
Message-ID: <20200108130711.GI20978@mellanox.com>
References: <20200108073349.2b270de3@canb.auug.org.au>
 <67b5c37f-ff63-9ae5-fe80-0d2ac0821000@intel.com>
In-Reply-To: <67b5c37f-ff63-9ae5-fe80-0d2ac0821000@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR20CA0038.namprd20.prod.outlook.com
 (2603:10b6:208:235::7) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5da29b21-cd60-412d-31e6-08d7943bb041
x-ms-traffictypediagnostic: VI1PR05MB6541:
x-microsoft-antispam-prvs: <VI1PR05MB6541E9D1016B898738C2B2A9CF3E0@VI1PR05MB6541.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(199004)(189003)(53754006)(26005)(186003)(86362001)(6916009)(66446008)(64756008)(66946007)(66556008)(66476007)(5660300002)(33656002)(2906002)(36756003)(53546011)(52116002)(4326008)(478600001)(4744005)(9746002)(81156014)(9786002)(81166006)(1076003)(8676002)(71200400001)(2616005)(54906003)(8936002)(316002)(24400500001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB6541;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XEXCH2TGTdJliG7QBSY4y0mLwWNnD5T/7X/6XWMsgC81Nns8BUTg64pSwljI0aMxXqSOjtcSZNsFY6jTnWR/oregZg3joZNBMkCAqRst7pJbyNDjHNurnvOVA9C1FXEPdSbKXTf7Pp8rQPaxGbB3pARdDfS1daLAplshl0ChXCFsdElCokRVELiLZIlsL/DQSY4CVYSb6c64v0ItJHl5ePllRShw+UBULfCjj+NNmQQ+vg0QbxqyNvdJcy0RfyRhux/tk6WyTywRdVLQsHDYPWemc77Gsgy8UBGoK/WC4Hfvum5/7fF0zK6v7ngrcxeEf+8Frh1CJ0Dn/ezPiMyqL8rT4EPz9smVPU+0iJWXSWUPFHnBhqb/WioJXeD48Dr23PSN/4kH9sedj72SNsoWsUy4S0k976ZQquz/RHWnDy609MVHRxnYgq9QgGeN/cRKZGIdENb0n+kWkNBUen+swVHbArJKS0yy6j2vsEY6LV7fUyjTMYjwFD/iU4Fpf11UXmE9h9Lw64craR4W/dbH3Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <024075D0AFE5454AAAA245C8E58F80AE@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da29b21-cd60-412d-31e6-08d7943bb041
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 13:07:17.8587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjNXjrfPGIOwCUQ61agRPLFSTjtoYUFlzpoLAdrJWtmK15RruSlOpjDusQEn13D11jkvjFdzm6HtDNzJyvWZ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6541
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 08, 2020 at 08:05:58AM -0500, Dennis Dalessandro wrote:
> On 1/7/2020 3:33 PM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > In commit
> >=20
> >    44ec5aa3c615 ("IB/hfi1: List all receive contexts from debugfs")
> >=20
> > Fixes tag
> >=20
> >    Fixes: bf808b5039c ("IB/hfi1: Add kernel receive context info to deb=
ugfs")
> >=20
> > has these problem(s):
> >=20
> >    - SHA1 should be at least 12 digits long
> >      Can be fixed by setting core.abbrev to 12 (or more) or (for git v2=
.11
> >      or later) just making sure it is not set (or set to "auto").
> >=20
>=20
> bf808b5039c
>=20
> should be:
>=20
> bf808b5039c6
>=20
> A character got left off by mistake. Jason do you want to just fix this i=
n
> your tree directly? Do we let it go and just make sure to catch it next
> time? Let me know if you want a new patch or something.

It is too late, the rdma tree is supposed to be non-rebasing in
general.

I usually catch these, as I have a script that checks for this.=20

Jason
