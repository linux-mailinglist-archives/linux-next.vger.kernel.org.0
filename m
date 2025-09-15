Return-Path: <linux-next+bounces-8294-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18116B57063
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 08:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2013417AE6E
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 06:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CE1285C95;
	Mon, 15 Sep 2025 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=@siemens-energy.com header.b="xm3JIpdc"
X-Original-To: linux-next@vger.kernel.org
Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazon11012063.outbound.protection.outlook.com [40.107.149.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1E285C80;
	Mon, 15 Sep 2025 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918150; cv=fail; b=RF5WXkQu0tGl+X1Ts3xhsOlUxoLDww/IOp6NQArzHSF0vf6MhPcdB9m1YW8wscUWkaF9w0F8+SMAnxBbS1RLpXwV+ub8VJvMoM2jhcX+vNblh6KGHzXUUcF+x5AvDv827MHdP/h8Kb2iWyV6+9PmNqe+1SWxjLeHYveFvj8iCWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918150; c=relaxed/simple;
	bh=FZm3QU+te90jSYt9VNtLq9pc8s3TCTh2oJmGA1IIWKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MukLC4F7cDuS+fZvIrj+iuMXFJhsu8B3mehiZNVCfqvE3IPWQ4O8f6i6cn/hrgDk44CQ6QHEMhfT9zmnBBVhLTUgELzmT+NBL3WHOjbGh2fRnIJkoKWfguL2uYeSA8kPZETYXgMAvkrdde3Ftm3mke7vA+COSM1TcxxbwCmYQBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com; spf=pass smtp.mailfrom=siemens-energy.com; dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=@siemens-energy.com header.b=xm3JIpdc; arc=fail smtp.client-ip=40.107.149.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens-energy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dr8nX9wEafVnWYPpWKa8Hl+i+jjeY/oPUJ6lMnLBHMrJhug4+xf8SKO/ZMx/UC1SLsnNK4LPh+6Ab0AuR9hl5EfVYqcpS8UoA/kmKnmLj0mBv33zlxq/32H1fl5XbE7N1r8UZrBd7gYCmyG4TzJamyFxMdWtVReSu46JbT/LDJgQw42oLMCvMdpbgBaaGbH4ckiRYbChTxux8Ls1ltuyZtkmHrNXpWdE0/EGpGtsk4laYKLS8flDfYckizGZoqOPxJagdqFh/esQRwSKYMhPoMlgn3QZu7+pTXu6FhBbweU6/cyAEsOLXVXGkHHJfh71GxMZsiiZ01c/MgjuXCoclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZWAOVJXmpDRiHS/bHAGb8koBzQh5ooewzviULR4Fdo=;
 b=llSdOso+U46F4Sl1jCXrf2siMFbNp9aGcJfZhlLFHBYTsbWoq1XDGojP5kXX7fZ9Dm/y0DYTwiaL1tRVFnStiGyze4hoKeeZd/9x8DukjfQLS+FFwPzhE5fjv7/+WDKW6BHgsEi7Cixj8SmtskPSOCNpqIp2tSmpFDrnGru4RMaZs2WsJusDxnJcbjiLEnZpqvXuZYOOBRkdPN4Xc/qFDvZ5hW+TMM+3Av33KfPQwv3L4Xs5/RgD1n2rIvZ4I2E9PpEMJn7O0ZWHc9qipipLeAD2kFKTzfhFBIb/PZQKPeMBeUr23x+JnrCqqbmlJ/yLPZ4/MW0ZztRsFL109NXnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens-energy.com; dmarc=pass action=none
 header.from=siemens-energy.com; dkim=pass header.d=siemens-energy.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens-energy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZWAOVJXmpDRiHS/bHAGb8koBzQh5ooewzviULR4Fdo=;
 b=xm3JIpdcTIHhfIqPW1HWvi03t8zHeGVrlDjMPJcAhxrrWQMPocb0jHcSiluwhfr8ul7Vzr75jDvy+8mgw5n3Jx3LepX3RfxyO/XlIdLZbfDQK04OVIT/Dbw1C2+mkumspk6PZIs/5KbDZ+o/UHqLcJkJqwx4AaCO5KrCH6uNLBqrdlzPBJik145HLUUhbQygWGOpXP8+ZXuu+jRmVcNQ+qtJKS4teUPoNXRGYA4W5cfpGiXso4FjJ1rCI2vWilEhWdYxuYZaIMOqsh2wx/I4w6/XOvbtqLXyZDjwEDwkua0WuoqvAbpHSNj0hPQrYwkmAlUmVHU9HuL3goL9nGJqVQ==
Received: from FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:91::10)
 by BEXP281MB0294.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.22; Mon, 15 Sep 2025 06:35:44 +0000
Received: from FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5233:e398:feb8:a20e]) by FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5233:e398:feb8:a20e%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 06:35:43 +0000
From: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Brauner
	<brauner@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Thread-Topic: linux-next: build failure after merge of the vfs-brauner tree
Thread-Index: AQHcHTv7s3oAgC4CI0WMdfN5mjICbbSIjsqAgAMQVgCACDxZ8A==
Date: Mon, 15 Sep 2025 06:35:43 +0000
Message-ID:
 <FR2P281MB1544E97499E8EA3C06C4D0C4B515A@FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM>
References: <20250904113334.18822d43@canb.auug.org.au>
	<20250908120229.7a4e6db9@canb.auug.org.au>
 <20250910104944.3e420e96@canb.auug.org.au>
In-Reply-To: <20250910104944.3e420e96@canb.auug.org.au>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_ActionId=d4d04da6-4da4-4b89-88fb-fc1139f4c651;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_ContentBits=0;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Enabled=true;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Method=Standard;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Name=restricted-default;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_SetDate=2025-09-15T06:04:38Z;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_SiteId=254ba93e-1f6f-48f3-90e6-e2766664b477;MSIP_Label_36791f77-3d39-4d72-9277-ac879ec799ed_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens-energy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1544:EE_|BEXP281MB0294:EE_
x-ms-office365-filtering-correlation-id: 396288c4-087f-4aaf-3976-08ddf42218d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FVNHNTmJIFOOdFA0RShtd1k3oK+QnGeTsODPyt/r16VezeHCjszjDwen6Dlu?=
 =?us-ascii?Q?Nzo23seiaWYjEOX/WXO2NzdoEHomoKNbaOKsrA8K4pgaBKwVpRDJk8dE4SqT?=
 =?us-ascii?Q?3J7TAXLt/jsWIEXXuGbQHLJMwOricLBeF4jAyS2H+RaB7d5745j3PzMzxszo?=
 =?us-ascii?Q?ZxHfLnAGM0Q3WAvBcXDpX9yrCkMxkiLaYjfZL+haS3GFj4R3I333pYiwf+za?=
 =?us-ascii?Q?PO7YZfi+QGpYV8gtgUmyoAFV2CARQqv7erO3GOOx82qUD7B76+rciOaLngXJ?=
 =?us-ascii?Q?i1Ak2wYGNgsz4nGaaM6rJBSgOOOHL1/CKL7tmyThS4az9xZwfHgRq2PpVCOU?=
 =?us-ascii?Q?scggWc9QXbg2ydqV28DFSehy0HIaMlEdpiTM9gBLrbaU9ZS4O9/tVbiW0WVL?=
 =?us-ascii?Q?5C1wH1JwFw6+Uvdy47v1XOSPudzQaEzF+bi1pdf8CmsqXOPAfk3n3o6K50SS?=
 =?us-ascii?Q?kldUSdaP6q7EMtL8lhk32aIuUEPzxicMMWSHkvJogZUxJe5qat1ku+JJopbU?=
 =?us-ascii?Q?GJWv6SZVBmr6SARNuJWXcB5Iv7bn8C0WPwGsQ1DwubAjF9b+GO3W/222/lhg?=
 =?us-ascii?Q?PINkEWO83+Ln3Qnwf24tqqEb5TSNqxwAj5twE7r2+aex6rU0GCNaq2gOXMAh?=
 =?us-ascii?Q?yNpuMg6pIDX3CL33fVMZ3V07bb8AG/F9IDP7BGnINqoL4JG3YeOIKTc4uFJz?=
 =?us-ascii?Q?RecZcbaIX+czcdAQccyLCB1JW/ZVmKtPJxlaWlfbdufdym7DzMQLT/EwZuuz?=
 =?us-ascii?Q?UinFur+SQqH/YrY67qO3CppoOtWR+Z59uXKDAu+SBJ3C6+FUWYxPB1iqpBSE?=
 =?us-ascii?Q?UPCZBJJ0BUvoVWrGbkemsPR7iXrwNNFSpVQs4skz52y48X7qiSrQ/tWe5mC0?=
 =?us-ascii?Q?3XWhnGq9tEA9eZDrHXfh8eKdgyrLXKIDywLXcLVBZVz1zLZzZQIOSe0VeiuL?=
 =?us-ascii?Q?Md1YhAs9W1cBPz1hjtpaZgi/GHBnX6Lgy79uibUh0UnrUxy1LFEmurlGDIrt?=
 =?us-ascii?Q?PrchjSXKqkJAilMP6BIosy1PP8gwTmQEsgCT9w6ntrs/IruzwrQSvK3zuwqw?=
 =?us-ascii?Q?Dr9FTQDmqfYQPu7pagtlXIfbLCSgWRhSEZDwWONyex9eODdujMaa85UzOLXr?=
 =?us-ascii?Q?IlCvnYY5NeNdsHtvOxRrvc/BUs3ocx49CGtkWgnVZNb9fYfGUXadk1/0vdb9?=
 =?us-ascii?Q?AUwtkfqCaMbqOLLXa+1x3PvGZtekYeigG+D9SpPVpi0Um6TmUVuwAogRY9ZE?=
 =?us-ascii?Q?S3vnfYwZ16Nt0S6xds/2nt1q6TlplmqJHFILjA0b4jICJ4YbYlXgU3NYQWt3?=
 =?us-ascii?Q?daBwoZ6a5ThoA2liQS15LcIRU7VLJ3OzVj5nw9pHEt4cxHH2D7Pv/8CEf4FO?=
 =?us-ascii?Q?luhF6SxMRViGXUay+fgs8McdN5YXBQ5FO4DGtsX4I1Xf4iN2QFKBIY7RIZ3b?=
 =?us-ascii?Q?VrniB1S7lB8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1544.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yVyYG77qLRnYeElqs2gUkaMmJVdsuAwdNJjQ1iFTbgiZ4KtYWFXfsCRrXlnd?=
 =?us-ascii?Q?JnYld89nDZs5CR8cSVtCQ8q5RuVPv2Ng3/8P9cSY36ZBybVk7MEV4bg2EUg0?=
 =?us-ascii?Q?cFzGcftcNHwpsPvBeIg+cgK7YEyHE8BAXbiB+F/AAcOB75isW2Nx/3DvOtC3?=
 =?us-ascii?Q?0Dlq+OroyzMAIS3v4dSeoCT16o4IzC5uXSWLfPjoFaAdGkkCiCsiHHoSdKVu?=
 =?us-ascii?Q?N8IETZJZ2HKP3wfCP22LWjTUdnq3hNg7v4TZkwV8HBCDGCUri1nF9iUbsn7E?=
 =?us-ascii?Q?YRdG26T3ybn0mMoe6MhM0mz9WUJ2u4W0ia0zbw+wTA2C8NBclqTgZadCbIQB?=
 =?us-ascii?Q?w83JFS1ZfZXwszWj9KiygcQ9ePNn8G7L9oz8zBM6xTJ9CRqB6VVefbvqVOPp?=
 =?us-ascii?Q?p7zrJRmNdrpct05M3CWcDQTlnJ34OvybT+1A6Up1HjESue0CY/CxMqI93HJt?=
 =?us-ascii?Q?wCzMJVeffnC/8gPCmKhBxlMgyUr6KRvHa+fARyUZGPlVUc65/RP1Hl4wXWfR?=
 =?us-ascii?Q?MDb5ooFjZk30pKkJTJ4wTSsPDE8cV1AkqzYQD/Ww3OzOfvKdv1mgJMkPuDRu?=
 =?us-ascii?Q?QKKl3TwW7wQkvi150FfvZDfqYoEYROJVCoMO/xFm5lsmQkddNHXGJXqNt5KB?=
 =?us-ascii?Q?pIOIDO6W3/fNFO8aJzD27t/34PPtU5zPrez58lVLHGMBown28PEv1g18q5lV?=
 =?us-ascii?Q?EjPlcTREtpktJnxD0l42Svuhp6GvKOhKynk+zETf2Irc1yfldFQ8uy120pZV?=
 =?us-ascii?Q?whCpiQCTjXKPjsVyJ7W37GdKEkRi/vUvjFCWI66MMVKp3SK6/81mlM4SMm+X?=
 =?us-ascii?Q?J1I2vH4Itp06wKMncB4IqRqW3y3h5gmRa2Fcuwv1mIrWDFd87TmLpVJW1pqU?=
 =?us-ascii?Q?D+g/sc5Gw84yHPSupDRpp1Dnqy9YZNPw3gq1qnF0DVUD5m0Zl3Ai9x5E1FW8?=
 =?us-ascii?Q?9vdWJNWkA2yxb3J+X2ONbD3NiOHdWB02DeeSziQeljVejcPFAfqG9pani6N4?=
 =?us-ascii?Q?1d8llyeVD1TfMRaRfwN6CcRUxC3LnnLainVfYBZV3m/tGPIUl1y76/RSkWEs?=
 =?us-ascii?Q?vCOb5+j8Fhx+5fzLh9E1dHiEaxOvtFw+wAj/99CG3I7YjWJqcveK3hZCQ7Ng?=
 =?us-ascii?Q?o08CsFMuyUW++AY/eMqmCCyveVJbipn1JnJvmpBzd8LdaHq9vF5an1oFs/Sl?=
 =?us-ascii?Q?E2C5qj5tACpGWz3ojha+y/za3dcn2JwbVb8lDeIBMkhOidJAkvf3Cj6xH/AW?=
 =?us-ascii?Q?5gRyMtqPJzL7aVAXG2Y0J4uvZyP5fnMNTahkIq4elkf/5wLgluXp+A5/+pDc?=
 =?us-ascii?Q?EY2hAvyPK1akZfDfPwC0llnvg796mnpNWBEPfiL7qU9i661NSTey+qXU1RCU?=
 =?us-ascii?Q?qxRehp9HKc7RHF3Sis13K64QSlBVVyLdq/JhVi4fZiZwTSrXneBOMF6lU1HE?=
 =?us-ascii?Q?ycVknLhLvfIVDPK4IKtTyb1OGGVkDB1l2C5/xO/1d6/bpuc0hSQLhnID8Olr?=
 =?us-ascii?Q?nQvOyG713JzEqgPEiKCkhhdIcnkdwG9uyuxsF67M27MLTfU+fzFK9FKqUaeR?=
 =?us-ascii?Q?ebePZrROH5fQsAVmoP98rIhEyZB/0m9lQ2tdPw+a59YKXaaJn4usq/3G/A0T?=
 =?us-ascii?Q?Yg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 396288c4-087f-4aaf-3976-08ddf42218d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 06:35:43.8951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 254ba93e-1f6f-48f3-90e6-e2766664b477
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQLc+IH2aNcSx3/4SayJOjdJXlo4wgZbjBOeFjk4XsEVy8D+SSVLl1EkMiP4EWXkUPPTIeTZfKlTAnr90FwIq3zHTN5svIKvUMujhZN4wsl6GnjYJHoxEE2VEIjc77yr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0294

Hi all,

On Wed, 2025-09-10 at 02:50 +0200, Stephen Rothwell wrote:
> > I am still seeing this failure.

Sorry to have caused such trouble. A patch fixing this failure was
submitted to LKML as soon as LKP reported the failures, but I believe that
one may have been lost during the pickup process:

https://lore.kernel.org/lkml/20250904-trace-task-newtask-fix-callbacks-v1-1=
-8edb3d557365@siemens-energy.com/

> From today, I have instead just reverted these three commits:
>
>   c6ac444ff20c ("nios2: implement architecture-specific portion of sys_cl=
one3")
>   bbc46b23af5b ("arch: copy_thread: pass clone_flags as u64")
>   edd3cb05c00a ("copy_process: pass clone_flags as u64 across calltree")

Thank you, sounds sensible to me; especially since this leaves the
actual bugfix commit of the series ('Fixes: b612e5df4587 ("clone3: add
CLONE_CLEAR_SIGHAND")') in tree.
However, I still see value in having the other changes make their way
into mainline, eventually, as they address a build-time warning on nios2
and improve portability to 32bit architectures. What is the best course
of action here? Reroll them into a v3, along with the patch above, or
wait for an eventual pickup of the patch on its own?

Best regards,
Simon

