Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78F33A1599
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 12:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfH2KMA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 06:12:00 -0400
Received: from mail-eopbgr150070.outbound.protection.outlook.com ([40.107.15.70]:1605
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727063AbfH2KMA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 06:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so8tVzQYUHBv76vUpDTflbN6kStRIwNz524/8/18cOU=;
 b=vNhlYVo8TrNeFNxhH/8sLQirpjTdkb8lFW3OCzC3X62yZXJeQGu4niajjRBQs0pYHdi37HBV61ip2cscjZnirYuu/UQDnr0/BnImjedoFe80F2PXH9HO75EvVk4xIMuVal/C4Cr/tgfsFB/6HGyE1TV/EwCL1ApX1TXf6HDIku0=
Received: from VI1PR08CA0090.eurprd08.prod.outlook.com (2603:10a6:800:d3::16)
 by AM0PR08MB4946.eurprd08.prod.outlook.com (2603:10a6:208:165::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 10:11:42 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0090.outlook.office365.com
 (2603:10a6:800:d3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 10:11:42 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 10:11:40 +0000
Received: ("Tessian outbound a25c4e5fef41:v27"); Thu, 29 Aug 2019 10:11:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9758031ba9e3d252
X-CR-MTA-TID: 64aa7808
Received: from 5f50b514b8bb.1 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.4.54])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id F143EF17-C1B1-4BF0-A11A-FEFCEE438F9C.1;
        Thu, 29 Aug 2019 10:11:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f50b514b8bb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
    Thu, 29 Aug 2019 10:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAvjvZcyeU7sKqgm6Xw+HKeHvEJNQrW8aJn1U7GvUw44wBoa8wE6HgVPL6wzS6ctLoKFSezSQ++WS46u7Ukm9f4+hNN+AuywBxbgRWTPp8HEEhdi+tHW0l4t6GHnPkFOdj0uUsVWK9lSUL0BT90rSJGvoFCIv2l3hNSe3utX9GYg9Iv3Az8fFfGmWUJg/CnuD0dWfgw8Rj1IfoYRMN0ZPHKgo3mNgDCSXZ1DjC980Oy7KaHLw8k2jBU8R2Xk2lQy2Oj7aL8yFA7VD6i2tJA5F86lrEoaBcnQ4A0fwBfT87GIILayPrAZP7GWXEtwgK2z7a0or25xBgecS+D+yJtI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so8tVzQYUHBv76vUpDTflbN6kStRIwNz524/8/18cOU=;
 b=m/zat2/JdxYJUNG0T4IChBayCCXSnoDfq/oO99giMXIVcBfEsOK4vlT7SlP48g8SleKv9i6XqJyqMu7zlXY1B/+CaLutrnQ8j8cFGfo49NAezm9edPP6eQ36Dn67kVr941Zgxi+VOnLvBPmk2dkckql/4SRfJ6sSCEuAoZnK4KET5lJvSL9Ln7UtrZMRe9n3K/miuNNFtUfkhQtLw3soXoCditByEDB0oNKYDzuJ4Yn02Rqahqfo1sfXXLoFlez0jGdp/CoCytz1gBPxC88Us+sdYeSIDk3dyd4Dz7rdpCcnW2lvs54//ki4eM1iJj1+TmUchyF17HIw14mwJXoXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so8tVzQYUHBv76vUpDTflbN6kStRIwNz524/8/18cOU=;
 b=vNhlYVo8TrNeFNxhH/8sLQirpjTdkb8lFW3OCzC3X62yZXJeQGu4niajjRBQs0pYHdi37HBV61ip2cscjZnirYuu/UQDnr0/BnImjedoFe80F2PXH9HO75EvVk4xIMuVal/C4Cr/tgfsFB/6HGyE1TV/EwCL1ApX1TXf6HDIku0=
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5005.eurprd08.prod.outlook.com (10.255.159.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 10:11:25 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::d9f5:7cb8:41e8:17af%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 10:11:25 +0000
From:   "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mihail Atanassov <Mihail.Atanassov@arm.com>,
        Ayan Halder <Ayan.Halder@arm.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>, nd <nd@arm.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Thread-Topic: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Thread-Index: AQHVW7tNhT4OtrNfq06Dw4dS1RbAN6cR7LsA
Date:   Thu, 29 Aug 2019 10:11:25 +0000
Message-ID: <20190829101118.GA9692@jamwan02-TSP300>
References: <20190826130637.176f6208@canb.auug.org.au>
In-Reply-To: <20190826130637.176f6208@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::35) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 44ea393b-a1b6-4876-7bfd-08d72c694966
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR08MB5005;
X-MS-TrafficTypeDiagnostic: VE1PR08MB5005:|AM0PR08MB4946:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4946270CA52A14DBB7ABCC8CB3A20@AM0PR08MB4946.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0144B30E41
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(199004)(189003)(53754006)(58126008)(53936002)(6916009)(6512007)(14454004)(52116002)(86362001)(316002)(6506007)(4326008)(54906003)(76176011)(25786009)(6116002)(99286004)(71190400001)(3846002)(66946007)(33716001)(66446008)(64756008)(66476007)(66556008)(476003)(186003)(6246003)(446003)(229853002)(386003)(71200400001)(305945005)(6436002)(26005)(2906002)(5660300002)(6486002)(8676002)(81166006)(256004)(7736002)(81156014)(11346002)(66066001)(1076003)(55236004)(33656002)(478600001)(486006)(102836004)(8936002)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR08MB5005;H:VE1PR08MB5006.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: dDHI0Ls5FE7kkXxdcjjIWc8VqeYo6GkYTGu74y5MiWspOmef7RTbcxGV/8yKUvReVWBOcnskM1jlFO6anMcLWg1fynpoKFXMJsmtcxVGe7VkoexFYWhtMFhjBiAT4ScTemjbVXQxbhwIt76RitECw/B8Txl52DJXPssIx2WwOFtN156liSjNKl+WfCQtgxKl35t3UBA5DKqTOxLYWDGglabzx4ih8tGS8UcRIEzUF+6RC9VR1kPcJefEuH14EOHABEVs8m1QG1+nSVXw52t/rnA8N6I+SacgM3YGD5TOXzZbjjvVZaeNGx/Y9k1ntLv0db59W8AqDLOYe5SIM+WsPN4I9jWFsmxnp1F/Oe2a/VOmMPy81nyWBHHI4oJjhHn7wEbdaIsMPnI2oWchdRy6/oCHr6eHEB8lfJXlcJH+4lI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F77339BA66CD934EBB209F8B716083D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5005
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(7916004)(4636009)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(199004)(53754006)(189003)(26005)(478600001)(97756001)(6486002)(1076003)(50466002)(46406003)(2906002)(47776003)(5660300002)(6246003)(22756006)(6862004)(6506007)(8746002)(99286004)(26826003)(14454004)(476003)(486006)(386003)(126002)(7736002)(446003)(11346002)(54906003)(63350400001)(63370400001)(86362001)(186003)(33716001)(8676002)(102836004)(336012)(66066001)(229853002)(70586007)(305945005)(3846002)(81156014)(70206006)(81166006)(450100002)(58126008)(33656002)(6116002)(356004)(9686003)(6512007)(23726003)(76130400001)(316002)(8936002)(25786009)(4326008)(76176011)(36906005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB4946;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:TempError;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5dbb9259-c1af-40b7-9bf5-08d72c693fbd
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR08MB4946;
NoDisclaimer: True
X-Forefront-PRVS: 0144B30E41
X-Microsoft-Antispam-Message-Info: grnlgAUeEd8ekpPtvEyUx+w98zqP5Axs6x8qKCFseU1r9dxO0Kz5MfgOhZqda4AxuEkkkvMJkh6wswalnw0h+ymgE3p5A4OHGpsPdsqwysqjsycFMKbqvnYWVqrZCL4iPFSjEZLQCputtWBAODyAcyZXi6MXMpw/Z51JH5fcptFeGalzkbY1+6CfTCLfZfSGRJ9tb8tuo4VTkWzh36j9d1sP4qlG9j3kx5XYb/TpNT+XEHqw3AlkQpq8iUMcMTnjm3oaM/DrYSPx4taHGE+KDFhGzKcH2ZKCTtbOPBTotDJQ3Zy2gm8vQdoYG0Mp4awhdXZEycBI9IYmt79X7Kb2h21GyE7YMOEzQMctqrk+1D3EKeYXRTYwWDxp4b5HQfx5w65i3xrCq2K1osH9ymby5hd8DcHB9B4oc0EMduxNVl4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 10:11:40.9745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ea393b-a1b6-4876-7bfd-08d72c694966
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4946
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 26, 2019 at 01:06:37PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/arm/display/komeda/komeda_dev.c
>=20
> between commit:
>=20
>   51a44a28eefd ("drm/komeda: Add missing of_node_get() call")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   8965ad8433ea ("drm/komeda: Enable dual-link support")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

Hi Stephen:
Sorry for the conflict, and thank you very much.

Regards
James
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 9d4d5075cc64,1ff7f4b2c620..000000000000
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@@ -127,7 -128,8 +129,8 @@@ static int komeda_parse_pipe_dt(struct=20
>   	pipe->of_output_port =3D
>   		of_graph_get_port_by_id(np, KOMEDA_OF_PORT_OUTPUT);
>  =20
> + 	pipe->dual_link =3D pipe->of_output_links[0] && pipe->of_output_links[=
1];
>  -	pipe->of_node =3D np;
>  +	pipe->of_node =3D of_node_get(np);
>  =20
>   	return 0;
>   }


