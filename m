Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009FA2299EE
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 16:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgGVOUE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 10:20:04 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:38311 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732391AbgGVOUD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 10:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1595427603; x=1626963603;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=ha8GtwYRQaL2vNMa4s7WrkwTNjFSlfVvhhA2ie04zWE=;
  b=RqAl5UV0QCElEHctRrrgPbfoepqeeE+YeCMKlZl2iXcMgTQ0WonjMGAf
   mLLNBb/wRNxh6bGmLAQ1Yjg2lwLQdnPQS5Lb0Drs6rxfV6Yw0jW9ECklg
   dABo7NunWDfM4U+rm67uWl/R5365fUNt7ZjmdbI9Gyj1Wy+H3I1RykzjM
   HwjURdMf33DeeXfTkHM7SmS4j707XyN2vM1znLHv+DHO09zXZoX6kPI2l
   r78f2P83MIbPGBR/BGgLmB+OKZqxMMLVSuLTxFXoIWlIKWA5X1huTJEiD
   ZQW39AmpYuHJtLXb9XDzVWy25pUTz1dQgbfWDgs1q7q2R5jNsfEWrxgU8
   w==;
IronPort-SDR: oXHbcLRdFk7EkkjXhtN/J+l7McNzpIOJxeDzZRxmulF9rwA2L2dY7VseQCBn42jcm7UJhqRohC
 +Mf5LjjQ4liAEcNtkboA/reI17lfKYCOiaz+ZwXZRCaUbXV96CvGM/G/Yfg9zaiH7jSWnmVB0y
 1tXwjp+XRE0INSbFPIc3MaFL24EdisHbL70u7S+hXQVEVRUoIVbj2TxXWpEvfT9Pm1TT0qFTZ+
 T21NQb5IfLaD1TlKFk4itIuGwM9gzwYUM0kfnUOqgcXkPbZKOT9wH0XgV05a9QjsCHcl8AzXYS
 WWI=
X-IronPort-AV: E=Sophos;i="5.75,383,1589212800"; 
   d="scan'208";a="143210954"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 22:19:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcIb713MGfMub1q6izc3wnp7QA4eR2dIc/x4kphjEvrjdeoX53eTmmqQPO5gZbabndaoFS0zcvGk2XuLbPCGRhuX7moQlmjyuU6ujp/mUmIyz0tvtvDJi15ymiz+coRBxgTnEIIhjsg+HBSP2nj8gwEOBFcIkCPNZrNYgKM5KU1j2F2jIyHg4Q+4rWUFYhs0mrlNBZ/EaNShSDGn9IG8Ihx3mC30cANO3fNph1kSwMwYrnIrq8LpV8ygMs8aiHCaOLKCpLhgBDZjZRVcOnDYc6Cco1jBX1QjqYY2WSDX2IOIU4kH2WszF/BSZrq8jT3A1AplsqcczfY0jDf/dCeacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzMEi7a3C41bv5q7cy2vmmyuZAEwxQXipF7JMur9kx0=;
 b=cGwuYZiqvZcoGLpoxUNUIr9Vb4hWMboNaXJzvTGXFKOlZN6y1TB+26u5uZJcc34en2Ej7sZ5nSBlo0f4wYTavah/bxsTmC5sCRscZE6JGvYkB3TxH4UGiwcP89KPQ+XF5sq9nLq668E0O1AHyhlH+sMh1AJjx/R97juLw1njog+8vRcpQnWK42s2z2EWkKsd3ADhSA6zgwpzB/39Pl/VRLiQa1jPDqG7VaDeFOOux7ueTVo8UZ9MUa6wvrhr4BiKWmEzJC6XlLFQrPiUH7Ogj3i2OD/Gsvekh5r9Vz6EUHNyBnEmMZ9xkDpKXxRA1tqXr3S/en8jW4hfHD1ihr+Teg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzMEi7a3C41bv5q7cy2vmmyuZAEwxQXipF7JMur9kx0=;
 b=efflEtYhTLHhVSy54H8sB4+HVhPf4s0rhtKBXQxeFS+aTqpQM2AZZfR10BWFWvQRFsxFMaJU2FfyaQzKveMNpRO0dUif7eZ5+5XXqprW//RNxvl6OKLL3I3Hjv6eXTStv/XIUBJ7ue6PelNMcRTB2p4TBbFl4SF2Jbrbwyhvb30=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1049.namprd04.prod.outlook.com (2603:10b6:910:56::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Wed, 22 Jul
 2020 14:19:45 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025; Wed, 22 Jul 2020
 14:19:45 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: interesting merge in the zonefs tree
Thread-Topic: linux-next: interesting merge in the zonefs tree
Thread-Index: AQHWYDAlawvQHwkQg0uu/iK03AzjUg==
Date:   Wed, 22 Jul 2020 14:19:44 +0000
Message-ID: <CY4PR04MB375191BC8B3ED61678D16CB2E7790@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200722235802.1f01457e@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b4d5ed98-4a77-4f87-24e7-08d82e4a4872
x-ms-traffictypediagnostic: CY4PR04MB1049:
x-microsoft-antispam-prvs: <CY4PR04MB104919AC9551AE602BC5FB59E7790@CY4PR04MB1049.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 59YQjjrxxkEQsw4kFm7zEx2XF4v68CZsAxYtNAhPOw1cDuGLyJdCNB+OnGM3e1ir/UMAc6DwISQAV505L5SF24/NBbj3EM48koc/iZui/GQCm3pkiLT3wN7jbUuj4zvjKfjEpc+XM4zLwNEpIRePyEKOMLcRDXiA82cTuos134OKp+1kjor7/HhG+TOl3OQUcgffShNO0+4VqqfWvoMw5yPC0HnXiTvt2BUFNac/FMXsFonHlU91NHKfrYK07WziSrPy9r8QdYPigmlbnsPZhXlJvn8Lk5FhUI1HZb9tx+c7FOOKREwJxW8I0/2bES/b
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR04MB3751.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(4326008)(6916009)(54906003)(478600001)(316002)(186003)(4744005)(33656002)(55016002)(26005)(53546011)(6506007)(7696005)(9686003)(66946007)(91956017)(76116006)(83380400001)(66476007)(2906002)(66556008)(52536014)(8936002)(5660300002)(8676002)(71200400001)(64756008)(66446008)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: XD+P9Pj/WtEtyEjuxZ+MgxSFPaoCTTdtpGn1MH3dm7ERbo/qRzXfWYzCGBZ9RpntGdYxYFyFFWY1TY0y91jyeELrZMPaO1MKOxzcrjTILOF1JF+7eW5aiCHymPFGDF6YTonB0/t+V1nCDlugGusX7mvuzyDKx5uW0tAsVQBV35Z9Wev/Cs0KfcItpFyGzhs63xCUd4x21us6eQ0CZOaYMbgfvaN/AIVXBLvehbEtjdHq0IslwBXkm53f2jef2otUZY2tJ0PTVgE50FLgnwh3M7rUk24WIGO8pAqdletBv7Lt1n6YVb4d91GClhjJnW1DkznNo9vL5XBWX9r2I9QW0zzeo9BSMfoTjvHsImAk2vHrL9/srZgt39OMoEyvT62bODaaP/69Oy38pdQk+g5DV4Rd+O/ydxwGFYp0pyO5bmT2zFRNclUnoeG2esp8RHmhfhtlorhQXvbTU87VSAtGIEDg7zpXN9GWYHm17yU+KUZRjQjs4zYg8/T+uM1fW0ys
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d5ed98-4a77-4f87-24e7-08d82e4a4872
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 14:19:44.9693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkaH3hohUmmXCubo7WXlDEStw2gvWIDL7sPqXBA7JF7NEXL3QVhjyZf5I9RIf6Q2zrr2GCZJBaBUhyDnEPwC/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1049
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/07/22 22:58, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
> =0A=
> It looks an old version of the block tree has been merged into the=0A=
> zonefs tree.  Is that deliberate?  Other trees should not be merged unles=
s=0A=
> they are guaranteed not to be rebased (which is what has happened here).=
=0A=
> =0A=
=0A=
I must have done something wrong. Patches for zonefs for 5.9 depend on patc=
hes=0A=
in Jens tree. So I merged Jens for-next tree into zonefs for-5.9 branch as =
a=0A=
base for the new patches. zonefs for-next branch should contain the same, b=
ut I=0A=
may have screwed up somewhere... Let me check.=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
