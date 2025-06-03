Return-Path: <linux-next+bounces-7011-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A8AACBEBB
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 05:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97493A505B
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 03:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DC442A96;
	Tue,  3 Jun 2025 03:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pIWv5xZa"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788124C92;
	Tue,  3 Jun 2025 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920544; cv=fail; b=S7/ciXx2uyVZzANi57zZp+jtQtEuD4+VuL5sXjZT+pOFUmWyUGqFThf1pl8t82AE9gsA/kzxwRZfjZFpUd/ks/XJ2qViAlfO3rznAdATYcUpZ8KuCYxtYU4H3Gw+mf0fQmgoPM9BNs9KaD+bW9cuAabGGJD7QnGErXeVZlctYJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920544; c=relaxed/simple;
	bh=/1c/K3vSrNJY2ltDNE1fxT0b4WZbBpdUXo9r3es8y9I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q888qED4n6E2x5xaB+8+646RgkIf1tMnnXUOQ+9Sp2QW0Z5fJjBnfIJ1acgpdTA9GL79lpd60YKsIatn6BhsQY+HFc99+YcVYU5YuFBpIg8UJLK2C4VZQPSZhaDoZN1vQR5MxGPckuhYGtM0v0h6k+qK6njULXAxuMhwLcINJCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pIWv5xZa; arc=fail smtp.client-ip=40.107.237.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa5Upy0CiZB9Td9KDn0UxPqBdRvs/aPFEIhft5wOquBhMWHyuBv+ybQHPLUGRdMo3f+s1LHojro02GXQYyh12/XDO/2z15ICBbVryZfOwLW/ZUjsTHmJSxwlS+Rw15+m6hbSt1bVwj+Un+/fcbeI1ePU8AOpYuLkGXMq3pKt11l82CPhcu0EX8JV6yeE6pvdpa7zm5rLqd3Fd4SG/dm5Q9TtE2PsUPb+2jeax6PZzxrWCHHYJpUvxX286zHrxIJ9LCBdGBHa8aRvcfqqSZNo9ODlJ75h6MeZyz4cubDoHW6zq4BQB5lkwcAojGy5wosAmDF/etVPV8CpMmlZPndz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pN/XgaiupB7Kw79gNPWWcELxCNnJTYYGuhUUTn4F6sM=;
 b=k9HOgbp9l45cVEyKKWl+NxOlnkbBje/kZk+gbMQf1rHYK1WxkGgXNeyFYpHBadRt3cCeDyhaSkzwTuZDlGeeTuxzNuQ9oeREfhdu7FjoMizvWeFsFwYHJ6xAp2TrLrgf6XXqK3YFe2uxfr/RouAvm7I9HBT8ORwjavkzOLQaECRFoxn92dze6lZcYbMLDRB9WFvGp42MprPt81ctOxvt53/+kKdBEb8caVsSlp4DfZbQK5fRE9SCOVyLg5yqpUemv9gi6LTqkNBRfnhTjRP7A51xL+34JkRKdE57HXOwCyxFZZIdOSHw3DyABK3mN8IaEgcvqORJdAmgHQ+gLg9nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pN/XgaiupB7Kw79gNPWWcELxCNnJTYYGuhUUTn4F6sM=;
 b=pIWv5xZa+4k+mF8bp2d6sD0vPbHLUrK012utIT88DfPL6g0dkBF4wqdolevKB6XMQupf4WfCpq1FM5SEv6HA2ITTG/MJhS8Azg7EEwsmVwn7aBPRoEIaNR+XHhs0t9bkQ6mSLYT3hqn/pxZh+tPb3JttFljxIrQI/Qhf3cdQIGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 PH0PR12MB7813.namprd12.prod.outlook.com (2603:10b6:510:286::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 03:15:39 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 03:15:39 +0000
Message-ID: <eb2cdc21-0744-4ac7-96a7-bc84625a5644@amd.com>
Date: Mon, 2 Jun 2025 23:15:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] i2c: amd-isp: Initialize unique adpater name
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
 <20250530200234.1539571-3-pratap.nirujogi@amd.com>
 <8670fa5f-5bf6-7dfe-1ec7-5cd1ec4472aa@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <8670fa5f-5bf6-7dfe-1ec7-5cd1ec4472aa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPXP152CA0006.LAMP152.PROD.OUTLOOK.COM (2603:10d6:103::18)
 To DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|PH0PR12MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb5d80e-20a8-4245-49bc-08dda24cea4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzRKSzhEbFIrVTJRbVY4djJTelNqUWsvYWxINitPc2N0RXlPSXB3cTlmVFBY?=
 =?utf-8?B?elJhSjNUSEUvZkkxc3A4OGNsRmNRUDVSZDJmRkx6YmdDdHlXbjc0cEVaaXlD?=
 =?utf-8?B?UVQyRnBoekxqRHJFdWRaN2dTekdUakczc0R3SW8wR0tLZ2l4dnlRN3JxdGVY?=
 =?utf-8?B?MnNFWFN2cUtPeEVwNGFKcE16ckszMDVzUUFBRDE1YllTT29lWTRNb09sc1B4?=
 =?utf-8?B?Nk1mY3IycW05N0ZReVJGeS9WS1pMM2tJVHJhbjVGVHhDc25kSnE2REF6amR1?=
 =?utf-8?B?NmZSM0phVlpsQy9NQnVuWERCeXhwek9nU2hlOUJ6RnpIczN3VXlZdTNSbHhk?=
 =?utf-8?B?SjIrTkR0dytjL21uOFl2TEhLQlVLUHVZdW0yNWhucGJDVk94V05uRUt0eHR3?=
 =?utf-8?B?NE51ZzgvSmI5S3Z6dnhMdjA3Wkx4SlhDNzNwS3lzVXJZSjBkRzc3SE9Fc2Zn?=
 =?utf-8?B?M2JubG13N0p0MlI3OEFiL0FPWmwrQy9udTNDWi9pMUFjMndzTXVLa1hjVTFU?=
 =?utf-8?B?OWhSTFVTZHRsdFBuSitvQWxIRzBIbEdyejNHL0x5VmRwZEtHckdiMklud2ZI?=
 =?utf-8?B?d21rdngvVXhyT1dwZTMyaGYzRGtJaEJBNGxoMGx0V0lCM1VVWGluSXFFTmZD?=
 =?utf-8?B?ZklGWjBxbWxRUW9vREd6cmE4bkFsSHVBa2F2ZEZRSTlkYVBMS3FzN0N2QzRk?=
 =?utf-8?B?QWpDczVuZ0JnZFBIa0Z1d0ErU04rNDJaSGgvRCsxMHNJTG1WRG93YjR2d0tX?=
 =?utf-8?B?YnYvWkEzZmZuU1E4cWMrY0piY1I1OHdqQXAzZWhTS3hldCttWG1tU0hZZU1i?=
 =?utf-8?B?RklLdGNzemJDSmRJbldpeG11dml2TWFxSzJ6anVGWVVvckNSdENFK3NSQUxS?=
 =?utf-8?B?eUQ3cWVZcTZqSmxBTHprSWNPYlVoMzlVaWJGcnM1VHllUzNucEZ6bmVFbENI?=
 =?utf-8?B?YUxBamtxYzFEQmcxVGl6MVExREJjS2c5TUFPeWlpZE9tNUphMUtENDlENE13?=
 =?utf-8?B?UXVBQWdNNmVBRGJ2UE5LS3ZoOFczSGxVOVV5N0hPRWw0bTNJamJIeXNBSmE4?=
 =?utf-8?B?S0gwWFNGZ21DVXMwbXU3eGN0eGhhYlZpeDV5V3orNkdEbXRya0lJbFRkMlFR?=
 =?utf-8?B?Um1UekZUdUp3S3gwbGJkYnk1OExzWFRXK2lGOWdmcDFGbHBhS3BTS1hrNGo3?=
 =?utf-8?B?ZFlib1FYZWNGckhXSUtMQWM4WGxjNVUwWmlMc081R3Q0ejNxSGRBWnl1Rm0x?=
 =?utf-8?B?YkRla0VjOVdadWRJRnVRTkd4aUkxc2x5V3YwL0ZzZjYyOHp6Z1BjWFB6NEF5?=
 =?utf-8?B?ZDRPcUVWdGkwOVdLaW1zeUhKdSt0bU9McWdlaWZVeERsS2hTUmt6ZjdHaDVL?=
 =?utf-8?B?NjZ6UkxNekxaNG9aUnorVlg2WHVwOUQ1TTMyaHFMZHhGcEdiczRjMWUxSk10?=
 =?utf-8?B?S3NzNFUvMVo5ZmRQOXRjeHRoNEpJUmlsWDF3L3NqZ2hKWGtRaVp1QjhTaFlN?=
 =?utf-8?B?WG9YdTJWeUxQbFJQNmVTbzRiK0JMYngyNThoei9UMEFwTkVPRm5hWDRkMkVZ?=
 =?utf-8?B?TGp1WlpPeW95YWxBY1gwVmZWL09yVGJMVC9qL3pZc245eDZ4NXNGQlQ2QTZP?=
 =?utf-8?B?emEvQ3pldXVYM0pMVGtMdGhKQjJTQ0ozbEZNaVVCR3AyU1cxTWl3WXRUTmhE?=
 =?utf-8?B?UVlaV25JemNsbGpROWVLQ2NoYWE0bldIV1Jod0dOdGxXbnZGZDZ5TDYyU25U?=
 =?utf-8?B?L0cyM2xmek93Y2xZUWFwNG5xZzBCY29wTHpCU1dNdUQ5MmhCSnFtNXFmc0Rw?=
 =?utf-8?B?Ly9KenRFbUMxc2F2YWhqaVFTVVpGVjg3Yktrc20rMk9meS8xRlRFbFZ3VUk4?=
 =?utf-8?B?QjNxMjZxbzhDWlljZldneGR0T21yUnVmWEJyWDdJWUUrSDNDK2R2N054cHI0?=
 =?utf-8?Q?Ae6gV2hfsMw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1FGQTRaQmtpMll6di9LMVhTQ0o5enkxcTlIdjZZZHQvUEpTaHREMGhUWHAz?=
 =?utf-8?B?bHYyU29IQUoxMFdUSkJLVUE3VWsxeXd0M1lTTlVYaFlCRXlsdks5RlNnWk44?=
 =?utf-8?B?bzZVOVlWMEtFOFZCQWI4VndQcC9mTi85Y21YWDZaWmo1T1lVZjVtaS83ZHdx?=
 =?utf-8?B?WHl2d2FwQXlxbUh3amExTWR6emp1TXlGRHpBMDV2WGJIbFpGWkRQS1VIK2ZC?=
 =?utf-8?B?SEY3aHFCQXU0dTNaV09kVU9UOXplS3FCZ0FYUkhVaGtHWnZyOWplUWZQUVgz?=
 =?utf-8?B?YmdLK0VCMjk0cWZOZXZoYTdZSmNacFFud3gxZm1hU1VaNE5vL0VKdGo0VHdu?=
 =?utf-8?B?TDNpOG9GM2ozNjRMZmtzUTlraUhsUXBKYzRMSVR6TXRXdC9BQStkb3NnTzlx?=
 =?utf-8?B?VVhvUnZwWkthY2pYWWVLRWZkd3F2aklvS1pSMkdrc296SG1yUkU3Q3UzQ0U0?=
 =?utf-8?B?ajZYZSsxRk1UUHFKSWVwTGVMOWpib21Tc0Y1OTRQVUpEdHYzOXlORUppTGtD?=
 =?utf-8?B?WFpGeEFneFJBRGxsd255ZTNrUTNwR1JSa3NYelptaE81NktFeUdXblc3cGFZ?=
 =?utf-8?B?T1FGcVlEZmkzUE80MU1pekFzWmlnVVNXY05ZMUQvK2s0eWdHTDdmTllYMnI1?=
 =?utf-8?B?Z0Y1eVZsTE5DRy9JSDdHbFpxZ2g0ZFBOT2lmRUtwdTFOTkFOTnFQYWw2MW9T?=
 =?utf-8?B?M205QzNZaHpZY3pqZHFnaktacHdpTnNud2pPQ2t5M0hKVEZGQTV2RGFhL2ln?=
 =?utf-8?B?UzNSRURHNmxUMlJwWWxKTDdyT3hpbXdOM1NPbm1XZWpaQVB1ODhEbzZUV3RS?=
 =?utf-8?B?Z0hFV05YcFVnbEZKRkVOdWhiWmhZM01rYWh6c0duUG5hNk1CMWF4VmxxcGIy?=
 =?utf-8?B?bHlNM0hSc3ZuOGtBa0NMakczSlFBVkRDSzJKRjUwcTM4TFQvUlJ2YTBOOUow?=
 =?utf-8?B?RTdHN044MC9hejl6MUpJdjhGSVU3S3ZYVEZWdUpMckdEdWgyNHVHckNKT3JN?=
 =?utf-8?B?MVFLakRzb3U3NUp1L0pPTS9IbHdvZWV2L3NoMlZ5VEdOdU5DaVUybXhhc0lu?=
 =?utf-8?B?ckJONEVsekU3UjlIbnl0Z0hqRmphTDFBMktPOGh6alYxNUZ1RDlLc2pnZlBC?=
 =?utf-8?B?czEydXFyWnZ0ZGdBWTFBbldqSW1hL3VWK25nbjNtUDVwOGUxVG1yQWNPaCti?=
 =?utf-8?B?a0RSdTZ2T0FXeFdTV25FSEZqUENJME1iNHZIVlNxTVROazh5cjVObC9KQjdY?=
 =?utf-8?B?L0JCR28vUlBNdjlGUmlvaHRJR1lKNnJSbmI5a3hnazVEVnBFY0RnUWIyeDNS?=
 =?utf-8?B?MEhMWXNSRllKNHB1OGk4Sm00N1BpRW03MHdZYlgvYS9sSDBvc1pDcjEwRUR1?=
 =?utf-8?B?a3RLZ2VmaUlIYmJ2clZRYnU3YzFsa1E3N2hmT21kditJZDBlaGZMYzQ0VVpT?=
 =?utf-8?B?bTB6cDV0d0t4NEdHUUp4eGNxQ0x0a2dSK0NQbmw4V3FpYmIzbG5YR1g5UytR?=
 =?utf-8?B?MmFTd3ZxZC9EZlM3V3gwRGNKWU5ndTlZYVJ3ZkF1RG9KS2lvMkl2TURqU3dQ?=
 =?utf-8?B?dU1HZ1hVVTlJSXIrUXFpRlpXcGlxQUlFdXZlcGxrdGViQWQvbUNSQ3ZkRGpT?=
 =?utf-8?B?QW1laEh4MUYwa09GenBkWWwxUEpqOFk1Rk83dFcxVjV5OUw2WWZmMnBCS09z?=
 =?utf-8?B?VnA2bW10T1pyOTl6VFYxSTlxN3NaS3pFVWRVVnc0NTNwRGhWUFpydElDc2xB?=
 =?utf-8?B?dTNnVjdBck9idUovZkEwendwRWIzdnNBcFAxTGd3R0s4NGcvMng2bHRhaWdV?=
 =?utf-8?B?Q0NNQlZVV3Z3dUljRGsvSzYvRC9MR3Y0TDVuRmNyZzRHMGNrbXdLVzFiMExN?=
 =?utf-8?B?OWU5NDcrV1d3SkJxVnlyNG8wR2hnazhlMG82UHJwU0llc3V1clArK1Q0WnhN?=
 =?utf-8?B?Mk9FVU01R1BVWDJEakVCbFZMQVVTQytIU2FiaGx4M1NPMEUvYTN3TU8vdjBn?=
 =?utf-8?B?S3BHUTJ2SzNvS0ZQZ1VZVUtJajFDcWdLdkFWM2l5OXNFK2licDB2V0tzQkw4?=
 =?utf-8?B?eEtlTmNseHlUUnRXazEzSjVnWDdEVzBOOVA2ZHBpd013bTlzSGN3a1VuRFRp?=
 =?utf-8?Q?k2zzGj49NUkjgLlEaU21L2VgW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb5d80e-20a8-4245-49bc-08dda24cea4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 03:15:39.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fYNS82t9xQb1o/C2Y+d0C3nIZF97Xd+Jo8AEwjkmTEWNITTFZmlFeWFBtDkiYZqAR1X4hRrnzz2YnHvy9c1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7813

Hi Ilpo,

Thanks for the review feedback and guidance. Sure, I will take care of 
addressing the review comments and will ensure to include the key 
stakeholders / mailing lists recommened by scripts/get_maintainer.pl 
while submitting the next patch.

Thanks,
Pratap

On 5/31/2025 1:06 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> Please send the next version(s) to all relevant people as indicated by
> scripts/get_maintainer.pl.
> 
> On Fri, 30 May 2025, Pratap Nirujogi wrote:
> 
>> Initialize unique name for amdisp i2c adapter, which is used
>> in the platform driver to detect the matching adapter for
>> i2c_client creation.
>>
>> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-amdisp.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
>> index ad6f08338124..e8cb3785c740 100644
>> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -62,6 +62,8 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>>
>>        adap = &isp_i2c_dev->adapter;
>>        adap->owner = THIS_MODULE;
>> +     snprintf(adap->name, sizeof(adap->name),
>> +              "AMDISP DesignWare I2C adapter");
> 
> scnprintf() is preferrable over snprintf(). Even if you don't use the
> return value here, eventually somebody will want to get rid of snprintf()
> entirely so lets try not add new ones.
> 
sure, will use scnprintf() in place of snprintf() in v2.

>>        ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>>        adap->dev.of_node = pdev->dev.of_node;
>>        /* use dynamically allocated adapter id */
>>
> 
> --
>   i.
> 


