Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75054DF3E5
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 19:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfJURMD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 13:12:03 -0400
Received: from mail-eopbgr70058.outbound.protection.outlook.com ([40.107.7.58]:36076
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726819AbfJURMC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 13:12:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bws9jc+6vTXzBFcpwvx1l0aPDPyvuS4SDx5ahBl+cWmev0rz3oIbb7Q5FsGTn77X4g66rg1tO6mRPcPmO1EAADQsbeIkZAU+URwN8cS3+b5iJk2LLKDdbGFYF2ruqSgsq5g+V6We3doZCOvcYl3ai5zbsvaACrq+73Ur3AbSHUO6j3f5Vs8VYkFD1Tt1DnBvyQUphULc8MwPMUilVhlmLY1yv5sqopCUuA9RzfpcCE0oA5FD9wqsR+E7QTnMNpDW1syrnjkb6iX1MxXVCzfEnr1UuArgw20aiN0qocajTq8XO0TpuC5Q/MyQkQlQEZFg7VsUhev2V+QSMj+U6rP0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jua2pWSridFLmY5LsWiqlgsoFLCKhounfsWmoKEdaBM=;
 b=OE4zI3de84ZUuM8Q5HnwTc+EkUSTkRgW07ANxzRZnkHMr9Sjjfp0CqsbzbwVUk6TQToD3TM6ogJ26GUx99Je9baz7VDkZI0xZm1Sgg0WM8i3c6TEr2w3lyS+EVYmYHvYqNS1N7R7eiCu4nIRqoRv9O6FI32TiqwrZcFzJwkoRss43472BqdG1WnFKYu1nt+Vw6JlYjZv5gP4H35xxaQtydVmA/ux+ibqvYmrS3385Vg7bqb645OcNipPGlzmaJbS8lV4f06TH7oGhg9sIvpmi+UyG/xsLzJz3WtA6W7hweyGCDhYAG/xNhJEX3uUZdpuLxxz9F4orn65hH/TgOOjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jua2pWSridFLmY5LsWiqlgsoFLCKhounfsWmoKEdaBM=;
 b=aEZIOfjwHO8joNHP34QEu3p4tYylYFDGLzM06TJsj+F6vOqUtwppd+qcTvAYbTwQBv4Fu+YDe6BJPwSMfHKoB/WDIDDxZBPbQZBaS7TOvzAAcByQdnNOBEUIm6bahaBS2xULss7AAekdF6ehl+B+sJqFKX5wWa+QpbV1UeIGOT4=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5534.eurprd05.prod.outlook.com (20.177.201.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 17:11:58 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 17:11:58 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Matteo Croce <mcroce@redhat.com>
CC:     Joe Perches <joe@perches.com>, Doug Ledford <dledford@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Topic: linux-next: Fixes tag needs some work in the rdma-fixes tree
Thread-Index: AQHVh+L3TKVLX91rm0q8yD/5yy/ydKdlLgGAgAAG3YCAAAa0AIAAFu+AgAACAICAAAD9gA==
Date:   Mon, 21 Oct 2019 17:11:58 +0000
Message-ID: <20191021171153.GC6285@mellanox.com>
References: <20191021184128.601ff09d@canb.auug.org.au>
 <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
 <20191021151507.GD25164@mellanox.com>
 <CAGnkfhzCuCUBG++QRTZbsUyFr8orq059Be7AvyL+_V9Smz7J3g@mail.gmail.com>
 <20191021170111.GB6285@mellanox.com>
 <CAGnkfhwsczOBLMZSJ0pWm=L3bMqgd4mWNitpZB3-NwjFN+fYDA@mail.gmail.com>
In-Reply-To: <CAGnkfhwsczOBLMZSJ0pWm=L3bMqgd4mWNitpZB3-NwjFN+fYDA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:208:e8::24) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54f7fe47-5b47-41b1-1b88-08d75649c7da
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB5534:
x-microsoft-antispam-prvs: <VI1PR05MB55346E5B0B8B7DF4DC67D229CF690@VI1PR05MB5534.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(189003)(199004)(8936002)(2906002)(66946007)(81156014)(71190400001)(64756008)(66556008)(66476007)(66446008)(71200400001)(7736002)(305945005)(81166006)(6916009)(8676002)(1076003)(66066001)(25786009)(5660300002)(54906003)(86362001)(256004)(6512007)(186003)(2616005)(446003)(4326008)(6246003)(36756003)(52116002)(3846002)(102836004)(6116002)(26005)(478600001)(99286004)(316002)(53546011)(6506007)(386003)(76176011)(6486002)(229853002)(33656002)(14454004)(6436002)(476003)(11346002)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5534;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A+Bo1dVk52iQjzfQCByxL/YzYJlfIVLh8Kuu65ZrxsxfZvrNNymq9LCvINOfc68L7bSTZ/z23Mdu85nQruKsrtrr7FsHi+STBOtbRYRJ5GrFvDhGZGNKxgPJFG9aDx5zJioMVm3t/Wq/cInTDHhksQ//uXoS3z2qaueG+LyrAV/7tOJDfH9Cf9FWLmWoT0QxBUpuyZ0CGROmWT4Bvyzj7UGfsK8KTFMog9hTu/IXpfvpabixFoFHKGhzj4fcATmV7dpBDDiSl4ipI+PU9mPfq83bvAwOxDWcCmS+U+RKnnZ44BNwekaxFTT18UsZ51T3EA4TOMMmAdP/d7MuZ+ZfmxBNNstg7xNc4+UBUTGU/QVfLze4PdZdu1IcoD5aTKfv5b5/VUVvJsUc5sfHLXl4Gk5oKEyJheMdAdWkF5sFk7M=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E10C059A5456342B8C356B8E079A85A@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f7fe47-5b47-41b1-1b88-08d75649c7da
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 17:11:58.4264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: orgrdnIVtySDxp+s+F9eR39la4U2R1w5mWducEzeUJVzEBM4Xuyn8kcl0ugQlYDkl3SMeL96313BbiRB6/PnkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5534
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 07:08:21PM +0200, Matteo Croce wrote:
> On Mon, Oct 21, 2019 at 7:01 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 05:39:06PM +0200, Matteo Croce wrote:
> > > > I thought I saw that checkpatch was checking this now?
> > > >
> > > > commit a8dd86bf746256fbf68f82bc13356244c5ad8efa
> > > > Author: Matteo Croce <mcroce@redhat.com>
> > > > Date:   Wed Sep 25 16:46:38 2019 -0700
> > > >
> > > >     checkpatch.pl: warn on invalid commit id
> > > >
> > > > Maybe that check should also check that enough hash is provided and
> > > > other details like the correct subject line?
> > > >
> > > > I also use a check that builds the fixes line from the commit id an=
d
> > > > requires it to be the same as the patch provided. This catches all
> > > > sorts of wrong fixes lines, and sometimes git even recommends 13 ch=
ars
> > > > :\
> > > >
> > > > Jason
> > >
> > > Hi,
> > >
> > > actually I just call git_commit_info() which checks for validness.
> > > I could also check that the hash is at least 12 digits, would be very=
 easy.
> >
> > IMHO you should do
> >
> >   git log --abbrev=3D12 -1 --format=3D'Fixes: %h (\"%s\")'
> >
> > And check that the provided fixes line matches the above output
> > exactly, or nearly exactly. People do lots of funny things to fixes
> > lines..
> >
>=20
> The point in using git_commit_info() instead of calling git directly
> is that the latter would generate an error if the working copy is not
> a git tree (e.g. a tar.xz downloaded from kernel.org).

Well, it does some checks and calls 'git log' so it seems like it
could learn to call git log with different arguments, right?

Jason=20
