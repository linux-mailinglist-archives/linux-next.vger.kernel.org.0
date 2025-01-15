Return-Path: <linux-next+bounces-5216-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93735A12255
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 12:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F1713A3C5A
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 11:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6EB1E7C38;
	Wed, 15 Jan 2025 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PSa8gtvb"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA47F23236B;
	Wed, 15 Jan 2025 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939909; cv=fail; b=jOKC6lDJ2u6a+eTeXrc8/jqPYKuL3JeekT6ePU6lYJEpeH9VvZwwHtUQ91UN0EUm99UksTTI8b9bJjrIN0oTzDMU8FjBdR0vTuxMgwqbBVVyC8xq2JPScc/t34WNXy8v+7qj4EHJQ2pUe77HRLB1S4ASJKRR/2p6v7c/yrQpHmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939909; c=relaxed/simple;
	bh=vYnBiErbjosO6WHdyrLHu+TKuIOBrhUQZWX5/yXxZek=;
	h=From:To:CC:Date:Message-ID:References:In-Reply-To:Content-Type:
	 MIME-Version:Subject; b=pQYNy89/ZImCEJeNeZ3y3I2yWEWrpxBt4gzDB3NURxAYPJ1wVeaj/9uRM7NvwDIgonAnv0XLWwR6LbNQ09XxoI7JJ2EG4jdoMIJbYwluZqg/NhOCp6N3KQXZIPyryMXEtOKJ0NTq6pmH5Vb2VVK5uh+ZAKAKMd7WFeweu1EO6Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zurich.ibm.com; spf=pass smtp.mailfrom=zurich.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PSa8gtvb; arc=fail smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zurich.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zurich.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ENaKTI009727;
	Wed, 15 Jan 2025 11:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vYnBiE
	rbjosO6WHdyrLHu+TKuIOBrhUQZWX5/yXxZek=; b=PSa8gtvbcrT0QhdB3/QefB
	8z/mgbYexp3xlkxsg23xqMbEK/SdcFr961Gad47LdUpMPbB5ayhyQ34ooESrjbOA
	qaqjVUdgkqR2cZLVzkZl5egqqsGtfTyZ9TGaOje28aEpd32tsiaN7C6OgC0pyuVD
	L2ENbxQudbBUshptUTcN4ojhM51mb27Pj8tQH7z5Vi843fgVy+9l/t4WwugjwzWy
	RsToJ5ycwQpXo5dBA1Bv9I6em8r00U8VYat6hjjRXiMa+D5I6xJdKcK1pMGf8xoO
	eCoDypWU/QTaxkztMapqP1Wsw9/kQLAH1aniI19GXR58cGogHJwDkAqF5OQ9q6Zw
	==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4461rbjct6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 11:17:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyDQ+rq4NxEKIfQsyTZMbKzkHpXZh87emxiTixqx18VVNassi3Adyr2jhdHlhKcPDFG7j7iO+WaCRC4uAVWrJozuIksoPQjQ8uM+4lKypz+vueVQlkwFvnMCwzGQhfWO1dIXvjXLnVQ2XIJ3Y0zdkfeOj2S1xifuMioeqz8yjrtBkB8gQVFLWW9AhX50wlHAkSEbrIglcA17/bSnD6glaJpCB+2x+zKOeEgc5JdFlrPxHJeKa/kiqcADcS7pXgHhfzOeDFKUOWpJBDsiW9kUN6NB6vlYkO2P+mQWLcM30oCHi6KRA1rz/ndF6TPCff/zwgj6dst9wRU1sxAIPKtdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYnBiErbjosO6WHdyrLHu+TKuIOBrhUQZWX5/yXxZek=;
 b=Zyvop+s5isptPzXjlkkdP/S0BjDwWg3cPaGGajswetNVqnlJmd5vip2wYuIWpJq118PkAQ27E5LTIxFCLgZS3gw4u36tee7qa8JnbmDdSeG8aBbZ25tdXvY1eQtRiF6C0CDz1SUujIROvdmJtDRckkt5yIdIFa4X/tIe/lSa+pLbEmTK+IxtVlbdAh1vk1tm16oSsxj2ZxTdRlj7A3+3E5NHgjRpDRjD9M7MewnNUZJ5z5BrwI/iIUCYGpUlfbzGA1VWSVHnOOZj1ihAVwioQt0nFSXiQuQETkG8G2qe0z4VOStHs8/CSsFqAolcoqfkQ92rJaqBd4w2zeAyv/6kQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zurich.ibm.com; dmarc=pass action=none
 header.from=zurich.ibm.com; dkim=pass header.d=zurich.ibm.com; arc=none
Received: from BN8PR15MB2513.namprd15.prod.outlook.com (2603:10b6:408:cc::30)
 by SA6PR15MB6570.namprd15.prod.outlook.com (2603:10b6:806:412::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:17:52 +0000
Received: from BN8PR15MB2513.namprd15.prod.outlook.com
 ([fe80::dd5e:86f1:8719:2f16]) by BN8PR15MB2513.namprd15.prod.outlook.com
 ([fe80::dd5e:86f1:8719:2f16%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:17:51 +0000
From: Bernard Metzler <BMT@zurich.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@nvidia.com>
CC: Junxian Huang <huangjunxian6@hisilicon.com>,
        Leon Romanovsky
	<leon@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yuyu Li
	<liyuyu6@huawei.com>
Thread-Topic: [EXTERNAL] Re: linux-next: manual merge of the rdma tree with
 Linus' tree
Thread-Index: AQHbZsWw3qPIhOOcB0KkmdjRXOM84rMWyKWAgAA2PgCAAAdHAIAAqFcg
Date: Wed, 15 Jan 2025 11:17:51 +0000
Message-ID:
 <BN8PR15MB25139C984234B4B7413D25F899192@BN8PR15MB2513.namprd15.prod.outlook.com>
References: <20250106111307.7d0f55ba@canb.auug.org.au>
	<20250114204828.GI5556@nvidia.com>	<20250115082721.732ba8d2@canb.auug.org.au>
	<20250115004130.GJ5556@nvidia.com> <20250115120732.4a210e37@canb.auug.org.au>
In-Reply-To: <20250115120732.4a210e37@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR15MB2513:EE_|SA6PR15MB6570:EE_
x-ms-office365-filtering-correlation-id: 0c6d0cf8-fb2e-40a3-5044-08dd35564050
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NnBlRTNFVDQrMTNlNS9iaVpac2k5UWRqdnUrckswd3YwWHdoS2FvZmZRMElV?=
 =?utf-8?B?amdma1hxRlZDWkhsMXNJMUNUMFoxbkk2TEpOWkIzOUt4ckgxL3FHY1dQWGJv?=
 =?utf-8?B?U3liN0lscVFrMzZVblVZN3ZBVkIvVEJlVUorZHBDcjN6WnBJak9pUTRTRzZI?=
 =?utf-8?B?cEJYSURLVUgzMVZwWUVXVmZrQkg1N1BrbGo3SFF6SFpIc3VWME4rUFpySDJr?=
 =?utf-8?B?QndUckNGY3ZQMkl2dGh6N2p5Z0Yva0VoOWI2NXRxRHJQQTFUWXJscEdadHNy?=
 =?utf-8?B?VVhrbzE3bXF6d1QrUjFObjZSbGtVaXFSWkNuUVR0cHRGdFRrR0t2WWVvUUk5?=
 =?utf-8?B?bE51SE0zRXFlUTFhUUhKcWZEQWNzQktjV3cvYW1VLzlIVW9wNGw0aWxKZU1v?=
 =?utf-8?B?TkJCd1V1RFVyN1NoaDluTnphbk1TVVRLTjRacTZzZm9iN1dKZ092T2Z5bkJB?=
 =?utf-8?B?VVVsZjFFaDlGZ28rdW96eHE3S2RiTmVkQ05zVmNCanczbUtDbHVuTVltYk9s?=
 =?utf-8?B?aHlQNjc2bUd6NnZMZ0JaU3FQYVdXVzdRUXcvb29iNkNJZWMrbFlCRHhFMmtl?=
 =?utf-8?B?OCtiY2hSU2NJM3ArRHhnQ1YxaTcvNjhtclNzZFBWRnNXcUlzWEhaVllvdStu?=
 =?utf-8?B?STNsaFhVOXR1WFZxSXVHSitKUlVUc0hoRjF1ZlA5cWxIeTFDUnJRc3pYTSts?=
 =?utf-8?B?R01JaEliTTkycjFFRUtHVzNvNm9ZN1crZG1hWjRYUHJ4NFVvWEFzcDVvOHBU?=
 =?utf-8?B?c2Q5TEZtVU9SSW16TFlrRXBBREozTFRzeUdLcG1NNFNSS0FVMEdib0VONnpm?=
 =?utf-8?B?RUVwa1ZJeEVnbUJlYWFTa05TREhOc0NJOTNpMDZPN2F1Z0JHRmlkN2sxTHc2?=
 =?utf-8?B?MjJBaFdkNkNkRmVOTFV3bHN1RjdsK1dlWkdOZk1vK2RyUHB6QVR6WnN0aGRX?=
 =?utf-8?B?Nm9meGxac2NDLytxQk56bDlPNEdtZ0xEMTJML0NHMy9aSGVNY3U0d3lEQmVy?=
 =?utf-8?B?SU8vRG5oUUdoeEErQVZhV2RaYjFjODQ1N28rZU9VKzdIQ2UwWDQ1MFQxUVpR?=
 =?utf-8?B?ZVV4NFV2WXNLbFhTandwdjZzVjFWMWRQY0hLZXFGNkJWdW5TT05MSEwzTk5Y?=
 =?utf-8?B?dkFMbDhoRU1TV0xuZDBYOVBZUmxJdFFUai9LL2NnTG9KcjdQWE9ZamJKT2Yy?=
 =?utf-8?B?UGluc1hmVmh6QTVxYk42cEtJNlV5cGNSUjQwVVVxcG9KRnN3Uk1aVzVFTGI2?=
 =?utf-8?B?QWcvOURpT3Ntait4ODk4Qk5WZUhvQmE3cWgzN1c1QUVxY0J1YUZlM29IVkkw?=
 =?utf-8?B?RDJuWUtWaE4rYUdFMjRrekltaStMak42WWVwV2RvMkc3d0hXYkNxSTBLZ3RY?=
 =?utf-8?B?Q3VYNFg3b0xYQlNaME5uaFRIVEY1WjZpSVpJa0JKMytDZ29CVnhReEVGQUxl?=
 =?utf-8?B?REl5eWtLa3JNRUttREF6OGh5Wm9UcWtCaDN2M2UwVm4xUnZoQ2Q0eVNWRXNC?=
 =?utf-8?B?aVpMQkdNZFplVUIrd3BONHVxWXh2VHB5TW84WENqZGFkNjAxdVUzMTdRd3lR?=
 =?utf-8?B?RWUrTjFMSDJXRlRiMTRiNklvMmE1dEpSalJ3RmxHbnBJMVlZRkdtM2xaUkdY?=
 =?utf-8?B?NkZJUVVQeithN1N3VS81a1EvWVZMUUhxeGFtelZocmtXV1I4bWhyWjV4dFNr?=
 =?utf-8?B?bkZoTFdibUhyQ0hXNDhRVmQ0VHlVZEdiaStqZW5xc0tmandwOU04ck9pM0Np?=
 =?utf-8?B?cmVna0ZKenpTOFJFYmZOR0t4R2wyYi9DNUNNV04xaWVHNHQ3alV6Rlc4VnVB?=
 =?utf-8?B?TThOY0Y0VVc5ODlYbUZ4bG1JTUZPWG9sZHF5WWhwM3dtQWRTdU5wRVIvN0Ey?=
 =?utf-8?B?aHVxMFdEaVYzVklvb1BwcjU3K3JNV0tSNVlRdEltVzY2VWZ3MFFHeitCZEFo?=
 =?utf-8?Q?iLFP9dgC0UTpKHegqAeWFec1mP0dKoiO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR15MB2513.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmI5OEJuNUo3bUxzWElBRXY5YVB6MWt1THJZYXl6SHVhMFUyWTROOExlaCty?=
 =?utf-8?B?N1hyNzUxUlFKeWdRT0ZlT012bzdjRGthNk94Nnc0TjBhb2xCSGhxTEsydG9W?=
 =?utf-8?B?MFNqM1ZEdDZFQlQrdTF4bXFGRlZRUU9LUndoZFJoenFISTI5cS9mN3RpcElL?=
 =?utf-8?B?T3hFeldDVXpLRWZrUmRrQTArQk04cHRzMW5SRUpzekFydmdBTGNYempXRTRD?=
 =?utf-8?B?QU1KRGNqdENMOXNnRG83dkswRE1JZktBcUFmL253ekJkekRya3RDVFBXN3R2?=
 =?utf-8?B?RDVSOS9Nd2Z5emIxenNlaGZ1OUcvelZwM04xcTRqVmhMQ0Q1YkhaV3QxWXJh?=
 =?utf-8?B?Z0YyZ2FyVjN3WXQ3MEMyZnhDMW5CM3BpMnJpdUxIWU54a0hnOURaZ3AvcjAy?=
 =?utf-8?B?Z3hwRFlETXpCS2MvdzluMVhSVkJDdnpWM1ltNEduYVppS3NpTWpZbFRoSG5G?=
 =?utf-8?B?dTRCcnltaTVlWjFOb09iakZiWUl4T1ZlSmVmWW9zcnJNZUlBaVFtcVFKd3Bq?=
 =?utf-8?B?Vm41UUNXSHZ0Yyt6NUFqSnBqVHcyWldhdktOQTJpUlVnRlRIOXorRFpIb2Nv?=
 =?utf-8?B?UW1yYjRLY3NITUdrMWJvaFlIWFVZWi96OVVuV2ZEV244dlFaTm1zMkF1MVJn?=
 =?utf-8?B?VHNEZ1lwYy9MRXpmSnMxcStBdWJKeDBCNkp5eXh1dk5YNmdnWlBJR015MWtT?=
 =?utf-8?B?TWZTbWlEMzFJWW94T0w1OVo1MmlYZjdTTzhRMURqYzVCRHJKbFZwRS92MlRO?=
 =?utf-8?B?ZmRENy96WjI3SWdnWEEralAzZTFYcG1pb2YyMzBydnlRK2NvTlhjRUhuSHRx?=
 =?utf-8?B?SlhjVFdXK2QxRzRKNTNLRlM5cEp2dzEvaXV2S2l5ZW50Q1NlNElpV2UxWUxV?=
 =?utf-8?B?YzdxdEZqbnhNVDgyczFZRlpmUGZKbHVtZ3Z1RG9xWU50OEJuRTh4cHpMc1hv?=
 =?utf-8?B?a0cwYllYWFVCenhJcitlbk1RWENWeUNWbDNNR2NOdll2L2FIa0hFTEh4MnJj?=
 =?utf-8?B?OG1xamZ2NzU2TGJxZThWZEpCNmVMUmdQaU1vVGd1QnVSeXd2NUJrUjkvUXFt?=
 =?utf-8?B?VTIwRHFxZVZIQlg1SjJHMWZZZW5nYlBjRmlRa0lMejF6NVU3Tzl5MzMrRlh0?=
 =?utf-8?B?b2JwSmp2NHVJVlkrZ2ZEbFhYTURGbXpBZHE3cWJQWWxsQ1pyU3BMY2N3akRt?=
 =?utf-8?B?N3lhYnVFUEJmcTBjMmh1MUljSUV1Q3U4QVhiSGJEVnVlK3lGUFRoTklIWTl5?=
 =?utf-8?B?R25WZHFJbkFBcDVlLzJUbU5aNndxSzd3TnlxV2NqemgwSS9OelNYTHNFZWR3?=
 =?utf-8?B?a09mbTFRU1pWWkpKRnpmTzdEQ3ZMeCt2UXBJNmdnT2U1bW1GYUoxdWxDaU1x?=
 =?utf-8?B?Yk9FbTNkZ3pjVFhEaVRyNldVZ0M1MTNsS01BMEx4MnVXanIxZnVwRVJ1REp6?=
 =?utf-8?B?VGNFMDBiUFIwK2R3VDhKMEVRcjRjNUFZaHI0MEFGNS9OaThuUlZEcWtLQXU5?=
 =?utf-8?B?a1kvRE9VVzIxVGFvNDN3SHBaK0tlUGpLVDFvSlFtYVVQc1QzdldIZzh2djlk?=
 =?utf-8?B?OWlSdE1jVEJuaEFsWWgwc2N0amR0bDJTVmVqMDhZOFVhSTJXMm9JU0l2OHhO?=
 =?utf-8?B?UUU5V1BFQmI2STJWcW5YU2RoYVg1a29Yc3VHMFQ0alVQTU9hSURrdXJ6ZEho?=
 =?utf-8?B?anpLMC8xVGlwUllKakJTck8rcFJuRWZiMStobWsxM0txc0tkLzBkWC9oRy9h?=
 =?utf-8?B?bWZXMitKdko5YzduRUhHNXVmRDc5RURZbkZ5UEt3b2U2UnFJMzhoSTl4MDd3?=
 =?utf-8?B?cFZoUWoxODhpTmJ3Tkxtd1d0OGQxaEk4RE9JUnZRaXlPVHdnUndET0NTVDJa?=
 =?utf-8?B?Z3ZSaC9QcHRIR01IV0JacWd5SDkzYmVSQmFqdmZOWDRhSm5pZEJabVk4Tldp?=
 =?utf-8?B?aUhMSWRmVngvTS94YmRMZE5vVHFaY1IrMnBad1lPUnB3aDhCdWhSOWdhYnJV?=
 =?utf-8?B?dkJEWmpsVVR1Zng2c3BCazltVmtIcFlmeHU2eHk0SDhheVhUWWVMRnoyb2lp?=
 =?utf-8?B?OCtMWUR0QnVRcHhRbmE0UlhFWkhmYlo4aC9kTE9qNnFiNTE0ZWNmS29naXQv?=
 =?utf-8?B?dTVsWUhqcnJXM1pyWWVpR3FNUkNzUWZIYm1DWjJERS83RUNWd0NGeUlGMDJP?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Zurich.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR15MB2513.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6d0cf8-fb2e-40a3-5044-08dd35564050
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 11:17:51.8323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0emycFXHO4aUZFQYcOwtvjuZkTwwnsDS0YoYIu7Y6Mz/9lvEydvy8xYfpJCcS4yU08r4YyVAZ+Kfkb+b9R4qXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR15MB6570
X-Proofpoint-ORIG-GUID: 5G5u3hWFjJUenmCKedRtzCQAOerrPxNn
X-Proofpoint-GUID: 5G5u3hWFjJUenmCKedRtzCQAOerrPxNn
Subject: RE: linux-next: manual merge of the rdma tree with Linus' tree
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150083

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIFJvdGh3ZWxsIDxz
ZnJAY2FuYi5hdXVnLm9yZy5hdT4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDE1LCAyMDI1
IDI6MDggQU0NCj4gVG86IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+DQo+IENjOiBC
ZXJuYXJkIE1ldHpsZXIgPEJNVEB6dXJpY2guaWJtLmNvbT47IEp1bnhpYW4gSHVhbmcNCj4gPGh1
YW5nanVueGlhbjZAaGlzaWxpY29uLmNvbT47IExlb24gUm9tYW5vdnNreSA8bGVvbkBrZXJuZWwu
b3JnPjsgTGludXgNCj4gS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz47IExpbnV4IE5leHQgTWFpbGluZyBMaXN0DQo+IDxsaW51eC1uZXh0QHZnZXIua2Vy
bmVsLm9yZz47IFl1eXUgTGkgPGxpeXV5dTZAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogW0VYVEVS
TkFMXSBSZTogbGludXgtbmV4dDogbWFudWFsIG1lcmdlIG9mIHRoZSByZG1hIHRyZWUgd2l0aA0K
PiBMaW51cycgdHJlZQ0KPiANCj4gSGkgSmFzb24sDQo+IA0KPiBPbiBUdWUsIDE0IEphbiAyMDI1
IDIwOjQxOjMwIC0wNDAwIEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMDg6Mjc6MjFBTSArMTEwMCwgU3RlcGhl
biBSb3Rod2VsbCB3cm90ZToNCj4gPiA+IEhpIEphc29uLA0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwg
MTQgSmFuIDIwMjUgMTY6NDg6MjggLTA0MDAgSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNv
bT4NCj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEkgdGhpbmsgd2UgbmVlZCB0byByZXRhaW4g
dGhlIGliX2dldF9jdXJyX3BvcnRfc3RhdGUoKSBjYWxsOg0KPiA+ID4NCj4gPiA+IFdoeT8NCj4g
Pg0KPiA+IFRoYXQgaXMgaG93IHRoZSBuZXcgc3lzdGVtIGlzIHN1cHBvc2VkIHRvIHdvcmsuLiBE
cml2ZXJzIGFyZSBzdXBwb3NlZA0KPiA+IHRvIGNhbGwgaWJfZ2V0X2N1cnJfcG9ydF9zdGF0ZSgp
IG5vdCBvcGVuIGNvZGUgaXQuIFRoaXMgbWF0Y2hlcyB3aGF0DQo+ID4gaXMgaW4gdGhlIGZvci1u
ZXh0IHRyZWU6DQo+ID4NCj4gPiAgICAgICAgIGF0dHItPnN0YXRlID0gaWJfZ2V0X2N1cnJfcG9y
dF9zdGF0ZShzZGV2LT5uZXRkZXYpOw0KPiA+ICAgICAgICAgYXR0ci0+cGh5c19zdGF0ZSA9IGF0
dHItPnN0YXRlID09IElCX1BPUlRfQUNUSVZFID8NCj4gPiAgICAgICAgICAgICAgICAgSUJfUE9S
VF9QSFlTX1NUQVRFX0xJTktfVVAgOiBJQl9QT1JUX1BIWVNfU1RBVEVfRElTQUJMRUQ7DQo+ID4N
Cj4gPiA+IEl0IGlzIG5vIGxvbmdlciB1c2VkIHRvIGRldGVybWluZSB0aGUgYXR0ci0+cGh5cy1z
dGF0ZSB2YWx1ZSBhbmQNCj4gPiA+IHRoZW4gYXR0ci0+c3RhdGUgaXMgc2V0IGFnYWluIGp1c3Qg
YmVsb3cuDQo+ID4NCj4gPiBBaCwgbWlzc2VkIHRoYXQsIGl0IHNob3VsZCBiZSBkZWxldGVkIGFs
c28sIGFuZCB0aGUgcGh5c19zdGF0ZSBzaG91bGQNCj4gPiB1c2UgdGhlIG90aGVyIGh1bmsgdG9v
Og0KPiA+DQo+ID4gLS0tIGRyaXZlcnMvaW5maW5pYmFuZC9zdy9zaXcvc2l3X3ZlcmJzLmMgICAg
ICAgMjAyNS0wMS0xNA0KPiAxNjozNzowMi4wMjM3Mzg3MzggLTA0MDANCj4gPiArKysgL2hvbWUv
amdnL29zcy90ZXN0aW5nLWsuby9kcml2ZXJzL2luZmluaWJhbmQvc3cvc2l3L3Npd192ZXJicy5j
DQo+IDIwMjUtMDEtMTQgMjA6Mzg6NDIuNjExMzAyOTQ4IC0wNDAwDQo+ID4gQEAgLTE4OSwxMCAr
MTg5LDkgQEANCj4gPiAgICAgICAgIGF0dHItPm1heF9tc2dfc3ogPSAtMTsNCj4gPiAgICAgICAg
IGF0dHItPm1heF9tdHUgPSBpYl9tdHVfaW50X3RvX2VudW0obmRldi0+bWF4X210dSk7DQo+ID4g
ICAgICAgICBhdHRyLT5hY3RpdmVfbXR1ID0gaWJfbXR1X2ludF90b19lbnVtKFJFQURfT05DRShu
ZGV2LT5tdHUpKTsNCj4gPiAtICAgICAgIGF0dHItPnBoeXNfc3RhdGUgPSAobmV0aWZfcnVubmlu
ZyhuZGV2KSAmJg0KPiBuZXRpZl9jYXJyaWVyX29rKG5kZXYpKSA/DQo+ID4gKyAgICAgICBhdHRy
LT5zdGF0ZSA9IGliX2dldF9jdXJyX3BvcnRfc3RhdGUobmRldik7DQo+ID4gKyAgICAgICBhdHRy
LT5waHlzX3N0YXRlID0gYXR0ci0+c3RhdGUgPT0gSUJfUE9SVF9BQ1RJVkUgPw0KPiA+ICAgICAg
ICAgICAgICAgICBJQl9QT1JUX1BIWVNfU1RBVEVfTElOS19VUCA6IElCX1BPUlRfUEhZU19TVEFU
RV9ESVNBQkxFRDsNCj4gPiAtICAgICAgIGF0dHItPnN0YXRlID0gYXR0ci0+cGh5c19zdGF0ZSA9
PSBJQl9QT1JUX1BIWVNfU1RBVEVfTElOS19VUCA/DQo+ID4gLSAgICAgICAgICAgICAgIElCX1BP
UlRfQUNUSVZFIDogSUJfUE9SVF9ET1dOOw0KPiA+ICAgICAgICAgYXR0ci0+cG9ydF9jYXBfZmxh
Z3MgPSBJQl9QT1JUX0NNX1NVUCB8IElCX1BPUlRfREVWSUNFX01HTVRfU1VQOw0KPiA+ICAgICAg
ICAgLyoNCj4gPiAgICAgICAgICAqIEFsbCB6ZXJvDQo+IA0KPiBUaGFua3MsIEkgaGF2ZSB1cGRh
dGVkIG15IHJlc29sdXRpb24gdG8gdGhhdCB0b2RheS4NCg0KSGkgSmFzb24sIFN0ZXBoZW4sIEkg
YWdyZWUuIFRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHRha2luZyBjYXJlIG9mIGl0IQ0KDQpDaGVlcnMs
IEJlcm5hcmQuDQoNCg==

