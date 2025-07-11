Return-Path: <linux-next+bounces-7498-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A718B0275F
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 01:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42533A8E12
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 23:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72627222564;
	Fri, 11 Jul 2025 23:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="INa/bQN+"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65491B0421;
	Fri, 11 Jul 2025 23:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752275176; cv=fail; b=uLAafboTJpqlofcU3S/fx2c/qjlFSM8n9RKbTwn9wqba+K0S+xPBtlomFxuYuKe89XLL70t+smuXAANhfZR9Y+KWfTxqVvC9zfcwtT+QT0H4/NXPC6da2lhg0mGXStWc6efYr3JA0C124RDH3P5Zjwzcm0qmVjcZhcytJ9PosYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752275176; c=relaxed/simple;
	bh=UypAJLcHBQG8gpXS01sJaudVkdce/T6Yz6Qgyo8QDro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NZhKLJCtHfwyA216Y9lORV/MPEeWAStXBRBaNdte5HgXcu2nUV5qXPcf1N9lIyzYNLr7MSiGMlZq2d5BLCz6iVEVyOhlztHFHrpf7Lsn4k9bH/Pn6orgpP/MVx3MuQWuztt2sL8HcdLxIBVCEUePJQRhdvq5INR+Ycei3TGGeys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=INa/bQN+; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJxiq7hDG7GXPuqPiGARJrgN6vg8AZeymF6NKbEckWrgZhhltvcmqfV7pTiMWCKf5itKtJuBBLLeTPqeJ9L72sBrVV68wZvjGGr2Vu1xH2I44DzCm+eas2kTf/1rhek4gvvy5xiBtflYzFbvjiEZ8mAwcoHzgzi9/0i5RZXpyi0N19OCSa6G7or3cT2JKVdsW8oanQkhdOR4CdLXYEc3XMh5oaddgO4qwz+ETJf1bDGailfqqIvafg3F0fv39xU0t4gFmopcaBBj9U9g7QfjgCHRgU3TDyiIzr2J7TYUiJvILTMOdC1xdFIMtOW0S0qQZGDieUNyxvz/x3S8xnNbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo34FqR2qK4BDGz/DcTI4G45lfvhlBfVj0j31hFHQN8=;
 b=GizJHvsIUx5M0l/FTUnwvC4ieKOlRziTF/Wj2hEiEF2RFAdJzEF1V7kOLqLp0ZVX/eFBD7ReTbBsgEQbLtIobHCygzs3KoCRDzLnvlWl73eNmYiSkZLvKQR6ZDEP4yrMAq859sUFIKEFa30b1Xi9aq1jF+VFyTlyrSCk1FTKo5mwX+zMTzI6RANMPp6e4jjeKDWJJ363oQyXRf085pWCYnagMxoJmXUWyPXo38q1QfSIyAFwu+8ErQbi0ubxebkGbuYC53nbqtFJQHa0A8IqNUeAAW0PSkL4NBtHv9f2g5r2Hsr9TgWkqNCpZcMe+cvC6UbVRPTbpHLk5x/QwUpdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo34FqR2qK4BDGz/DcTI4G45lfvhlBfVj0j31hFHQN8=;
 b=INa/bQN+TCJ6AeqeRKW3SZG3TBjGLL5dNKJYwVD5NpoU6jNO7mIdxOYD58lvlyQ/lhlWgBIuGqL4bUU31cskXn1ZSPsQDIzSUX48ZHFfJNi6SlFW0VtXP9OaPCuW0aOZNd0YFBBQV9wmAei3acq8BDBCymtLMa1sGcVhGYkWhznllOFyVLqDrO5FO2BPnNYWh1MH6aoyD88ZhYpH5Zp82HpW//vm9jk5eE2vXS61R47tS8as/kPSz6qRwiUkvwJD9Hj2KDs+Rl7jw/QHmDa5UVKNfrZIjZTKclL6Hp4/HT6WmH5KRpIAdRz5Ew3zpideTDjEavBff3k02VUWcUwyfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5706.namprd12.prod.outlook.com (2603:10b6:208:385::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 23:06:12 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Fri, 11 Jul 2025
 23:06:11 +0000
Message-ID: <862fa11d-0f9a-4193-91d1-ea930d2d334f@nvidia.com>
Date: Fri, 11 Jul 2025 19:06:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: commit 3284e4adca9b causes hang on boot with CONFIG_PREEMPT_RT=y
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, ankur.a.arora@oracle.com,
 bobo.shaobowang@huawei.com, boqun.feng@gmail.com, frederic@kernel.org,
 joel@joelfernandes.org, neeraj.upadhyay@kernel.org, paulmck@kernel.org,
 rcu@vger.kernel.org, urezki@gmail.com, wangxiongfeng2@huawei.com,
 xiexiuqi@huawei.com, xiqi2@huawei.com
References: <20250711230042.3468-1-spasswolf@web.de>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250711230042.3468-1-spasswolf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0029.namprd20.prod.outlook.com
 (2603:10b6:208:e8::42) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: ef608b2f-c6d1-4676-6f1f-08ddc0cf873c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVJRbzF5bnIxWEx4YmlJTW9HTE1xZ3FRaU9NSnNTMW1yUzdDM0hBYXI0d3py?=
 =?utf-8?B?b0NOejR2d0pDR0l6em1JUzZ0cnRzSUthb1lDOGFaN24zeTU5a2plVUFLUUxl?=
 =?utf-8?B?WE5CZlVubUhIaVJOVXFhcFBmZ0pzRm9ldmRUUTAveWdUcjVyQVpWSHJ1TkNp?=
 =?utf-8?B?dTJLZTc5Qm5KMkVxM0dRdjVUdEJBOUxjRi9UTlFNTGdBWjhqbHBjQlJsMXdQ?=
 =?utf-8?B?R3grMGcvRHd1a0xUWUFtRVcraU5oQTZwNGhqL2s1Z0NUdG55T2JKZHdIVG90?=
 =?utf-8?B?QXo1cm1zUGVNTVNLM3JUZVR3TG1rLzZnK0RxckpoMmhOaG96cmZWelFjMklt?=
 =?utf-8?B?T2ZxM1BJQzQ0d3JXdUdhSUx5cFdNOS93TU4zc1QyRmJwdkwrU2NDZjczUkxr?=
 =?utf-8?B?bE1oV1c5S2FMOHlSZy9WRWlWbFpEeEdrbjJjd0pEM2JsaFhKWkkzZVNpR25S?=
 =?utf-8?B?YlljQnRsMWpRbzlUTzZOQ0xaSi9ZWHV0WWo4TFpHbGZySHJyaFFhRmNyeTJv?=
 =?utf-8?B?anp4SVJSd0dmYzlWZ1l6cUpQWmM1TnhiTWI4ZUFrQmhvcG1oMm1HdWkvbms5?=
 =?utf-8?B?ZUxXSXNwdXNUTnhDdjQvcUVIbm9EZ0FoS1ZCUnRHbVpPT0RzRFd3TG9vUncw?=
 =?utf-8?B?RW9wbTkzeTJ5OUQwZXlPSm9qQmJDNXV3bzhVYmJvRTRvbUdYVi8vNTA1ZHFZ?=
 =?utf-8?B?b1VsWFJsMmtFMlhMK3ZlTkxJRGdaTmdUV2lxdXZwYStYdmlJRWxLN1lCYUZC?=
 =?utf-8?B?dk5aampBM2FYWUFjRWJ1OG04bGtScUZCK2NSVmVPR0hmWTJlLytJT3BQaFEr?=
 =?utf-8?B?RmhiTkJMck9QTWFCT0hIblMxWXpRaVpkcFhzY0t3NU82WFA1YkNUSHNyNXRw?=
 =?utf-8?B?QnMzbWRSMTQzNUdkL2VvTDM5WE9ERjAzcnRVNTY1QjNXYjNiNENxbHVlZ1hE?=
 =?utf-8?B?NkJ2SnpkcWtDZWdzTTM1dFlmdVI2QUpmK3RRL0IxVW1zYS9wMCthRDQyL0RZ?=
 =?utf-8?B?bXZzOEZjUmtHNHZNQ0tjK0ozMXlPcjlGNnBDTWIzRlJqa0NlQmxGSWY1RVc1?=
 =?utf-8?B?eHl4Y2RNQ2xVZk12ZjZ2Zm12b0N5bUlUcW9HY0xHZUNNOTVkQ1A4d3cyZ2Ez?=
 =?utf-8?B?MGp3QkZkcHVSUkpzNWVPRVhHakxEUTM0UTJlcjl5Nis5TjRBVGgybjQ1WXRZ?=
 =?utf-8?B?UXpZY0UvSWJId2pOcWsramFkM0s5dmtkWEFWcGVuSlN5SlBKNWwwZnBaRlVy?=
 =?utf-8?B?ZVI4Rzk1bVJIOHJFaGcwWjc2bC9oYjd5VXVGMFFuVm1WL2xyUEx5SUZtcHdZ?=
 =?utf-8?B?QTc4d21EYkhEb2xNYk4rb2tuYjBDL0x6QlIveFIveFo5a2VGKzlaS3l0dXFC?=
 =?utf-8?B?UW1EWHNxRzM5WnlVa1NxODRIaEVoZEZhdlpXVGs3RDUzSnhlK1NkMHR4YTJL?=
 =?utf-8?B?VU1ncXk2SjVSMGU1bmxUemJBSjBsTFV3UzYwSTA2N09oZk5qdG00YVhJajZ0?=
 =?utf-8?B?RS9zRVVXNGxZTDFsWWFXQkJPQVpWNG1RWTl1SXVVVHQ2eG1oWG5yemhQdU40?=
 =?utf-8?B?ZjRBQm9hK3h2QmFNLzFKK0ZMVEsxblZwejltMUtzc3VnSEdvN1o3QzNvWlJj?=
 =?utf-8?B?OXRJdjZ3RitnRHhuWGcrUXlOS3N2S0F0SExxTEt3SEJMQlE1Z1JSeDFDWHBm?=
 =?utf-8?B?UzBDRkV3dmpGUjhUQ2kyaUI0MEtoRVVVZHlKelAyY1ZGYWtYZDRwdEYreGtL?=
 =?utf-8?B?ZytGOFhmcmdidjJ5eE1xYWIzOVVBYWZwODBKbEhMSGREalR4SWtvV21kMnBK?=
 =?utf-8?B?V2dOdDNXaWwrYVVkRk1FSWkrTkpkRHU5Mmh2c0w2aFlYNVZVU2ZHempSaUtn?=
 =?utf-8?B?Rktkb3F1aVhpU3cyWWcyTUkwNEhRSkVsMzRVcVpXcnh4UHVmd3owbUJKcFg3?=
 =?utf-8?Q?Hyeg4Zg+lcc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXNxWnpKWUduWTFTSUk4NkprYVJHaVM1TzlJZTY1b2RWQkpUWlRVT2tOS1U1?=
 =?utf-8?B?U1VYYlVQOEQvYjNjMzhka1hJeUtLWStDaFYremd4aGFsa1J6Rys4NGd1YlhT?=
 =?utf-8?B?eTg2WEsrYjJ1QXc0MTc0UkVzeHljUTJXZ0ZQRlh2NnlBNGZ2UmtVN0F1czE3?=
 =?utf-8?B?ZkhUSWZ2U3diaFZNVmdnbXZteTFpbFFPK3FyN3FDSWxQa04xL3J4MGlQLzN2?=
 =?utf-8?B?M1d6aFVoeExVR25OUE14ais4ZnJ2Y0Z0WmF4VU9TUEJ0ZmZCZTMrZTdFNkVt?=
 =?utf-8?B?Rm8vWGNTM2doVHcvUEdTM2lNc0RUQUZtY2JESjF0dittVjFIMUU1YmVJNVhN?=
 =?utf-8?B?UUZsSHNWKzZVOVpIS2U2cUJaQ210cTNISkhYMEwrYlJwNzZpR0l1aXNsTnZU?=
 =?utf-8?B?L3dNanB6K3NCWHErNWpsV1NRUzZNSUM3b05YQnNuTFJ3N2Zybi9CcE5nRUhY?=
 =?utf-8?B?OE82Rlp0U3BmT1RkMld2ZVBlb3VnL2lmZlczSUxjUks2WEdsRzJNaFlxa0cx?=
 =?utf-8?B?TUZUNjRxNnQ1cVpQaStPdFJGNldYVkZaNEVJUzFNMGJTTG5MUWQ3cGw1a2Jq?=
 =?utf-8?B?Zys4NjVvSHJBcnZEc1hHU1dPNW1HVmRWR25Cd2dYYjFiSTlncVRjRnZZSDlF?=
 =?utf-8?B?Mnd0Q0tnd2RKeUtuYWlRUUlOZWtTWDBpL1h3UExtWTNvWUIrMGJaTUIwM01R?=
 =?utf-8?B?NklQam1EZnlKempUVW9XWGtZbklsSlFEUFk4RjBHWlFoOW02QVJRTmZaUFVv?=
 =?utf-8?B?Qmw0WXFhSVIzdWlRYkwycjFVN1hhRDUrcHFudk5HSmtGenJ1TVdUN09wMzBR?=
 =?utf-8?B?NlFzMDdLQnY5K2M4U1N2STlCN3NOa3liNmRpTFdJOGJsa2lQYjZlWGlLUXJ5?=
 =?utf-8?B?RktqQzNVdVpjalZSREZFZ3U0ZmI1Q3BUWC8xaDh1WXVmaHgrdDAvMVU2czVK?=
 =?utf-8?B?QStDdGtFTnI0czlqNFV2WnRQTit0VE9YWjRiOXlFc3J2Y1hiZWlNVWRRSU1C?=
 =?utf-8?B?YkNWekdLMkU0NDA1SVFJQW1GTGVwTUdTY2ZzSXZhTVpGWjB6SVRaSkhYUlRY?=
 =?utf-8?B?ejE5anFIby9mbjdMVDlJdTlyZm5SN3RTV0p0UDlGYmo4YUFhN1pQbmZ3bHlt?=
 =?utf-8?B?ZTA4eXN5cFlZZ01MYWx2MnhiTXltSFB6RmRPMUk4RDNRdzV3aFRobHpNY01E?=
 =?utf-8?B?dWh6Y0l3RThuTWZxMi9aVS9UaW9Vc2FXcG1GbkdKd0VYTHdNL0ZUdUhoV2hk?=
 =?utf-8?B?NXV4QWlZWm1JSXRTdzhmWGpHMk81OEwxelA1RHcvOFRoSE43aktiM1ErbXJM?=
 =?utf-8?B?UXNPanF1YXVkQXVUTXFGUjdBeEZxRTBmWkRsWm9nQXhuRkR3VWNyRkVDZmt3?=
 =?utf-8?B?cmE3cFBJNzJvRWlVR0U0UmtHelBZWElVNTVDL0owYkE0UTFEU0RkWUhYUUlq?=
 =?utf-8?B?QW1Zd0FDVE1BQzdsaWVlVGN5TTV3Z0owdmUrK0VqQ1U3NEQvVXhCOCtKQkJU?=
 =?utf-8?B?ZjlwSlZxS3ZTTG4vTW9GWUhXdkVjNjRXVjU1NTdxdVU5QUxNTHBIZDlQMVJx?=
 =?utf-8?B?cVEwOVdtZDU5WXhYR2lQbHdHRGUvYXVmaFUvSUVQamY4NjJkVloyZlNHdlhD?=
 =?utf-8?B?ZTFtQU13MFpSYm1BVEZIRkpUWE1OSGFuMGVlQkxXVnp4ZG43RmtVRmcyK2Fo?=
 =?utf-8?B?WWZqNUZaaUZOUWdXTGlEd3RXOEdXVmxmUU5WMXNnOE1IRFM5MXJlTXVkSnZl?=
 =?utf-8?B?ditFMk93SkMwc3UvZVFCRXIwN1JhY3l5Rm9Va0tIVk1xMklaZmJJSE5xa1U0?=
 =?utf-8?B?TGlCaElVSE5xR092bnl4dEI4N1M2d25pOHRMbExpb0E2dHpSUVVvRWt1T20z?=
 =?utf-8?B?RkpEclViM3NiQ3lVNDQ2R08wZ1RUSGNrMTVoTE0wUGdUOXJ6V1ZJaGo5OUc2?=
 =?utf-8?B?ZVVrbnE2WFFzTmdpdlNHVkVTWmlQVWEvU1hPWXhNRW1ENTJsRnJIZU5PaEhl?=
 =?utf-8?B?TnltMkM0OWN5bVg1Z1RvdzV1dUZHYi9mUFVRVVlCZjU2MFdibWlrTDRxRnBr?=
 =?utf-8?B?OWRBM1AyVUtwdWZady9EN01GTnpPTkU5SkpmNWk4amZZQmJ5R21FcWhTc25K?=
 =?utf-8?Q?x/cWaopYI8rEJFGdDoDM5P43F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef608b2f-c6d1-4676-6f1f-08ddc0cf873c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 23:06:11.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGUogfiU8Eb29p9PoY/ykw2NEX5UK7Ow9S42yuIQ1zAi7l22kEp7/Mi4xq5PZQd3TU+v9/znzM0GuF1vDLK86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5706



On 7/11/2025 7:00 PM, Bert Karwatzki wrote:
> When booting linux next-20250711 (with CONFIG_PREEMPT_RT=y) on my MSI Alpha 15 
> Laptop running debian sid amd64 the boot process hangs with the last 
> messages displayed on screen being:
> 
> fbcon: amdgpudrmfb (fb0) is primary device
> Console: switching to colour frame buffer device
> amdgpu: 0000:08:00.0: [drm]fb0: admgpudrmfb frame buffer device
> 
> after some time (about 60s) this error messages appears (hand copied
> from screen, not entirely accurate)
> 
> rcu_preempt self detected stall
> 
> with call trace
> run_irq_workd
> smpboot_thread_fn
> kthread
> ? kthreads_online_cpu
> ? kthreads_online_cpu
> ret_from_fork
> ? kthreads_online_cpu
> ret_from_fork
> 
> This only occurs when compiling with CONFIG_PREEMPT_RT=y.
> I bisected this and found the first bad commit to be
> 
> 3284e4adca9b ("rcu: Fix rcu_read_unlock() deadloop due to IRQ work")

This commit is still using old code which was fixed in the last day.

Here is the new commit:
https://web.git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git/commit/?h=next&id=2e154d164418e1eaadbf5dc58cbf19e7be8fdc67

Thanks!

 - Joel


