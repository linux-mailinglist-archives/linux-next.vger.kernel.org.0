Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271F29B2E5
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2019 17:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbfHWPCr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Aug 2019 11:02:47 -0400
Received: from mail-eopbgr30061.outbound.protection.outlook.com ([40.107.3.61]:54855
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbfHWPCq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Aug 2019 11:02:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9XUmTOPR3EaTzwOLKAtvOiWbF/SJL8qWxJx7ETLVWyQywVcUzDrRvujK3NQAXD19g6M53oH4agUK9IjzoLeWcOXNq77wzOVz0ARFcs0Afs0wupKFHtFyQwQ5NIl8z/LVcawqd1AFp02wlc1x33A1Y8YXnz3lT+r5NSQvcmxew4E8PhoLRmhfULNd888vCTG3Ktcp2APFxJBNosxlpNOOALepaGk1PAeAxgwB/S9FB/dQQHi8W/6dGPyfl486kg0pQP0f/ag/ixhVZnTqTAeaeczhGD5Vh1DSW0j4VKsCF7jssszJ46kOdZpFVB0syx957kbyqvz8eq49rBWvOtF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8uNQ6bb2P723hLVX8awGjeMi2LDnpkg+d9Wm+q/xgE=;
 b=YgufbavgCQRPoT6lJ23XstkdpuWXbW7NmhyxWYJ1S28V883OUhNVLXxvwCjJRf6B0kuIr7iWZqXeoiUxqwjlIg0dCeng3MS/oyjrIUGmvnAGslpB1D5yAPUUNSXZdAP3SoJL3NZhXkrYcG5ZSSZuVbF37/wwaopcaXVR84chQDA1STSbAakBASTjSVBdklMx/aOhdsiq84mA5XatOeB106q96/jOT9n0Ch4eDxrct7wjgpKrAwwoN0yTrfC87kfxbC3PdFPf569UrEygzzqyp5xvByWBX95LNqjnAwv83WmbTPtaR15wUZBUw4ny7q05aQl3PFMbXetygVRejr11ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8uNQ6bb2P723hLVX8awGjeMi2LDnpkg+d9Wm+q/xgE=;
 b=dp6reOmtVsT0HU1L/I66jiaV1RBO7MVuOX4whHGZkPoZletBc7zdOlFc77Eo6cc3vaehhby5ppXD0aKsfXJzrBcDxvXBXS8X/jJ5Jf4fW4ndWAG7VIXU85iUQzZd4FqiZBtugyw4CU3wku97IaE/dvJ04gFj9MN2sH/bedwVlV8=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5984.eurprd05.prod.outlook.com (20.178.127.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 15:02:43 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 15:02:43 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Moni Shoua <monis@mellanox.com>,
        Parav Pandit <parav@mellanox.com>,
        Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Thread-Topic: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Thread-Index: AQHVWVmgru+wGtDU/UuiDjFq8Gwzr6cI1OaA
Date:   Fri, 23 Aug 2019 15:02:42 +0000
Message-ID: <20190823150237.GL12847@mellanox.com>
References: <20190823122227.4c2b9790@canb.auug.org.au>
In-Reply-To: <20190823122227.4c2b9790@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::28) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acede8a8-3afb-4569-b231-08d727daf2e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB5984;
x-ms-traffictypediagnostic: VI1PR05MB5984:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB59847CB489361AF849DC4438CFA40@VI1PR05MB5984.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(189003)(199004)(53754006)(102836004)(25786009)(2616005)(476003)(6246003)(81166006)(81156014)(8676002)(229853002)(8936002)(66066001)(6512007)(4326008)(66946007)(107886003)(86362001)(6436002)(66446008)(64756008)(66556008)(66476007)(305945005)(7736002)(6506007)(1076003)(5660300002)(36756003)(2906002)(53936002)(6116002)(3846002)(6486002)(14454004)(26005)(71200400001)(186003)(71190400001)(6916009)(478600001)(99286004)(52116002)(33656002)(76176011)(11346002)(54906003)(4744005)(446003)(256004)(486006)(386003)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5984;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RSNeFWg+JttRvXwlF2S1TPW6bsTJoqZIc+hkOoYRmqTS612g7oel7+kKvYJntNiTZb8EDQGe1xOdmIb0fE+godAgbWLkjGpwIczZs2n/RScdhbFla6/ad/iH5oJVTRXl+DAwL3Vooev7xULfHeIawk+St9DPvTIsA/UpN9XFVPhpoIFLDDwlDTpVD3Ee0u0wPdkHkF94ivRo2HJrMMhqq5nkWdP/sv18JwfXmvks7cvRos+Sc9OBOtYFC1VJVmeVZSOkzOu1ezLG6qEB0VQi8UDN/x3k4sIHj/BINSgw6LS5mmy2F6+Zq34NaldTqyefrKM6GDBCzfARn6y9uE6ugz9bxODqNMBrGkCdREOb88yO3zhmH1PICDV/soj33uNfte482vWLqtB5NFaxFRUh/46PNHzynFy8sDcFayN9+5Y=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6134B4F54FCEA84DBEE94B7AAE3B4EF0@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acede8a8-3afb-4569-b231-08d727daf2e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:02:42.9078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhiHGAL1KBTMbeXDhIh3rYXPTvuP+YTTfjzSaeSsF/sznaMd1UppKL1MbHCTgK1+TqQGsajJpfI6qqKZo2/Vew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5984
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 23, 2019 at 12:22:27PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   drivers/infiniband/hw/mlx5/mlx5_ib.h
>=20
> between commit:
>=20
>   0e6613b41edd ("IB/mlx5: Consolidate use_umr checks into single function=
")
>=20
> from the rdma-fixes tree and commit:
>=20
>   3e1f000ff746 ("IB/mlx5: Support per device q counters in switchdev mode=
")
>=20
> from the rdma tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks OK to me, thanks

Jason
