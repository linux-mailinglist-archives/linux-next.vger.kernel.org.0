Return-Path: <linux-next+bounces-5921-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3BDA6B519
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 08:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 213821887F10
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 07:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EF91E2007;
	Fri, 21 Mar 2025 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="E4gDDAo1"
X-Original-To: linux-next@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9169418E2A;
	Fri, 21 Mar 2025 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.144
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742542447; cv=fail; b=sWWISqV1dkLW3NIeP/2ZchgLDLyTmliphJofOQtfnHREmviA7kzoNQLEX+qOjXYV75wn9oHSOpWq+PBPnCPU8Otp5uoqsPXCovsr5ymdMjwtmKWO1zb57kSiVbPh3odiE32NCTkIae6LG8OeFXrBwzERK5Lho+2Us+Bl6FY4nhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742542447; c=relaxed/simple;
	bh=OVnhysEyE6LWQRyAB88zJp2LkPheAZyJxAwhiAX75gM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q4UE7XeNtYa2VGvlMgLDac7pdbBNvhDSxa8lirENgTpuxj43dJdaQSyH7iYX3+4m85IlyYcAXnizOYOutDoCkP5BuVkB0t481/MULQ2gdyjL3Tewyi/7ZEBsi3njQ/DueEC3i8nz7t1oetQ3ocLLXZB5yaeXRKYsWDxKM1PXWSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=E4gDDAo1; arc=fail smtp.client-ip=216.71.153.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1742542445; x=1774078445;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OVnhysEyE6LWQRyAB88zJp2LkPheAZyJxAwhiAX75gM=;
  b=E4gDDAo148Os72e3s99BgxCa/Tj4VZNAJDqAVHTWruauWq80TMEIWSo0
   kjREH6paY4Oh8g6lsRUFPc4UmYsjmnj+IDo7dmy9N2T482LwTEW4ziNkZ
   lVubaoAGO2a+pbaehdayp4UsBTPQizE5JEc88w/r+34/hLBe3QY+VtIcp
   f9COs/HEETEYH67XHauj41qrUcuDUPZGNmT/2DA5/HsAt1ybHA6Ap08Qq
   6zIHAyy9CHH7lRQwJluJvK23UWqsVIV+AVYuuhbNPnzH8HsmMgpzInvRi
   gjk9lfo4iUFl4A0b793dHMeU5A8lLPzxYSSR0HVXBnnyXzsfQ78lI9l87
   A==;
X-CSE-ConnectionGUID: AYX11ErXQ7iBChbEd9/0Og==
X-CSE-MsgGUID: NxWnC0VBS2+vzYOR7cekLQ==
X-IronPort-AV: E=Sophos;i="6.14,263,1736784000"; 
   d="scan'208";a="55935768"
Received: from mail-mw2nam10lp2046.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.46])
  by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2025 15:33:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOLnGyDqhGdkXa3ZrtE1fvOGVExZSu2pextWzZulmoloy/YK3OxeFxamnY/HP7sZhbQIDi+ecptY9AlEs68g5XRZ34qO9h4k7rP7fSqDwWlfEWqwOYYvlBZ2g/VTzsxfeQJFvJI4ah3PV2I3ajFmLLrmwBlJZ0ojOkzFulu583r8GW5eI/Vsqu2PvJdKF1BILiu+3zsriPc+oAVwzirL+fda4U5JJYGzrvX4KLY4lCE6KFErWqQWYRhHeVDck+vBCuJnDcENqKOi6BUEC/91drAk6s3v5znitFVxUMDG4FwI4RGuwNuyi1cZ+w8bSZUm1GOWYPWsRAPnl1d7Ir/jiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mkt+g3mJOUizZghW7lkM5OLS3hGr9fkRs61AdP7/nTs=;
 b=re8Ha249sRARBn+3OF+WNViyg9AcpiXSeLPJanQBdAfuFhoQ2iLayF5agG9Up6XXGN4+iF9F7YiD7sAYr3h47UEm8J0wAhomeBgQIIRgduM45YTjLZK5eZsfeTaEjybeanN733bCa3jNZZgqge5PUqcE6jkPzrRdCmzP5EqaikdBzEi6DdXPEShanIZNucW30P7aTmBybWzpfjKVYFhAlYDO2r5i4ATL3MrckiqZbTAsJdl5A6jCLsG/Pr8r7FSxRH+toSiP6VZgcYUilXex28LNXueW97d88jn1oOe9wQBABKFbNokSjgd5lm69BXhkDpULmCdiAzVUPh6PsoTdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by CH0PR16MB5338.namprd16.prod.outlook.com (2603:10b6:610:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 07:33:55 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 07:33:55 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the mmc tree
Thread-Topic: linux-next: Fixes tag needs some work in the mmc tree
Thread-Index: AQHbmdxfPFZYwaoBUEOHdMkiGyQTfbN9K+OQgAADUPA=
Date: Fri, 21 Mar 2025 07:33:55 +0000
Message-ID:
 <PH7PR16MB6196B4BE63D7ED4D91E66BD3E5DB2@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250321080918.1f8b90c4@canb.auug.org.au>
 <PH7PR16MB6196A1D9A7043FE4E69D8AFAE5DB2@PH7PR16MB6196.namprd16.prod.outlook.com>
In-Reply-To:
 <PH7PR16MB6196A1D9A7043FE4E69D8AFAE5DB2@PH7PR16MB6196.namprd16.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|CH0PR16MB5338:EE_
x-ms-office365-filtering-correlation-id: 5f1d4f2c-d49e-4b02-ee8a-08dd684abc5e
wdcipoutbound: EOP-TRUE
wdcip_bypass_spam_filter_specific_domain_inbound: TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tw1ysu7l0UK0QHO1bhZ5zoEdywqJxGtxScb2L79fuBe0PDuIngE9WmT8uNrX?=
 =?us-ascii?Q?rd2QOPNDIeVakXpSNtFnOzUE0HggfPSuNAhjqelfqBaS7uKOxHbbYFsalXw1?=
 =?us-ascii?Q?jy9ogtLw7O82m7XWWIlBPSny6xGASCOtdL3iRv4cRkRFb3m+YMZLVWMXerUH?=
 =?us-ascii?Q?GG7Zs3bwkq8vQPUKXA0bqyfNEtaa8lUD/+0tJejPLy3WYdQ5BuqdhqewN9k5?=
 =?us-ascii?Q?d4qzOs2eFS4K6SUbAWQbj0gqpyjFH5xWM7sizrDXZE8/mKyCsvxeQYtrWptk?=
 =?us-ascii?Q?LzvJUJO5aVJKcaPMx3l07rcGsC3js7SLW9y61ra6Be95Ippo2Wyj5fiMD6TH?=
 =?us-ascii?Q?QONeGyQjvWsp48XRMFvbDdLLMod3+OJNzp0cbwKdnqEqMjsizrVw5tHiCw18?=
 =?us-ascii?Q?44Wb9S5d0e8Q71QN6H8AcMfd9CDNEKLuUomlAZO6aY/GF6+FFxGVMEDjxYKO?=
 =?us-ascii?Q?rfjF2Z+kUh/+v9DzzpP5ZcAg85nLMqwD/EoriZzrVHcKON9QVnc95AjJNKhK?=
 =?us-ascii?Q?fEYUH7d2WmWXajr9xeFfZJ7+Px0OIPqw60EmnYikESigmWi/wePZNeyiwuNH?=
 =?us-ascii?Q?eqItcVD/SsUyV0Q4jFLUpk5R7JNzTI/l+NQrk5SZOF+tguZenyqX++0ulSus?=
 =?us-ascii?Q?0oqJXfxdVxfXpQCiRooyukmxJ0/cFrai2Bdl6SvIrFw1TFm4/y4ytEGC0l/d?=
 =?us-ascii?Q?2WEtF07LPJeMquV527Jx/oGdK+RGMTQQgN9BtsIZ3A359xL7WT+aBaxgMiwq?=
 =?us-ascii?Q?YNW2kKbE9YxReW4REK5MUDHJQuJmgEVJBtabiZuzFwb2WUBhVsJLAw0twaz0?=
 =?us-ascii?Q?peshs5fzJOZkSebIoPbFVDro8lwtWvPRSySUj1sAriBylRk1WKIcc5mQ23MP?=
 =?us-ascii?Q?WTTMitYYc7xTb+xAsAtmpbqZ9zsFM7Nyio/PErccGaMl8okLC/GfI8UrQkLa?=
 =?us-ascii?Q?aCQrL8GrBMhOm20dom6cz5gkLlWizmqidr+uum9Cjzwdk+Agj6SKjxogPISX?=
 =?us-ascii?Q?OceDn50WRSjIoUK+fZDzvQNIT5M+ktiBLFnJz3kfZ8IT/YFwpEEdHBEsD+wL?=
 =?us-ascii?Q?ft8E2wxdz9DSyhkDeDRJeabtXoUojNkPLYqZVQuFfehH6gtJIyKY6vtxjyBq?=
 =?us-ascii?Q?DcpvmUfw2WkgRxx6D0ywsGVqgCtR5v4znSte1m3Xy3/sg/eo9QKHDUF+mNm1?=
 =?us-ascii?Q?uvGp4mCmqDWAowoJJx07RJKB5EWhBv3QfSTZEDDyWTtXmirGPmoxLD9sD62C?=
 =?us-ascii?Q?MMbeDRMG6nY1DAplKhpZxYrMxtDfJFXFs6kWqEmHi1rf1cIxdKQU+XDno/2Q?=
 =?us-ascii?Q?yFGVudoSswpH8+IgoiGYpTwWJAlFbbhp8lHKkIOX3zfU0hb6KyysC622zA+x?=
 =?us-ascii?Q?caVi1Dv0ft/yFuXV2YH09JRN5vdieXeR+NXlUEmrsLjRJb8FMtRJkAC9383h?=
 =?us-ascii?Q?K4fWpAY1PjJDnEx9t7CyVh4eId39tgrm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5En6z5Ef+XRWGb/VcuvkdYXw5MiGBOOFM5ml/G4piTo9epAGjL/HjVuynUmJ?=
 =?us-ascii?Q?db9DQSDsHtmUTNQ65vybYUc+SCPUJlKadcJVGs9oz0OtihCispJW1u+HdQeG?=
 =?us-ascii?Q?B9IjyclPbMrzqABRNThjU7+sMTkGO2AXt54noiM//3THWxhhFv//r9kld1RV?=
 =?us-ascii?Q?U/D0VfHdbXL+Ex+c9BjfywpiFCU/lTwjllbBmEcDzsVchtNCca1MHwRsar4k?=
 =?us-ascii?Q?nBuj6OFKCCJpcMF0zPR7AtCahZisXiocbyWpVLZBSXWLvOlX3nRTVyWS4D8i?=
 =?us-ascii?Q?UnU8dqgApY+bqguHhP+/NaFkoBlUc4lFrt83AZq8FlOyWkEy7vA2hjwn9Smy?=
 =?us-ascii?Q?JVRAMHTpKWjTqStKYnLFOzKTXmXxCJvF70VoObjMtHEim6o65hqOQhuwJfuJ?=
 =?us-ascii?Q?SmUf2WARKEUnN8HCPSg2pHg7oSqsXRyhAN3jy5xG8E1z388vrvO2MMBc1Uhj?=
 =?us-ascii?Q?dAPRso8F+aIER1CR+OLVV0Oh4ho6YGe0Ohtt4Tt95D7tPsyhjQv47CdOCSZl?=
 =?us-ascii?Q?zFxKUmxLazLr1oQogjS5jNOwj5Hh4UZrOdku5HZo4sVXkNEPxLiVcr9tg6Bj?=
 =?us-ascii?Q?6z8NuNH69bEgbQPWu+OyACaANXDENM2M0RNtNc4PRPkeHeaF3tZ/XOcqAK1F?=
 =?us-ascii?Q?aD8NoeySQHQgchurUvNfVdt7wmqJoU8FV6Ei77kX+5ie4Be0rY5s1w98trrU?=
 =?us-ascii?Q?y4uBMbHya2oTO1KybQfisFiHz4E5vHxeYC2rdVd8buOxIQBq/j1VhqAkOLnj?=
 =?us-ascii?Q?En4M3l4/7W8tA6J6MdV+SEEcDD8+tXCSK9XrAzrk8xBT1COmQJ/E4+7xvbud?=
 =?us-ascii?Q?P061i4D4ZuXRobQOv4BJyRfoTVPmnMxoC1wVkOIPGO4L0xZ4VP5IgkquRi3e?=
 =?us-ascii?Q?zVgrA6CVGQtJ9U7ScBUPO+ORvNqLfYgMSVkpnTwQ+MLx8J4WOg/UMVN12j+e?=
 =?us-ascii?Q?6K3tlfRnkqCUCA3K2m9xMfKrkoc6Ai9ADAvxXN5KJsDnUaVFDFUreNOSHDFn?=
 =?us-ascii?Q?JTRekD6Ahl6MhcEwyGRqijpLhG+Srr82h9UagMNUE7GE1/nvw5fQlH/qvzuj?=
 =?us-ascii?Q?uAJTUCOA6ay84YVdWTxVFYAiBJGslevFfO3yBs0N9HvL5JVTa8yItC6Bx/Sq?=
 =?us-ascii?Q?tliuFYAZyKAg2WJA0UzRhghxbZQWD/vzB6w0Hl/ap5fSv0KLeOqphGrMJG9B?=
 =?us-ascii?Q?E5/jtNJHTF2DwWe9vI5BhbFNzPll/lgT0Yb6rEor+JasH7mztseXEv4QjW/W?=
 =?us-ascii?Q?ZpTUFWXbcAwqAHE0rRVQ5Ck4aaEbxme0/6E+9iGLKpS6svqHmEcYIh1Gc2Ha?=
 =?us-ascii?Q?Fq+Q8toGzVWQfGDD5FHav/WZqPia6XVC5TNDOQwG0Qx4mrvd+Fz3g92dWSUb?=
 =?us-ascii?Q?keyJGmwTE5UrB2++bWXNlp3y39empaaAA609rnlh/8ikDHxx9uoElON/WIX4?=
 =?us-ascii?Q?mHlCELvhi17KkbIJa5IBP1Dj+GU0qpAYxpkwhMfTr+e5unPNyzmK263Nl9PJ?=
 =?us-ascii?Q?n++93nfj+ANnIuc+5G46lmhlgdGE4mqnpewwISLk7C0o2Il/uTMKPxXXmRUV?=
 =?us-ascii?Q?0g6eO/ao6FBtK25aQhvxCiKqRSvHxeVU5Fxcgh2+2414OQqk18LWpdzs6avQ?=
 =?us-ascii?Q?qLIogCyuFw2366RKZ4h77yA1xx5lpRp4gBhvX/mxWPgS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s8uLD0kWlkPApEJboT2nkGv0uo1eHUo76khRtfETWzhQD/6a0sL1WAT7Oh75UtWYCq0tHVJXmvaPsjFsRQ8/QlZUtEaFqGGgUzynfzUXYy7/IpHV9yowowEd9MMotVStJY2wrB5aAbRDE7vi+g8KX7ladjR09fkXKB3LTyWG4RI9pWKuEQMrzCZQu1lj6SjLiWCgGGwiMnYEFPEEE26WHqeNzfEI1Yz+c8Mowj0UlkoMsYCrDFhnJZ4GsV+3yTmpjqko22pEGOtBFy054Vr04FwMbvF53gBfsR4xgTc3XOuEpgGJx0G8L3nTG358HWVDn/jaYKqjwCqidT70FR8Bv1EG9cUFIkJr9ihwYqeMh4IjRy5UPhqyQTfGAeLrpYwy7dm8dQOMpXr1cWxl1M6xF6IcV2ILRc/lA+xdXnSxw7nxipYcKNoO1AV6Au2Dd+DqwoHrececf8T7PTPpzOaLv/o7aEJQbjWWdXvG9ho1ovAQV/H9FAtTFEUI09QxZG4KBcxcO+7wS4j6ooMayzyvrDTM6CQuEcvldmMVLfNACl2BRdxI2z35jBqe8QDyjUXEVD/sqx6N5QIAwrr8hnPOP6rBlSXAkKv5QF6p5CKOTCT7DOk1mzYnB1fL7+jseEYKE9XTq1nRQoWbRSPcwicUrQ==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1d4f2c-d49e-4b02-ee8a-08dd684abc5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 07:33:55.3475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5u/0rMBfCptjqPTv953ORWPBs8sRBOBrS0NhB53qDaYtOT0zxeGRVB10kgBKSZznrvV5/ixwdzevimAB+nSmHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR16MB5338

> > Hi all,
> >
> > In commit
> >
> >   79055e47336e ("mmc: core: Remove redundant null check")
> >
> > Fixes tag
> >
> >   Fixes: 737d220bb2be ("mmc: core: Add open-ended Ext memory
> > addressing")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> I was using Ulf's for/next branch, as I always do, and their the sha1 is
> 737d220bb2be.
> Should I be using different tree/branch ?
I apologize.  Looks like 403a0293f1c2 does exist and presumably point to th=
e same commit (impossible):

commit 737d220bb2bef9efd43267c757faff003533b631
Author: Avri Altman <avri.altman@wdc.com>
Date:   Sun Oct 6 08:11:42 2024 +0300

    mmc: core: Add open-ended Ext memory addressing

commit 403a0293f1c230524e0185b31f69c02a6aed12c7
Author: Avri Altman <avri.altman@wdc.com>
Date:   Sun Oct 6 08:11:42 2024 +0300

    mmc: core: Add open-ended Ext memory addressing

I guess something in the metadata is different.

Thanks,
Avri
>=20
> Thanks,
> Avri
>=20
> >
> > Maybe you meant
> >
> > Fixes: 403a0293f1c2 ("mmc: core: Add open-ended Ext memory
> addressing")
> >
> > --
> > Cheers,
> > Stephen Rothwell

