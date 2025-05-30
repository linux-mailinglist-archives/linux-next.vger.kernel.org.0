Return-Path: <linux-next+bounces-6992-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3FAAC927A
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 17:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01FBD3BFCC7
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 15:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310EA19F127;
	Fri, 30 May 2025 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mx9RbOUP"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7EFBF0;
	Fri, 30 May 2025 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618523; cv=fail; b=iIXfAXyvmxoNnemkGLCNUVRARMtTXfGlplIYkR3pTdj0vDLXro8Vr26BjSnPKGkW+F2wifne1jVxmS/sdWBCH8yDixld98BU80Vdeb17BROrfqlc/3AvFPdKDQEC8Dbir+LTw+kfx9kfhKU7RYEsl8/ib6qR9VNHHQf6hMXEJDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618523; c=relaxed/simple;
	bh=Rww69LpGeGfaQva94fFCAE0C7dZi9xswKBG6TjUNkmU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pp9rtmbhprfv/ewlJ8r1FSigzvlIfZFe0/7iczo+gN1tneNvn0tSdTh/CyzrDPdHDDP85TV/TlBH60xqM0C41p2jSR5qR5DsTnYnkmqwwetngrJvLwYWIyfYfjQoIwEwp/ccgkz87iZmvRCDuhspMWWC0n71tpvfZChgDkUYSOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mx9RbOUP; arc=fail smtp.client-ip=40.107.244.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agooRhGSfgD+201nQTUoGnEht0nKRstEkjvPRY2CPjieZ6f1Y2TVPTrRll7hn1iMTMjw+emBagApbyzDLIBCDImtKaQhM+MEXALpWs4wzj7H7MJWLq5/g+JqPNHIwtBlF2Z6j9PJi3defnWBydmpMd4VSXl7p3mCIBV7AiQxOBlENTLkJ2usADpGk6xaOS5hrBU8OtjcUmCmztv4pyB4BPCrleV9qrz5+zNOzSN4WzTz3hakG+0yW/nCWo2hcjeqWdHvv/rxio7pivZvw7QisOh25r98vSwfKjSBpw7RFM9XZ0zWYVVQJAkFCIKJPTjpHSg3S2QlJCs8T3Ty65C7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtJgaUQIAwLvpZiVXxacG0xS6GENvwL9iWN9kW/58xk=;
 b=r2HAmX3n12gt6TX9JpyKnbgNeDjPYJ09wMW570rkn41csttld3hWpp9esUgX5wB665GmUfA0giSpAiMJRxatonl0kkpBvri0M3ziS/W0YgRnNsUrdF2BKKJpTu1EmyTXKzqCQdGzHhZDAaaNEslRrqpuLRTZqF90p+DRpn5daZGZSsRVglv083i3hr8MaZZSBiw6O7h7Ek0WmTNsY5JybtWhTXQ/ZyFXYlJS4+13ihi+07bjcKPYfG25hr0o/neXGVzwZ+BmjJqloEngZNbuqwZMXkRolUc55jBD9ndumX+dFGUKRC5N04Elq1nJxwGi/DhqWrsicA+7ylCsl9XtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtJgaUQIAwLvpZiVXxacG0xS6GENvwL9iWN9kW/58xk=;
 b=Mx9RbOUP2ZD7pmCkfISrbA8kQbHPiTwZCqtqnVieHCY+1CHeO+fZAchqz98GhPYnJKIQZG3HSdiBxZWv/mKvFAznBmp/HRAPO2Nn3MbFgM3IZ8TVXpQvJSB82Lyof35HGlKojfuu2c6RvSrWQ423cr7M6MU0u9RF6AHCZwP03TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 by SA1PR12MB8965.namprd12.prod.outlook.com (2603:10b6:806:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 15:21:56 +0000
Received: from BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4]) by BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4%7]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 15:21:56 +0000
Message-ID: <2df9326c-9b9f-4316-bcb9-4ccaf715c757@amd.com>
Date: Fri, 30 May 2025 11:21:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 27 (drivers/platform/x86/amd/amd_isp4.c)
Content-Language: en-GB
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>
References: <20250527203231.3c6c0b9d@canb.auug.org.au>
 <04577a46-9add-420c-b181-29bad582026d@infradead.org>
 <d2ac901b-f7d2-46e6-b977-0ad90faa46f2@kernel.org>
 <b712a69d-e899-4286-b5f6-06d87d732ed8@amd.com>
 <e079d753-554e-7a42-11c6-a08cc095eb91@linux.intel.com>
 <f4b8657e-17c5-49d0-bee8-8621c811b6ca@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <f4b8657e-17c5-49d0-bee8-8621c811b6ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:5:14c::27) To BL3PR12MB6426.namprd12.prod.outlook.com
 (2603:10b6:208:3b5::12)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6426:EE_|SA1PR12MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c2bd15-61aa-4a27-b060-08dd9f8db6bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2hZN1lhaG8yMnN6ZlBpS0JRU0xJdGtHdlA5QmE2RFJuWTEyQUpOMTdnZU83?=
 =?utf-8?B?d2QzL3JaVmRORzNQbWJtWE9lNlBZNHFYZEpGV2dHVHhWaTYvd3J1TTVlVmVs?=
 =?utf-8?B?WFV1dVZ5NXlSaVNBWVNibzFlS3BVcGRaSmhaT0dJT1BJSXduWVUvU2JHVTEw?=
 =?utf-8?B?UFBwK2Y5SHlzUjZTQnU5T1hUZ0NLNnNBQlFIUjBYTXRPSmhWN29WL2RSQmFI?=
 =?utf-8?B?S0ZPZXFEL0FvSnZlRWl4b3BleWZiSDUvY1lKSGZqK2EwUGJEM1d3MnhBSWIz?=
 =?utf-8?B?RmFxK3BybEYrOWlzU1VXR3NMSUh2aExkbG9tRm1OVnE5ZlJQaGNyaEJTWVpQ?=
 =?utf-8?B?Vkk4dVZzMjI2ZWhPVjVtbkd2UlIwUDYrbTAyeWk1cjBseFRsWTdxK24wSE90?=
 =?utf-8?B?RS91VzJqRVVGSzNyMGpDTW96M2NDcHREdUdyTmhLYnUyVFNZalY3M2F2U0hk?=
 =?utf-8?B?K2xNMytUNVBmSjY4M1FsQlpqcHRrbDdVYzNNTm40Y2czY1FZMm9Qcmd5dDZw?=
 =?utf-8?B?Y1ljTE5WVTlNVVZyNmRneVpIaXl0SWhkdUlRSzNyR0VuNjRhQXVMNGJGN2Mr?=
 =?utf-8?B?Tlg0YlAvbWg0RzNqZFBxbml1OWU0azkxbVBubGd4RlByc0RlTVgyclhPdG51?=
 =?utf-8?B?RkMxZStGZGVOMGVRSDRyODVFS1VOVU1aTzgvclpkZS95cGhWVnI2ME8rNnl4?=
 =?utf-8?B?TFRMdFNrLy9GKzRvZlFIcnpBNzhsV0gvQ1F4K1pRZC9wbSttS0pCaUFqZ3pm?=
 =?utf-8?B?SWZjdlFlMWpKOEdrekROa3JYNjV6eDc4WURodHBPYlJjcFVhMFpEYXlhUHp6?=
 =?utf-8?B?VnNvVlVTRGI5VnR1TDFJU05lcTVjNDJqUFYva1dFUnNWSjUxcEJBckdzODZj?=
 =?utf-8?B?TjFZVnhYNlVmaGtZVk9xMlZodGhzdmdZcDVVaSs2c0VvNWhMR3hhZEpNbm5Z?=
 =?utf-8?B?WUFSUDVwWjZrcVE0VmUvbnVhNkh5ODR2QmpNRWx1RVVvcy80MjhiTUtlMFkz?=
 =?utf-8?B?dkg1VlBrWk1nWmtJWGFvNjJGL3p1d2N0WE5OZTNwUnZ6VzNLRjF4bGR5NlBm?=
 =?utf-8?B?VXczRjBOLzQ4UWpzelRUUHJMMkV6eXBYYzd0TDYwUDZXV0xRNU82ZXA0aVJY?=
 =?utf-8?B?QWY2L0U5Y3kwWm5iM290ZmMvTTVabEZoV3pzeDQ0OUlqRHlRZ2d2dFpoVmRu?=
 =?utf-8?B?MGxlTlZ4Vkp4U0JYakVUZG0zZHFIMmd4K3dqeDI0RmFtNmgyeVFqVWZGdkdD?=
 =?utf-8?B?WEJtSWpjMjAycXJiOFZIS3dUeDJNYitPdk03RjVySzhsWjBPUGlTKzJnaGZC?=
 =?utf-8?B?aUszUUJWVVZVbm1tK0V3UDhqczZQdXZ0NGhIaHJyRXhESEZlenNIc3E3VE5n?=
 =?utf-8?B?YXF5cTVvWVMrUHdYRGFFdGhKc3Naem9sRmNDdjB4VEswQkFtdnVGVmd6NWZL?=
 =?utf-8?B?aGRsRVNGeGtEclp3L3NjL2VLUzEwK1kvTi8vV0gwZ3FiZENCWUR6eEs1TkNs?=
 =?utf-8?B?dEJybmQ5VUJVMWxzdXBzQVZsbkpITE50cmxEUVhoaVIzTUlOQlBrak1QcXpq?=
 =?utf-8?B?WkoybklEa2tmVFZMeTYrNzVMWWhoOXJXZGtQVmZGYWdYY014T2ZxZWdBaXBF?=
 =?utf-8?B?UWZacUpjSFFaay82ZHl4VVR5ZGtNM0N6STNYcTQ2Ymx1cmZYMkpUNGpPMUJR?=
 =?utf-8?B?QVhXb3dlR2tEZFZZMy9maG1YVHVjWVdMZFhFMHhSQktSL2RiQUVHRVVvaTBZ?=
 =?utf-8?B?aWtDZGlURTJ5VjBTTVhwYTBmSm4zK3NjamFWREtybjdyYkJZNGRoMHFQR3h6?=
 =?utf-8?Q?4gtaTj5yqm1n1EMv+iGoN6AtZIMSqD3PRRtvo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6426.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0hKRUdHdDQzRk53NzM1MWNaVWhZemYwUkJtTHBvK0hyNVVFK1RNbFhKRlpr?=
 =?utf-8?B?NlZsZXpjQnRLS2JoTEdzMGNna0ZiV0dQZ25xbmtMZC8vYTViZ3ZkWFQ0cEVJ?=
 =?utf-8?B?M0ZEUHFuUndDS3lPUjdqN2Y0QVkvK0hFYUs0R2I3WTRWUkFIYUhURU1xS2tr?=
 =?utf-8?B?dVZ2UUJWT0FrSitpOWNyUkRoYVI5eGplTGdWalR0RmNrd3FTWGRWcDd0SGFD?=
 =?utf-8?B?QmhxalVZQ3dZcjhJUitDZlE0ZThBK0M0TU1xSzFkdm8yL2NhZkdqdEllbHdz?=
 =?utf-8?B?SDVqWCtuZXJoRGtSOThXb0VIY0ZRV2xPL0ptcW9nMjF0bitUSmllSXlRd0h5?=
 =?utf-8?B?a0ROWWs3U3YrQUNFNjBSbEthbWRoTDhoM0xQc2NHckZFVkdqSzFZRHFnN1JB?=
 =?utf-8?B?a0dadGRpTlNWSktpNzFvK0U0cklJRlFQYkhDc2xHQWdhTHlhVXBhRXdzcUJa?=
 =?utf-8?B?L0ZOTHU1VlNqV3Z4a1RzZG02YWJPaG5vZVRNcXdkMDhIZ3hHS2ZhS2tHZnlq?=
 =?utf-8?B?MHdObUxsbXIvNllaMGxsU3pNM00xSER6NmxEWEV3a2VSNndwa3R5QkRDZEFl?=
 =?utf-8?B?OUZxUUNFZW16NjVHNThrU1lZdElQMG9sNStXUDRGZU5ubTVESjdjZHVIM0pF?=
 =?utf-8?B?MjgxbkxhSDVhWGlCaVhzcmZ2WUxjVVcwbENBTG9CdHFaZ0ZPMkhDZmIxWVdG?=
 =?utf-8?B?dWZxNkhMblNTZ1UzWWQ2cmNZSzhOc2U5alpEWkpNU3JnejRCUUNqUndaL0ZZ?=
 =?utf-8?B?S0l4QkF4V0RJMTZpNEEyOEVYem5mRnNYVjdpY3Jab0lVZk1QNTU4VG83U05B?=
 =?utf-8?B?TWhFOVBaeXZCeDgwTDBIT1lxVkt5VG4rdlVHazhPczVJc3ZNdjJIYStMZU01?=
 =?utf-8?B?SGtJK3VaK0c2M2VaY3lXOWdGSUt1MHVoaUZ3b0VFanZWYVVZQkdUMGlQcWpT?=
 =?utf-8?B?eVlKRGVHZ3VRSHVaY2IzR1M2VG5UOFUrSmQwY0VNcXJaMndnSFFSWGh2M1ZD?=
 =?utf-8?B?aUJKbERDb0hSUGZUbTVyY3R5UGc4Y0FVUU5zbGxWazdxcFRxOEo0TjFKZ09w?=
 =?utf-8?B?eVlxWEtxSUpKZHhCdjF5WVZSS2Jid1REZHkyRVAvNG5tY3hZNnpDSGNRUnZH?=
 =?utf-8?B?WDF0dkxlZ3RNMTFPYUorWVdZano1YW5Gb29sc0ZJTC9sN0I2QWJMazVZWENK?=
 =?utf-8?B?MFpWVXRWQWI4OWd0M05WOWtLRm9LOW42Vk16V25mbER4TnhlUUNVOFRRcGtr?=
 =?utf-8?B?TFdRSnh2VzdBQjBnTzNha2ovMUlyT0lqdGVneGZkV0hIdjNrcUFjZkdEb2VN?=
 =?utf-8?B?L2RYNmxSV0txNGFRbWwrL0ZERVhsaWNrVUtpUGtXYU91bEFKSURsN3pqMUZy?=
 =?utf-8?B?S0pRY2dZU1ZJN1UxYTY1dWw5T1djNFhoYXV0ZC9Eb3p6WHBYWnRkOS92eWVT?=
 =?utf-8?B?ZVk0ZmkrNjgwUjFwUkhSWFdIbStCQVRUZDI1UVo0akpOZ1dJTGVjWE90M1Jo?=
 =?utf-8?B?dDB6WXFYK0JNNEJjaFJjRmZWSE8vUXVNTGhuNGFQajk2V2NVSjhYZU44cDZi?=
 =?utf-8?B?OWtKbTdPZzVpR3N5M3h4N0xWRWhKUVVjajFudnpPRjVEbFFhTmRGQmZiZm1v?=
 =?utf-8?B?QzExUGRpRmxIMVU3WE8vVHUrcVd4c1d6T1FBK0R1UWQ0QnhrSVA2WmVXV3Br?=
 =?utf-8?B?OXNVM1hxOS9md0pTbFlnMEsza005S0JIWVFtV3REYThRcTVib2RuOUxwSzQv?=
 =?utf-8?B?Wit6SGZENjZaM295SWlTM1ppVGFpeVVEUFJXYlVVV2FuRnRxNXBKVWZRODRQ?=
 =?utf-8?B?N1Z5UW1OcnJyb2xyblQ5cC8wSHVaejd3QVZza2JYdEZlUUFpRGJRQkVLYS93?=
 =?utf-8?B?ODl3QTM4Y2hXSklIcEpjYTg0MWx1ZmRXZFRySEJTY3pCamUwUW5tdWJGWkw1?=
 =?utf-8?B?em1NTnlkcFFvbVBWTDZaUklxR3VwUGY4YUhCT2JHcXo5TnhzSnJ5T3pnS0V4?=
 =?utf-8?B?RnFic2txbHdTYXdOK0NZUWtveVprdzlwUlJ2dmthNkNpWXNnZjVQeXRFMzFU?=
 =?utf-8?B?ejMwNzAwU1BDT0J4K1JTQUMwbjlKTUxEQXRCcmh2U0E2VHRnNE9oMzY2U0pW?=
 =?utf-8?Q?stvZMjBDnRvJLcVvsuAWNUr7F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c2bd15-61aa-4a27-b060-08dd9f8db6bf
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6426.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 15:21:56.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zn8L8jvGFXYlIGsHau83DKovhHoJjWRYF8/I/3txKbH/WtnKlhU65fzCkdn+TJUcYldcfw2zgmu4dew705vZSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8965

Hi Ilpo, Hans,

On 5/30/2025 3:44 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi,
> 
> On 30-May-25 9:41 AM, Ilpo Järvinen wrote:
>> On Tue, 27 May 2025, Nirujogi, Pratap wrote:
>>> On 5/27/2025 3:43 PM, Hans de Goede wrote:
>>>> Caution: This message originated from an External Source. Use proper caution
>>>> when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> Hi,
>>>>
>>>> On 27-May-25 8:56 PM, Randy Dunlap wrote:
>>>>>
>>>>>
>>>>> On 5/27/25 3:32 AM, Stephen Rothwell wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> Changes since 20250526:
>>>>>>
>>>>>
>>>>> on x86_64, when
>>>>> # CONFIG_MODULES is not set
>>>>>
>>>>> ../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
>>>>> ../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of
>>>>> undefined type 'struct module'
>>>>>     154 |         return !strcmp(adap->owner->name,
>>>>> "i2c_designware_amdisp");
>>>>>         |                                   ^~
>>>>
>>>> Hmm, this should not check the owner->name at all.
>>>>
>>>> Instead the i2c_designware_amdisp should set adap->name to something
>>>> unique and then this should check adap->name.
>>>>
>>> I noticed the unique name set to "adap->name" in i2c_designware_amdisp is
>>> getting overwritten to the generic "Synopsys DesignWare I2C adapter" name in
>>> i2c_dw_probe_master().
>>>
>>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-designware-master.c#L1046
>>>
>>> Inorder to use unique name to detect the specific adapter without making
>>> changes in i2c-designware-master.c, I used adap->owner->name.
>>>
>>> Since it is causing build issues when CONFIG_MODULES is not set, can I make a
>>> change in i2c-designware-master.c to initialize the generic "Synopsys
>>> DesignWare I2C adapter" name only when adap->name is NULL. This way I should
>>> be able to pass the unique name from i2c_designware_amdisp module.
>>
>> How can you check that, it's char name[48]; not a pointer???
> 
> A NULL check indeed will not work, but we can check that (name[0] != 0).
> 
Thanks for the feedback and suggestions on the changes. Yes, my intent 
is to check if the name[] is uninitialized before initializing with the 
generic name. I will make the changes and submit both i2c and platform 
driver patches shortly.

Thanks,
Pratap

> Regards,
> 
> Hans
> 
> 


