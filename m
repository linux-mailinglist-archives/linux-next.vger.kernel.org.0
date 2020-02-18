Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8E7161EE2
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 03:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgBRCSE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 21:18:04 -0500
Received: from mail-eopbgr50053.outbound.protection.outlook.com ([40.107.5.53]:12037
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726182AbgBRCSE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Feb 2020 21:18:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWHCXrqLRHYntsx1h3FAIIaAE09urQd7BFHQ1GaB7Tm7rvDs32AsbkdT/NwjLvEedloJ570nMouVPznznILXUH3cqJc5k0i9K6ajFwgi37oPzodHCt3DLqJDvjoEg8nLO2R82ToOQSowscX9j/jiKEIWSQVqpWmGPdi1x74/uQBuVmVavYk7V4XXbS3+wZB/NZ8WFEssjY7OZM2KNRtp5XJl42ZunwNT4sHMdgUfVkjX3hQBKY2FQsRHTlg7WuR1jup8qDqV4RVjHXRR7X+wdRfCkMt92iKNZCiTFsV+XFGrmqYuCnfE7CVobX7F2qosORbQtmYgaE2m4HtiRBbMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsIvn05MxQquw1lpVP64bjqXKNDrRhw7yUn3AwvgHS0=;
 b=EwFV6+epl8o7QGujT0qzHNTWqqFbXOM2j07/jFnAs+QHx/nA1qAXnF3k/RVievnbhXXIDM+wg/Dh+9YjGLJW5CcdO6QgClwpsfTsufY5tTeuFeG0C6ZzIkpj/iGFpT/WWBm3QrhPij5UsWO43Ty7gB7CPN0dvcjlZ1r2yVHwJCiaZlS7XKEcxsj+rlCO7KunLQY7hLI0o/2lQXudkzx2W/C99HZwHiZSinN+cR3GG1abY+TS34Dw8F7beCBfVMsCN45UNavpTiS8gUuHJlQy9/B0cxIExiIheqXRuHYgKG5DKvA7ZRXjIJCNM7NBV5SVmbiLYn9N/5rAp3p5eJM9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsIvn05MxQquw1lpVP64bjqXKNDrRhw7yUn3AwvgHS0=;
 b=cjnuNqGlFKMj2hDifKRJFudg3jsiPpUDVS+NqmhLGeBUjABfY+h1bGnG0ODVKCmeDe+YkY6BG2/y6FbVGAnuRZOS/6BWJmTYR4lG9+IPkACfTyRkGaEEfbhg8lw68A7WYer8wT8i68oCgNud/hkMAWNqRF87f1eMbtc1kbfWirQ=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5155.eurprd04.prod.outlook.com (20.177.40.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.27; Tue, 18 Feb 2020 02:18:00 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 02:18:00 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shawn Guo <shawnguo@kernel.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: RE: linux-next: build failure after merge of the imx-mxs tree
Thread-Topic: linux-next: build failure after merge of the imx-mxs tree
Thread-Index: AQHV5gBmPb+Mmucw+E2UUarjOSK+k6ggNu1Q
Date:   Tue, 18 Feb 2020 02:18:00 +0000
Message-ID: <AM0PR04MB4481EE01C21245B588A9EDAD88110@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200218130859.3deb3404@canb.auug.org.au>
In-Reply-To: <20200218130859.3deb3404@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a73d00de-a986-42c3-db23-08d7b418c6d0
x-ms-traffictypediagnostic: AM0PR04MB5155:|AM0PR04MB5155:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB515538DEF313B2AC6F0742C188110@AM0PR04MB5155.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(199004)(189003)(8676002)(64756008)(2906002)(66446008)(81166006)(66946007)(81156014)(66476007)(5660300002)(66556008)(76116006)(52536014)(8936002)(44832011)(55016002)(9686003)(186003)(4744005)(316002)(110136005)(54906003)(478600001)(4326008)(26005)(6506007)(71200400001)(7696005)(86362001)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5155;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6NJ1xjDK/c1q94iBW8UpMPsuqP4hNiprACTKKvIJLb0YCGYa0p+2H1s9m5AZbwoiGV74X4YVRFFvKu99j4Du9RJpGJB8yMrCpMRZVvbiktXApv1EdBj7/tadKTzuupjOc5FsHWBL7mZa7vIKjhw75igMG6/r9DMQnD8ra55fh0MdiGg7cEe2sP/knuFWqJIo+N2xXv1zXJ3tqwdJXYafq7u4WvX/T51nkulr0dfLd8z292mtkEVO1pNCb8q5orF+6B/7AWQC5othHJggKdOBbWt/4hMUEH04L+/un5VmYiu2M9EFZjkP4cYsJb139vOqt1Mm/gHP3pUbWrb15STQcfapsc17nX3fX2DfKdSOzJrhyqK9ykDSpF940KtVgcJ5/VcbTTdknU4QUN3mLwN5ldqIeKd2CoAUD/BMEU6pp/YdkSWXPidqipdCqohl2fw
x-ms-exchange-antispam-messagedata: VCjd0JQTTZkPtDiK3T7QIWMuZfZiMyCk9BmOVHACfA2MRa0zj0t20OBsSPZjwrra4Yf5yY+BMv7HBViV+KJVLSGtEumvDvuNIryx/8h+CnV+Pi4ObbygUtwh/c+FAK2WAJjg0NfahlYNPSL5YToA9Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73d00de-a986-42c3-db23-08d7b418c6d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 02:18:00.3376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFq94XvN40tXPCxhcGkb5bHBPbMMQ2jxmLV0B2XBVoF/YNEVFFgw5RLaQ2gM4s8u+OSt62RjwVfk7ulz6EJVYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5155
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


> Subject: linux-next: build failure after merge of the imx-mxs tree

Sorry for this. I'll fix it. It should be the functions not defined when
IMX_SCU not defined.

Thanks,
Peng.

>=20
> Hi all,
>=20
> After merging the imx-mxs tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> ld: drivers/soc/imx/soc-imx-scu.o: in function `.imx_scu_soc_probe':
> soc-imx-scu.c:(.text.imx_scu_soc_probe+0x44): undefined reference to
> `.imx_scu_get_handle'
> ld: soc-imx-scu.c:(.text.imx_scu_soc_probe+0x134): undefined reference to
> `.imx_scu_call_rpc'
> ld: soc-imx-scu.c:(.text.imx_scu_soc_probe+0x20c): undefined reference to
> `.imx_scu_call_rpc'
>=20
> Caused by commit
>=20
>   68c189e3a93c ("soc: imx: increase build coverage for imx8m soc driver")
>=20
> I have reverted that commit for today.
>=20
> --
> Cheers,
> Stephen Rothwell
