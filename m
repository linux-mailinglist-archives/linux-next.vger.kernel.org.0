Return-Path: <linux-next+bounces-3369-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 958FE958E05
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 20:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2631C20C52
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 18:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224341C4602;
	Tue, 20 Aug 2024 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J6QJ2G9x"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D71C3F37;
	Tue, 20 Aug 2024 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724178537; cv=fail; b=D7hJUP6l4cW42WKcToHqt9jWh5S00PpiIFD5Fl5NDIbwS8vKXdQCs244H3bp/E6miM1PLZsanJ/ZRg9HYMST/axBAF6N6sH3h9Ji7xU4o/Ho/9bvat+yl5iLamif/JEv/F+jQlO1yuMQt+88Xg+VoBvizcQYU5Wa868FO/QS4hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724178537; c=relaxed/simple;
	bh=3OGWwnrHzbCToo4k05TbeX+Ku/6mkjEomSvxZ4XJiWE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b1u7ItFU8X6o2x5hW+uQvflZK9JCRgK78l79MoqSaqxSzha+8o+hkq0Wv8Rl5BWHcVUSJ8u3DlsSzA/g0Q63hCa34wu+ejpHgnlAW0IANQy1ATIZEUIIi4HdtGUQtVtTYdrwLoIjeDkpxby14tUwe5kSawvL+Fa8kIX08ZmxCTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J6QJ2G9x; arc=fail smtp.client-ip=40.107.244.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNJKKYyQUYI+XKppPmHdMzqjfgja2a4YCjjw4svRp2/b1dgFxywhAJv1dX2JWrz8yPFXs/F2yv8QnE6DzDhUKode+q8J/1WMwENEmu/Ee8YKtGUPXCUY1DdDXD75IgJNYQHH3dBRcPKB3Bi4VvxfY3O0PH9E4mw+VX7voqd/eGsdWKnzQkr+if5pbwk7cedgfwpSaN1rOHFN+qyHym/qse2NsT9LMuwKA6qH15uJtT0YU7k/zc4VHZF1aAF69f8+SN2JJC/jJOQr1LdxTH3ohLghAHgtjYtPNhBSqThLMdZmO3URSKcxvdz1Po44JC2Dd9Heo3DiwxLuGo38ILMWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfKBurVgSt/RPBloUMUa2B7uWheg2L4vB2l7vgQseJ0=;
 b=LM5HbDB9nKZ/8uMapWN9JaSBXE9MO0HsZtmGhyVONWAAS9fXqwi/jRWOxOaCg7qIieRw1ci/VYPdQTIllZBa1gAjA4M+/SxYUyqId4asUjEpRtKXCsSGFUszOWiuXfswJpfRjIWIyFrT+8WOwn2HrSZGSwU7KkMv9yJNPiumsyRiDDxbbXiAu7z+XVfTe8tY2v8Q1c+xmXKoZbzl/DhjsxHJvrl558P8JOqDXfm58Bc5pgv9i9oHUpHtmuXLyV9n+7niY3ghETU0SeK0MuJXYwMIaDmLd+l0dN1cha/BgrenGQiuDGozE+n00CMeAy7iYh/kJT4D2svTsE1S0C69/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfKBurVgSt/RPBloUMUa2B7uWheg2L4vB2l7vgQseJ0=;
 b=J6QJ2G9xcpNaiYUJKESSGHS5r8pmfT2f7Weur8Ptm4XsFHszlacPXs6sLwIGnILBvKpbSbGhXEFZFuF2H0NkNCSHfIcMZSkKHJnzba0rQs7fb1XYWHKggrWclajHOml0JOSdoI8eb3nUXwGSKpS254HAFYr/FYmpqvqkrekpG+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7875.namprd12.prod.outlook.com (2603:10b6:8:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 18:28:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Tue, 20 Aug 2024
 18:28:51 +0000
Message-ID: <388a818e-487f-4ec0-8da3-1d51291d2089@amd.com>
Date: Tue, 20 Aug 2024 13:28:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: commit 9d8c094ddab0 breaks Xorg/xfce4
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20240801165234.2806-1-spasswolf@web.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240801165234.2806-1-spasswolf@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:806:d2::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 004106c4-2369-47ad-198d-08dcc145f059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEdoS0xYQ3hLSExFenZIM1ovY1FBWTh4VExWUDczaUxMaEpXQmJjZ01lc25N?=
 =?utf-8?B?Uk8vU24wMC83MHppMVNGdHNpNXlvSVhQYXBqQUVTRHljMUNNSUROZWc3cDVk?=
 =?utf-8?B?VVRTcmx2VHlGTzV6Z0JEU2o5a0pkTGNWL1pCd09Uc0VkQjhYVkgxQzd6Y0Nr?=
 =?utf-8?B?TWxXa1VqVnJ1VGN1ZzQyT3NKVGExczF4cFFyQitHUWtGendqcFJERFBDSi9r?=
 =?utf-8?B?V0JIRnhacHhlZUdRY0pIOGJ3UXZlQXdsRHNDV0RvKzdFbVEwVUtrTU5FTklO?=
 =?utf-8?B?OFo3TThxbGlLbEVxb0o2U2p5WUFLVWRxbmFsTWxmOWR4eEtTVWhEU3dGbDBi?=
 =?utf-8?B?b2JnRHFFTGRGUllkZ1BrWmRwNWVpV05oVVc3UGpxQXYrTllLMmRKaURJVVRG?=
 =?utf-8?B?bGFlM2dtT21aMk5oTEtRTWE1b1hxOGJoYk96dWxRWlJHMTE0Vk9WUGI2QlZE?=
 =?utf-8?B?VTM0UGxHTkxrc3k2dDUvaFI2K3RicEVlSU8zWXFPSGtuL3NwazRlc1Fub2E2?=
 =?utf-8?B?c0xwVlZWRDJLQTNZL0dOb3dpUUZTQ2ZId1grNXovbTQ3aTBOT2IwSk9tRWRl?=
 =?utf-8?B?Z0ZpYVB0bUpidTZXS1dHYnB6NUVFY1k4Y3hHZEFYSURzalh0a0xucnlUS1Jt?=
 =?utf-8?B?TUZwVC9mdjdtM21JU2FVcDAyTUFEWTV5a3NpRWtnRVY5UW9xandKSFR2Zk5N?=
 =?utf-8?B?MEpuM3NHQkhETWltWFRzbDZqZXJQd0VzMFpnYktKVitocDJxQU9Fdlo0SzI0?=
 =?utf-8?B?VEZPckVFUlFoZjVWZjRWUUEwUVNDM0dTaVhwM2Q5ZldYUmljdy9jY0hBeEtz?=
 =?utf-8?B?d2xmZXRLek1tc09XTFhkRU1RbTZlK1U5NjVaSkhFdU5ycERvSDVPVVZuWVN4?=
 =?utf-8?B?UnAzNWNreGZBelRySnZmempIcWNvVXp4VHdvWVQvM3hRZTAvUWxIOXVZVFhz?=
 =?utf-8?B?Wmpnbk40blFpeTU0YjMrQ2RtTW9MMGxlL3BYc0tucGl0YmFiS3c0VHIzd3BZ?=
 =?utf-8?B?UHRBbGwyL0NrQW94eGJBSXl6dUdCd05XK3NDZ24vVkdjR0EwSlJNY3VMU0Uz?=
 =?utf-8?B?UlRPdEYwZzdjK25hRVJ2RmJnOE9ZOEZldjJIMHFQTjBkZDRJeVYyaytGeEtl?=
 =?utf-8?B?RWdLL3QyNlRoTFpSUDRHTHdJcGtKbUpaOGlwaXM3eXRyTjRjLzRWWGRoRktD?=
 =?utf-8?B?eHgzU1h2d2ZqcjFXV3BLZy9XUGgwSjluUXpaUFhmNzNoN1JTRXpSclJ0SWVI?=
 =?utf-8?B?ZVkxb0pSUmJraXB6MHR2UldEMyt5S2VEWk9iT1EvV2I3akE3WStlVzZodjNZ?=
 =?utf-8?B?dnlwak8wMFk2QXFBY0FiK1U3SzZGTU4vVTZGSnR4dUhaOG9zWE1QVjNOcDl5?=
 =?utf-8?B?cDFjUGU2Y3dGcWc0NXNxdU5lNWJRQW15aGRIRnp6bUtobEorWmRlMUk2ajBF?=
 =?utf-8?B?TWV0Y2x2L3I1L1ZGeWVmVHFtUGZTblUzNjIrendScSs0YkNHZGc0MFhpYlpS?=
 =?utf-8?B?LytJUy8zbUJrNnB5enlXd2hBNzg1blQyMTg1S2FoTWNubDVOM0V2RVRMUUlo?=
 =?utf-8?B?ZCtEd092dXludHdSdjVGZERIWlhYYmR6UnlmdW9XYWEybjRwQ0oxbVZVYW0y?=
 =?utf-8?B?ZkdlanBDMVZmZDgwMVNLSWVDVVJrc0pjUjFrNUEyRXZPSzN5R3YzcG54N1NI?=
 =?utf-8?B?WEtrRFN3UDdXaGk5Rmk0SFM4Y1E1Y0w1ZzZaNFBFMTlEWkpHMlJjQzNhSlo2?=
 =?utf-8?Q?Lavbki8n7CUEy8CKoU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnVTUUNHTndPSEdDOWllWEdqQStjSHRmWWVSWGRhTHl2a1JWZ2IzbkdHZmw2?=
 =?utf-8?B?YjBWUDY2dDZleU1PU2paQ0Z5TUlydTFRc1pEVFJteE02cWFPY21xYTRBV2lZ?=
 =?utf-8?B?NnJTMjJkelJvdTRYVE51SWx1QVpWUmNCMWFQZ0JEeXdtR1VnYVl3bnYrK045?=
 =?utf-8?B?K3M1MDE1WExHQ2d5eWpsMzdSRW5EWlRXR0FsTEVPUkFpd3VvRlFibld6YTlP?=
 =?utf-8?B?MmhkbGRiVk5VS1grY1cwbkpEYnArQ242QWFYNkZhVzhObFVNcUlmWTBycXdt?=
 =?utf-8?B?WnNDOWFTR3pLbE9aaFU2bitISVNuNVVSZjZnR2ttZUlLRUZ3aFcrTjgrcjg0?=
 =?utf-8?B?SEhBdU5DQUR6UkgyZFptVFhWOC9kNVdvMC9zYXFBbTRWTGpqQXRJaG81dUxF?=
 =?utf-8?B?MkxSeGkyQ1BPRWJxVm5tLzNTdWRLK2pQM2JFai9xbWZJMCs1bjlFMXZyaVBI?=
 =?utf-8?B?b2NUOGdJTWFzYU52anRUZS9YZk5ZRitmTEU1eGkrSmpSRFFFZGdHcit5Wnkv?=
 =?utf-8?B?MmErbGVnRlM2YWRDVStJLzhRdG8yRlZaMEJGOFdDZm1VL00zZ1NaTW91R0Vz?=
 =?utf-8?B?UzRIZ2NlU0ZBc1NNS3JKNCtZNFZua1NqQ1Y3ZU5FbU5kelozdWhRbVNxZm9D?=
 =?utf-8?B?b3FwRGJwZ0ZuNHBFeEN4N2UybzAwaHRZNlU3ZS9IcVhhNG9SZkZPOWdldDBh?=
 =?utf-8?B?ajBqdm9uOHd0VmlWSlg2WUs5bzZtVEF1V2JLVHpYT3dyeHBhZlV5NTE3Vm04?=
 =?utf-8?B?blZKT2s3YXptdnNQaHd1Tm1kTXVvUFRSc01yQzJDWTlsV0l3dzQ3b05hOWxy?=
 =?utf-8?B?b0xiZjJ4OElXNTc0dXpYMC93cWFydXpyZVVmRFl4YS9qcDlTNmoxM3F5dFZr?=
 =?utf-8?B?MnNYbDE5UjJhRkFsZWtnWW1qdUNvUk4weE5JMHBLdUJOcE1INXBpMkx1VUl5?=
 =?utf-8?B?QjVyTXdqaHNmMDdzaFpVKzdLQ2ZhQW5ZZTYzREgrSnA4Sjk2V1pBZmdpUUdp?=
 =?utf-8?B?MFVEd2ZpTlJTS2FxbHlVNHd2R3BXOE05enN3cm5UK2Z6bVdzZXArTzNhb3l2?=
 =?utf-8?B?VlR0cllhLzBQUnFFaEQrUXhlcWVYQml6QVlyZUhGZWZFTXBvM1ZpTXl4VlAr?=
 =?utf-8?B?N2hic0Y0UG5qR1VGR1d6Rm1PMjkzckJJTThibk42THhNOWhTbWM1TWZ6bHYv?=
 =?utf-8?B?U2FzOGU1dkZkb0t3RmxRTW1pWnl4NGVvdm0xeDdEc3pxS0xmbHRXeDZTMHVr?=
 =?utf-8?B?ejgvQk9XN3k2TWFIeURNNmc2NzQ0TkwyUEJwczNZekZyRVdTaVBPa2RJdnBG?=
 =?utf-8?B?WHdmeGNGMHZHZTFHQkVDYlp0NVpscVkwczlXVGlLOUpzcnZiYW1lUThYcGU5?=
 =?utf-8?B?SXpFazJNR2RuaGVPRG5aZmFNS21NSTRyREdLTm04SzRmeTRGamNselhCdnB3?=
 =?utf-8?B?ZnFpWnVNQkQvVjRZbXFZUmd6NlVkdVRxMnpuMmp3UFMvUGF1NUZHbEJaYlZF?=
 =?utf-8?B?VDhwc1JoaG1JMW5FZHYxWEVmMDRIK0dwbHY3bTBITkZYZVFLbUJIUSs1c3Zo?=
 =?utf-8?B?clA1UmZHTEJ6RVc1MWlHOUpvRVc4RCtPUTg3ckY5MlNhSnd6WEgxbmNMUlRq?=
 =?utf-8?B?R0laZ0VzNms0VWpQZU1lbWZ0T090UnF4bDNLbVUydHhhckxkUHhxTEtKRnI5?=
 =?utf-8?B?ZjJsOXAwQ09taUtFL1l2YnFDd1VEU2FKWGt0NUozc0dpc3VSOWhpR205Vjgy?=
 =?utf-8?B?ZHkxaVQ0VElLNXUvTllKblFXV3RsQUhTdnFiL2QyMFFjWmk0WXlBOURSM2dO?=
 =?utf-8?B?QTh5VWFwN2FHN0Z1WmFiNFNSdG5FVFl0ZFVhM2VhY2M1OHpFeGdPZlVEeXNy?=
 =?utf-8?B?YlNBcm16MFZ3UlBnYVpDN2RCbzFxdXpTL3l1TUE5WW40NFdXRGorSytuZXBj?=
 =?utf-8?B?TnBKeEpFUGhJL2NiWm5aU25jb2YyWkZydFdVeHBkdGt6WUcwVUJYQzYxUU5E?=
 =?utf-8?B?YTVNZ0RPVUpnb1ZBT2o4WERKb0MrakJ6Ky9nbnRGdllPSVoxMThsSlZGOUFE?=
 =?utf-8?B?c3Z2MFNLKzBhZ3FCWkVnMXR4ZXVhbXFZdzJySVRsR2swVEk4TnJIdzBWK2xP?=
 =?utf-8?Q?AeoRH29pfpnKgiZDDQofG3Sk5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004106c4-2369-47ad-198d-08dcc145f059
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 18:28:51.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUqQwJcunxp9STjaK1W6DTZ6xmBNLnGZDjrSIKcdw6dsEAB7dVh8wwOFPC+2CV7I6Ck6Xn6dXk7EUpxJXbMPXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7875

On 8/1/2024 11:52, Bert Karwatzki wrote:
> Since linux-next-20240801 starting Xorg/xfce4 fails on my MSI Alpha15 Laptop.
> I bisected this to the following commit and reverting this in linux-next-20240801
> fixes the issue for me. Gnome (with Xwayland) works as usual.
> 
> 9d8c094ddab05db88d183ba82e23be807848cad8 is the first bad commit
> commit 9d8c094ddab05db88d183ba82e23be807848cad8
> Author: Mario Limonciello <mario.limonciello@amd.com>
> Date:   Wed Jul 3 00:17:22 2024 -0500
> 
>      drm/amd: Add power_saving_policy drm property to eDP connectors
> 
>      When the `power_saving_policy` property is set to bit mask
>      "Require color accuracy" ABM should be disabled immediately and
>      any requests by sysfs to update will return an -EBUSY error.
> 
>      When the `power_saving_policy` property is set to bit mask
>      "Require low latency" PSR should be disabled.
> 
>      When the property is restored to an empty bit mask ABM and PSR
>      can be enabled again.
> 
>      Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>      Reviewed-by: Leo Li <sunpeng.li@amd.com>
>      Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>      Link: https://patchwork.freedesktop.org/patch/msgid/20240703051722.328-3-mario.limonciello@amd.com
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  4 ++++
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++-----
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 ++
>   3 files changed, 53 insertions(+), 5 deletions(-)
> 
> Bert Karwatzki

Thanks for reporting this.  It's an odd issue!
I could reproduce it using SDDM (which uses X by "default").

Just to close the loop on it, it's been reverted for other reasons:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/717b432b6d55e1dcefcb5e2ec315bf66b6ab8c54

When something comes back in a different form I'll double check X again too.

