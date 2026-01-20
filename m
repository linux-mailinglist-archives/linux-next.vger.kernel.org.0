Return-Path: <linux-next+bounces-9757-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNdKOK+pb2kZEwAAu9opvQ
	(envelope-from <linux-next+bounces-9757-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:13:35 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 520CD472EF
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9FF0A9E5E5F
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 15:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85853128B6;
	Tue, 20 Jan 2026 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jv5TpsgR"
X-Original-To: linux-next@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C42FAC12;
	Tue, 20 Jan 2026 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923047; cv=fail; b=ZqdPmg05eALNUVgxilY8ObrGcFeqFkfiUnVmUGDXIBF3VroOxhcDSqdguoEgAXuZEFrAemUh4ElE/LwF1UwqFTDmiAXk1mAnlxHVeCdAX4/7gmdzlgLBKpFhFFng9Eyo/2cPttwEPeqMgmh6WzXzxsPq2Vy5/MwbxSWaQCy8nZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923047; c=relaxed/simple;
	bh=F3afslwsNG/T1T945wqJfw7xdsuCE7NIlq3PBuDGLak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jLE2zBYDWPt9BbdseFjgts3ihdF1Rn7Z4TUgzqdf3zOXfQg0nltNUuw/QE49kH8Gy8tEiEJIdVHMXtypxxAp35eHZeimPUZSYFwUqU01BCEsYTkk9OdAyRpHvQiYj7nxZMVdZ2iXkwAp3PdwQ92bHPNXjVjqyNftHzruF1VTduY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jv5TpsgR; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKEFopN3z+LlL+HYS5Ka3dXRUL9PKdElIfQjaBSo15EEY6th7By9TtrsxTUVz3rTVZ7UOgzMrenqZJtdUgo6JJY0MViE3Oxe1jK66XZKcbe/S2i8GgRd1SmCQDBjyBvXaMgHEmkqEbRSaMkr3Z5irGmRi+yGM1C4ZvjMOmrGKv6ZiVa+Fv7vuj+b9QHlMrgmpco+cPDT4Hm6qPmtXwvJyt/t1Gx1pieiNBxrypVCmHqiPjlfapADnO3Yfkmox4A8y2voHnv9qlxHqFbK8ukDxYwfRlb75Duy0q9rkz9PTlcyjXohO92vr5hGpyQLCh6xNbC/5zPI/GyxxNtlFm5ekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF88LfHJFxAn82UJ4tbe7be8Yw2u+X7CCUXnE46w2gI=;
 b=OX5RAX89Zusgskrrio49XPdUFRruz3VEk61pDKcdo/CAxG+NuRHNUxUFA55zcPPhEJjCGYdaK9QxW85wxnSpIaf4tmEjjM/sAgJuiQ2MfZjUBAwNMBKnIlkLEF+vCyaoFDiZVWsumiDf9xYnSgwV9nPh4C6SLZmLyY4BAE4l8YYiy5UhBInOf6Rx02HSay3Q5NDF4UJxoi9gFS/HJzCxv9cSnfs//PksMJuRHJ4yABzA75DFdC5+4iJXj1KEUEscgdtADMFV4zC4buAJrlRh+N/ny3U3auL+7QYT1MNS1QuXfpR/jRl8riExvjOqbB+5frRBuwoZ/Ahe75d2uX26Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF88LfHJFxAn82UJ4tbe7be8Yw2u+X7CCUXnE46w2gI=;
 b=jv5TpsgRTZsbJ55iTKvV5mdshrQSDsbuqaLVjoG0Jam/Jy0q3YVhN/fK5ih4WVkOli+lfjdOCChD30vqSVBZzh4LQWkQ3l0PY5AsG2EMsKgRHyOqUULIXttN4Y9oW/YHeZYGVv9tORLkqL3KDSd9iMV8AVcFOXinzlq9jgYDGp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB8137.namprd12.prod.outlook.com (2603:10b6:a03:4e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 15:30:42 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 15:30:42 +0000
Message-ID: <2a987ffa-e40c-453e-a54a-97a4ce8f8341@amd.com>
Date: Tue, 20 Jan 2026 09:30:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the drivers-x86-fixes tree
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
References: <aW-LCX4W9qIWNSdx@sirena.org.uk>
 <ee1f1510-2935-587c-d459-af9c1680c25c@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ee1f1510-2935-587c-d459-af9c1680c25c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb2bc4a-9624-480a-ebe7-08de5838df6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDZqQnpWMUpjVHR4NzdyRTNveHdPL2JFaHl4cGViNE42MXF0NGFMcFRZd0hZ?=
 =?utf-8?B?VXM0RmtZUkVkTDlkTmRpRFQxdnJVUlVKcWNzMkczb3QvWHd1dExPOVFIWGc5?=
 =?utf-8?B?dkw5azdnMmlZOERONDBMTDRoQXZPR3FhTi9Vem04emQ2VFRTMjM1cmliY3pz?=
 =?utf-8?B?R252NnhBeUJZdmNlTkZoSklCMmxXRnJka1pUbU9mVzZNVG4raGFpc3VUWU9U?=
 =?utf-8?B?eGFpUGw3WUlhZHJ1UlQ3ZCtKZmJCOVZhNVVSL0h6NGZzZk9Mb3ZIeklnVEVQ?=
 =?utf-8?B?cm5EU0traGFaLzdOREhPZEFMZXJpeUZvNDlCT1Y0YkhhaXN4R0JkVy9jQmdh?=
 =?utf-8?B?LzVhQSt4clFCTmJHMXd6bGRidVVYMUFuWXRlQURQZ3lZdG00ZzdZNDc0WkVG?=
 =?utf-8?B?R1BJeG9wOGtiTVAyOXRnelhjR1RvbDhxNFZhVWJsakNrS0w3UVNGc29QSHEx?=
 =?utf-8?B?OTVJYkRET1FlT1FxNnl4YkxyNEcwSXczMEd1eCtUOUFDcFhTWk00YzQyQjN5?=
 =?utf-8?B?UGlBZXRSa1VLbnNNbVZmcFliWDU2Qi9nazdLMk5aa2dDNVdhOFFvVUl3NDRa?=
 =?utf-8?B?MW1MSUZPUHEzSHBoZHl5RnlkNFdrekNvdVNhUzMvRkVGdmdYQXBkRjA2anJL?=
 =?utf-8?B?V3pIa1pwUk9QSFhrSm5DZzkwdGEwTUQxa1g0UGJGekhIWHU0dGhSME5iSEdN?=
 =?utf-8?B?U0hJa2grTlZhVWRlWXdCckhIZ28vVXRWR0xHd1hBazJOd3lzUDJWQmwxcEVY?=
 =?utf-8?B?MnFKVWNFdjRqVFZJZ2xIOXNNVzFjd3dvTHAraWpTeHdHaFRvZ2ExNjA1YVBE?=
 =?utf-8?B?N0hjcDhKZXROaXpWOFFwdm5nKzVGSmJ0aWRTTkh4TG9GblZuTCs0TmpReElj?=
 =?utf-8?B?ay8zc3VVWGI0Wko4VFBqeDdaczBNWDFIcDdnTEdhTTVaNVNMcE5hLzVDZVdC?=
 =?utf-8?B?UnpESnArK1g0bkhub2EyS0ErSjY5VlZBd0J6Lzk4Qll4YWg3dTZvTHArN24w?=
 =?utf-8?B?MWM1N0tMYXlnOFdJTVVrRHNENzNIR3AzWEMxZVg2THh2Z2J0RFVHdWhFTjcx?=
 =?utf-8?B?d2d2RnRVR1N4OFptSEhxY1dFOC91QTdTTC9hcDUzUzNxVDJzUFZHYVFRMzUw?=
 =?utf-8?B?QXN2aE5FNy9WV1lidWJLV2R0UDBVOTdrUjJzV01mUktRN2t0a0JtbC91TVFI?=
 =?utf-8?B?eHpEQVNwQUNMZExuTmc4V1pXTXRzSVhQdlZCWkdmVTVLY0xCWnFNRXNZNERr?=
 =?utf-8?B?WG9WRWFsMlNMck5TalM4dld1Nnpld1VHQ3BUTWo5TGJlRjFDUk5kTTNkN00y?=
 =?utf-8?B?QkkxVEVCYklMRkVwNVFxaVVZa1NiRE1IYmtTNDF3SUEvaDNCSHBFQ0o3b1NJ?=
 =?utf-8?B?QmtIVDkvTW5uZ3JoYmpYQlBJbHJyS2pXNnRnSEovUElUYmM4N3pjMWxEb1JL?=
 =?utf-8?B?Wk1CeW9jUjROb3BQYUZPaW9oTVdTTmpuNHBnTDZLY1hNS2JVRHJJUmdTa3gw?=
 =?utf-8?B?ejlTQlZFeVZCa0Vxc3EwWExQVk1xWkdNT0YxeW15MVlmNnk3OEUxSjNrQUdH?=
 =?utf-8?B?NGFSNG9JaUpNb091TUJISmNYSzZFRWlua0pkL2pqUkgrbVFsK0ZZd3V0YUdT?=
 =?utf-8?B?VnBreWc0RnVjdFMwQVNuV0c5R1Rka0JBK0JQQkxHTEtleEYzM01RMjZZZ2hx?=
 =?utf-8?B?RUQ5WVBlblZPdVFkSzBjN3IyTTRhbnZPZ0YxNkt0WFVmRUQ4RUxhRVYzT2lz?=
 =?utf-8?B?R21SLy9xd1Y5eFYrSkxIbzYrTnVxcUFjblJSZjhmYlc1RFdVaU1iMjFBcHJx?=
 =?utf-8?B?eUJpU0tXamowTHJzWjIwQWNRQ1p3ZmhPMlVnZTFkZHAzMmhhbm9DTmdYcVoz?=
 =?utf-8?B?SXJQTThHeHNxc3dOTVhvU0N4amFkaG5oMGVyVENITmxqaG8zR2dtV3NvUkxY?=
 =?utf-8?B?RkJvZDU1b0JCVFJpL2Vjc3Ztd0ZOUkh1MERzYU1saGV5QXlPSFdORlRtWklo?=
 =?utf-8?B?RVM0eFUzVmxnVTRLK2pKYlpjQnVGTW5LanlOL1Jza2J3MW12YXZoN2hzSkRH?=
 =?utf-8?B?a1RQeGlycEpISEhYSE5EQ0xIZ0Zsdnp2T0RtT2FQWkdIcHVqK1piaEhLdEs4?=
 =?utf-8?Q?QCt8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzhmaVFBTmt1QUhZM0pZc2dOMWtRdGNNZG9SRGg5T2JmN2NIMU4wRnpDRkt6?=
 =?utf-8?B?cDROWDBhUUZUTzdPVmYxelZmT2RCdWdPRWM0VnlNbklXWTgwVzEyQ2piaFRk?=
 =?utf-8?B?Yzdud3MyUzVqTHVwd0JIVEd3d1llRW1abTRnamQ4NVVVeWlURStyZFBJWk5S?=
 =?utf-8?B?aUZKLy8xUXBSb1VBQnpOcmJ5cHZOZWVpZkpBOEY2b3FLTC93R0ViNFFzNktq?=
 =?utf-8?B?SnRjN3NFaCtiZ1JKek9GYWFESGZrTkZqNmJkSThqaFJ2QnpHOXFMWW54RWI4?=
 =?utf-8?B?S1ZJemp6WHpmMDZhMXdSZisxM3hyNW1kTCtVUU1OYU1adGROMEVpVVFLbjNr?=
 =?utf-8?B?UXlyUkRoek0rVEpCVzJjMFU4T3JZdUtzc3dXUzE4a1VGbjJzV2ZiNFJLU1VI?=
 =?utf-8?B?TTZUNWJSTzlEcGVLRkpJcGJ0TTRnL1E3UjlTOFA5NElnK3NrQ3ZIWG43TlVz?=
 =?utf-8?B?azRxbDk5Y3V3a1V2cEFqc1E1VXBjMVF1RmRndUwvYUhLU1dKZXVJYmM0SFZy?=
 =?utf-8?B?TS9WS2dWaCtIUDlvemQ0MVF3SU9manNDdmsxd2VCRFlFNERMZGdNcnord0ly?=
 =?utf-8?B?SGRBeE4wK0JBa3VWYTA3N3hXRHNoTmZCaThGTGhaY1l6QU9TWGxFLzBzUXdR?=
 =?utf-8?B?MWEzUDNkSjhFR0xIZzdLMk1DNW1OcUwvK0NLZUFjTHN1bTlkVnZvY0ZpZlpO?=
 =?utf-8?B?a0QvWnhsdm83SVJtUndTN0VGOXhiREFqS0FWeDFLazZQT0JuZko2cm9qUXJ6?=
 =?utf-8?B?U25YazAwdWNoeGRpaDJRSzRoYzFQVEh5K2JWNWpTOTU3VlQvRy9YMmNlRzR0?=
 =?utf-8?B?LzNNU2dKVVR6S1JNT3ZLMXl0QVNDR2Z6RlNaK0xFN0NhdmtneTA0eE0zUVJQ?=
 =?utf-8?B?R0hld2ZDWjFMdFcxT1FUWklYUzBmYXZMMHJWWWJhSG1DSW52cTd0cFpUUS9G?=
 =?utf-8?B?c3o2ZEorVVRJUjltN01jaUd4dm8rbEFxdUFrSEI5Uzl1b0U4VE9zNnRKWVJp?=
 =?utf-8?B?S1BSZGNSbGU1Q2xMZCtLVEorclFha1ZuTUpPK1JOZGMweEJ6QldrdEc5MWgv?=
 =?utf-8?B?MDNabGorK0JOMDNQcGw5ZDgySHhtTkpqSmx5VWJyb2FFN3g5ZndBZC9vcm91?=
 =?utf-8?B?ZkM1UFJUK3NoRlpoWk1CWVA1WkRhRFVPUEhkTHpKWTdLSGRNQVFBcTQ2d29T?=
 =?utf-8?B?VmRlaVVSTjE1dmhwbWdOYndNMng0WDFPdUdCck52L2FUTHlVamZjNE5naVlU?=
 =?utf-8?B?YlhIaXdxQTA3cHVLdXpYaHZjQ3B6aU9Fd1g3TFU1bC9xM3ZkaVlvMzNyTWkz?=
 =?utf-8?B?TEhoY0NodDBsWkx2TmJHcjZia2tENE9XQVNXbTY4SVU4ajFUakprS0FWMmVM?=
 =?utf-8?B?Q05IMlpLTVZ2OFNzSmlqRExPS2VtWlhNZy9Tcnp2a2J5cG5NM0U0UWxLS1VN?=
 =?utf-8?B?enZSWTdydUlveEJTVStZSHc1cDlsNUs1Skw4NCsxNUVtdEJYTmRHWHFONWpU?=
 =?utf-8?B?ckZvbEsxQ0ZtZitndHo2Uys0VldwZWI0MnBEaU1oSEhUSVdOV3NIdzg2K2dI?=
 =?utf-8?B?ek1ySWZGV1hqeVB0Tlo2S2VFODhpRnQzUEJwQVp5VDhRdHVKdkMxeFBNZzFv?=
 =?utf-8?B?YU0xYnNGcUJRL3h1RWhQQVVZaDZmQTBkbk9oM2pTNUZrajJzYUhJS3VGZTBk?=
 =?utf-8?B?aGNGWjFvaGVsVm9MTWlZc3F0bVlaQTZNU242MjljK3ZpQ24zMWRSQ1c2aFZ0?=
 =?utf-8?B?UHZFUndybDN5dFQ1UVJjN3RJUU55bDRTTEV4bkJzTkJRV0U5STdjaFpjMjgv?=
 =?utf-8?B?WmNkaEFiYlhQMDNTcFJmYlNpYmR0bHFiNFRxTHdjMFg1N1FFWTRNemExMHhr?=
 =?utf-8?B?d2ZzWlk3alFCMzVIeXJvZjBzQkxic0NUbk5UdWRYUlc3ZEVRQXBScVowaWs0?=
 =?utf-8?B?NzVrWnFqRDR3ZVBlcWpxOUdwZWFLMytjMjBReE9kMzZ2aVNnOXA1cmM5S01p?=
 =?utf-8?B?LzQzckRaRW1lZDlTWGFjY2svL3oyMUdNNHJoZnFNWDYxTXhtZVZrTy9TUzA2?=
 =?utf-8?B?dmhkc1NnclV1TXByeWlpdUFmVzlhR2o5RUZrVUQyZUY2S1Y5M2xPbHJDRmkz?=
 =?utf-8?B?WEFPdXB4QjY1dXhlUThhZWpDaVBWSnVWUjRFN1UzOTJXUDlOd1VRYWhpeTdF?=
 =?utf-8?B?WXlRd1N3bnNDYS9taTEyWlNMVWZJTExKMDVxRmt5Um5ISEVZNUdBWC9SM04z?=
 =?utf-8?B?NW1Wb1J0ZlV1OUVyUGllOVJzU1dOYyttYm84WktkNFVHS2NUaUFJdWVXN0Qz?=
 =?utf-8?B?MU5ZZGkrODZDdXBqc29sNk9GSXhKR2dYcVp5RUF3RUl3WXJ1Z0VBZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb2bc4a-9624-480a-ebe7-08de5838df6e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:30:42.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDNj0FEftIonDhzNmxuACUdT1z1Geg43t3tKlNDELzwHGOWA1HQmwTRoYpiQF5+t60+9RwnQ/wRuV2c/IJqpVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8137
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-9757-lists,linux-next=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-next@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-next];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 520CD472EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 8:37 AM, Ilpo Järvinen wrote:
> On Tue, 20 Jan 2026, Mark Brown wrote:
> 
>> Commit
>>
>>    bb820f17b68f6 ("platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro")
>>
>> is missing a Signed-off-by from its author
> 
> Thanks for the heads up.
> 
> The patch was submitted with Signed-off-by but git interpret-trailers --in-place
> seems to mess the tag up for some reason.
> 

I think it's my fault, I wrote the commit message in another text editor 
when I was reformatting the kernel trace back and when I copied and 
pasted there was a spurious " that messed up parsing the S-o-b.

Feel free to strip the spurious " if it helps.

Sorry about that, and thanks for catching it!

