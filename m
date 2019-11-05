Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20849EFDE5
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 14:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388839AbfKEND6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 08:03:58 -0500
Received: from mail-eopbgr150083.outbound.protection.outlook.com ([40.107.15.83]:25316
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388738AbfKEND5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 08:03:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GG/skRnJo9nTyP7rmikkgRwco8zWBmHUDogjFluoSDwFOFja2Q050wSESHuB/c8xao1pgICATjn8x7LsNn6B0ANanQlo5GGstZE5EaSY6+zFW7fwqsV2ur8bn8IQBGahbyz5HPC6BqE2TmC/h9aKe9EhngcIzeye1K1pXIaJ8ZGtxp4SUEKXbnGuZlkjdYwlNaMbAO4HqsGvv1CxMPUKjpEZsBtUYvVB+gV7mGa3J5cZ5roFAbFUtQgeqAD60g7H66mm7dF/WQPHIbl8hMwTG6K/4L0aORU/TF5ZKfnQt9LvQoDa91rnjZfMEacJrXXgXVLL9MeOChhWqSMLdOXcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgYtdfxbabvhIn+k/7XfcxqjyXQYEnIwwWUCrpVr6lY=;
 b=QkxWSpy52A4vwI1cAqFwQ4i22M6p2Rt8wqvQ6ufCfEwv/U+xr2J+TPii/DQUwPIvCuMuzNf5Ah10E6o4lX1WaWaFuSFG4E4aOKYOkaXKSvomayq0oOyDbYfAIMXawnSjd+1B8/HJuAITx+xyvCQn2mb+H2LFy+S5rabHMKyqmzlFeQ/0TOp67vrGr4NmUiQp06d3ol9EAnVh6KTaQHa8BJgpUVz+lSu51mwzJdNcNIP2AEAHV7FsmyUauDoVo3/sDqrQhsJcdo731QKyrQPA6RspyUA7pkXnIJaIzxvwTZULSxsjDo9w1RX+3NIaOzF/thhxTFdhnP+bGC5/LQLpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgYtdfxbabvhIn+k/7XfcxqjyXQYEnIwwWUCrpVr6lY=;
 b=CaOAWXhP/5m+vfjjegtEtgdoFDYPYpfqwYct1/AoeTfREdoQf7wHakAcl3HhALuI+mNwN733jJF1/KhBLT+/OQSI/jsg1WfmG3bA7mIPib6rpF7+4PVqcZdkx3BchuM/B5qrcbVv9AJxgUpSo/d663dkbpbQiI9hAZRtIkAoGc8=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4781.eurprd05.prod.outlook.com (20.176.4.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 13:03:53 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 13:03:53 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Chuck Lever <chuck.lever@oracle.com>,
        Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Kalderon <michal.kalderon@marvell.com>,
        Ariel Elior <ariel.elior@marvell.com>
Subject: Re: linux-next: manual merge of the cel tree with the rdma tree
Thread-Topic: linux-next: manual merge of the cel tree with the rdma tree
Thread-Index: AQHVk7IUyWK+Us4/I0KM4NtHCttd2qd8i4eA
Date:   Tue, 5 Nov 2019 13:03:53 +0000
Message-ID: <20191105130347.GO22766@mellanox.com>
References: <20191105192144.7af9704b@canb.auug.org.au>
In-Reply-To: <20191105192144.7af9704b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR2101CA0015.namprd21.prod.outlook.com
 (2603:10b6:805:106::25) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 48affda4-03f2-45cd-8345-08d761f09bfa
x-ms-traffictypediagnostic: VI1PR05MB4781:
x-microsoft-antispam-prvs: <VI1PR05MB47812A3BBAB77B395BF4D33ECF7E0@VI1PR05MB4781.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(53754006)(8936002)(8676002)(33656002)(99286004)(14454004)(478600001)(66066001)(71190400001)(86362001)(52116002)(26005)(7736002)(6916009)(71200400001)(256004)(81156014)(81166006)(316002)(305945005)(6506007)(386003)(476003)(186003)(6486002)(6246003)(2906002)(1076003)(5660300002)(3846002)(6116002)(6512007)(76176011)(4744005)(446003)(66556008)(66476007)(102836004)(66446008)(66946007)(229853002)(64756008)(4326008)(11346002)(2616005)(54906003)(486006)(25786009)(36756003)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4781;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nMQ3MXWxch/sHFb3lmsjL2npsSO2QmgA9mcfHFFUsGG3a4Hu6loJNjIEfQ0sNYNpHMf9hAc6XBBFRITPp0+HgYx7amZYSyTN741MGwYRN3XB0TsPsFVohaelXOpoT45PleQIjtl3WgDX4yJrojAQ40aZeDyZ4v/VVGuoi35iSs94XnEDXt9eUqOfFr28P2xc10lsqACUYbuXiERmtM6pd7c+01G/HNd6RfTTWMnIUoEYMQ4YFw7YCNnMRAZj44l25R0dMa9ZOHJvGrZz4/G06n0+vggjpKO3gHEMKAt4Om26sny3DBW70h1c8MiTFM0NfHoL4AyBpAUy/rZYGN2D3GDoMu+mWbQI2oyrI+rp3sT2do0I7mEv9L/eWH/zcD46uXS1XSFoh5qGRgd8pB3H14XoVdElT1xv1U8kHRigI/SucJzI/a6b9+OkU2ZtZCpL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22BA4109C2612F448EC349C67E102073@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48affda4-03f2-45cd-8345-08d761f09bfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 13:03:53.5894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lax6GQ4CzD8yQftSilPVBFY+zz3wPMWBgRi6QZelB9iWzuWI1WmoI6PUQzzhhJI+2jqv1dajHxNyNI3ZWi0c1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4781
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 05, 2019 at 07:21:44PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the cel tree got a conflict in:
>=20
>   drivers/infiniband/core/Makefile
>=20
> between commit:
>=20
>   771b46a8d15a ("RDMA/core: Move core content from ib_uverbs to ib_core")
>=20
> from the rdma tree and commit:
>=20
>   b0a70ca7e39e ("IB/core: Trace points for diagnosing completion queue is=
sues")
>=20
> from the cel tree.

What is a 'cel' tree and why is it taking RDMA patches?

Jason
