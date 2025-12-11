Return-Path: <linux-next+bounces-9390-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E78CB6B9E
	for <lists+linux-next@lfdr.de>; Thu, 11 Dec 2025 18:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38A26301103A
	for <lists+linux-next@lfdr.de>; Thu, 11 Dec 2025 17:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23FB264F9C;
	Thu, 11 Dec 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="s3m8ZQT4";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RwH5lzQ3"
X-Original-To: linux-next@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6CB32ED32;
	Thu, 11 Dec 2025 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765474125; cv=fail; b=KkwoN4WZcxmSJMY+jB82rQrqrtq2ffwL35APb1oLIseD3RW50ty7x+gaYRTj6EgBbSQdzQkbbaimy/+HZboIAckyUQLqQjrkSOIjkF7y+1XhmQ9+LfLG8+AMdddO3BkyDlsTcLuaggby4gaOn7vfDGynMpPy1gGkVDifIYSImVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765474125; c=relaxed/simple;
	bh=jxutgAo+Uy3rtVcb8vrWB0vSBEHPRSvbk+og1/Q7Zu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XCVrIojYqug5wunkmEvB1m6Tgw+AONh1q4Oqojl6tzR3sxPeJwswtpOUQUOX/WGtsX2jWjvKBDon2s/8l8Pj5Gv79sXPHjvjhF42qJitLHD7TSUiR0BkNOBPJ9hJJHlS/AUhHUlEuzKBr/9tH3EVg6cWYwgEkIAOjHLEryTnVVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=s3m8ZQT4; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=RwH5lzQ3; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d42fa572d6b611f0b2bf0b349165d6e0-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jxutgAo+Uy3rtVcb8vrWB0vSBEHPRSvbk+og1/Q7Zu4=;
	b=s3m8ZQT4Fos8MdZRxr7Yd9YvTbtxruB1E7XtTixCkKDfiFlTKdtb4DoXmJrhb8+hADEAB+wmnFRyecZGKnWOo0cUf/r6h//d+idow14CUUZ71uk3P/uLZlLXIzgJFm84pRTzcYY4hNaJc3d07TVdDUmeMXiLzx+nLq1E5xwVFEM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6bdcfd2d-febe-4a9d-aea7-f6d18eb3f8ed,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:7b7d56c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d42fa572d6b611f0b2bf0b349165d6e0-20251212
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1166583332; Fri, 12 Dec 2025 01:28:38 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 01:28:36 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 01:28:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBOf2e+JNb/PsZpZslewaC57GzTSWIl7xCs8JXbdke0EdWarDuq395mTx6L35AC+v54Et+EI23qAEroExC4ZikJ7L9QqbKhA070ak/zQImthvoQcEq75aOvFVp3ICNVBQqpt8ChHumpb6irB8RLkDDksQeY449VRwLnZ3EiNkjIFQspaCkH97KTdFh2uoVPcNiBoaWc+6BiJA5So28TDCN7W3BVWdSxMdeT3/itVCF+gX0AnqWhF0Vj6RngWyDW8R92Mrur8e+iPwUFzWYZ9SbBEUvuBqyrUVH0pbSxuN+VBvEPJ5pHVW3KLpLUq/4Jbdh9W+K5EtIkJ1AtzRstTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxutgAo+Uy3rtVcb8vrWB0vSBEHPRSvbk+og1/Q7Zu4=;
 b=tPah4kqfZlyHjdKHSlcndogwDNGDEdIBNA9xzsEDg00u2mX6v3Dg+/Eu1W/NXyff8IfgZ6D40WHuaTLpnkoVhA83d0iApZqtOw4SfeLEOaI50yzToCSE+KsvRcjoRknqI5IJcWpBSmo96L7PQjXtkSBRk8XgXIkLNOlKJsQs6GojR5PCFQsle9d/YCXGlkXTYMr7iPNsQnQZW5+BXVDXbOe0bEPMtld3Oa1H2CthwQMC3L6ijPguadq2rBzj6yx9V26v1DIlPxEx0rw32c21x0VrGr8szpkcIBP61/zXnXb6OUge9oWLiL62n8aQgK5H937hTEfF4ahcgB8mqDMvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxutgAo+Uy3rtVcb8vrWB0vSBEHPRSvbk+og1/Q7Zu4=;
 b=RwH5lzQ3mtal0eHVcuoFLabafG2DgH29eMgZBp/FqfdNTdY8pbScCi3FzfJTbwf4ob0dmzvnodHk8AehN5gV+6IQe8fi3BRzB9mIXdfv9YBTMmpTX5u45harp+YQJAbYTtA7kdGaEODZ9N3w9dAUhUpYx/SqB89epYb48n3a7YA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7575.apcprd03.prod.outlook.com (2603:1096:400:423::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 17:28:32 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 17:28:31 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mailbox tree
Thread-Topic: linux-next: build failure after merge of the mailbox tree
Thread-Index: AQHcajFrZpLe7kR/KUSI+w+O98RhkLUcsr8A
Date: Thu, 11 Dec 2025 17:28:31 +0000
Message-ID: <3d2904869ac67226d57d633077c7309cc5b9310a.camel@mediatek.com>
References: <20251211104903.24a16b29@canb.auug.org.au>
	 <CABb+yY0FJnunhxmapSXqZ=R_XeLOZkjUZLCRyt9s1zDhzFR7Hw@mail.gmail.com>
In-Reply-To: <CABb+yY0FJnunhxmapSXqZ=R_XeLOZkjUZLCRyt9s1zDhzFR7Hw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7575:EE_
x-ms-office365-filtering-correlation-id: 2241d84b-6611-4f2b-9fd9-08de38dab4a0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZmRpV2FOc3dWd2hXcmNqU0I2TUNwekg5VnNrazJLK2lBK0NCVG1raG93TVh6?=
 =?utf-8?B?RDF2RjZ4dlowSVRJMUdJYmtVZzNuVmtCbUp0UVQvL2ZxSVdiRW11L2xsbE8v?=
 =?utf-8?B?bGVYaEVBaUtvclVvb2w0azA5STdNYTRrN1BISEkvdk1Oa0NNTW5WUVZXZXJ3?=
 =?utf-8?B?dlJCZld2N2QvYkRWRURmZWFnajdIa3FDTmJjTy9FbWV1MVFocGhLenpXMWZX?=
 =?utf-8?B?aFFHOWtYZ1h5c2tYQ21qdHZ1UWRyVUdySFp4RytuQUxTWmRSNSszeUhSV3RK?=
 =?utf-8?B?Si92dE5JTzBJL3hJMlg5RWFHU1FzUUlJMWxkR2kyMU9wVXZPZlpab2Rzb3FR?=
 =?utf-8?B?dVZqT0o5aTI5Znh6SjU1ZmIxMWszVmc3dGtIbXZMS2hzY0NIMnpEMHdDTUVB?=
 =?utf-8?B?emlRZmV3djNRSThWWmtZSkVSK3FBTGZNVXB0WFc5MCtKZ1RLV1pXS0o2MHA1?=
 =?utf-8?B?bjNDRWlCVkRZNnhYL1Q0Vm05Tjlnb1o5eFBBbEZ4RGNZdnhuWXJqQmNQeUl4?=
 =?utf-8?B?UUI3MTMxTnNYQ1dKR1U4MnhST0lObEVZRFZFdU9OMnN5VlBkTUxrMDh1Wm5V?=
 =?utf-8?B?Uk1jc1Fkc2RBTUd2bURKR2Fka3A4UGYySVk5Z0R4MmxlTFZ5cUVXY3N5cXp0?=
 =?utf-8?B?ZGlQckdhUU5lVTBWVkJqQlpucWFLOFVZbEZBb2k1eEh0NFErOWtOZG9tTHVz?=
 =?utf-8?B?aVFaRk1zdThRaWJpR29zMmRxR0ZnZEh1YjFBby9yTE9wVDhTZFBCbzk5TXVs?=
 =?utf-8?B?TG5MOWxaZFRuc0YybTduN2k5ejVaR0dqbWtmTTFFRmxiM1VOY2pSR2VCeVd5?=
 =?utf-8?B?YnpjazEwMlZaMHN6empIWnNTZHhWL2UvbTJmWFdKbThiclBYREtKNkRTc0FT?=
 =?utf-8?B?eFFMZTYrS1BCUW5yYW1XbUQ2WnhFaGl0M2Z6ZVFuZjRKeG1xeVVTSzVvNE1v?=
 =?utf-8?B?QXNDTDV4M0JVU0ZMdUhRMktkMHlPM2hqTUdDYzg2SXNQdWFuQkovZE9lTmdh?=
 =?utf-8?B?K1FnRHRFS0g2WnVSeDh4RkxCclpjR1hIYWluZEZnWEtvS21LM1UvZ0NLN2ZV?=
 =?utf-8?B?Nm4rN1lZMjdXTTFpaHo1OFNJZDZoeWVuZG9LdkUxa2ExaXFKZ2pTRDZuSjJQ?=
 =?utf-8?B?Z0YvQ0F1VlRndVppaUZOWmlpZmI3ZFM3bkJpQUZKZUw2RFg2Z085VzhnNHBj?=
 =?utf-8?B?eXBaUElsbVhqQjdhMS9uVE1Fc2F1TDMrS09QL1p6dnJ6M1g2QTUxQjhRTlZs?=
 =?utf-8?B?bTh3LzNIdHpYdVR5Q3ZqRjUrKzY1YnZwWU9icCtDMUtIL0tBQjdacUZQS0NK?=
 =?utf-8?B?cHZEdEsvdGsvOCs2cElDWFFSbkMzMDgyaHltdGxjM0VGRnIxeEFuVDduajIw?=
 =?utf-8?B?MHFDcDRkSjlDbHUvNGxaMmYxQXpZYmFoVUVQWHkvR2E2VDJzZDJudWprZ3VT?=
 =?utf-8?B?YkRXaUhLcE96TUY0VkFEZGx0ekZTQU5CNXBWZi9zYjkzNmxmWVA4NlM3N0xQ?=
 =?utf-8?B?TDAxSTJnQlk1Q2dDejdrb0JTRmhVOXFNaTVKNm9qZHZxblRXY0hXYVR3VWpX?=
 =?utf-8?B?ZUdVQnZvVUZNYmlDYTVhNWhjTkkxMFpmd2w5a3RCYlcvd2pvbDQ0aStKYThD?=
 =?utf-8?B?ZU8rcm53MGpTOXB1S0plcW1MeW1QNFQrNTNjZG1BU1JYalFBemowNzJnMmRk?=
 =?utf-8?B?RC9vaDZKaThmaWh4QWZqUmJpWFRhVFlOSEpnSlI2ZDMzWE9IL3ZkdGdQaFc4?=
 =?utf-8?B?ck1wVUNzZFgzV3VjRDlMSk9NTEFpUy9pQVdnR0IyMkpFTlpvVzEzazArTjFx?=
 =?utf-8?B?KzVJdTlxZ3Z5dHBTMG54ODE2M0FUOElwYXdRN1YyRkJTV3JzaVVZdm9yQlIv?=
 =?utf-8?B?V3c1dTU2L29pWmllbDN5eVJzRnpXc29wZlh5NG1TQXpFZHVTallBZXllbGlH?=
 =?utf-8?B?ZGkxYitvMTBlTmRwaTNGb2M3OU8xak5RdXk1VEdTaCtTZGlwUVZGWXhKTjRo?=
 =?utf-8?B?WUJFN0ZVa0FNeG81Nzc0c3JyK1p3dU9jdmxkMTZzSU05NWRpMkdKQTVBNUh2?=
 =?utf-8?B?d25wNjFDTmtRYzEvWWVVaWNaaUNBODVqNHg0Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck14bEFuQmdDSkN3alRSWGJKY0tlb2l2WXhsUG1yRUNCZ1NqdzFGL1N4TlFE?=
 =?utf-8?B?djNJNWZZZGlYYnZmWW9jNVVXbDFJQXpBcWhZVmo1UFNhSVNsamZ1UXh3aERU?=
 =?utf-8?B?SC9KWkZoYmw5L2ZQa3dNN1FHVTdUaWhpWk1POFArdTlNcGRqYUNja0dDRGJQ?=
 =?utf-8?B?c2JRU2JYOXVWU3VYZEpmVVd1S1V1R2owY0lmRE5DeDdMM2dxaFNxdWtwQk5S?=
 =?utf-8?B?WUQ1NmRLQjhRbG5wdFVVMmxQMk1PS3dnemJOZnVVYWFtMXA3ZkNVZFNKcFkr?=
 =?utf-8?B?NERsbG5QOWRIVk53YjFuWWtTL3g4eFlUMW9jNWd1Umhicm0zaElzUEpJVkFP?=
 =?utf-8?B?d3FMNFEyeEVHSzlwZ3hJZGM2NDJOdzZtd2VEUzFKeHVDUnhCVzVMZEdQTEFC?=
 =?utf-8?B?MUFZVTg2NTVTVThCdjJxazhmVVRZL00rZTFzT3JIY3hteXowd1ZqTmV6N3hn?=
 =?utf-8?B?TE5GZHRRNzduS0pzSWw5eW1FVDNKSmNCaVYwbWJXTEErWlZIVlBKenF3ZXEy?=
 =?utf-8?B?c2psVjdxWStpTjB1RGFMVmtWUWJKSUtXVU5weDhDVHgwbTMxU0VCZGdUUjgr?=
 =?utf-8?B?WmptU0hSZnk4SDVJVUl1Z3hDRmtybnc0RVZRN3htQkZZcGo1TW5qUFU5MTNl?=
 =?utf-8?B?S1NMSHJjR1VRK3VxMHdMUmlJV25tUXRlMnd4ZDVHSWZaNHZZOU9WMW43ZldT?=
 =?utf-8?B?SExoNmF1WnI5VncyaGtGS3hIbGtWcWhkQnRnbWNZYWdEanlYTlFWWE82RlJO?=
 =?utf-8?B?Z0FkblAwa1RjVm80L2Y0bkxHWG5RTWpFQUtleUVLelFUN3Z5aXpCYmNUQkZY?=
 =?utf-8?B?Yk1yanMxOFlTdGk5dTFNU3NtN0JrSDZSKzcwZXZhRDFCNXp2TFJ4NkZPb0V4?=
 =?utf-8?B?Y3hwc1VtZGdvanNMZXhzRkRLeGJEdUk3R3ZpaXpsMDBldVlrSjg5LzlzcVlQ?=
 =?utf-8?B?NFFBS21sWEVTY0owUHgweVB3azdQQ2tKR2ZESUd0MVBZem04NHlmRUlPaS8y?=
 =?utf-8?B?WWxCclhReVIzUHplRXdXb0J1cVZERzJNOVB5dmlMdmNVczArNk5Ib2oxWkJB?=
 =?utf-8?B?bjFJRlNmcXVtYnUrVm5DYUpMZmtJTjdjYWh5WUlncmovQXRIUlkzbjhocytl?=
 =?utf-8?B?TnJHTmN4MmZDclJicjMzNDFKL1BOSmkwSHJhV3h5eEF2RTZuT0tUY3czazZy?=
 =?utf-8?B?NUo4QnEzblFoRUVSN3AwdzBsSFRvR1pRclUwd3J3aGdZNExPMndjYzBQN2M3?=
 =?utf-8?B?M0U5bzNFU0FLZWx6MXFQb09aVCtBOU5DMHhFRitJczF0QnlGVWpGTjZSNzhl?=
 =?utf-8?B?OXl5Vnl4NE5udWNXRk8wSUVYcGJPdUNQMU5JNlZ3bXN4bHE1dk1LQ0JDM3dw?=
 =?utf-8?B?OE5aeHQ5dGEyVm83d1I0a2JhT1ZZa0NxYml2L09UQ1p2YkxCK0t2cjNlaW5Q?=
 =?utf-8?B?OXFFeEpISHFjSENYNmJ1V1NTNTBKV1BEb1czNEpHVGh3b1lZZUFFUUNVa3Bv?=
 =?utf-8?B?WmYrNzk1aUVGd2I5bjNZY2ZYN0JRUUFLK3lVNE1MQllPSkFsRXdyUFZqY2l3?=
 =?utf-8?B?THViTkNiWlR1RDdNK0R4N0NVQ0NxeFNpRWEyWGtEQUphdnhJWjRhN2xaUk44?=
 =?utf-8?B?UHA2N25sdmZPelZXWnBnc202V0Y1NzR1c2taOTh2NTlxODZSb0IxWVVNK2Vr?=
 =?utf-8?B?TWN0cS94ZnRDQ0NpQ0hMZERaeHZrR09SRFMxUWVGcUlXSFQ5NTN0R2UydjRW?=
 =?utf-8?B?MEZtaW9RNVIxV1FIRWo4Z0dFY0tzd2RMSDI3VnhxOGgyUE1XYkZySlI5NTcx?=
 =?utf-8?B?aE82c1BJd2ViQUhFcW1MYUJrbW15RXRCRGptNjRJdU95WTBPcytlMWVsdi9P?=
 =?utf-8?B?cVBaK1NSSG1PZVlKQXcrL2Y0b3pBWnZNa1V3YWtVS3g2TlJBY3dhdlBxeVVk?=
 =?utf-8?B?Nmt0d2g2SzJEVzhGQW53dzcwZVlLbGJmWFZIeTlzMXQ1R2ZUTWYyRlZDWE1q?=
 =?utf-8?B?dkhaRVhIaHFXMHhpYzJ3S1lGV0VlTEVBVzRrSm8xWVcvbERDaFFsZE9nWmw3?=
 =?utf-8?B?bHI3U1Nrc3RlTWkxZTBXMVUxWWdsOFQrSnVaQmNPRFErT0E2TDBBbmtubVMw?=
 =?utf-8?B?RFM2bUplcUVXZEptc1hQSEZjSWNhdDNQR3FQZ3c3Zm4wbXhkb0VEaXRjQWpa?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C746B7C3450A94D8D1E45D08630BBE8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2241d84b-6611-4f2b-9fd9-08de38dab4a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 17:28:31.7027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEZaKytKxsVbWxzWyKiRLNtJVvN8vf9yYS1kflbyVGAs07VtP6MlN6+GM84FZ8/7tSnPeLs/A6ISZW1Sfm51LMTsNklCMzeJtPfe6t5VGZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7575

T24gV2VkLCAyMDI1LTEyLTEwIGF0IDE4OjAxIC0wNjAwLCBKYXNzaSBCcmFyIHdyb3RlOg0KPiAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBPbiBXZWQsIERlYyAxMCwgMjAyNSBhdCA1OjQ54oCvUE0gU3RlcGhl
biBSb3Rod2VsbA0KPiA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyb3RlOg0KPiA+IA0KPiA+IEhp
IGFsbCwNCj4gPiANCj4gPiBBZnRlciBtZXJnaW5nIHRoZSBtYWlsYm94IHRyZWUsIHRvZGF5J3Mg
bGludXgtbmV4dCBidWlsZCAoeDg2XzY0DQo+ID4gYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0
aGlzOg0KPiA+IA0KPiA+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGst
bWRwMy1jb3JlLmM6IEluIGZ1bmN0aW9uDQo+ID4gJ21kcF9wcm9iZSc6DQo+ID4gZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYzozMTE6NDE6IGVycm9y
Og0KPiA+IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdjbWRxX2dldF9zaGlmdF9w
YScgWy1XaW1wbGljaXQtDQo+ID4gZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ID4gwqAgMzExIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZHAtPmNtZHFfc2hpZnRfcGFbaV0gPQ0K
PiA+IGNtZHFfZ2V0X3NoaWZ0X3BhKG1kcC0+Y21kcV9jbHRbaV0tPmNoYW4pOw0KPiA+IMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gDQo+
ID4gQ2F1c2VkIGJ5IGNvbW1pdA0KPiA+IA0KPiA+IMKgIGUxZmU5NzhhMDdjNyAoIm1haWxib3g6
IG10ay1jbWRxOiBSZW1vdmUgdW5zdWVkDQo+ID4gY21kcV9nZXRfc2hpZnRfcGEoKSIpDQo+ID4g
DQoNCkhpIEphc3NpLA0KDQo+IEphc29uLCBpc24ndCB5b3VyICJSZW1vdmUgc2hpZnRfcGEgZnJv
bSBDTURRIGp1bXAgZnVuY3Rpb25zIiBwYXRjaHNldA0KPiBwaWNrZWQgYWxyZWFkeT8NCg0KTm8s
IHNvYywgZHJtIGFuZCBtZHAzIG1haW50YWluZXJzIGhhdmUgbm90IHBpY2tlZCB0aGUgcGF0Y2hl
cyBiZWZvcmUNCnRoaXMgcGF0Y2guDQoNCj4gSWRlYWxseSB0aGlzIHBhdGNoIHNob3VsZCBoYXZl
IGdvbmUgaW4gdGhhdCBwYXRjaHNldC4gQnV0IGlmIHRoYXQgcHINCj4gd2lsbCBiZSBtZXJnZWQg
c29vbiwgbWF5YmUgSSBjYW4gaG9sZCBvZmYgbWluZS4gT3RoZXJ3aXNlLCBJIHdpbGwNCj4gZHJv
cA0KPiB0aGlzIHBhdGNoLg0KDQpQbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCwgYWZ0ZXIgYWxsIHBy
ZXZpb3VzIHNlcmllcyBoYXZlIGJlZW4gYXBwbGllZCBpbg0Kb3JkZXIuDQpTZXJpZXMgYXBwbGlj
YXRpb24gb3JkZXI6DQoxLiBbRml4ZXNdIFJlZmluZSBETUEgYWRkcmVzcyBoYW5kbGluZyBmb3Ig
dGhlIGNvbW1hbmQgYnVmZmVyDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMjIx
NzE4NDcuMzc5NDcwLTEtamFzb24tamgubGluQG1lZGlhdGVrLmNvbS8NCjIuIFtTZXJpZXMgMS80
XSBBZGQgR0NFIHN1cHBvcnQgZm9yIE1UODE5NiBhbmQgdXBkYXRlIENNRFEgQVBJcw0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDMxMTU1ODM4LjE2NTA4MzMtMS1qYXNvbi1qaC5s
aW5AbWVkaWF0ZWsuY29tLw0KMy4gW1NlcmllcyAyLzRdIE1pZ3JhdGUgc3Vic3lzdGVtcyB0byBu
ZXcgQ01EUSBBUElzDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMzExNjAzMDku
MTY1NDc2MS0xLWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQo0LiBbU2VyaWVzIDMvNF0gUmVt
b3ZlIHNoaWZ0X3BhIGZyb20gQ01EUSBqdW1wIGZ1bmN0aW9ucw0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjUxMDMxMTYwNzEyLjE2NTc4MTAtMS1qYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tLw0KNS4gW1NlcmllcyA0LzRdIFJlbW92ZSBkZXByZWNhdGVkIENNRFEgQVBJcyAoKioqdGhp
cyBwYXRjaCdzIHNlcmllcyoqKikNCg0KVGhhbmtzIQ0KDQotLS0NCg0KSGkgQW5nZWxvLCBDSywg
Tmljb2xhcywNCg0KQ2FuIHlvdSBoZWxwIHRvIGFwcGx5IHRoZSBwYXRjaGVzIGJlZm9yZSB0aGlz
IG9uZSBhbmQgc2VuZCB0aGUgcHVsbA0KcmVxdWVzdCBzb29uPw0KT3IgYXJlIHdlIHBsYW4gdG8g
YXBwbHkgdGhlbSBsYXRlciBhbmQgZHJvcCB0aGlzIHBhdGNoIGZvciBub3c/DQoNClJlZ2FyZHMs
DQpKYXNvbi1KSC5MaW4NCg0KPiANCj4gdGhhbmtzDQo+IC1KYXNzaQ0KDQo=

