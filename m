Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9067BEF35C
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 03:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbfKECVV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 21:21:21 -0500
Received: from mail-eopbgr10077.outbound.protection.outlook.com ([40.107.1.77]:1300
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729428AbfKECVV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Nov 2019 21:21:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjVUQuoXy9Egi2GnQDllvfLEfIuEZY3yL5MTF8GfxaV0GvO95llIgTv0mm7VRpttY1+IfnpPVJOYAikQjddkdVKHURCiyOxQNUCII6AVtMBwP2g+vZ2cnttvAvatJRdIwSzR2rmVUelsG8HA16DRxp2de5D46eLF0ainyM9NV+GzE8gwS4JC493Ze1x5mxydsb5fUqMI3f55q5MHhF/hpTkEz4v3CVAQw0zIYMdzEZ+r53LW6UtdiZmIN1zjkBacFsff/1BwMPmpoBXWJijTMQz/A5l8gTb1YcoZ3H9hqbLfaQqCxdNIFIfGvWswLykutjQqiV1ngi7kiKMphuYUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vs831X2HFeKUSUWsQjdHn3Aiew9eaPWKf8b8NGtcXbk=;
 b=WC3QLGnIEVd42bmqJIS9uWLlxqUcNxzECe6TCGID2GjIis0STxA0S4Jf5Zjp+5mG8j/rUShlIHm0qZgsR27mMOoZpoDYecyfEpttxWUi/1Pfjl3FTXk+h2+4i5fobKTA2bKnJwUB3tR4X6BGuY1ScvOm59wBjGc7cRfN+N89917KTVg2WbXR07N7aiQ8FOVyPMTFX1qBmqYoOFGFiWS3AgQ0xLr34JGctipUMAr7hsmI9hGpW4RFwsOn0smmglTHj4pUwwVx9Z/hPfyCKAPvcm1mPRU/zGHpL7f7GN4ZNuIN7X0xUlSgaLO0ofsp4At+AMcxxXQWsyjAbjSX0f7aPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vs831X2HFeKUSUWsQjdHn3Aiew9eaPWKf8b8NGtcXbk=;
 b=JMcWTqwdM0OAvw1XaS5GAgK5OWrAQMy8Zr5cLtJEyVFBR14na7tD0Wa5z4zPAB8Xt4PsX7WZIDLAPMEZMuTEVGGTbwpBvUcuy2hM+GybjOllWQuUPa/jqdGDE0lJ0vaq5mgRzcSXnK6YumCsoWk3rj4FDBQTPdRLLW/w7tKFjeY=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5198.eurprd05.prod.outlook.com (20.178.10.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 02:21:13 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 02:21:13 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Topic: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Index: AQHVk3bCA7/YT9S5FkKoZgZ7zcMK4ad72HGA
Date:   Tue, 5 Nov 2019 02:21:13 +0000
Message-ID: <20191105022109.GL22766@mellanox.com>
References: <20191105121704.72edfc76@canb.auug.org.au>
In-Reply-To: <20191105121704.72edfc76@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:208:2d::27) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f583bf1-1078-40df-3007-08d76196d451
x-ms-traffictypediagnostic: VI1PR05MB5198:
x-microsoft-antispam-prvs: <VI1PR05MB5198B3C6550EA3372280AAB2CF7E0@VI1PR05MB5198.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(199004)(189003)(53754006)(81166006)(486006)(6916009)(229853002)(305945005)(76176011)(81156014)(316002)(99286004)(14454004)(71200400001)(8676002)(6116002)(54906003)(3846002)(6436002)(8936002)(25786009)(476003)(66446008)(36756003)(86362001)(66066001)(33656002)(4326008)(6246003)(1076003)(6512007)(2906002)(5660300002)(26005)(6506007)(102836004)(478600001)(386003)(186003)(64756008)(66556008)(256004)(7736002)(11346002)(446003)(66946007)(2616005)(66476007)(71190400001)(6486002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5198;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M+elqiHxBoRyg7H1SPoXxaaG7lILfsWIjPMLId5PqPcyUWOVvgqfQr2TC1td7DJdtJ24xmRh1icoZRo4pbVvc/JpMJezbOev9/8aUyFrjEuaS8WIyUb/K7AbmBRXcX7Nl6bCJIQljAgHai9fIN1Sy5vyM9M0Xl0UyT9q5SW2X0HdmHwS613ispR2wGN6yeZxUaK73WYWsgo9YgXJaeCMQcIeuFLwGwJwxhuFTn7cGBTYMhgIJWjs5mKRCekIuIq3BH0bGfaZFzxJT2dXFbOH7WR08jUdG7fvQYXMsmq8soaY3qyLkpSGI1RrhowUi/JwhqrNKOUWwEl42p1J7EwlbWk/3+OWjBB/H3ZAorE/Wyhh1GSJGnXeWvdX9EkrMjySkAEhNIoC3qjLCkz+izDJMKXPHSfNeuiVtwHJbgmmakCe13f8pWz50/pBp2DV6R7N
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F541015C365E0C48BAD4BCA6B384A6D4@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f583bf1-1078-40df-3007-08d76196d451
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 02:21:13.5281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LiOfT9cIw+Sn2bhvesyaxLdQDslU2VGnNREuwACbP/La4n1ZVE5Jg9quYHU9R1+5BI511DA/XgCCyRSf3GkBIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5198
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 05, 2019 at 12:17:04PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   drivers/infiniband/hw/mlx5/mr.c
>=20
> between commit:
>=20
>   1524b12a6e02 ("RDMA/mlx5: Use irq xarray locking for mkey_table")
>=20
> from Linus' tree and commit:
>=20
>   806b101b2bfa ("RDMA/mlx5: Use a dedicated mkey xarray for ODP")
>=20
> from the rdma tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/infiniband/hw/mlx5/mr.c
> index 7019c12005f4,077ca10d9ed9..000000000000
> --- a/drivers/infiniband/hw/mlx5/mr.c
> +++ b/drivers/infiniband/hw/mlx5/mr.c
> @@@ -1967,8 -1945,7 +1945,7 @@@ int mlx5_ib_dealloc_mw(struct ib_mw *mw
>   	int err;
>  =20
>   	if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING)) {
> - 		xa_erase_irq(&dev->mdev->priv.mkey_table,
> - 			     mlx5_base_mkey(mmw->mmkey.key));
>  -		xa_erase(&dev->odp_mkeys, mlx5_base_mkey(mmw->mmkey.key));
> ++		xa_erase_irq(&dev->odp_mkeys, mlx5_base_mkey(mmw->mmkey.key));

The rdma for-next tree is right as is, the xa_erase does not need to
be the irq varient here.

Thanks,
Jason
