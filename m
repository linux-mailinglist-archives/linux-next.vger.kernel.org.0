Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D155DF3BA
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 19:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfJURBT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 13:01:19 -0400
Received: from mail-eopbgr10071.outbound.protection.outlook.com ([40.107.1.71]:59201
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726276AbfJURBT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 13:01:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuD9nOQTGBgNA2HxSTrwHK7aXrtTr6Nl/sHnD1RSnoPDq/nsMBN5emkAD6eLwZCT+nIfWNh+MqrB/LDL5hpxsOMPyr8EWCMWYurMzdXEGIYDTQ1qCdFpYQRlgM77KO5rCsqTkFfl27vRF1jx3x971hjpHU7BrOyzQ3tMEWs7GkNqIukk4AnVlSyqLnlyV9rqMANtQBGVePGoNTnq/ro7q52DqGXT4Obfv+75/70Gi/gU7keo7nnVGYu6MeRYje7U5yQL3qADSFNaf7SknnQYknGxQUL1m30rvlnbTUXgJJqgIEgvYPcx00gKlwytz/P0f5QbEwZLneBK4Vh62TEOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLIJtnw8uKzC3ORSaXQE6LC73AaD5r/KgOU1uqdNJDY=;
 b=aY71RpYdS6DGkqgghFBJOvzyhgw2ptRlCNjblOt3FZqppiRteCkiKWJUBLO/iPZMLqF/8uPmeqtTCNDNV0qJiXWus5Fdd1yC/g08RFoiR9u0kCIsRJfzBYiX/2TShPVNOLrQUbukOADfsbybqpXzvqvW/MAL1b+GzopjCVMg4GK0ACq3ebgDCwDviweNazzZt7baKh9k6yuD+ffIttZoelPMB9Uw5tDKgt0N/sqw2QVqRWi8RrD/koVHKSregV04VujNZykWwdcpXPGz9bVuVt5sjUPyjqkx15OJefFR409lq7jWhv/HCSEx1enC1RL/DPf1Z1qagr8h1lr8g+stPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLIJtnw8uKzC3ORSaXQE6LC73AaD5r/KgOU1uqdNJDY=;
 b=AaBrSS8MnOwpHEdt1VIMuOoRxF4n+p3tfh00ZcwkPnlSppKBh1k0b92w6hHry4/KJkRdGprY581Uz7h08KWKOMEb6XGlxnuTplXrs8K2d02ISb6l1Hjd5QTb+/sSe14OM4Z4Sufi7qrP5IVTAd334PpXFpFm3tkWu9iQRePgGT0=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4751.eurprd05.prod.outlook.com (20.176.5.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Mon, 21 Oct 2019 17:01:15 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 17:01:15 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Matteo Croce <mcroce@redhat.com>
CC:     Joe Perches <joe@perches.com>, Doug Ledford <dledford@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Topic: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Index: AQHVh+L3TKVLX91rm0q8yD/5yy/ydKdlLgGAgAAG3YCAAAa0AIAAFu+A
Date:   Mon, 21 Oct 2019 17:01:15 +0000
Message-ID: <20191021170111.GB6285@mellanox.com>
References: <20191021184128.601ff09d@canb.auug.org.au>
 <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
 <20191021151507.GD25164@mellanox.com>
 <CAGnkfhzCuCUBG++QRTZbsUyFr8orq059Be7AvyL+_V9Smz7J3g@mail.gmail.com>
In-Reply-To: <CAGnkfhzCuCUBG++QRTZbsUyFr8orq059Be7AvyL+_V9Smz7J3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN7PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:406:bc::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 734223a7-b09d-4378-1cbc-08d75648486f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB4751:
x-microsoft-antispam-prvs: <VI1PR05MB47519357B3A5FE98F6AE387ACF690@VI1PR05MB4751.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(14454004)(11346002)(446003)(86362001)(33656002)(1076003)(25786009)(6916009)(81156014)(8936002)(8676002)(81166006)(478600001)(64756008)(66556008)(66446008)(66476007)(66946007)(486006)(66066001)(186003)(5660300002)(386003)(256004)(476003)(2616005)(26005)(102836004)(6506007)(71190400001)(76176011)(52116002)(99286004)(71200400001)(3846002)(7736002)(305945005)(6116002)(6486002)(4326008)(6246003)(36756003)(229853002)(6512007)(6436002)(2906002)(54906003)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4751;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1PYPxFp9mWs9X4BM25laXLekwWIb9NBXsNWQRQWf3FVw+BvGWB5G5R7XFaeNbflv9uq5cMxqO0UgwsSlZwkYLOgs8vWYciIlrIXIOUjOO2axtph1BNya6cT4oL87iZMzUvWN5fN4XyZlkOQ2DLW0l7VLtswlfqQmUy0lrYN+v5nxBFLn3NZCvAapd5l8kg+2BZ/h3WCSs1yLSlKV7qyN1xINITyFk1cexwqs8paVKn7xl0mBznvORtP8CekHPjXtWmejUtZtfaTaIdeuDE7J9eQBcdp9m09fM3G2GiPCsN3aeHewsznHmmdBNsKOJszU0D8soxJtmI8g6o5nSqy7FbKCr8ZmPqGHbC6+xi23fDICUIMAGfLr7qJ5mx8xNQoaPdXi3rEpaRbWPC9Dzi6sC2JBb2dMGaeB7viA35hMC4fs+lF6e2s3V0t8wdAKJDqd
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <319F531358C7844886670E6C2D23931C@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734223a7-b09d-4378-1cbc-08d75648486f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 17:01:15.1648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MhCxQ+QG9FMNt45pCRfPHKIgjt+B4CoVMvC2I/rUnE4WlzpIdq7GVtawIkvb2Pyro8TTwG/zulEhWT0N+hBapQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4751
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 05:39:06PM +0200, Matteo Croce wrote:
> > I thought I saw that checkpatch was checking this now?
> >
> > commit a8dd86bf746256fbf68f82bc13356244c5ad8efa
> > Author: Matteo Croce <mcroce@redhat.com>
> > Date:   Wed Sep 25 16:46:38 2019 -0700
> >
> >     checkpatch.pl: warn on invalid commit id
> >
> > Maybe that check should also check that enough hash is provided and
> > other details like the correct subject line?
> >
> > I also use a check that builds the fixes line from the commit id and
> > requires it to be the same as the patch provided. This catches all
> > sorts of wrong fixes lines, and sometimes git even recommends 13 chars
> > :\
> >
> > Jason
>=20
> Hi,
>=20
> actually I just call git_commit_info() which checks for validness.
> I could also check that the hash is at least 12 digits, would be very eas=
y.

IMHO you should do

  git log --abbrev=3D12 -1 --format=3D'Fixes: %h (\"%s\")'

And check that the provided fixes line matches the above output
exactly, or nearly exactly. People do lots of funny things to fixes
lines..

Jason
