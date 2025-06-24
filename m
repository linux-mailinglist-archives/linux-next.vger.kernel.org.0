Return-Path: <linux-next+bounces-7235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A263AE64DE
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B755A2ADD
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C05228E576;
	Tue, 24 Jun 2025 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MxhLhDOE"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D792A1A4;
	Tue, 24 Jun 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767855; cv=fail; b=S7P/mydlY8keBRfrQaYcBObbvv1D5k3eESBUnouojNLqHmpmHL/O0E8exECPOPiK6LJ6gymwykGd79nOKLBC7UAwPZHHjorMFcZi12xpUm32u67QT0wvMFUyYdITOV2fc8rGKsLQQMvvO/FEHhuHM3sJWmmuYjF2CjUT2EnxJJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767855; c=relaxed/simple;
	bh=GVzJxZVO6GCwVGysCk7VncSf6j5QrSEdTfmVV2lYUaI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=uP1wGaJl5g3MGdCIFoJs/eXHZWjl/lF7E0YPxML3EnbdnKcHgZt17uH+nwiDNm37WppvK3io7R8kHdPbwV0wvHQag7QJ5hzUcgiM1I2e3CoLGx+MtdZskOaAgkAbF2GWoJjHZUNzS3unSzLj4A3a8hlS4Xk7ECnwT6MstglecCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MxhLhDOE; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb7XhuO9TkpKe7BbVew8rqvk8iwXuVBYZcG4eTEfK2iuZ/qVxbZ/r8sGsp8EfQDJDf87pJVqHJLFAhjvzHoxe7qhceqN9SzSO58zFEcccrOkLmojBExlxnpyiWOuzF84gANV+feFnbiBqx5109Rtt3kFW7P5APDm45qhZP8VU0WoLaCbv6C8mLev36zWmaRvTqDBSM0qjFGpUncG/8DalzyIdwklC6zKTa9KuVgyAGGSFlvdeGXnV+b/qLlc4y/xu/BWZaHVgkvUxIjDKnc+U5ExmjnAVeQTCA0w+qs8e4Fw0y+fXmx2eR8zUqKQ1J/DJ25RO3SEPOR3XsPXgOFoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLHK8MqeJhMiW+92V9+SPRTEo3jEZ6B+/R83S9Nk1h0=;
 b=aWT7WVo3Xxb1IdoIqmzB+32K37Pp54NGRI7CJCtQaaRFaUWFwV8/oCe+tVivGp1aYZCHvs5gpZwsNIsnVMLeYCNjG5Lycssuys3agUUz37AoHGmhikk2dS2Fw+KUY8Pv/uYlMj8UsARnHzpeHmNRny8bw8Btx0UxDvOM8qIv9nUyMKQ92YFDjqWfNmXjmFEZGSmkdR4fuQCVftapjfIZE2ndusMld7bouJ+i5OFdDUMTjUwpl3O/389Gu0s0nMbODGhvZs6HJN0PUjn0JBK9qQfkVFQ9ZHQBzlKMUXNRUb0W5PPaugn/jn5eI7dAHoEbuLhdLoLaSC5H9GgKonyydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLHK8MqeJhMiW+92V9+SPRTEo3jEZ6B+/R83S9Nk1h0=;
 b=MxhLhDOErO6nKZv3MJ1dZTUFDC+mUWptDPa2LbFNp+U/rnMWj1svrp6cG9bnVlXYmhJU0P0l+eG9Wu1of1FnpSAFXWlZwYVawZWWBYxHGlbNODP6Z9IwiUKOmqKmqZ05rwvk7B2ND84hmzH30K5o1vCXE6CTIf1GBMHMhUr4Sqga2NeBXIsphCnwlt2sAnZXS59IFefWLUzb0CQX1km9vQPXn6GYXYVd/ON87Qt9PPne+BGyd/3JuHLSVGkZzA7XghQnkbAPRZDqggyj8986sNp1KS17OE8y9iGbwGsk5jiFaFUWevlrg+BJ+rnpVq5OYfY4lRWzogLC59PrA/6txA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6037.namprd12.prod.outlook.com (2603:10b6:8:b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 12:24:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:24:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 21:24:07 +0900
Message-Id: <DAURELPD1M69.1WQM3ZJI33MFZ@nvidia.com>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, "Stephen Rothwell"
 <sfr@canb.auug.org.au>, "Lyude Paul" <lyude@redhat.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250624173114.3be38990@canb.auug.org.au>
 <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
 <aFqTX2oDzacpDpif@pollux> <DAUR75ROUY1Y.1GX6ALNM4FUAX@nvidia.com>
 <CAJ-ks9m-pas1nYSr7GKvREsOKdGOoyW2ru3OKnnjerv9hsWdGw@mail.gmail.com>
In-Reply-To: <CAJ-ks9m-pas1nYSr7GKvREsOKdGOoyW2ru3OKnnjerv9hsWdGw@mail.gmail.com>
X-ClientProxiedBy: OSTPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 892197eb-083e-4479-f7f0-08ddb31a05de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ak9nRzBHQ0FSNHZva0xnQ0NsWGxBbzd2eE5ka3dsK0QrdEVKUzZYcDJaVGsx?=
 =?utf-8?B?MVRMeUErTU1DVHdFaWJqdURLV3NUSGF6eVlJNHZTTDVhd2FCN0kvNUp5T09t?=
 =?utf-8?B?eWk5M3dCSERReHhGQXFtSHNJUWdBTVpKd0duVEIrZFdBUTVJdlJuWTRXN3pX?=
 =?utf-8?B?SmJ5bnFRTVNhRlBvcjRyMjNhWHpDN3JTU0c1UU1oVW5GVkFYWksxVkdXOERU?=
 =?utf-8?B?aHlub3dHZGxSb0VwYk8wVkswMDRTNTRPMW9QU0NrTENQcjRoQXBEZmt4OEda?=
 =?utf-8?B?YlpUWG5xRXc0V2s5dCtuTnNaTWRxNXNhM3pzZUM1R2JEZFlpWFVJYjNvMHlj?=
 =?utf-8?B?TFAxdnBhWUlYWW8rTmRBeHdSVEZ2MXFEN2VZVW5hTzhPaWFGeUY1SU5udnBY?=
 =?utf-8?B?bXNkb3RLRm0wTUw5bUgwZjhPaDlnWnJ5ZDNpT2hHSGgxUGI5RnZscXpzeERw?=
 =?utf-8?B?cDAwSWppL2NtRHQyRjZ0WE5JRFpudWFSWWhhR0MwTWlkZk1OYmtsN1BYVUp5?=
 =?utf-8?B?YmdLZDRrZU1KVVRveDNNdGVEMGw3THBFUTNCcGd3MnlnZEhvMFVnc1lLT1FC?=
 =?utf-8?B?K2RJdUFBc25RTG5SK2VmQ045dXYvS2V2T05DUzVtdlZrcTU0T3BKQzU5RFUy?=
 =?utf-8?B?SHdaQUw3VVFXR2Q1a0tBdlcveHZxYTMyZDJURkpYeGN3QTQ2YnJ4OUNmNHNY?=
 =?utf-8?B?aXAydTNnRktaVG5sa2hiNWxlSXNHTEg2eUl0RFNvSkgxeTQveVFWM29jMlhF?=
 =?utf-8?B?YS9nb2xqL3pQZ2VldlhZYlJoQjNwL2tGL3ZlaFZJWU8yWTA3b1RTUHFSN25G?=
 =?utf-8?B?azdhTnYrTFI2OWlVbmxRd1FYaGhIY0pHckluVk1nK0RpSUtsNGttVFR4ajVF?=
 =?utf-8?B?ZTh5aVhDZXpXTE45Y2Q0TUQ2WTVQNklLVE9XWVg0R202dVhpbnJHUzR6TEpI?=
 =?utf-8?B?dkxlQWU2U0xuTkoraGhlVHpsaFlZTy92YVZXTnlibUM1RDFnU0kvM2ZKSy9O?=
 =?utf-8?B?bHBkZ0ZmKy9CdVZGNkNXOHNTa1BoOUUwUUM5K1RmaFFVbG1qWEtvOU5ESEkx?=
 =?utf-8?B?UjZLWTZuNDFqTDYzTW5NcVpqd0daeHB1WFFnZWFKVEpkUmRRSGpxaEU4K3FT?=
 =?utf-8?B?NUhOMGNOajg5MkNuZWE5eCswcHF5ZGNyZFAyMDk3US9DRjdrNlBkMW1YbEo3?=
 =?utf-8?B?WXlLcWNSYzlPenJqdkp4UlYyRDFOT1Jud0krMWU2WTZPanJsRWt3VGVXdmx2?=
 =?utf-8?B?VzdSWWluM3hBZDd4Y1VlZjlmdFhBZmdZOE9YV3hCSFBBMTZWbXJlK3JFRE9U?=
 =?utf-8?B?RVlKM2RYanNHZHJkcC9CcERORFU1aWNDQS8xdVgwTWp4S3h0WWdIbnREeUpC?=
 =?utf-8?B?YThpZU9uL0hRMGF1UXc2RFY1SDArbWxVa05pdnBFbGZ6QTY3Z3Jhd290N2hv?=
 =?utf-8?B?aGF6WHFzOWJaM29kTGdCRGJPeFZVSEZ1TSt1OE5tWXIrSVBRdEhaYzRSbDAv?=
 =?utf-8?B?OSt5TGFsT09UeU81VXZTaC9SajJnSDIwU1hJeXhwSDUwUFNLeXFheUMzMEh1?=
 =?utf-8?B?aDZtVktlOTc3RUMzQjN3bEE1eU9US1FrOEo3UWF3QkJCRzJOOWN3d2tYamdP?=
 =?utf-8?B?Z21kMEJCdG1qWWUyRGdxMnNzVnh2RHNnRS90ZkYwa21zNUloZ0RIcEhJQ1BK?=
 =?utf-8?B?L1BxUVByeVgvQkxoMlQ5OEppelpxc21wSzRnOENiQVplMzFtbnlJL1pYTzFV?=
 =?utf-8?B?TzFjdzlCaDk4MnBjczhtaXFtK1Bqd2FqckpvYncxdk0vZmFOelk5Z2dJaGti?=
 =?utf-8?B?YW1rSjc2eHhLbmFJWWJiMFlDbzZQeUFKK0twcEtxTFRiZkxTS0ROYTlVbHY4?=
 =?utf-8?B?UFk5emtWM2lnTGF0RVB1M2RNRTB0MTBhVWpzQVVqVlVVVFdzQkgrc3VMM1VZ?=
 =?utf-8?Q?/dz/SGD6Noc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxOYks2OHdiMmdJV2NyQ2RLTmt3UkVRK3BSc1dJRFV6NVNBeDdyKzBVU1Bq?=
 =?utf-8?B?bnB0S0lWK3FmVGU3b09IY0pPZXRjak1VOW9YYXBmdE44eFhYLzdBRytLTnE3?=
 =?utf-8?B?b1VFWisyVjMzVWdXQlcyb25rZU5wdFc0Q0lObjVJS3NaZFVjTzRFM3NjU3Jq?=
 =?utf-8?B?cUtUUFJ2Q2FyTFNrVDRxbG00RkdhSFZsUE0zSjlva09uTDFTeVB6ZW5SdnRF?=
 =?utf-8?B?bERUOFIvZEgrQTdTR0s0b2FSZUhSbzVFYnlORXVrOUxDTjkveUJsMFN4VVVJ?=
 =?utf-8?B?bklna3d1MHV1U09WZ1BrWG8wOWtLdXI0eFF4MmRjYkppYlJSZHVVVXo3b2V6?=
 =?utf-8?B?eDlUSVp5eFNSWmVXckpNTDhDY3lpVWlZUXYxdHdWQ2M0NGd3RFNma1VHcE1N?=
 =?utf-8?B?bmxGMTVKbDBSQjJUZWNJcVAyVzY4VjlublFhSnFYQkJjbnZobDJVLzBkQWRY?=
 =?utf-8?B?bmFHZEZldmxueUlpMlVzTXB5blR6ak82UVFTYXNMcjB6OTRCcFIvb0RzdUQz?=
 =?utf-8?B?RWs0dDBVTWxxZ3h0MHJkbjdjcEdLaWNBV1RNTnhlYTlVcmRVdG1SdHdxSWUy?=
 =?utf-8?B?VFFISlhYME1BVFRwZDZOOU9yZlZkK2FPQmhZUkl1KzB5aGJQdTR3VzBralVI?=
 =?utf-8?B?dnQ3MXpSUUc4VVJEaXVDRksvSWFVbStsRWw5ZjdnNkdJZHB5eEdnVG5KcUEy?=
 =?utf-8?B?UG8ydWVJMVpRdlBiQkdQS21aNzRqMGE5NVkyZ2w4NGcwZDA1UzZFcGJEYThR?=
 =?utf-8?B?NkFLWDdXMHJXcFozNEJDVno0MTVJS1JyYXFRcnlweDRRNUVEMC9lamFVQzBY?=
 =?utf-8?B?MGh2Q3VPUElmMEJaVnlHaG55Y3RxUE5kQW10M21WNDVMNEszUjBaQ0lGWFB6?=
 =?utf-8?B?Rzhyem1SMVhBU2x1RmxHQzlGeFFuL2czN3ZSV0VmNUhoZnlialR4NVBXa0wx?=
 =?utf-8?B?R1haNjNJQmtpdHQzVENEMGJ5dHZtN2JYZGNtTmZCOEYvM3RtM0lUTUp2ZWIx?=
 =?utf-8?B?UFpCUTV1VXFGYnpVOXZuQithQmcvRGxObFN6YkxnbThmRHJITFlnL2UyTUVs?=
 =?utf-8?B?NFdrYW9MQkRJUWY3eVZIMDhWZElibDBmc3dlL3RnMXhhOGhtMFdYT1oyWkx6?=
 =?utf-8?B?UW5xWE1RZkVhZW5DUlR1ZTR5dEtVeFhnaFI2UEFTVnNRT2cyb08zT1lUdlov?=
 =?utf-8?B?RUFRbWlWTy9xWlRyOHJoQnhETTI5VUJXSlhPQUE1N2wvWkp6NEQrWEFUV0Ju?=
 =?utf-8?B?SW9heUVKbmI0NGhqZFJ6c3BLTDNSR1k4MkZFMUcxaEtNcktqM0VuZWRPUVZn?=
 =?utf-8?B?OE1SVzdieWJRalkyMW4yN2RJZkMvNlRHNDdhSjFrai9ET25vbjJXN2YxUmF4?=
 =?utf-8?B?RFREVXhpT2N4bHo2dnFsdWZ4S3BIOURmQUZCdFVjZ2FCcUhDT3FLdGV0Wmgw?=
 =?utf-8?B?Z05KNkZDVCtEMFc0ZU1YeHUvSXM5c2RmRjB1ZGRiK3R0NTNrZWIvQWR0dlJS?=
 =?utf-8?B?ZU1VQlVpREtVRWNwVE9TTHZrWFFjNFNxdDNVSTdZd2ZJV3EvclE4S2l1dFh1?=
 =?utf-8?B?ekhTelhDdzcvUlR4NlgrZElZbVRMVTRpbDFUZ1BpSjl2OWZzTHhORGh6bTZK?=
 =?utf-8?B?VkJGZzIxNjJnVllueE5ZQUIzRXJOM2FFdXpIUGFaZEU2R2plcW5HM0FpbUVs?=
 =?utf-8?B?MmhIOHBaV2Y5VkJGUXFneXVMMTUrNkpvWkdXS1Z1c1VjSVd6MzJidjlBcEgy?=
 =?utf-8?B?MUdxclFoV0lMTTViN2pRZ1NaQWdyUWsySDNOS1U1a0loeUVOSThHaG9lNEJK?=
 =?utf-8?B?MFN2L2JoTTd0MXhvUTNGZzBIWnRyazIzTzJlVk50UVZwT0hBMXpET1FYWTNB?=
 =?utf-8?B?ZkNPTTZGdXM2YzhJL1JxNHpSOHpqZ2NwaUZ4cHNPNnoxcnhkNVlKSHptK09C?=
 =?utf-8?B?dUcwc1JkeUMvU0V5WlpyeUxwbUN0WEJUNXdTbjMyK1BzaHhqUTJVcmhHNUNa?=
 =?utf-8?B?YlVCb0l6cmk1Smg4YzN5VXdtVVU3T3BFSjZJbWl4QWhFSSt3SmxCNzN0d21w?=
 =?utf-8?B?RGpZRlRPUDZUQTF4UHBRZUg0NkJqQ2VoRzBZZ1lwQUE4Nkk1MGwzVC9UZ0ta?=
 =?utf-8?B?aCt5R1ZjaTBibk5uMCthclVUSXdNeDFKOFVOemxwUXJ1TnJOWWFMcjBkclR3?=
 =?utf-8?Q?Ls7rX4Z7ML1sgUxF5S17B9FB0GssZkjXkUi0yDIYLGB4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892197eb-083e-4479-f7f0-08ddb31a05de
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:24:10.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMb/fweGD3dmZNPpiK0ZA2EIJDXAEzXfRH2acDSMpeSW62sYBH1ffqPq13nvNDi2EZemAYxNfjpBlJ8/Evq++Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6037

On Tue Jun 24, 2025 at 9:16 PM JST, Tamir Duberstein wrote:
> On Tue, Jun 24, 2025 at 5:14=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> On Tue Jun 24, 2025 at 9:00 PM JST, Danilo Krummrich wrote:
>> > On Tue, Jun 24, 2025 at 12:31:52PM +0200, Miguel Ojeda wrote:
>> >> On Tue, Jun 24, 2025 at 9:31=E2=80=AFAM Stephen Rothwell <sfr@canb.au=
ug.org.au> wrote:
>> >> >
>> >> > error[E0277]: the trait bound `u32: From<DmaTrfCmdSize>` is not sat=
isfied
>> >>
>> >> > error[E0599]: no method named `as_nanos` found for struct `Delta` i=
n the current scope
>> >>
>> >> > Presumably caused by commit
>> >> >
>> >> >   b7c8d7a8d251 ("rust: enable `clippy::cast_lossless` lint")
>> >>
>> >> The first error, yes -- the `register!` macro was changed to use
>> >> `u32::from()` to avoid an `as` cast in that commit, and while the cas=
t
>> >> is OK converting the new `enum`s like `FalconCoreRev`, `from()`
>> >> isn't`, so we would need to implement `From` explicitly -- Cc'ing
>> >> Danilo, Alexandre, Lyude.
>> >
>> > It's a bit annoying to implement From explicitly for all of them, but =
it seems
>> > to be the correct thing to do.
>>
>> This might be something `FromPrimitive` will help with eventually, but
>> in the meantime I agree having explicit implementations is a bit
>> cumbersome.
>>
>> What I don't understand is why these `as` are problematic - a type like
>> `FalconCoreRev` is `repr(u8)`, so the cast cannot be lossy. I think this
>> is the case for all such instances using the register!() macro.
>
> The use of `as` is problematic because it disempowers the compiler
> from checking that the cast is not lossy. In other words, it is of
> course fine in the case of a `repr(u8)` enum, but if the type changes
> in a way that causes a lossy conversion, the compiler will not warn
> you.

I understand and agree with this, but why doesn't the linter limit
itself to such lossy cases (e.g. `u64 as u32`) and let the harmless ones
be?

