Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F0BDF106
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 17:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfJUPPP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 11:15:15 -0400
Received: from mail-eopbgr10047.outbound.protection.outlook.com ([40.107.1.47]:48099
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726289AbfJUPPP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 11:15:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgvYDD3hz1yPYMpIApopSc3O7kw1C9oGeULmvCaQA+rYyEHzoXrD/k+huB9gQTNfLhJzvBu24iLgzMoNGBLERNzs8P0LpwZaedpac7h68aw31t8lXhNUsf1QN6o2wSxU3A88lg9vJjgJfpNsfUMWFTFfiQbuue8anGeNXVMKgWKxKGpqVKYxzl1y3Sdp7iLmMN96MaG1zTuGE7+KKIdYWW+wmVMly0VXTuCqn3WGYv2XI90loW099YKSgkxW+r2c9yvXu5sR/T2u5gRnUZDm/prlpYbt/976bbikHr3TXogfkRRlhdY/aap2SRzUj0AAnTIJq9kqjyCphm+dHeSwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1gGqYo2yngYMJyClo6FsrZNNq60hEPVLhMp0D6txB4=;
 b=A5z4p02EEr2eICC/4x7lYpbZokz8FjcENZ72fMbstwYOjIe6J6+fmGTpo71ExeDj4dJ4+bsqivqNbMHgKhZuFoBvoa3E3qtPX8wdl2YShurZYZD5+yjyKe9VRq0d7CLy1W9lwosMl+kngLqt1xeczOmTIWgKRRdaP5YxLAYmvcuP4v2aE244NccVzMY/W/5wqXmT9lqNpr7g36zqGMdR386k8vTfvciyBAG+DBQFs8It1VHS/ss1906wWYWhJeMz6HwgWHnN63GgUPu4RXUwb5UVVrDJo4yDbv3EzPAGtvKAACnx99jVNAWBf2Fm2yi4lMb9ruliK4T3/ygM6ef3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1gGqYo2yngYMJyClo6FsrZNNq60hEPVLhMp0D6txB4=;
 b=FA998Zs3RUWEmZe3OlhLo1xgzn5bHbvfbUUpvg2r1pC33IbwG+Ft0lJAxNXyrBfsVWRJhz+DRjrCKSq6nGQ2gweyBo0zKhXFNxJVSTuPLEeLm41ANz13VkT3YgbQ/fgROlOaJ6iojZgeTaxgoX45oUp3Gj+gaKQNvGNcAhnCSxA=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5486.eurprd05.prod.outlook.com (20.177.63.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Mon, 21 Oct 2019 15:15:11 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 15:15:11 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Doug Ledford <dledford@redhat.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>,
        Matteo Croce <mcroce@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Topic: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Index: AQHVh+L3TKVLX91rm0q8yD/5yy/ydKdlLgGAgAAG3YA=
Date:   Mon, 21 Oct 2019 15:15:11 +0000
Message-ID: <20191021151507.GD25164@mellanox.com>
References: <20191021184128.601ff09d@canb.auug.org.au>
 <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
In-Reply-To: <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR0102CA0034.prod.exchangelabs.com
 (2603:10b6:207:18::47) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f764c2f-3578-44da-27bb-08d756397762
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB5486:
x-microsoft-antispam-prvs: <VI1PR05MB5486EE141E8A96450E4530B2CF690@VI1PR05MB5486.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(53754006)(189003)(199004)(8936002)(316002)(54906003)(186003)(8676002)(81166006)(81156014)(36756003)(66946007)(26005)(478600001)(2616005)(2906002)(4326008)(476003)(229853002)(6486002)(3846002)(6246003)(66476007)(446003)(11346002)(6116002)(71200400001)(71190400001)(66556008)(64756008)(86362001)(66446008)(256004)(76176011)(33656002)(6436002)(52116002)(6916009)(99286004)(1076003)(486006)(7736002)(305945005)(6512007)(14454004)(5660300002)(386003)(6506007)(102836004)(4001150100001)(66066001)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5486;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BCoOX9SiFu0Tu3SlpxrcobQLswqAGTggrECtCszLEPRW7bd3IYTGRrUvlLHY3Kkr3MgAbFQArbWKKjpjHyYGk+fBmQl8AfGzGoC88C6ZJPFlHoCIww3Fo+xcu/WZVfJbUXjnC9a3Gw4mVdtW8xPU2o+IV4tAyb7++czDora9Ywup6rP+bvFoSktKCDT8qW2DPRtOQ+xRKuI4TewlN3A1k7nPdf363mC/9p4Q2RP4OB3s4hAVfMGJUcpBeKh7hXiKgv+Dm8S/oRrd8GAQKmb6xZpInkJTF3wZCQaKqiF/uHQ3gvdikDYrVRRM9QUwS+qZw7jANWfBT5OlBZNPgsf/2/ATRoXvXe88Y/HRKgqrnz0UXoSChUkwHKDLWaQ5svi6lMeF+4uBt8zQUQ9YWDLYBsY6mm/vudw3EZp5Pv0yhKY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43693883C590FC4499D10CBFD91E48B3@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f764c2f-3578-44da-27bb-08d756397762
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 15:15:11.3819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwGfGgSFROCWXCjuc8pMKGlbFqwc6w5gTwsiV/Hwx+ef0BeXx8TKqQMba2nHeN/yb/6UdrbmopwrDRJchos+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5486
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 10:50:33AM -0400, Doug Ledford wrote:
> On Mon, 2019-10-21 at 18:41 +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > In commit
> >=20
> >   612e0486ad08 ("iw_cxgb4: fix ECN check on the passive accept")
> >=20
> > Fixes tag
> >=20
> >   Fixes: 92e7ae7172 ("iw_cxgb4: Choose appropriate hw mtu index and
> > ISS for iWARP connections")
> >=20
> > has these problem(s):
> >=20
> >   - SHA1 should be at least 12 digits long
> >     Can be fixed by setting core.abbrev to 12 (or more) or (for git
> > v2.11
> >     or later) just making sure it is not set (or set to "auto").
>=20
> I'll leave it to Potnuri to fix his stuff.  As for the rdma tree, the 10
> digit hash is still unique as of today, so I won't rebase the official
> branch to fix this.  However, I'll see about adding a check for this in
> my workflow.  Thanks.

I thought I saw that checkpatch was checking this now?

commit a8dd86bf746256fbf68f82bc13356244c5ad8efa
Author: Matteo Croce <mcroce@redhat.com>
Date:   Wed Sep 25 16:46:38 2019 -0700

    checkpatch.pl: warn on invalid commit id

Maybe that check should also check that enough hash is provided and
other details like the correct subject line?

I also use a check that builds the fixes line from the commit id and
requires it to be the same as the patch provided. This catches all
sorts of wrong fixes lines, and sometimes git even recommends 13 chars
:\

Jason
