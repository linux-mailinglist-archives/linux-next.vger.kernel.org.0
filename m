Return-Path: <linux-next+bounces-6788-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF593AB8221
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 11:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E6F916938D
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 09:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10F32868A6;
	Thu, 15 May 2025 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AvV3G72s"
X-Original-To: linux-next@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834051F12E9;
	Thu, 15 May 2025 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300296; cv=fail; b=MtZZfqOBaJXEeE3V7LnHw3hCz9Ssu6x9eY6xKwJcbFoIipIAuemjUU6fCw0lYf4phfRbH0Y1hOaBvfjaMTa08arNSAhSU7lVphT7TdDAduG9tTJ0Q5mTOVxPJsCtCthKcS4VQjby8hcYhISKHM4sQt9XWeSnA7R/N+KhCghlR6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300296; c=relaxed/simple;
	bh=fut+xFatXXgdEa8wm6rcaMOIbkL7k8sHVlKsjlovOdE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jQ+t6tcz9jgSx7LMZrY2soHBhqKV+eiitWPk7zWPxmEeIDOCRIYUVGvljpsE8bG7Cgo66oiLFGHUp4bRN3AIjybrNQ3VNGRmDVyv1HwZlpq9eRpsvissoGpeCjgfFPS6JrvEl1sVFjX1QcCLsrOvRju60+sRmMF1h4hMZoG4/E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AvV3G72s; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQBW04jfZhEt6108iPmgilRzerjvlhOnghIzNQNRizb20zmgGYljN0TMHcACRxngrSRYhPOrpZlvIcV+mn7lwXGL2qkKCY3AoBuZa8eVfbUgeZtD2n5ydp0DKQxCwuC8y0sfoghgAe1xzsLjI2hBHmxPi/b9/6K458cFsb/QXXMqmiZRWNnANjPMPNDndz1KpnP98McbsNT66WVai1B3sxxy3xYs7Q/d0WKHTs6M4Q7MV56/dO4vlbxqP6TroVv3xss8xcrSSa2c43H8r+LFLQXlw4qN+1/Gg/5wrtWrgXsTbQaHPkE1vFWpE4x6/izxhJV7iSE24h1FtKMcBMZ64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q8cD9CxMmMmLLXOEvKsViWbw2VWCjWapS/Jl/1LOA4=;
 b=yD/wHpkpSHI1nDgHP9ZW+nQEEOEc1OnqWjNv4zGnjMcy1IHjb9vpzL+JgrCfQsAx93dETqKJuHpS0Rg1OWTOXAJ3Id9vbZgm1SN6OXIUxaW8dBCbKy1YCfRuwNPPqTvzExVdh/3xV37b7E5mNNifQMpL7Ot2yIW1v9zJTNzbevdLXPr2eDfNaTxyQTynHuab9w6QqdCl3So0mfM6lpGDJpjgxVWCvdzVMejSO0DoR86HOl6XXeRnrgGV3qTmB5IsJtAldqD3kjoVCT3TgFOeSmD14MJf+74mK81qFf3w/rLCGDSXohuLibyMPvMDEWIDvvErpWN1AIj5ALOH+yv6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Q8cD9CxMmMmLLXOEvKsViWbw2VWCjWapS/Jl/1LOA4=;
 b=AvV3G72sMYwmIMdP3bgzxG77fZOk5bUyD7ldvyVbRKEzo/thgnDumI7x/81GnGv0BBXnAAMLV/NbIa0lFpcYLFo/oAzTvsi5OwgylFeZxfg2IX1sPg1n69dfaf2B75fM+55Fo0gm/OtbuJui+ruoXhapuOMKT6pJe+saYDV+DAo=
Received: from TYYPR01MB7024.jpnprd01.prod.outlook.com (2603:1096:400:dc::9)
 by TYWPR01MB11941.jpnprd01.prod.outlook.com (2603:1096:400:3fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 09:11:30 +0000
Received: from TYYPR01MB7024.jpnprd01.prod.outlook.com
 ([fe80::39ac:b8e5:61e:8037]) by TYYPR01MB7024.jpnprd01.prod.outlook.com
 ([fe80::39ac:b8e5:61e:8037%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:11:30 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: manual merge of the phy-next tree with the phy tree
Thread-Topic: linux-next: manual merge of the phy-next tree with the phy tree
Thread-Index: AQHbxWhHoRIDvUiWxE+1iBcsYNNiVrPTZ1Rg
Date: Thu, 15 May 2025 09:11:30 +0000
Message-ID:
 <TYYPR01MB70241C298A797D6A6A67EB94AA90A@TYYPR01MB7024.jpnprd01.prod.outlook.com>
References: <20250515170912.509a9751@canb.auug.org.au>
In-Reply-To: <20250515170912.509a9751@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB7024:EE_|TYWPR01MB11941:EE_
x-ms-office365-filtering-correlation-id: 96da5da2-b626-4774-6e27-08dd93907ae7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wkUM8EOvMOHtzVyJoGatExtAsUA0yPP2QvVjIf62xRTvxGvHHJBkZFRgaNxZ?=
 =?us-ascii?Q?6XJs/bGWvJMBSnF2JvZqIaxg67O7Nlvsmx1KvEdjHA3E32N2wPTcVpQbHY5V?=
 =?us-ascii?Q?DVEa6Vhjx7hmkU8vOlvasR+cUal0nTFhuXz6vlyMG2MsP7YnRmdfGhk0/oez?=
 =?us-ascii?Q?Iyl7hLGDp7ThSjUJmq7L3rPWc5GmBPbmj6SehddPbvIrJMRBR+yL29HTfCkE?=
 =?us-ascii?Q?iGcLt/Iox/0SM7n8NqBgzwN9FP7/PYu80jf4AdIpCGldMYukqn2pqHVFC4nR?=
 =?us-ascii?Q?CaI+vOM/O9eyvnVCEEHXTRO9mK65JSmHlEPwJ9JRqCHqhZSSmBPA0EVpkhgK?=
 =?us-ascii?Q?qneNtlo3RTHcarEKbpWTEFilOaNozhRmSnImawMZPvY125DHS7+xYh2x7p0V?=
 =?us-ascii?Q?Ok6dZiey1LhwD2ArSnhP9sxQ7Ff5HfITUeSWJGoFe0k9np5OmOOo0O6KzM6O?=
 =?us-ascii?Q?izAHeh1nqOflLTThmMiCEBIqVLDKHS/xEDhIlAfUqdnroxiQA5WDZAC27q3r?=
 =?us-ascii?Q?U5sFLlJxvxZAcd2Jf90J1YTgfiymfPgrKiXowOj+A4kJPPcVVI0AENaUaWcq?=
 =?us-ascii?Q?NMFp55c+R1le5PhUnEARSdCtV5+r5Idcjzw3P5uuWbwwe9iVJNOs4aX6I/6k?=
 =?us-ascii?Q?oecGMJSjVrtviQW9m4iKkStDarKfHq/H0EH00p3c5MRtl9Dw22rIORBzW+/o?=
 =?us-ascii?Q?O0K+/PmnHeOgIKGdy7gL88GyRvtw7U/VRMfNnFDxyLyeyPFMUpab2vA9dosW?=
 =?us-ascii?Q?wMOU3U8wgcpGI5Nu4Uo0R0FPfUbIXm2KhmSEVZBKxcTuTvDL34T6c4eP3Ut2?=
 =?us-ascii?Q?1UFbGQ3cMWtwsnXHv1OuAalQKmp6bLzvmlUSHjOJh0zq5mp+EQ95whF0dKAt?=
 =?us-ascii?Q?I00QbZ75v9P7+B0thfQqPc3mh/ZgOTPDS/n8ySigORfUph8/Wd9Llk5x2KjG?=
 =?us-ascii?Q?IzOk+D3l1CjuyGDh4rrNs8Lc4nDIGL7TEgHpKKaHQEw1FNR4nkT1/OnXd7re?=
 =?us-ascii?Q?UNlltXeBtOlq4X93Y51tTo4l/0nKu9iGuzHln0nKXpnK/Y4NIs4aYGnlmvPR?=
 =?us-ascii?Q?GJon5GoF0dpHDaPkbo+TgV2yQG3tyLAigujIRFiwtQrTpUb9X3yz9k23TLvJ?=
 =?us-ascii?Q?OLs61qliZ5rSiEQ7kVLnT+ReWqgRT6vw4dCFuBVVhc3t2k/jWzRW0G03rPxR?=
 =?us-ascii?Q?FdV/kqhLzJtMy8UzuczExGPwuaJ+zvJaftXvyejFbNmXXNIoEgO5WhVuG1C8?=
 =?us-ascii?Q?IcrsBV2bZO8Pmc/m9oyyGLfL/cJdZPInBalQwncS/Nrjo70j3SIPFzEJYtgD?=
 =?us-ascii?Q?ZWbmqFaPVqtnVzMip+DjegB9JioNQ34uY6iQVL5kwuoDmlerjGAmjvTmXtjI?=
 =?us-ascii?Q?QxgaLTF5HBqBC9x5o3mkHGkfc7PkfV6SRbzIsZQcoUfl1wYA5DEegwdcYz+p?=
 =?us-ascii?Q?n6TajVHMhReFCjtbWQU71TUPRIEl3W/3l1C78yR+TlNpSmnEIOZm259bYSpH?=
 =?us-ascii?Q?3TXNaw0G/g/hjlc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7024.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SNn8rxmOsb0G8O71ih/rETOnQmLiwBFsmO7huXCOPtMDW24aBkUOIbHijiiS?=
 =?us-ascii?Q?4NeGz9eNmznZ32OlX3TDU8gJip6CTIWBDvOHXMBELX7jt7SPOI80MLCpb3m9?=
 =?us-ascii?Q?m8R9MZC0ZDxiBDCdWZLjbwrNsxhr3B5cZQLq46I5RLN0hVtuoXxZ5hWy9ih6?=
 =?us-ascii?Q?9acJlIYY+k7rfVKvp2+dxjgwQ4kBqGh11xwxvvbv2L1wAGxeAEv7PkDFhnWJ?=
 =?us-ascii?Q?fqfOaO9i8UV3Z6qGD181JX9XLY6S8jupqii/eWEb6gAV0vT+F5Yd90m6LhEI?=
 =?us-ascii?Q?StGseVi7krbfZWRXZjr+WAbiGnSFs49gfMh90+CGSKBhIwChlh9CU4u7HsEX?=
 =?us-ascii?Q?TbV/Sf1c3oDzE9YAbHTCyzdsKmftX4FSPXkZoLbHvrw8Pbv+Xb81cQYyal38?=
 =?us-ascii?Q?U41Zr/ETbsiSoqRQUtFPPbZwY3/jSqU2Q4IaPRMTmv1XOt855knwuFunKaZ6?=
 =?us-ascii?Q?EDGk79vBiyVTG2qF3GU1JdyrS8h/Y5mGNChsekrqSAyoTU0eckj0thdA8czs?=
 =?us-ascii?Q?vLEkGe6IRH0PiYbjgb2WiAyhsDtGCyZx4cIWHrL41BCRAPeasdWT0DMTnYEy?=
 =?us-ascii?Q?BbfokVvWsec+uAkTw1z8ITUj7s2TbSc8N8sYWBOZY//1v8KAFJX50JUSw+Oo?=
 =?us-ascii?Q?kxY6vewTibsAKt+mM2qGxEed8dCe2EhYE6j9F9+bQug0R24wrioiSnqsvoBA?=
 =?us-ascii?Q?IeTrsRmi+IJkOkz8HprMNu5WPCm/Pz/cJwPm1+81nFTFVw7j3bV8iUrqQ8kx?=
 =?us-ascii?Q?FaH5FpDeemgoNcQ/vrXSrQ4PZsmN3GF5tV3z23fR1j2UNq3tnRBZCFfO3XbO?=
 =?us-ascii?Q?rv10y0zmdLE32rGR4+XSbb4a2IZxNZ7DOyV/Y263kSWfdu/vzoFtbJJrNu15?=
 =?us-ascii?Q?CfbCJdDhxXsROsNAal/qigdjWiqCZiY/qsGKhhrD5DZd3crMUPUXeapy70gp?=
 =?us-ascii?Q?IBPT3V5JO0RBi2qng5jd7MBSqwmTeCgS1x1qGyw4g5z6pSAXj1GKz9t67Uoq?=
 =?us-ascii?Q?CtLUsFL3e3Z/Zov8D2jCKOhcM9PovE9dZnVOGn394lOumqxA2GuGJCUvpKqS?=
 =?us-ascii?Q?qUk0L0VbBIIGb8AQk/jgVJV+Q8S1n9v86wbuX0/cB5F3Vpo0resSW1Fiqyky?=
 =?us-ascii?Q?xHFgZNhF72TwQLraI4fTOB1WlT9/zpbylUgzFe7rpMdOghNEhsDK+7tvbsur?=
 =?us-ascii?Q?33BsOjkqY0CU99sc1hoRP1MruhDRSHh0zDuLWU/pHDVp0m4vb4/pL7FaDa3/?=
 =?us-ascii?Q?NYp8ttsMIvhk0dUky/SEw972UN2J8Tylw6ANvX6NCIkYCM16C7Q4eITt2NOq?=
 =?us-ascii?Q?QdnsFrT57OPwAqBd1AHlWtUERJ4AjpVVpxtAlXC0qddFm8WaJc5baJxS+j0d?=
 =?us-ascii?Q?IPE6uSgKbrzqnFR9wm/WcjgG1N2d0CVC2RmGZFttnCs9/YcNppPKp57LlDMC?=
 =?us-ascii?Q?E5XT+xX+Qh+21ayUKa0cuBAD1/5xHZesHHmbq1G4PsDudPqrPAXmmA4Zqquf?=
 =?us-ascii?Q?1OO5rVubdvJelSPxAULNgZtiEETypnAmrEcC3L/1HVgxdhB6guhMHhtxMo04?=
 =?us-ascii?Q?nX59NPV5s0Ecgch3narvDNC6ypW5rH1h4fcHKQo4Lau9v8e0KWcARZ+rQ4Pf?=
 =?us-ascii?Q?rQuiguPBdR3LuL/PshkKyg0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7024.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96da5da2-b626-4774-6e27-08dd93907ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 09:11:30.2768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w89RzsYGdXOqKlicXRXpl0emZci/bIg5aCbXPThz7GPwVLI9UbdQw9lzAoEnkzZyf9D1NXwVcA3NUBxIlghYLyaz6wfpuuseTHV4Q5Svps/i8A67Qm/NeNW9Otc1l5Pp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11941

Hi Stephen,

Thanks for the report and fixing the conflict.

@Vinod, shall a rebase my patches and send a new version?

Cheers,
Prabhakar

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: 15 May 2025 08:09
> To: Kishon Vijay Abraham I <kishon@kernel.org>; Vinod Koul
> <vkoul@kernel.org>
> Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>; Prabhakar Mahadev
> Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-
> next@vger.kernel.org>
> Subject: linux-next: manual merge of the phy-next tree with the phy tree
>=20
> Hi all,
>=20
> Today's linux-next merge of the phy-next tree got a conflict in:
>=20
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c
>=20
> between commits:
>=20
>   54c4c58713aa ("phy: renesas: rcar-gen3-usb2: Fix role detection on
> unbind/bind")
>   55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware
> registers and driver data")
>=20
> from the phy tree and commit:
>=20
>   3767474d7497 ("phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support
> for RZ/V2H(P)")
>=20
> from the phy-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This is now
> fixed as far as linux-next is concerned, but any non trivial conflicts
> should be mentioned to your upstream maintainer when your tree is
> submitted for merging.  You may also want to consider cooperating with th=
e
> maintainer of the conflicting tree to minimise any particularly complex
> conflicts.
>=20
> --
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 9fdf17e0848a,867f43132b7a..000000000000
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@@ -467,16 -472,24 +477,24 @@@ static int rcar_gen3_phy_usb2_init(stru
>   	val =3D readl(usb2_base + USB2_INT_ENABLE);
>   	val |=3D USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
>   	writel(val, usb2_base + USB2_INT_ENABLE);
>  -	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
>  -	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
>=20
>  -	/* Initialize otg part */
>  -	if (channel->is_otg_channel) {
>  -		if (rcar_gen3_needs_init_otg(channel))
>  -			rcar_gen3_init_otg(channel);
>  -		rphy->otg_initialized =3D true;
>  +	if (!rcar_gen3_is_any_rphy_initialized(channel)) {
>  +		writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base +
> USB2_SPD_RSM_TIMSET);
>  +		writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
>   	}
>=20
>  +	/* Initialize otg part (only if we initialize a PHY with IRQs). */
>  +	if (rphy->int_enable_bits)
>  +		rcar_gen3_init_otg(channel);
>  +
> + 	if (channel->utmi_ctrl) {
> + 		val =3D readl(usb2_base + USB2_REGEN_CG_CTRL) |
> USB2_REGEN_CG_CTRL_UPHY_WEN;
> + 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
> +
> + 		writel(USB2_UTMI_CTRL_INIT, usb2_base + USB2_UTMI_CTRL);
> + 		writel(val & ~USB2_REGEN_CG_CTRL_UPHY_WEN, usb2_base +
> USB2_REGEN_CG_CTRL);
> + 	}
> +
>   	rphy->initialized =3D true;
>=20
>   	return 0;
> @@@ -764,7 -791,9 +792,9 @@@ static int rcar_gen3_phy_usb2_probe(str
>   	if (phy_data->no_adp_ctrl)
>   		channel->obint_enable_bits =3D USB2_OBINT_IDCHG_EN;
>=20
> + 	channel->utmi_ctrl =3D phy_data->utmi_ctrl;
> +
>  -	mutex_init(&channel->lock);
>  +	spin_lock_init(&channel->lock);
>   	for (i =3D 0; i < NUM_OF_PHYS; i++) {
>   		channel->rphys[i].phy =3D devm_phy_create(dev, NULL,
>   							phy_data->phy_usb2_ops);

