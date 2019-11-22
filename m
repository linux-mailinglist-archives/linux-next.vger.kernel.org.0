Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53916107A45
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2019 22:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKVVyr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Nov 2019 16:54:47 -0500
Received: from mail-eopbgr00081.outbound.protection.outlook.com ([40.107.0.81]:55361
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726655AbfKVVyr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Nov 2019 16:54:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSM1+M6IVKqtCqH1KPugKX4rt6XnJcQcXHDJZ7M6vGiY8BoIeJrNZmFv1sM1LOR90Z+2rSTdhF8ne4Wnvj7MXNzLmwPG2NQs8/AS/wuslpaYzVLFHDG8lQPHgrT1FU9Ua7pgkiEtHU+8XSg5/xD3diScSOOMPSHT8uctUQco7p/v9DgKYWxSLNSMm/jC0qFmOgj/nk1GHQhz7xU1yKWngbSX7Hz4dlPXzdJP7Hy108MS3VC3HPCW6L6Dx/IGc7avqgJ2SIF/vtmrNw034YFov8IFVkj0DGaYU+4n2oAPjT/8QbAX+fc8sR2aLK+DZHU3/M3IBRiLYyNvcvZJF4d0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSfs03lEKgtB8M5Iajo15HMRY1iKs7AEo4iGy+KQJKg=;
 b=NtwIbkUq5LFH+Ku7myNJRa2x7O/WzxQMaKJRF30/bofA1WhBKAP36kZJT+eA5ujTCcQ/TdPoVIifiOHzGtIQTMSyZyG4zKnkDqkIdBgHvrcasGL1kMrXVQ4zRW4610c33pxPPPPCZhQC1zeEiQvHA/qTjoFP5A+cXME+yxB935namTHjSwST8AQK/EslsFmhEcDEJnvHGzPsjyL6s6TZRXpc8wkRocAr5xRvpIqY23RiY2wZd+1YA1vJbNR1mqwhVt+RIPmZlYX1Zc4GIDfeGlGRX3KhTAx+ocAq9HgLMMllu0eecNCoIW7N7vm6q0kc7VoEzrXyVGkq6l9uZOcE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSfs03lEKgtB8M5Iajo15HMRY1iKs7AEo4iGy+KQJKg=;
 b=Pa4nbS9ONbhaliVZ9n+Ze3iYvWyxg6ouNYkkve1pxJc6vD2USUOFsoOKrFOREB63NrjfpL4vUsIg2RIZ6ACWi9MPChSDuLds/Xv9mylBNg4rPfzvax8OUwdSmFMo5T8KV+fb291359FVUiZvw6GhUTcrYUbm0G3Rog4zgkVETuc=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB3149.eurprd04.prod.outlook.com (10.170.229.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Fri, 22 Nov 2019 21:54:43 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::dd0c:72dc:e462:16b3]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::dd0c:72dc:e462:16b3%5]) with mapi id 15.20.2474.021; Fri, 22 Nov 2019
 21:54:43 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Chanwoo Choi <cw00.choi@samsung.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the devfreq tree
Thread-Topic: linux-next: build failure after merge of the devfreq tree
Thread-Index: AQHVoPGq+904rKXcc0OQkFJyXhrMMQ==
Date:   Fri, 22 Nov 2019 21:54:43 +0000
Message-ID: <VI1PR04MB7023AA4F1583DB3C279F90F5EE490@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20191122155941.4c8e3bd1@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8bde853-330a-479d-2e6c-08d76f96953f
x-ms-traffictypediagnostic: VI1PR04MB3149:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR04MB3149766F76B337129F5CDF80EE490@VI1PR04MB3149.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:220;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(53754006)(189003)(199004)(9686003)(91956017)(76116006)(66946007)(52536014)(33656002)(53546011)(66446008)(64756008)(66476007)(66556008)(5660300002)(74316002)(966005)(478600001)(6506007)(7736002)(110136005)(44832011)(7696005)(14454004)(316002)(25786009)(54906003)(81156014)(99286004)(8676002)(81166006)(305945005)(8936002)(76176011)(446003)(6306002)(6246003)(102836004)(6436002)(66066001)(55016002)(71190400001)(71200400001)(4326008)(3846002)(186003)(6116002)(4001150100001)(229853002)(26005)(86362001)(2906002)(4744005)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3149;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e220ooJJuAG7nHx2geRh/e4BQxWdGjg6GgV3fo0IL+lhtG3T9glUD718dc0bCkdEv4w3UfCNi+5SwySHzS1n/7u7zVX/Kk3MirVBLfEAVddV17C2Mc2B8Nrxb00oGjtQddRV45buS9+e0Yx2K101sXFgLeWfmZYEvTZfr3kuD11KZBu1FdneE8dsCexSxv97IRuR/okkmSIzNcmnB7q0GoswmAUdVeRdZfMCODbfRV12JQqfOFuzSFLwtC2P7PDsnHKaS6gtr7i/6hhYBUSx3f06CkKLn/13kddUKnaimidVDqXb+eSFvGupGo5dgHt0nFL/y8R1ulQFmMpsEZ2NYQKPm0txmb/shk1frtUkhcSXdr4cunZSk8ZyxMth6t1XHDzWUBJO+rdpKWi5ZE603hZit2wxcAogA7ug1w6W/GWr5+LYENpWDO4ha+BnnJeTyG91ChgQqy6ZrxSPEscU74rSNNmXD+mEjLQgBcwTOPo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bde853-330a-479d-2e6c-08d76f96953f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 21:54:43.5659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HM+DjL2Yl1lgtI0SNs3BTFjYkmPf8Mb2Z6gk4XJEkHhEJwqXhURNg6rzMkDgUhFwYouk67d4YSEK6CW8/zGz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3149
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2019-11-22 6:59 AM, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
> =0A=
> After merging the devfreq tree, today's linux-next build (x86_64=0A=
> allmodconfig) failed like this:=0A=
> =0A=
> ERROR: "__arm_smccc_smc" [drivers/devfreq/imx8m-ddrc.ko] undefined!=0A=
> =0A=
> Caused by commit=0A=
> =0A=
>    1fcfb874236e ("PM / devfreq: Add dynamic scaling for imx8m ddr control=
ler")=0A=
=0A=
Sorry about this, it seems smccc calls fail under COMPILE_TEST. Fix is =0A=
to add explicit dependency on HAVE_ARM_SMCCC=0A=
=0A=
Resent entire series: https://patchwork.kernel.org/cover/11258499/=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
