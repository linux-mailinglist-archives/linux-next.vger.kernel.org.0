Return-Path: <linux-next+bounces-5931-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD1A6BBCB
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 14:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDC3C463A17
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 13:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE8722A1D5;
	Fri, 21 Mar 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="Kzy9MZBm"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2126.outbound.protection.outlook.com [40.107.220.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D631216E01;
	Fri, 21 Mar 2025 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742564250; cv=fail; b=Kz3viNyCRztpjhmzSei63nlY2p6NxSrFCSOrMSI/j7G7PsmPZxJTEBYv0qn1dstEsMwmyHo278cRFD0Ljd8EgKJcSHXgNrcAwtMqI9saFKxsMXVcRbcA2Oz/zwSyIQvMAXs2U271ubfEv3PrFqB17CK5W3oGqcsNh6ir6hIkk/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742564250; c=relaxed/simple;
	bh=XSbtpYDksbp9uNqU9npPybmnXmsS1XUTbBGL3WE/teI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kDOCfJixhz84R/icnqQ2KQSOZIFvhkxp9wnUrD7FW9yrOIVXLZTSS1DKns0WJ1lWVR3+1EmlD8qkL7hFbGYUnMhNTEPcz8etFYRYNSOSx0C2FyWUzmOw/i5ExCBcg6q9qWkO7M+/F1GWu/urj6dlbXbtq3PWI+hrCJKDauHFzq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=Kzy9MZBm; arc=fail smtp.client-ip=40.107.220.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlDG1r/0+Ylf3WxcR7Hm2t4h2kypkKZZ7WH0hRUM5R3M8IRQjBntU6QsiInLejMqXGb05d6BzjUyd5YaZKjE1FslKp1z1v0MiQjE9VRb6Mrn9VkhjLXhJqnwNfWzMqmrpHoH49tMmoyzawl//262ewhh1S+Ul8bRZmWJqaqGfekmi6BhWrxUx/FlzqFJ87IXulvqke8VogJ1YTIsdO8iSvUyYR1voCz1Xo9GD8xYYJw5mzy1521nC/NGlBFRaAUx0p1/Q/o9IRjWZBIT/J7Y6dRs4gxq6DN0X9xZppvV/PkLQQpVp69+VQ+uN+pTUzdxnAO7FPNB1oIZSd1Y8MvKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSbtpYDksbp9uNqU9npPybmnXmsS1XUTbBGL3WE/teI=;
 b=QNGVrhUV0NyPDsy4EsukU7JmaPuBW8hiL3NgHw71xvesriBb+WZKpr40XR6qhe9RF3b7BHIMO0C3/heWxVPT1+UFjURNgIkbnBcBfYcuRIrlC2hc2R0/jChL0UT+cRJtdWOi1XiA4AmVGCdAbgvR0D2o4t33c2EJD2vZTm+SWohtsoWGlGRnSQEkAx9zW9aYyOcMB0voZ2d0+CWbTQlKtKZ+TWqBfeoGQYzilvHC87KnUlUAf9Lt/g//rUJpRRiOF1rDQPuz0ERePHuElBWxNfMStU5ImStsE3HpN/0u2tiEn1f+mVDtqsotPPONQew7oddCEC8gMPHIyNjp4pyMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSbtpYDksbp9uNqU9npPybmnXmsS1XUTbBGL3WE/teI=;
 b=Kzy9MZBm3j70+jWdxpi2wnOOVkbz3g4TgnUi7y5lehElSYEB/7kNtTQjdzwi4kRUYGp+O3OjJjFlurFhZyih1l91s5HFFJYzTmXIa9iDL+CLK3fqTyFwqF8XIIUeMXua1xK5JSURR8HpmXCtoO7CR8R0ek1ycmKFNEW8ReBU99I=
Received: from CH0PR13MB5084.namprd13.prod.outlook.com (2603:10b6:610:111::7)
 by SJ2PR13MB6168.namprd13.prod.outlook.com (2603:10b6:a03:4fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:37:24 +0000
Received: from CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::67bb:bacd:2321:1ecb]) by CH0PR13MB5084.namprd13.prod.outlook.com
 ([fe80::67bb:bacd:2321:1ecb%3]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 13:37:24 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "jlayton@kernel.org" <jlayton@kernel.org>, "chuck.lever@oracle.com"
	<chuck.lever@oracle.com>
CC: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the nfsd tree with the nfs tree
Thread-Topic: linux-next: manual merge of the nfsd tree with the nfs tree
Thread-Index: AQHbmeUbltwc6TnYVEuNGJIhszaczbN9l4UAgAABcYA=
Date: Fri, 21 Mar 2025 13:37:24 +0000
Message-ID: <c4d6be529fb349f43b853ab701c5ebc70bfe43d6.camel@hammerspace.com>
References: <20250321091151.2fd07db3@canb.auug.org.au>
	 <0c875429-1245-41b7-8573-6b011eb4d923@oracle.com>
In-Reply-To: <0c875429-1245-41b7-8573-6b011eb4d923@oracle.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hammerspace.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR13MB5084:EE_|SJ2PR13MB6168:EE_
x-ms-office365-filtering-correlation-id: b7cda802-8b83-4c7c-d5ac-08dd687d838e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U05ob1poWllLQzU2Mm5hdjFSamw5ZEZzRFIrUHdYaGx5dUlYMlRMeXdaQ0lQ?=
 =?utf-8?B?ZjR4YWRVaVV2U0tXeitXczF3TkgzMkJJYUlqbEhhZnJpbll3c3pENkF4eXFO?=
 =?utf-8?B?TzZxQ1lVQWJKTTZYSXlNTVZiOGkvMC9MQW5kNGhrdUozaHhUVXdsS0x0K3di?=
 =?utf-8?B?ak1Sb21Ra3I2UnBvSUlUZy9MRWRLSUJnVHVWQ3A0RmZSL3NianpCWnRBUWk1?=
 =?utf-8?B?aTRPcHNvamtXdWpFNVM1TjlqRC90b1M4YkZiZlBsUFc4WFF2NWJqdHMvNk5s?=
 =?utf-8?B?R0FvWVZnV3FCYzZKcnJ6ODFwaWxEdG9Gek5pV1JGd21RbnRhQlFMckFZQllC?=
 =?utf-8?B?RzQ3NlMyaTdwSS90d2JSR0d6QTZIT1o4YkxiaUgxS3BJRTJtYi8yU0RleEVn?=
 =?utf-8?B?cHlkSldkNU5aaWIyNzJmSWtkRDJYbWhhT2laaFBHaVBCQVVWN1lDY0MycnNW?=
 =?utf-8?B?RUVTay82NUdyZnllMElLb2F3TDZ6U3VMLzlZdjNzcnU0bnEybGdRRFJBeE1C?=
 =?utf-8?B?TWd3ZGFaaCsvS2NoOS92aDh1Q2VCcTE3ZFNXUTV6bS9RR09MVUV2cHpZU1Vq?=
 =?utf-8?B?MVZ5b213Z3J3dnh3SEMzMFRnK2NTTGd3OUlzTnlUSkpQdkxDbENOOFJSVFJC?=
 =?utf-8?B?a3oyQ2RXaDBFYVJMWks0MFFhWklUMEJERTZRUGNlajliSXMvaHJIZ1NXeTg3?=
 =?utf-8?B?N0Z2VGJvc1d6NlZRdjBXTUJGWk9VcndMN1pWbVdRN1NMbHBzZXBld1lUVGV4?=
 =?utf-8?B?NkpFTTNpcTFFR3puenZXZzNSSVdTZXZzS1IzeXBVN0N3R0s1TU5rc0wzaGFV?=
 =?utf-8?B?UTYvZ0xsb1g4YlFMQXRva2kyZ09jS2I3VWJxODN1bVZQR09leDh2T2VET3g0?=
 =?utf-8?B?MGVvRS8zMGxHaEVvRlpNTzhpNTdBN0FGQTFJa1ViaEtFTmhrMXVBVmZ1QVdM?=
 =?utf-8?B?VnNXMXdvQnp3cGhiK1lpVnZjNGdPMDhQckwzSVFVcnQrNFRNNEp2RXQxZ2gv?=
 =?utf-8?B?NFFzaTZNK3pPelllT012UFlHcW9kVjlNRFhZOXlTaGxzVHdPMHhlL2VWdXpw?=
 =?utf-8?B?R2VLOVhycHpIbXl6dUU2TWw0eTByN3VqYndnZUx2SjB1QVNuUjcvdGZYbTBG?=
 =?utf-8?B?T1lZWG1QQzFMZmxXUTFzOTZXdVFSL05pOE9qUW1CeGx5WEtkMGhMcUVsQWJK?=
 =?utf-8?B?MDFtbUg1eTFsYzFuSTRXVytmR21LclhwSmtJdVlIdkJuRGxtYWttci9tU25G?=
 =?utf-8?B?ejNtS2xEVE82bWhXMGUvSytzOTRRdkJFN1liKysrT2hMazAzOEtqaTNXOVRo?=
 =?utf-8?B?RXpDeE9VZXJUMU5tSTFPakk5KzdaNDBwSEcybEpHUnUrYlpmRmtOSnkxSzE5?=
 =?utf-8?B?d3dsbUw0RjB6aW9ZdW1KZUJVaE9OeThjTmIrMWt4cXphU1ROb25SSUw1ZVpH?=
 =?utf-8?B?YnRjYXA5ZCtPNmlYckRrK1h4dDZjZHhpY25jd0VoU3MwQ24zbWNTYWxkWGp6?=
 =?utf-8?B?WitGWTVjc1dtekZZdDVTT3FBU2FkZS9mQXBGWmp2TTlQZ2ZZbFdBeVJkTU00?=
 =?utf-8?B?NEpUVTIwK1pUVExaKzFGTStDV01LZEdoTTk2YXFTdm9oSmVNMXN0Uko4QnBa?=
 =?utf-8?B?Z1VDTW1wMzl4UG5qc2dRcktHcmw0TjIzbzNCazVub2o1VUlBMWVSYk81bGdp?=
 =?utf-8?B?eHdKMGIvbEJlVWUvZFM5bDlBK3FwNCtkKzVrT0hPZmxqZ0ZJeUhsU1AzWHlr?=
 =?utf-8?B?dVdXMWo3bzRQcFA3VG9oNm91eUtESGRXbjBVd0hHb29abU9nTU1NR0xPOGFl?=
 =?utf-8?B?bS9pcXY0ZDhaYTRtMG9MUUpXTnZQbUNuaTgwck5ub2pEUFV3dzBMTnk0a2FN?=
 =?utf-8?B?NU45T01LWlpCTnRpaFc4MW5yRm10LzFnY291TjFXbktERUFuTHRnMHB3WlEw?=
 =?utf-8?B?SThDZ0xBNWU1bXBaaVduNElqVGNPZTNjdWJUUUFBUnpTMzlNc0dpRDlRcy9v?=
 =?utf-8?B?MUdubWtzeE1RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR13MB5084.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzcwSm1BSjZnQzcrd0k2WEZNM04yZFZOZFE3ZWU3MGNtR2RvcFNmdFptdWpF?=
 =?utf-8?B?amNvY3p1VE1PbDdLbGpka3cxQ3loaFlCZlZha1EvZXhIOVYyNk14T3ZVNWtR?=
 =?utf-8?B?VU9IQS9XUnR1VmI1RzdQRnk3cmRLcXhzNHN3bklRYmFRMlM5RlFjZkVHUmpJ?=
 =?utf-8?B?cGdjbGJHQmxiNUNDZ3F5bFpnVVdmdmlGSlBOSFl6b2J4SzdaL25YZkRLSjJS?=
 =?utf-8?B?eEd5NDRHZ2FsbWRIaXRCcnQzWlZQZmVqbUtYQTFWeUt4eVFkT083V0VUVXBs?=
 =?utf-8?B?VXBaZkxxWnhYRXpqZFV6NjlWTHd3MmJqNGRYQTloMElOQWU2R2hpMGVYTk1h?=
 =?utf-8?B?REFLZmhZTWFqM1VUSGFUYmFtR3FaMEZqM3EyYW12Q200YW1IMXlmRzVEWU1p?=
 =?utf-8?B?cS9MVThJb1VDc3lIQ251d2NjK3Zlb3QrNXM2TllXazhMREFENlp2cWZsUDRk?=
 =?utf-8?B?UXAwUTFIUXAyYm1iYjkraXl5SW50WXZNb0hxS3Zta0R3dWZBcllENURYRTc2?=
 =?utf-8?B?S09Sc3h0NFZYcGFhdHkrdXkvNUt6MEdXZml6eE53aTRpNUc2R0xRR0ozakJ6?=
 =?utf-8?B?azNPcVh5OFNIUnA5dlMwS09BaXc5VlBOcVFtTVdETWZacVUyZW05RUFkRHJo?=
 =?utf-8?B?THNPTUlIYUJHTHhUV0Q1Y1hSTTFUazBwcytyV2NuZnE5S1R5WG9vN3lhMGdj?=
 =?utf-8?B?MGIxZ2lPaG5SZG4rZklZWEVGMWhUd1htSlFRNmxKWWZQcVViUitpUEVnaWk4?=
 =?utf-8?B?aGRRdWlZaXVyL1VucTUxT09uVVBSU01ieGpVQXhHT0tFTzJZclVQQmNPc2pn?=
 =?utf-8?B?dzZ6N3A1S1BGQm52OXYwOE9lNFZmcW5sbHp4dkk2aFluUW9lRk1pMnFUR2F4?=
 =?utf-8?B?OU9Gd3I4U1BHNTEyYkpGSkNGNFRyZmV4akxHaWJwclF5Um01ZmtBTG81dzFp?=
 =?utf-8?B?TnQycVQ5WkR1dkhiSG5IS01LUURvbzVJMU9RMjhxR0VaLzRyR1dXWUVIQ3k3?=
 =?utf-8?B?YlJ4SSt5S1FzaVlFT0Q5RFVJMEJLMXYwZGpVVE5VNVg5YU5ZaWduYUljSER4?=
 =?utf-8?B?NkhSOE1yWUttdnVKa20yY21rUG9hK1A3TEpvbythSmVsbXFJOGkvdUZQei91?=
 =?utf-8?B?Mmw1VlFaUC9kQlBDaFR2RWhtU2Y3bmVvK0RpSnNhZzh1UjFldDNUK3lYRnBU?=
 =?utf-8?B?USt4UnF2aDAzVGZKVTUzL0JmMnRPSjZkTWl0eXBDV0VLWmVaMWhrc1FUWUts?=
 =?utf-8?B?eHlNN0JlRkg4ZnVmK2h6Tm8vUGNPU3A2SE9DSThHMmxoWDhrUzZOSk5YQ0xx?=
 =?utf-8?B?R2dJUHJ2c0xuSDBpcHVSWXVTNm1WVUNSc0VidGg3V1hxdWdDUTM3RkQ4all4?=
 =?utf-8?B?WUFaT2hVTlM2RStZTDkwdC9nYjhpVzZyS2N3V3gyclNtaUtEaE44U0ZPdTFG?=
 =?utf-8?B?cHhOVHhyM1dUcFVIbDRBbGllTEZxZk4wWTNib2g2Wm9xT0hzSVRSUzRObnoz?=
 =?utf-8?B?a3ZTVnA4cnpGc01USW91eGlwUlg1czdRZE5RWGxiTC96Y0srbHJkSUVNVUdF?=
 =?utf-8?B?REVkSFRiM1grbndPeUpuWjgwclNKTENGVVZxeHNOa3BPWUVXVFo3eUloWGp1?=
 =?utf-8?B?V3FNNUM1OHAzM2xHRTJzamhjRlpWQjJjbXdXcVh4YUJHbjFSY0RVR0JHN3ZG?=
 =?utf-8?B?TS8xanRwdVA5cjdTM3pmVWw4UEJtTzBwejd1M201SDdqWTczcUc1Qkd4UnVr?=
 =?utf-8?B?anZBSTRXc3pIUmZQRWtPRnlZUTJHUUcvbk1iYjRFV0k0R2ppM3QyNTByRTBs?=
 =?utf-8?B?SDY0SFRFRXV6NnE1QnFkaHI3RGNyOFRja3A3NDBXMVRQREVFMWFNaEFWUUpz?=
 =?utf-8?B?SGtLcHhtZlZQYUJGdmdoamlLalFqbzBkMzI2djN2M2lxN0JHVTk3amNMR1dT?=
 =?utf-8?B?WlpSZGluUFNCV0M1bElVVzJzN1lyT3pMVUIweE5aNHBCb0RWM25MeW1ITUNl?=
 =?utf-8?B?TWVhSVhpNS9ncnk1UTkwTHdXMXoyb0l0VkNQSi9jMUhyRHBNR0FkZFNPcGVI?=
 =?utf-8?B?ZnI5YlRMcFYwWkJPTit6b1NSNVE1ZTdYUGVDSTNFYjkvYkx2UFNoTVpnNXJM?=
 =?utf-8?B?d0w2aVJqb2FaNFl2UDZmK2VXejJsT0lseGtuZENzTm84NzZUYXJpTFowWHVK?=
 =?utf-8?B?N21ENmV1Z3U2RjcyYUMvR3UyTWlPNDZiS2JtYjdGazBINmNZNHVFWUR1aUJ0?=
 =?utf-8?B?K2trOFZWN0czOWNCamkrblMzZmxnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39D4AF68FDACF742A86F7FFD7ACA43E5@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR13MB5084.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cda802-8b83-4c7c-d5ac-08dd687d838e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 13:37:24.3273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1FDnhIykz5YLhPdPh7Ogu2oIJOqjIL2637lJCvCntT/3/WtiXmCdOW6IdacExu6cjSOAwoh8/y9mQ5uNJeCVRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR13MB6168

T24gRnJpLCAyMDI1LTAzLTIxIGF0IDA5OjMyIC0wNDAwLCBDaHVjayBMZXZlciB3cm90ZToNCj4g
T24gMy8yMC8yNSA2OjExIFBNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0KPiA+IEhpIGFsbCwN
Cj4gPiANCj4gPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhlIG5mc2QgdHJlZSBnb3Qg
YSBjb25mbGljdCBpbjoNCj4gPiANCj4gPiDCoCBmcy9uZnNkL25mczRjYWxsYmFjay5jDQo+ID4g
DQo+ID4gYmV0d2VlbiBjb21taXQ6DQo+ID4gDQo+ID4gwqAgMTFhMTQ5ZTA5ZDU4ICgic3VucnBj
OiBtYWtlIHJwY19yZXN0YXJ0X2NhbGwoKSBhbmQNCj4gPiBycGNfcmVzdGFydF9jYWxsX3ByZXBh
cmUoKSB2b2lkIHJldHVybiIpDQo+ID4gDQo+ID4gZnJvbSB0aGUgbmZzIHRyZWUgYW5kIGNvbW1p
dHM6DQo+ID4gDQo+ID4gwqAgNmMxY2VmYjg0YjNkICgibmZzZDogbGlmdCBORlN2NC4wIGhhbmRs
aW5nIG91dCBvZg0KPiA+IG5mc2Q0X2NiX3NlcXVlbmNlX2RvbmUoKSIpDQo+ID4gwqAgZjA0OTkx
MWI1Yjk4ICgibmZzZDogb25seSBjaGVjayBSUENfU0lHTkFMTEVEKCkgd2hlbiByZXN0YXJ0aW5n
DQo+ID4gcnBjX3Rhc2siKQ0KPiA+IA0KPiA+IGZyb20gdGhlIG5mc2QgdHJlZS4NCj4gPiANCj4g
PiBJIGZpeGVkIGl0IHVwIChzZWUgYmVsb3cpIGFuZCBjYW4gY2FycnkgdGhlIGZpeCBhcyBuZWNl
c3NhcnkuIFRoaXMNCj4gPiBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5leHQgaXMgY29u
Y2VybmVkLCBidXQgYW55IG5vbiB0cml2aWFsDQo+ID4gY29uZmxpY3RzIHNob3VsZCBiZSBtZW50
aW9uZWQgdG8geW91ciB1cHN0cmVhbSBtYWludGFpbmVyIHdoZW4geW91cg0KPiA+IHRyZWUNCj4g
PiBpcyBzdWJtaXR0ZWQgZm9yIG1lcmdpbmcuwqAgWW91IG1heSBhbHNvIHdhbnQgdG8gY29uc2lk
ZXINCj4gPiBjb29wZXJhdGluZw0KPiA+IHdpdGggdGhlIG1haW50YWluZXIgb2YgdGhlIGNvbmZs
aWN0aW5nIHRyZWUgdG8gbWluaW1pc2UgYW55DQo+ID4gcGFydGljdWxhcmx5DQo+ID4gY29tcGxl
eCBjb25mbGljdHMuDQo+IA0KPiBTaW5jZSAxMWExNDllMDlkNTggaXMgb25seSBjbGVhbiB1cCwg
SSBwcmVmZXIgdGhhdCBpdCBiZSBkcm9wcGVkIGZyb20NCj4gdGhlIG5mcyB0cmVlIHVudGlsIHY2
LjE2LiBUcm9uZCwgaWYgeW91IGRvbid0IHdhbnQgdG8gZG8gdGhhdCwgdGhlbiBJDQo+IGNhbiBp
bmNsdWRlIGEgbWVyZ2UgY29uZmxpY3Qgbm90aWNlIGluIG15IHB1bGwgcmVxdWVzdCBmb3IgdjYu
MTUuDQo+IA0KPiANCg0KUmVtb3ZlZCBhbmQgcmViYXNlZC4NCg0KLS0gDQpUcm9uZCBNeWtsZWJ1
c3QNCkxpbnV4IE5GUyBjbGllbnQgbWFpbnRhaW5lciwgSGFtbWVyc3BhY2UNCnRyb25kLm15a2xl
YnVzdEBoYW1tZXJzcGFjZS5jb20NCg0KDQo=

