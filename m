Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E83BDF46C
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 19:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfJURjb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 13:39:31 -0400
Received: from mail-eopbgr140049.outbound.protection.outlook.com ([40.107.14.49]:42249
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726672AbfJURjb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 13:39:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm6/yn076EDO2NzFMDUMH0ovSXxGsgVB6wabOwnriDzpgTxQpLCfz8C+XZsjTiS67+CMEdKmEE492vC4F8sJEwzBYzOtXxXl3NN/veg8qCqXVfAz9dzAbqwTkg4nGlS+HSXmGMRSLvYxycgGRIqBvPCCeLpLWCwK0fU4fMI3cVNxjGqGuR/XIr7xmpZU0gvjHWWeSNP5GSHftSRtpEhT6BL4RtSl+d7qnilVxkv0XLsvpBauPJ7jfxv+mW4qKRIAg4HpBssIAtL1z1UY/6ACsW0VnX6ZeLOI+x2OJ7e2ny+GDPojEvPOvcIe1+qE6yMQBHIfwA7Do0FVYK67WBRY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqxs7DKtPF1KaGh76s8LN+xPoZo9n4WcFrjgYgdawnA=;
 b=NzoTth2pzEIV8cg9GqJAPUFEj+wlPpdWVKbS/mM6aVs7GKcGL2l0EldfiHNlUE228SZhSv71/YGPPxLPpIk/+DUG7xkzbSL7q1rO9s441DkVcXuZZ5Bs0d2mPxG3zn78ptnlp83E6PwOQIuCA4HtDT1blKSqSUK9QxOzZUY2BS4lF3HyXpeq574z8S6ysfZJuQnJYGKj+RBg/aBcHUjKMIYoPOUFhnMC96IYQ9AjP+19AJBVvAhzOItyLevRxXZ0cyfUSn4dZwQetKqWiaMfxvbt9vpwMc3G9O8C2FQSduSNGG8i6+3QZahbsq9a6lCZqvyUT4CgMJPnfPw93xmWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqxs7DKtPF1KaGh76s8LN+xPoZo9n4WcFrjgYgdawnA=;
 b=NmS8gah7Yd+iPe456sWhJ1/8R+/cuF3YopS+MePcsttpnZbtV757dgaO8FPmP1ZQh7mbe/301UnEeIWvsEjGsqHC55AnYc1/mu3Hs5HCYPuJ+0pmmkO6X9FCq424WhVh+NdwAfQKrnLKuwz4F5MF074R44wKpXmGP7JgHDFDzv4=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3199.eurprd05.prod.outlook.com (10.170.235.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Mon, 21 Oct 2019 17:39:25 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 17:39:25 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Joe Perches <joe@perches.com>
CC:     Matteo Croce <mcroce@redhat.com>,
        Doug Ledford <dledford@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Topic: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Index: AQHVh+L3TKVLX91rm0q8yD/5yy/ydKdlLgGAgAAG3YCAAAa0AIAAFu+AgAACAICAAAD9gIAAA9uAgAAD0oA=
Date:   Mon, 21 Oct 2019 17:39:25 +0000
Message-ID: <20191021173921.GD6285@mellanox.com>
References: <20191021184128.601ff09d@canb.auug.org.au>
 <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
 <20191021151507.GD25164@mellanox.com>
 <CAGnkfhzCuCUBG++QRTZbsUyFr8orq059Be7AvyL+_V9Smz7J3g@mail.gmail.com>
 <20191021170111.GB6285@mellanox.com>
 <CAGnkfhwsczOBLMZSJ0pWm=L3bMqgd4mWNitpZB3-NwjFN+fYDA@mail.gmail.com>
 <20191021171153.GC6285@mellanox.com>
 <d3a389360982c9d2730e6b29eb96523a562483ac.camel@perches.com>
In-Reply-To: <d3a389360982c9d2730e6b29eb96523a562483ac.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:408:ac::40) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5b3415c-28ce-47e0-3742-08d7564d9dae
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB3199:
x-microsoft-antispam-prvs: <VI1PR05MB31993D51B071F8D74A97408FCF690@VI1PR05MB3199.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(199004)(189003)(7736002)(6246003)(14454004)(5660300002)(3846002)(305945005)(25786009)(71190400001)(6116002)(86362001)(26005)(99286004)(102836004)(36756003)(33656002)(71200400001)(386003)(316002)(6436002)(186003)(6486002)(478600001)(486006)(6916009)(54906003)(2616005)(66066001)(446003)(256004)(14444005)(6506007)(4001150100001)(52116002)(76176011)(81166006)(8936002)(6512007)(476003)(2906002)(53546011)(4326008)(1076003)(11346002)(66946007)(66556008)(64756008)(229853002)(66476007)(66446008)(8676002)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB3199;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6nvPbwAK7VNUcHoZ/I6Aw9c0X532bz1V3J2/Ar+5WB1RSSs8gWJyxK/QBaSg4e49Weu8c0bfOI/qBgvh+usN1pajLhLjvL0+uTNpTawhYIKTe1QLHPhigQlR3+cirZxIimtSMWNFAdgwW8r2UkdWq1OhtqG87FqNT2c585M39RS7XwguaMjHzkxP4A/+gzFQ3GiL17GSGC81T7PlRjRaki1pnVo0D5b6SgNfTRNU1+ZIFDPPwHtiPlntEou224T6x9Ls9dIxWFxNaiOkUufLlBIc8u48hq+uDd3jKupfyJW+v9rbYprl0Hog1qmTrlbHxP1XYbw7r+IhT/BtG0es0qXeZSqme4VSyPWTmTYsipU/IEi5XsOhyn+Zg3j5/3XJYqNJ9mwGSZ3sKjIZ2TxOiKZiYXglblPx3cGzO59DN4M=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <737C8B349830954A8C665DDF6D61B5B0@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b3415c-28ce-47e0-3742-08d7564d9dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 17:39:25.5954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3woqn9h/4JcNVXPVTa4ebnyc/k84ZR89Bj7H9HjVLak+Xy78NKysW7SrwSc9vk5TtdmHtn6opiFk8Vctx3P+Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3199
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 10:25:41AM -0700, Joe Perches wrote:
> On Mon, 2019-10-21 at 17:11 +0000, Jason Gunthorpe wrote:
> > On Mon, Oct 21, 2019 at 07:08:21PM +0200, Matteo Croce wrote:
> > > On Mon, Oct 21, 2019 at 7:01 PM Jason Gunthorpe <jgg@mellanox.com> wr=
ote:
> > > > On Mon, Oct 21, 2019 at 05:39:06PM +0200, Matteo Croce wrote:
> > > > > > I thought I saw that checkpatch was checking this now?
> > > > > >=20
> > > > > > commit a8dd86bf746256fbf68f82bc13356244c5ad8efa
> > > > > > Author: Matteo Croce <mcroce@redhat.com>
> > > > > > Date:   Wed Sep 25 16:46:38 2019 -0700
> > > > > >=20
> > > > > >     checkpatch.pl: warn on invalid commit id
> > > > > >=20
> > > > > > Maybe that check should also check that enough hash is provided=
 and
> > > > > > other details like the correct subject line?
> > > > > >=20
> > > > > > I also use a check that builds the fixes line from the commit i=
d and
> > > > > > requires it to be the same as the patch provided. This catches =
all
> > > > > > sorts of wrong fixes lines, and sometimes git even recommends 1=
3 chars
> > > > > > :\
> > > > > >=20
> > > > > > Jason
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > actually I just call git_commit_info() which checks for validness=
.
> > > > > I could also check that the hash is at least 12 digits, would be =
very easy.
> > > >=20
> > > > IMHO you should do
> > > >=20
> > > >   git log --abbrev=3D12 -1 --format=3D'Fixes: %h (\"%s\")'
> > > >=20
> > > > And check that the provided fixes line matches the above output
> > > > exactly, or nearly exactly. People do lots of funny things to fixes
> > > > lines..
> > > >=20
> > >=20
> > > The point in using git_commit_info() instead of calling git directly
> > > is that the latter would generate an error if the working copy is not
> > > a git tree (e.g. a tar.xz downloaded from kernel.org).
> >=20
> > Well, it does some checks and calls 'git log' so it seems like it
> > could learn to call git log with different arguments, right?
>=20
> git commit SHA1's are not just 12 chars and could be any length.

--abbrev forces a minimum bound to the kernel recommendation if the
user has an old git or misconfigured git. git auto-detects if it needs
more digits beyond 12.

> And checkpatch already does use specific arguments
>=20
> 	my $output =3D `${git_command} log --no-color --format=3D'%H %s' -1 $com=
mit 2>&1`;
>=20
> and then parses that $output.

Maybe output format "%H %h %s" and then parse it to check the min
length and verify the subject?

Jason
