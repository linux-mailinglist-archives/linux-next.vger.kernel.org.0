Return-Path: <linux-next+bounces-8191-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDEB43470
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 09:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CD333A5AD7
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 07:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAA12BD02A;
	Thu,  4 Sep 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=@siemens-energy.com header.b="XMlEx1oD"
X-Original-To: linux-next@vger.kernel.org
Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11012045.outbound.protection.outlook.com [40.107.149.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A82BD00C;
	Thu,  4 Sep 2025 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971865; cv=fail; b=VVq31TP5c/bWVvEL6CdKQxJmgltKosoIXpRJihNJAO6PPdEI+LMGeGquBrypp+qzTXmydHuHKYFwJ5X/KFqbSHv/4e95ZzC9minlAabZW4yAxiihZ1d+iJhWb+HiZ0+uraXouk9cOQyTEcAo7z2tqOZQ+UJPd06j5TOCHvSNsKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971865; c=relaxed/simple;
	bh=HLERZlC7OlcysXJ4ySy2qnsPZ5Mxv+RS8309ML38PHU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sElx8dfzgC+JP7HxW0+Z24mKsTa2+eeTSoUuKbcZRPm8vTaWqW8hyWkrz0x47qBSkK2rwCvvY0pZZ7QtD96CHD2s7MsYVJM8eI1LfLJLyZrw3miI6DY3DnEvHwK1d3t8pqfH18SRz9KJVTS2rr7d7gdI/4vcNONCR9AFyp1RPxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com; spf=pass smtp.mailfrom=siemens-energy.com; dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=@siemens-energy.com header.b=XMlEx1oD; arc=fail smtp.client-ip=40.107.149.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens-energy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urNfKITAiYhBZ1QOnl4TVptl+HiGXysAvZTnDIWke6XPXm2Rs1cNr4yITHk/4BxnSZgCkWrvSJRTxHHMMeqIHp/x8rwWamGQIlTts3yZSBkEr4lMbAMHw4yU28cYyxCxIAwiQz83k0fKqlH3SBwxxN1VFFSBmC903LozDY54sfSiBoB9LEFkuDZ0UnhvRI1ahbacQPkcE0qYqktRMVSV9pyZUh2fW3Q4CMNccbB0M6RQITDGm7ERC43pTuaUNCLhvEiE89tRsZBMcmxihXcL9IKhfwch5Mq7Sb4rGAk1RValIegV9qHgrkn4OWMti90lQVoAP6mxfjSUyEYxMMtspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yolseursy67wRvV4JvXBlDwuX693YUKZL2R+fJwhoio=;
 b=DGvHpmoc7zE6p9rGTUcnsCvxLA+VHTOGPaIRdiYyEYn+o3fPzen5xBkU8ia+u7YLND7k642hls3Hf/sf+2SBGQEgZdEm50C9g7tMrjSGqqz0TgfonCohEgOtioadF2A+OqCTxLEPIoUbiv41z5nfVHs6uTniuMLXzpXmjiGtYgxfiDNKmQF0ghOfNfQS8p+oEjZI0JFD6QgkUHAIRZrb3HN1TTzj/NxMBC9DpgR5CTSFPKfXz/Wv2NQMXYL54FnPYYpGF7En3fw/ujCDAXXdFvDT6mFP9QHs8lCndv1P3EDiy2iwBUGx4DDDqqk2tOy7QQ6CM2NctDuDXPUXkSfkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens-energy.com; dmarc=pass action=none
 header.from=siemens-energy.com; dkim=pass header.d=siemens-energy.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens-energy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yolseursy67wRvV4JvXBlDwuX693YUKZL2R+fJwhoio=;
 b=XMlEx1oDvBR1dwd4Tr4HsjDEPZ2WfN/edShNkOpJDGwwMFTIrHGFrb5NUJCji3eGbkh8o/e965JhjVScfD7rdXxC97QZt4cD8DjeLydrgaFHfUgrSHpqeDxMezx+YunWseQE4i6Ec54UJYw9ec4KKGdj1Jd9j0zcRl+o3ggL5TkXNpJKqsz/qr73x8yWyfCVYO3DMOtIce+fYE1+GIvnh51pIN0mPcHchDlSeTT31J6Hl370MPJvHcI5iSoEZt+iTpnl+M/bAWc1LCLDrDB/BED+QC9+0l/i7s3hsUC5GEp7yxCK37PE9VFH4SJjetVMA1hoPQtLefsxD0Z0wDK9rw==
Received: from FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:91::10)
 by FR4P281MB3574.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:44:19 +0000
Received: from FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5233:e398:feb8:a20e]) by FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5233:e398:feb8:a20e%3]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:44:19 +0000
From: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Brauner
	<brauner@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Thread-Topic: linux-next: build failure after merge of the vfs-brauner tree
Thread-Index: AQHcHTv7s3oAgC4CI0WMdfN5mjICbbSCpPYA
Date: Thu, 4 Sep 2025 07:44:19 +0000
Message-ID:
 <FR2P281MB154466417264801491E8001EB500A@FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM>
References: <20250904113334.18822d43@canb.auug.org.au>
In-Reply-To: <20250904113334.18822d43@canb.auug.org.au>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_ActionId=20477559-f3c2-4db6-b8b5-61c0b12da02b;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_ContentBits=0;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Enabled=true;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Method=Standard;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Name=restricted-default;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_SetDate=2025-09-04T07:18:37Z;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_SiteId=254ba93e-1f6f-48f3-90e6-e2766664b477;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens-energy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1544:EE_|FR4P281MB3574:EE_
x-ms-office365-filtering-correlation-id: 4c6d2c0f-6288-4203-a6b2-08ddeb86db45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?amROKX9SkIeGNivYCg5i3Tki+kpkq1v0k3saOsCTTsPF0rahSxELf23NAJTb?=
 =?us-ascii?Q?4GfQE6XpEvkML29W+g1WfpBfPXc55uvAf3/b0Ngo6HIrY/Zl2pOT8RYEm5aF?=
 =?us-ascii?Q?xeG8QW1P2Kbd1DM3BnpJKzs7KW78JRlGPBf3MnacAS0VCY7sRCV5KVsLxFYO?=
 =?us-ascii?Q?ICFTS8kiAx/3Y6wDsrhcxS6S1KmdI8o1bFIQZ8neu8CYuKG7k1hDKiOVrmCq?=
 =?us-ascii?Q?PktzAuC9NPYaoyJsFAzBCnlOJckUOV6mbI+Z6IsNSbqd1g1+uR2MjD2DQtSN?=
 =?us-ascii?Q?j8RThLuByuQelLZjj4ixn+0y4988+2+uSuOyC4mXmy1oiKpOMVgIZVNGmlwY?=
 =?us-ascii?Q?6TydmIs9ruh2ydxzjiOrKs1Brq66g0EE+Z2YWl+gALpI69pihl3kw9+AB7Cj?=
 =?us-ascii?Q?JJKrszxxAW+HsuyjKjyYO0ZimUpu+I2YXwKIrhkNOntUBj2leScxV6sZtaur?=
 =?us-ascii?Q?lSuoXfZxJmiOcXU9PY2pjQsGHakB/TouTxZrz5i5optNPJrjhhAx0gKjS/8r?=
 =?us-ascii?Q?CQPsToV80eRItNa4xSmJhhRoumonW0FBKbBz178YgHSc+j0rezx7TP5yQN2C?=
 =?us-ascii?Q?xloQ/63mKyJlB6Vr6MjigTGzgUavFiuRIAKgR0aECnm9sYqREAhVg4+r2toU?=
 =?us-ascii?Q?9vwX8B34UrZsXU1ayfxVHU950wQDZEkpu9l4YMgiMFhsTwh6QVnoRIhIe4S8?=
 =?us-ascii?Q?b6379C1jJeFHr/Ujv4CR54pOBCU/IhWKc4MPJKjW1hyw1PjlgjejWeTVZDiM?=
 =?us-ascii?Q?UYHRdkvxfKXkOIkBZ/Daa27Q6GtyfSrlqWJYI0Ho4VRShm731Iips1LBSfE8?=
 =?us-ascii?Q?8mlGitSWcONKvCCvaFC2vWVNnz9cd+83A6pSehbscbJm1ic0R7d7jACPA3aT?=
 =?us-ascii?Q?yJK/dGZc8CIALTs1mHlwkkRdRX1Ho9lNHfL4mfKYKAjhzWiD1y63sRK+Gyng?=
 =?us-ascii?Q?hnmYek1XiUluKYLI5bwwcJrKCo2gIpa+UuQkCXLRPH4qFsszWIGQmtiFqQ8m?=
 =?us-ascii?Q?Y+O+Uw1/bOcekuFaOQcUFQCZD7XSBdlz8Usk2O0be/HD8S1aZTmG5nZq51Lc?=
 =?us-ascii?Q?htqnp9g3JeMOIeITYylACFD9oNHvPBYckfyE9g+1HSRi55LmVkIn1fNKfimc?=
 =?us-ascii?Q?oxpW+GCf/QNdgTNZ1SCp45/Oqgyp+tAExQBN9iBPd8rBOP5hc9RzI4UNbMgT?=
 =?us-ascii?Q?eX8/xghPmM3rRoEKFZLm5IH0qSxDSGkUSTeRvT1TspLmjsHkBlSPh5+Hgh0u?=
 =?us-ascii?Q?xfYJzLNVhme5XI/diX1lfcb4L6UdyTLFuHiEl1hRU6sxgPpEI2VNA/XUkS4S?=
 =?us-ascii?Q?G2Ysea0xOm3/1y4VA4fkIJ1uUWGS2oRc4e0fiIkqjdFEemGhtyWh8h5q3IgA?=
 =?us-ascii?Q?D3XyFtyClQPWqh6bv2C+hXR29RWuBm+11CDWm2WbkWNzgwnW0LROWOUo3dxp?=
 =?us-ascii?Q?llTfIyOadvxu3WvkiqXCxAkGhBmwyOI+W61s9dRxZMMJZedXSd5VAw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zPj3EZt19McI0dLUbLGfP0gBpsY1hhwwMP8tkSGOd5XjL6+iOMie1D4MjQTj?=
 =?us-ascii?Q?/BOCAm+Q4mgk0O6glYfhpEyulMzzaB3CJpPTnnbkCeLSxKZk0CbUdhV85/8V?=
 =?us-ascii?Q?bFwUn0RZ2/CfFEO+zvQmKKd87og3BDEeBKCJA8Os0VlOaaNbfAjzG+GE1CJa?=
 =?us-ascii?Q?N7wHYAZDw5GjNLgHmC/3Qg1Lv1G6i0uJuTR900xaZX6lef2Drv+LvW6ORANq?=
 =?us-ascii?Q?fTcIuAM9qkW+H7Ez53DaR+zb2ZXc6f+nWCauUQx3QSRmaF5OG9d4evXN17YQ?=
 =?us-ascii?Q?E+F7flFPaEBv0LW1Z9Qg5so5m4RQHqQ1MBhXkXrQ0eCEYYd9Olp9W3i3+YNp?=
 =?us-ascii?Q?HhiilLYodl6aiFUGkRP+3lWFFFylH9WIfwG63/c/chVZ0E2Ken/HEXvRkNQx?=
 =?us-ascii?Q?+j4y7Bw8sbiydppDJASaqzxcdbPOvziXVkr+nPMpTf0H82IRZaNewr65ZmeI?=
 =?us-ascii?Q?QkYN7z1IkPpaa3Em/pA5PAyh6sL5IBhn7gQbyDuOxsJYp6bZB+5lOVSHOVlN?=
 =?us-ascii?Q?om15v04z9xGV1SOjlGMb8658KMrZwykzjo//u8rd5TScm51vhaXhPCRByAip?=
 =?us-ascii?Q?Sa5cg+fyYURA3Jn96QMfJ3khCGusKcmtY+c3OGHz3sV7UBbWKCFpR5rx6MVF?=
 =?us-ascii?Q?IohRdr6OsRqHXed7lAJWW1s55OFTPI0GyDCLyJo4eVhSa0+bg+tELf5QyTzu?=
 =?us-ascii?Q?Pd0M1G73BTEpftRvydnpWYe1j0l/z71xfA72YaisatFW3wY0NX/wEKbiD0aP?=
 =?us-ascii?Q?I/F1LKMRUYqssTxkKZxMfjJEO+/WKHAviu6+ELBfX9EL6hl/5cyDJPOaY3ZM?=
 =?us-ascii?Q?WbK964LMEdZjxCcZATXsWpjtSv1FTCvYmNAolPZMfPwZNeqvkFabMAN423nL?=
 =?us-ascii?Q?Z/824xI0b2NTdLQDrf6D1eeAKRDu2MGdiBJ1mOhBaI961zaak1GxqCUaWS5n?=
 =?us-ascii?Q?5oZA2T/VN7oR+QPQhHkXqxuQ8/s3tdr4hkN4Rm7rZ+3HIfTQmu0spA7tTAjn?=
 =?us-ascii?Q?z6omfiPx+wAvc1ozdtXdpPpIxXOEzO6Fg1xFLdltlGM4mv3av5wLTMNdgtDl?=
 =?us-ascii?Q?G68ydg/nwRsHT3Bx4ECWiNyMnzexATI2+K23YLdwiJCcpZaNzfxD4jAwyNlf?=
 =?us-ascii?Q?HZ4UYGY1aCb/tPti7SNiMSojKSMYhgHmMZUWNdwQIR6+tUQBGBfG3jlX3gmS?=
 =?us-ascii?Q?7oC2RyzWfGD12zvu6iLqFmrGBTAa9A0qqBMJgsckqcNJ+o+jGR+fKYbzycJn?=
 =?us-ascii?Q?pjSgX4mMn2lguZbZuD4A+0LVC6v5MRw6nvvfosJHwAm5gWrARZhLTrke7X2h?=
 =?us-ascii?Q?QPo8X2fNTgUEoNHoxAAzDgQ9HlkQ3vhWZ7oLhAXe0QAq3Xdhudr+wgX03EQS?=
 =?us-ascii?Q?ZqcmihJ9zftKPOA55JTJ1nLi34NUeWWFdQvnqnTqY6wT+VO9Lw5Im9qxX4d7?=
 =?us-ascii?Q?+tumDHvMDxBnLY/YjMlfkuF/gl01yLMeJZOj0z/1mX80CcnNZZSQYwRioztG?=
 =?us-ascii?Q?pr3auNJ85UgnkaFy0d9mLgttG1YXJm3+65ME/GnjietgAyFPmbISsReC+YVH?=
 =?us-ascii?Q?FVu0iqHc5YomFhcFgv3iQf+3Psts00AwZKj/1ygxbP1GwAgRlOHjAQ85ViM7?=
 =?us-ascii?Q?9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens-energy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6d2c0f-6288-4203-a6b2-08ddeb86db45
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 07:44:19.2708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 254ba93e-1f6f-48f3-90e6-e2766664b477
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFPAD02WFT45m+p6Zr0rcUQoeLcX43PJCDFOq9u07AcIr25AnaIWH58wxZGqKPN/g6tgsqNztTzKgDzAi0XqDdMSOil0daPQIgCMH2CfLiWuymwkLzL52U1Bi24+JbWF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB3574

On Thu, Sept 4, 2025 at 03:34:00AM +0200, Stephen Rothwell wrote:
> After merging the vfs-brauner tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ...
>
> Presumably caused by commit
>
>   edd3cb05c00a ("copy_process: pass clone_flags as u64 across calltree")
>
> I have used the vfs-brauner tree from next-20250829 for today.

Thanks for investigating and notifying me. Yes, bisect is almost
certainly correct. It looks like I missed adapting the tracepoint
consumers of the task_newtask tracepoint that I did adapt in that
commit, sorry. I'll look into preparing a patch for it.

Best regards
Simon

