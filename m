Return-Path: <linux-next+bounces-6060-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8F6A7459A
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C524E17AFC0
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 08:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF020212FA1;
	Fri, 28 Mar 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KoSuj+oi"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0576C2F3B;
	Fri, 28 Mar 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151170; cv=fail; b=fv3BxROSIG7PFSEksrYCx3xeYkbJU/lQ+ir1j9gHlA39V/hHMwuM++8gyRun54T5W+An37zUvr4P6BEtfZ5Po87S29YhCsM/U5bdmRoFKnp5HpeTmkBO+T1CI89yQSLIq8SR1H3FP/LkZs/raNpnqsr5BqgVCeC4E71K3wdgz60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151170; c=relaxed/simple;
	bh=XVfpvuQK+kp4jCb0lNcrtroNAhjRt2jNOSQgSKOxN+8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mWwwny6kYXH5/kQREhZLD5LLJ+Ox67CBL3O/QTYQXswao3Lk/L3khCNJhYNIPTmttN9S/7do6zCQJ2N72QNZHwvJpyxfzOAYNvZir58qurBJdux8/05boaCryiOqljNXgJbpEzUrmfSlpvRcN1N99MFK2onhxwiRj5z7zfIDRfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KoSuj+oi; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt2smHx84vGHD9HHeQ92i5S8oBSX22KKabtFz6XcKfY0O+0iBIB73LuVIo4JnbfbvCYFB0N1NJ22StYs+rh5EQiKMr5jcYla5/IXDh80ESa3H0Ej9qtGZhzGANy+sLbDBlN0iGXAW5Z9qa3CoSH1IaDNMuUfOh0JZmRM55R9O1Vk1lhA5yLcrHhSrMJr5dK2UmNXOCYtFDITTObWK6mjj1GGEzrlWQ4ReXh21FZQM0OHS/2gTP9stplgcJYaL1K640NGAXXY/tjnFHNwTudPzYustZqzVZQE6aXkVLQWh8FdWW8LOV7L7KuC1giV/Bcxc+Y0D2eFb95/OvDBgzNr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5tohAw/pUfj5jZeg8JRZHbC+ZRss5m+wxuDoRU8m3Q=;
 b=ckXNHciPXh9oe7E1doWMXaS6LKsauoYP3FVNegjlufO86ejkrbmplYZcDn8CNJ+g8MOwew/sRxZbZ5zWF/rh1CySmpOdma56qW2woY0KwbrbwlsjMHLIhRu6xe/ZAk/Ranm1Do45Le+wH1pgf+Eakaka28bL71yIa7oov0dsJXlioOgKh6A2QyrYDL5GTs9k3vPNZS/rzCkLVDwsX1EpVCLV786ZJhiRyMUDXjRDAm1YN9xgIZSQG3vN111CVi+2fQgY8rK6vnzTN70S7HOi+cWXp9dff8vSx8Fck7EqvKPQsyPhO0CgGI37juKrYuA10HE+zDPnUYKMenOtT9jbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5tohAw/pUfj5jZeg8JRZHbC+ZRss5m+wxuDoRU8m3Q=;
 b=KoSuj+oichWUJFtrlqBFuF1C1n6tVlSBz9L2gWZd+pePAbijKdq5s3PYY2FIC1VToNP0OIPSx6lthFxAecvrpy2uO39HoDMiFGE6Or5q33XsMt8uVG1LwhWuxnCaEgQgWHG3Da3qWgWYHmmvQufZtsm+gUEiAxWTuhADHxFSUyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by SJ2PR12MB9088.namprd12.prod.outlook.com (2603:10b6:a03:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:39:25 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:39:24 +0000
Message-ID: <0c4c6f79-62d1-4ccd-b5e3-f76c9000ff3d@amd.com>
Date: Fri, 28 Mar 2025 14:09:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Roth, Michael" <Michael.Roth@amd.com>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
 <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::23) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|SJ2PR12MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d9ba0f-c1b9-4a3f-4c49-08dd6dd40aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWhvWVJ2YkRmajhvTjRoeDhkSHRETFNDcXA3dzVSV2lHYVY3bkRjZVdUVXFK?=
 =?utf-8?B?eGpMaTV4YzJLeGdIKy9ibzdrQno2WFo0Vksvczl5dWpyTHpYTzMvQjdjcHBD?=
 =?utf-8?B?czNLQWRScEEzb2JnSXJmZ3l1aEN4c1k5S1V2L3RnLzJHRlRlQmE5TSt3NDlm?=
 =?utf-8?B?NjZOcENmRGlVZGgzRHlLUUZ2YkZhMjZBejZqMWc1SmNKNC9sdmVCRDBYNXRV?=
 =?utf-8?B?OXBTUTAxZXpFMlF4a2FsZXdoQmtuemQ5NnE1VWVuZkQxOU1BRjNMbEYwL29K?=
 =?utf-8?B?ajdOeVR6WVRjRkdGZUZJbUpJQTBENmkzbVVwTzJYMThVcGhQYkVYWktIeVkr?=
 =?utf-8?B?d2xndXVkejFKSDNJMUZVNjZ5MFk4Q3VMR2J2c1psWWg4a0lJUmozQjdSZXpO?=
 =?utf-8?B?VGpkb2I2SHJESnNXZWgza1FYMFpDOEhOeDNPWUplQjRWZlZPbHJ2TDg0Q05w?=
 =?utf-8?B?YmtsQ0x1Z0ZVVy9tQjBpR1kvQWJaOEk5Umhha2VTQnFNcmZTK0J1bTVGM1Zj?=
 =?utf-8?B?WnVwdWo2em9nV055dTJzYUc1bzh3QXN6ZFpqZExlNWpmd1U4ME9LUkZvd1pq?=
 =?utf-8?B?NlEzaDFjcDM0OVZGWm1XN21va0I2OVlPWDVuUTk5QU85UkpXRmo0WmpDTzZu?=
 =?utf-8?B?VTV4dy9wNzhEV0hCck1LTUo3K0VScnFSZGkwM2p2RC9EcHBIbkJKQ2ZncUIz?=
 =?utf-8?B?VVJieTIyc1pQRnZ0TWRGbHRPR1J3TDVJdzVDRmVHbjBCNzBWZC9KcXpBTnYw?=
 =?utf-8?B?QzVGc3J0TFJQdG5mTUhWSHdPZG84U3JHZ0xWK01uMG9IdXNTUUxheExQRGVG?=
 =?utf-8?B?TkJLazE3eVNvakF0YkNzMi83UUZuYVZrZmthcm9rQ0lpMU8yQWM3NU5pdTVw?=
 =?utf-8?B?UDhUbVJvdC9uWGQ5VDFkYXhpWFF1VlRHWHQvazNDc0xPUnhXaUtVbmFuSk42?=
 =?utf-8?B?VzhBQUl3Vmg4Rnc0QmdUdDNEZEJPa2hXbUZ5NFRNYXVCRVhhVFd4RExYV2Nn?=
 =?utf-8?B?dkZnclVqVDBjdmprV2dPczRPMTczZGpRUWlmbERsUDFtQnQ3UFZMemF3WU9I?=
 =?utf-8?B?YWVxVUtvRHdPRjdTTjJnRmkvWnRMMWhEZ2sxU055a3JNdjI5NS90ZllFTmZ0?=
 =?utf-8?B?dk55aGFQTHdjdEtTRWhDS0VDdGpqYkgrU2hIRHRPM1Q3VU1JQzdLUC9xYVQ5?=
 =?utf-8?B?L1BzZEJtRnRBSVZobFd5M0hzV1g0SEdQTUJVZDJtcjZMclBZUmtEdnY4dk5Y?=
 =?utf-8?B?dnYrbFJFR3VCYTI4UndRNG1iSWl6T0FmN3Zwekh3ejZtVDdvWjViL0NselU5?=
 =?utf-8?B?VkYrclFpSWxFeHVxZ25NT0lWRG5tY1dJc05oTzREY0tSY3l3T0lBODJ0eC9l?=
 =?utf-8?B?MU1PR0p5V0liNXh1MEsvU015YjNwemRTbHhReUdRbkpJNVFCMGhWV3JHQTV2?=
 =?utf-8?B?blNibUtDblo3WXhLWHF0M2dkODNGQjFSeG0zdDJCV3ROV1R6bUhYcWdsWjBo?=
 =?utf-8?B?aW9KK3cvWDNqSHpRbHBpc1YvT3hrTGhLZTNralBoWlF0VWJzSklSdldhWWx6?=
 =?utf-8?B?S05EeHZreXlHTGlBa0RoeVNwYnVnSkM0eVhvUTUwSUVHMVk5bmMvR3NOY3oz?=
 =?utf-8?B?SHlyYTFLdmVhNVBoOElrL3BRbUhVbGROUGJ0OFNac3F5dkFOWFVydi9NRjNk?=
 =?utf-8?B?dUo3a3J5NUpGNFlSVWlyQmQ5VGZnRFE5ZzhQRFR1YWNzZDVmNGFoK2dpb2lZ?=
 =?utf-8?B?WlhuWTRjNE5taVh2QTcvSWV5RG1aT1c0SXRvTm5UcmlySlRxQlh4U3laRWZ2?=
 =?utf-8?B?aFh1SzIybU9uVUZsd1BjaWpqMFgzbFNwV2JDKzRRV1lzdjFhUkYrcWFqY0pZ?=
 =?utf-8?Q?65CSZIjaAVVOH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZPbVNwRnJKQUVNQUZoQkhGYnJpWitzTFd4QUlndldGRy80MnZwN0JpM3A3?=
 =?utf-8?B?TW1sN2NvN045WXdsMkpBNHJMOUc3SWtBQVlJdzZ6eWpWajZuUWRRc3k2Yk9q?=
 =?utf-8?B?L3Jpd0tLVllQR3lVYkJ4d3FRVTVyRHEwNU9sSy9uZmVCMTQxeHpYbjhlYUZZ?=
 =?utf-8?B?THM5T0Q1bjJjVjZkYkJIbVBQQm1VRDJpUVVjWklJaUd3eHRtQXdFUXpzRVJH?=
 =?utf-8?B?ekxJMG04cjJGQ0ZQZjFwTWVsajZRVEorYktSRzhVTk40Y1czYXpSU05tRlZa?=
 =?utf-8?B?NklvKzZGR3hiK0hqcTVvV2wrMWNSUklIK2Q4b3VTRUFpYkhRc2ptUi9mY2lj?=
 =?utf-8?B?K3BnZEc2UzNNTWZUZTRuREZ1Lzlvd2JrWXNtS1RLMEg0QU5oTERmL0RibHBY?=
 =?utf-8?B?UkNwb2VQdW5oenhMTWY2UXBjK0FhNS8xUGxTenlWRHI2dnBJeWpHVlY3OHcv?=
 =?utf-8?B?NTRhazJDNEJHTWt5R2lNYXZJRkdwbVBSdUovMmR3bDF5VGFaYWRoZlpESzFL?=
 =?utf-8?B?VzdISzAwakVLelZ3N2hMMWt3UTdweU44dmtubnhFK09pem5IOGd6aGppL1lR?=
 =?utf-8?B?N0FLSjZFMEhxSkhJc2JSQks3YnJ0SXVndHJ1NlQwbWZlamtLcUhZdTBLSm9V?=
 =?utf-8?B?aGQ5ZzBwMXdkZzFuSnJTNUxsaUJ0ZThnRytlblhYTFJ1ZXRycWhQVWVmQ0FM?=
 =?utf-8?B?eWUzNG55NkNINU5QaG85UWxCd2V1NURYOHF5MWZteDlaSS9vUTA4QzE4cmlI?=
 =?utf-8?B?RXd0dFpXWmhTRFZVbzBoUHVzeTJqeUN4STVHZ3E2S2diSzJCcVFtTmx2UnJm?=
 =?utf-8?B?ZFFLS3FFR01FQkg2MmZOTkdsWVEreExMcDFoNkVKR0t3SXluM3VGYTloTkZN?=
 =?utf-8?B?M08vSTFxOVNOYXU5MkZyYmtwOG1MRXhKUEdhdk1jc3E4R1FQMnlVTUI1NlMz?=
 =?utf-8?B?cmkzNS85UG5DbDJ0UGgwVC9uc0RKNmMwNXZLd2RLbktLbXhpVXZVOS9zZ0N5?=
 =?utf-8?B?ZEF6c29JR3R4L3lzbXZQQXBQRGkvZC9HUk5Ec3FVa2RwT0RKN3NJODd3bXFP?=
 =?utf-8?B?MWpvOFJDUXlOWUFVV3IwZDRnbzBML3E5Y2RIU2UrZEJiWkcyMHpzY1YrVHE2?=
 =?utf-8?B?d2RSdFEwbDVSSWtPOSt3Q2ZYNFd5K2g0Y0lzUUlWVjJJcXBVN0NYS2NiaHRF?=
 =?utf-8?B?a0lFZFlOb29RRStDcFVtVHNtZDY1ck02cmNKQnBpQWp2MFljeG9YdGs2ckIv?=
 =?utf-8?B?WXc5czBpZkxoR1hKeG9BdG5MUGJCSyt0QkczL1pnM0sxUFdaN01wckxjc0Ru?=
 =?utf-8?B?Mk4xTmdQL25YZ1hyYmxtd1BBWHlVRHYyU2J5YzJkQXFtK0UzZm9qUVV1d09G?=
 =?utf-8?B?VTFzOFNSbWdyTVl2dkVoQzdZS3E5Vko4b25PaHVueGdPNk1oV3dDWjJTZzk1?=
 =?utf-8?B?eUZSQmtiMnhaR3B3UldlL1Rnd1M0cStpMVBXZVAwV2c2Y2FJZXlFb2h3UmRa?=
 =?utf-8?B?VitweWd4b0dJWGlucVVFd1FLU2Y5R3pBSER3TnRrSVgwRStpVFVrYWVWc082?=
 =?utf-8?B?NlYvNUdoZUpwdW9QMTVvUFVqeDNEZnI0RFNUWGo4V3NBZzJYR0VXN3gwOHd6?=
 =?utf-8?B?T3pjQ2RGeDFRc2NxRkRiMU1BaFNrNFZhNjRqa1N4YlZ3dGhrMHVycHhUTE9x?=
 =?utf-8?B?LzgvdkhRNHJjczJwV21KcWxObmFVYmhZaE0wTGppVWg2VEhUVjlOMmg2QXRl?=
 =?utf-8?B?dHdTTEtrU2t3MlZ1TXNPVUxxbE9PQVFlLzRsaGpmMzR5ZEx3dnpiSm45NEpG?=
 =?utf-8?B?L0dvdk43TDAxbitsWC84TFFMNmdDLzkwKzM1Qmc5VVZyaU5oZGR4LzBJTlVi?=
 =?utf-8?B?bWh5cUx1UW8wUU41bXVPM0M5VzFIS3FlbmJMMkhXeFROa3VvMGZ1eEFURU5Q?=
 =?utf-8?B?Rkg0c3cvcnFUREJUbVlaWkhvUmIzRjdwZVdDYzR6OGxOMTBRSFROVDdJbHVL?=
 =?utf-8?B?d0tyNDlhYjRNdjd2NGMwNjdjdG14QVE0RU9ET0Y4enkxSnc3VjJHRDl5ZUpB?=
 =?utf-8?B?VDhzTWM4V0JZOXRZdnBCTEJkSWpoaVVKZ3ZYU1ZraDNsdVJ4NlVic0Zad05W?=
 =?utf-8?Q?7aYCyLjAnzyuin1mQw89LHbOt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d9ba0f-c1b9-4a3f-4c49-08dd6dd40aff
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:39:24.4529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++6c1FQSh0zI8qiMOiBAP7VOw5+VQU8RDpSkofy9SkpMI/R5jVqBv1enxsMVqdkDmSrLjJt+7pF7cEGZxnEeNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9088

On 3/28/2025 1:58 PM, Kirill A. Shutemov wrote:
> On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
>> On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
>>> On Thu, 27 Mar 2025 16:43:43 +0200
>>> "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
>>>
>>>>>> The only option I see so far is to drop static branch from this path.
>>>>>>
>>>>>> But I am not sure if it the only case were we use static branch from CPU
>>>>>> hotplug callbacks.
>>>>>>
>>>>>> Any other ideas?
>>>>>
>>>>>
>>>>> Hmmm, didn't take too close a look here, but there is the
>>>>> static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
>>>>> the caller may or may not have the cpu_hotplug lock?
>>>>
>>>> Yes. This is generic page alloc path and it can be called with and without
>>>> the lock.
>>>
>>> Note, it's not the static_branch that is an issue, it's enabling/disabling
>>> the static branch that is. Changing a static branch takes a bit of work as
>>> it does modify the kernel text.
>>>
>>> Is it possible to delay the update via a workqueue?
>>
>> Ah. Good point. Should work. I'll give it try.
> 
> The patch below fixes problem for me.
> 
> It is silly to add work_struct to zone for one-time cleanup, but I guess
> not a big deal.
> 
> Tom, Srikanth, could you please test it?
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 9540b41894da..ea5f7e0b675d 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -964,6 +964,9 @@ struct zone {
>   #ifdef CONFIG_UNACCEPTED_MEMORY
>   	/* Pages to be accepted. All pages on the list are MAX_PAGE_ORDER */
>   	struct list_head	unaccepted_pages;
> +
> +	/* To be called once last page in the zone is accepted */
> +	struct work_struct	unaccepted_cleanup;
>   #endif
>   
>   	/* zone flags, see below */
> diff --git a/mm/internal.h b/mm/internal.h
> index 109ef30fee11..f2e6d42af6eb 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1516,6 +1516,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>   
>   #ifdef CONFIG_UNACCEPTED_MEMORY
>   void accept_page(struct page *page);
> +void unaccepted_cleanup_work(struct work_struct *work);
>   #else /* CONFIG_UNACCEPTED_MEMORY */
>   static inline void accept_page(struct page *page)
>   {
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 2630cc30147e..d5a51f65dc4d 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1404,6 +1404,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
>   
>   #ifdef CONFIG_UNACCEPTED_MEMORY
>   	INIT_LIST_HEAD(&zone->unaccepted_pages);
> +	INIT_WORK(&zone->unaccepted_cleanup, unaccepted_cleanup_work);
>   #endif
>   }
>   
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 4fe93029bcb6..e5f16fdb7eeb 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6921,6 +6921,11 @@ static DEFINE_STATIC_KEY_FALSE(zones_with_unaccepted_pages);
>   
>   static bool lazy_accept = true;
>   
> +void unaccepted_cleanup_work(struct work_struct *work)
> +{
> +	static_branch_dec(&zones_with_unaccepted_pages);
> +}
> +
>   static int __init accept_memory_parse(char *p)
>   {
>   	if (!strcmp(p, "lazy")) {
> @@ -6960,7 +6965,7 @@ static void __accept_page(struct zone *zone, unsigned long *flags,
>   	__free_pages_ok(page, MAX_PAGE_ORDER, FPI_TO_TAIL);
>   
>   	if (last)
> -		static_branch_dec(&zones_with_unaccepted_pages);
> +		schedule_work(&zone->unaccepted_cleanup);
>   }
>   
>   void accept_page(struct page *page)


Tested this patch ontop of next-20250328, it resolves the issue.



