Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81FEBE7939
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 20:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730824AbfJ1Tat (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 15:30:49 -0400
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:19629
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730396AbfJ1Tas (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 15:30:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPDpgsQkjcuSEduqW0OWhDvNjMrNckiMqyxPYoETTARux1sGxbnGn4XdJBLGR/BCdyekH+QwtdMLOQTZ8/Rizio/IPUy5rdBlUWQZ2VlLZve76cLPP3BjJ/twSQWvHI73G6yLNL2oJzZ1qI48vxcrUbsbqIHgiALBYV8tbfYhY5IP0kHFDzyZxv0EtGRLzO4NEMr/oDFMLEJ1SzbMVvZ90uShZvRxQNp+2rd8StT5MaWFPiUjcsx/c8vIEQirCKpy05s0zedAWsM++TpZ7PypAotbQM1fRYKW823Le/kwfNcLDlUzdm/zUG9hzrVLcjUpev72jWo9SXCkmytJcazwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RSG1/6QAZ9vBkcI7EnrtsuWoCxps+c04ZZXBF/KA+s=;
 b=TZWOkDCIJ9k1r9nks0TG7DOKCntp6pNwt90oZIduUC1okPIzJ3OSlljFqE8w12oAIF/JjpYVnzu42iJM/GKeNPLL7eUk0i9YYerZ8d8MkCO9NUDmwKRvnYNvpFCEWvmMvJ5kjDk5Zmb5jhDtUEBvbo1OY4H3AY4Gb2EtA5pJtqjugiiBRATjoQ6JE5O46gH8wes2GDtCGP5UT24+Hz8QQiN0nvz4MQ1EP0xiJ5g/aSvN67YfHulkb3kSmMDf9PaOSj2ptt1mQQJWbiXQSnfDZm1+B/pLi+56DbDAQ8v9VJA5a/muc3VVHJtDW9r+fsf+/3KHwI0Dmd+ekMvVSi28KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RSG1/6QAZ9vBkcI7EnrtsuWoCxps+c04ZZXBF/KA+s=;
 b=qjFYqB3WhzW9dKXoOYtk+R3g5gMEs7PwjcikpO5sAxSJufIkZYl/+HDF1aEkHRes7TosK9Q7YqrM6TqXHEq5eYErPNySnHCaoYfFOmQk5ehhR7pegwM+AF9rfdMw91CyKimQOAFDVkq1F6b3/RFO2cBudw+M/JWsa3QohwnmXUM=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5759.eurprd05.prod.outlook.com (20.178.122.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Mon, 28 Oct 2019 19:30:41 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.027; Mon, 28 Oct 2019
 19:30:41 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Erez Alfasi <ereza@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Topic: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Index: AQHVif4rvTaScq/oik+Qu9xpmvtv2adweFcA
Date:   Mon, 28 Oct 2019 19:30:41 +0000
Message-ID: <20191028193032.GA22766@mellanox.com>
References: <20191024110115.7cc32b99@canb.auug.org.au>
In-Reply-To: <20191024110115.7cc32b99@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:405:2::22) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 993ab9c2-64d8-4cd3-f50c-08d75bdd517c
x-ms-traffictypediagnostic: VI1PR05MB5759:|VI1PR05MB5759:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB5759055AD3A65038C4D06D32CF660@VI1PR05MB5759.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:478;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(199004)(189003)(53754006)(186003)(71200400001)(256004)(14444005)(4744005)(66066001)(102836004)(71190400001)(11346002)(446003)(2616005)(99286004)(107886003)(6916009)(4326008)(2906002)(6506007)(6246003)(386003)(54906003)(3846002)(316002)(6116002)(478600001)(1076003)(486006)(25786009)(86362001)(33656002)(76176011)(66476007)(66446008)(66556008)(64756008)(52116002)(476003)(6436002)(36756003)(7736002)(6512007)(66946007)(6486002)(81156014)(14454004)(229853002)(8936002)(5660300002)(305945005)(26005)(81166006)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5759;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T3Z0fyPEQ5ZTOH5LEMfXgDJhXibSLzju3TlA63Mdzdr9AOl6eUnXeLB+d5JKrIpPKVE7wE7KGqz+xOP8b1uOJhA42R/paoyK9CLvbmP5ItBmMAHtnTpXl7zn6AWln9P610XgmfrFqCPsnFhlub+w5WFeipOk02OgyWCwF4QAn9O6CX1/OHyjhr+Kb2ykd/5XPZYFFi8Y3Fvqwbr8VFG2Nxf7297adpwSvvjmLC5vA9QsM4YaoeLzGLKLlOGdrgYMdiGIaT2awlLLSmvyelz1mqz5R6DnkJU4GHIx94CLKG6IFsQxuCTyUNWoCGMgFqc3+7CWNbb2xAld1QYdUnOvKxTNDN9vFGzZyKqIgQglTzGIIFXR4z6azVcSyZ4aehjsT8CMFJc2lcpEcgRWx8tOflkq7THyCXIAGDPh3iRziZJ9FTsYZmM8BSk2KVmcFfit
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1419A389989994B87A7B697E5BA9ABD@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993ab9c2-64d8-4cd3-f50c-08d75bdd517c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 19:30:41.2006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OKwb11/TnK27hppS09CbcL1UB+0dEDYEzD1a8YxODmCZW4thCGdlyRzhS46FME3Mx8zvKGno5PEeOJ6KMh10+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5759
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 24, 2019 at 11:01:15AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   drivers/infiniband/hw/mlx5/odp.c
>=20
> between commit:
>=20
>   9dc775e7f550 ("RDMA/odp: Lift umem_mutex out of ib_umem_odp_unmap_dma_p=
ages()")
>=20
> from Linus' tree and commit:
>=20
>   a3de94e3d61e ("IB/mlx5: Introduce ODP diagnostic counters")
>=20
> from the rdma tree.
>=20
> I fixed it up (see below - but maybe the mlx5_update_odp_stats()
> also needs to move after the moved mutex_unlock()?)=20

nope, this resolution is right, thanks

Jason
