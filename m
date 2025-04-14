Return-Path: <linux-next+bounces-6220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DEA87EEE
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 13:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE2DB188EA31
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 11:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8978A27EC99;
	Mon, 14 Apr 2025 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QklEZboH"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35B1714B3;
	Mon, 14 Apr 2025 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629920; cv=fail; b=c02juzJm/Je9vFjWCHZz3jSikjbCnWXE9qDH05LoCKCaTNGFqZ/sk/j374pjsQJYz2foyIwajrfKf15QHYG6mD+JQhZnbY1MAUBu39ZWJPfGTXmXynbnV18ZGh3NUWSv/oueqoMtdcu3RR5krxL+fBZS/XE4RaxeKpuljMTXX9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629920; c=relaxed/simple;
	bh=Hzpe+GZVxMuU64MvMWurenP3MX6SXn8OEPwvC9YmyF8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zwe1Ori4FDfTorIYJw0ijbrpEgjVe9ceZ6/QDyMlqQUOJMksNZ+9p1egRAAD3J1eohlgRGnSV8ZybgPGPPK+5CaB4bXR9hY7Y4uItsrrXeTXnvcRgACe0jKzYYZ5xr4QXvUeo0dGTVDGIpVZaG556tAxOaLB0NwRizxrylfAYqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QklEZboH; arc=fail smtp.client-ip=40.107.243.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmtzfxHFuBtFxZ+x8ycAup1aYb93fLzd0dXu9oUGagk2rMqYdNYvywHCiSRDULkJtGDBwE3e0RZYhyrZPCwbAn4GLmmA0IhY1P02cGJmZj7tThsjT1WtjQostcuDZxSsFx52HpEd0fCFh97Wt3jlfm65BsELfLhUNC2Otk1kcnXCe1mnPv7+tNqjZFQUAZ4BNlr6yORHbJEQ+RvwahbV3/AACpIIz9iSs7RD8M5g/j1SuiaFL2f+5i0rgnpNHCXmawqkiaCTV8/Zsgf20YJq3gso10JIVCAQCfbqrpgz/FgS9Xp3IT/RWfprPNH6+kiaZEq2SoYFM2H9J3XWgdQa6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESAzaRVYcAAHE4HJXFSVJ9Qe7L0lVLNUXk2lr2AGBZI=;
 b=nufzDvc02psuXgi4G+WOWYWhuYHqooVqK1mSX+Q9JtwDhqaXH1SBGnj24oWv3jk5mDrsvV1brFGExjTu16c8+H8lhlpBMee7lkwv1W/O9UcMjlmNukVrykU4k9kXU5QpvpFJs9k1ARX+TQxyLImnQovfeSKoqTxZMInqg/UtUR7qWYqRLMSa3+X9WvuPnp9U/8AE48pAaBLH/x6PCqQy3hS6xQtZexMtyzKAqpGgw037UcgYf7wUJorHjmpe8VL5iRKce/HvpCdzf7WK8kL7vyVlnY4BwlEEzPv5KxfyfFc6qJqWicGQNT77Yhd0mDLP6MMUk57FvydyUpH9IDcniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESAzaRVYcAAHE4HJXFSVJ9Qe7L0lVLNUXk2lr2AGBZI=;
 b=QklEZboHgKzUHCgI6ICrau2bChb0qN++Ydc3RC8E4ERb9JbSAfaDx3f3yMcRX3VPiufX3345EdX2w9g4zQ5qyF06VbpBsVYXoD6srhlVQSfNpXOkn5kD2kvM5Y4LKhIjcE0ySxWYs6wsvfWNebu6+D7+8Pcm2lEcRKlRIf6jfzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by SN7PR12MB6672.namprd12.prod.outlook.com (2603:10b6:806:26c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 11:25:13 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:25:13 +0000
Message-ID: <4c258a85-7b2d-4946-a64f-d0341c444119@amd.com>
Date: Mon, 14 Apr 2025 16:55:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Patch "nvme: re-read ANA log page after ns scan completes"
 causing regression
To: Hannes Reinecke <hare@suse.de>, hare@kernel.org
Cc: sagi@grimberg.me, hch@lst.de, kbusch@kernel.org, Ankit.Soni@amd.com,
 Vasant Hegde <vasant.hegde@amd.com>, open list
 <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <9a800759-b7f1-46dc-977c-7e39532ddec4@amd.com>
 <e1f2ac49-25f4-4b2c-b67c-10782b4e3455@suse.de>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <e1f2ac49-25f4-4b2c-b67c-10782b4e3455@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::8) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|SN7PR12MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b4a364-c14b-4b45-1dfa-08dd7b47060d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2pYWFd2WVBSRlk3V0RJL2pJTVBxc1M5V0hqU2haV2g0VTZrREtJb3F5eUF0?=
 =?utf-8?B?dnhTWEVrTG82NS9RU2EwczgrcnQ1bnY1TDZ2V1FIYzVMUEpKR2hJRitqSGND?=
 =?utf-8?B?TVV5RHUxMjlLNkNadGY5VUpPa21JVnRBbng5clpZVERDUHVSbTM0YXROMy9X?=
 =?utf-8?B?QUY4SUs4L2JPaGV3UHV4NEQ1VVFEZC9YVlBxQjlLRzFaK2VTays4ZkpxdE9z?=
 =?utf-8?B?Uk5CeFJ4MEVEZ0tnc0xISTUxVHRPZCtwUUNwT2ZQbU5ZTDdTK3czVGJaYW0v?=
 =?utf-8?B?NHl0cUJVRDZHWFBBTE54RCtEWTZ3SUZTMi9iUTNWWHFVaHovQUZzQWhTQkRU?=
 =?utf-8?B?amhTNHBiZTI1VVlvMzQ2bjVDaFl5bWFmRzRTV0t3emNYWGlHNmNkd3VYU1Iv?=
 =?utf-8?B?UkxPOWRYb1R1bFFoMUpXYUdiV28yN0QzTEwrc2FCSExzN2E2Yi8zbVVheFNG?=
 =?utf-8?B?TjV1Yi9hRHpZSTFuMDRIaVNnNnh5RmpUbXY5Z3UzcHVvQ0pYc0pzWlNZbHNO?=
 =?utf-8?B?QWZBc2hyL2htWlBNSVhRSUVlRnpxVDloSHd5b2pjWGdBcTk3UWpmVUZjaXhj?=
 =?utf-8?B?UDlLTXhUbEVaRjBsMlQyejNLcmh6Mm1wV0g5dTUrdnNGY0dtUG9WbDVnczFT?=
 =?utf-8?B?a09WbkpqVGJoYUNiWVdEQjlGUXV5TVZSRGZhMU5CWVE0aG1MVEVzdmtUZjQ1?=
 =?utf-8?B?YXZBSFBmTGlYSWRleDN5M0lnWHQrTExkL1M4dE1GWFM5QVVPMjNjMko3eWtB?=
 =?utf-8?B?OTRXU3REaDdrTEd5UjZQZks3L3orZ0VodStBc2RlQ0JQYjdEOU1nWmREbkJs?=
 =?utf-8?B?RDNmcWl6OUpnUjhRb1lGL3ZiRStLaDArOUpNSUVnL0U1YkJOeDFyYnZibFhz?=
 =?utf-8?B?T2xnWlVCcW9FSWt3WWZsV01ObWp6YlN0eHNnYXZuM2RhUjBZTDJIR3FGVGVa?=
 =?utf-8?B?ZXlBc2grV2x0TnVyWUxOaUtQLzB6NGxrcHdiMHZqam9aYlFKVnRZL0x6ZTFy?=
 =?utf-8?B?eXhtYVdDQjBrQ3Q0dC8vbUdscy80eW1tOVV3QUpQSWZHQXFydmwxQWl1VVBH?=
 =?utf-8?B?S0Erb0hjdU1rWVM1MFFMWXhNdmoyQ1ZRSk9mVldjQjJYWStzY2xyNEdrdHNh?=
 =?utf-8?B?SDhsQWpsZkV4UkRqKzBLMTllRm85dExncnN5eitMc2lOQ1Avc0hEZ24zanV6?=
 =?utf-8?B?UDV0d0xTYXJXNUJoeUFubGRZWFN5RkVDbk02OE9zNWJqSjd6TlRQVUU2UXZD?=
 =?utf-8?B?UWQxOWdpRHJCVElwT2FFSjNocWZsVlY4UFJtZWJxb0svZHlxOUprN1owOWtK?=
 =?utf-8?B?cGRBUlF5Y3A5RklkblB0V1djSXRNVXpleEZiUU1TNlFIZTBrcVBpSGI5REJu?=
 =?utf-8?B?M3cvYjRpbXVESmQ5YXdERGQ3UDZrR1ZGa2tWQUFKSXlqc2JwbGpnOVgxclJW?=
 =?utf-8?B?d0lxaHNGUHJhZ3dSM09WMFR2eFlsR1pPc0Q4QnBTdXBQVENLbHlvWWprOHVa?=
 =?utf-8?B?WS94UzNYRzFHRWMwOWRsTUVYUnRyZ3ZyQUF0U1p2ZmhnSFVETG14Wi9aMTNK?=
 =?utf-8?B?YWlCbVpTOGFzME1yV0t3WlVSWlg4eG5hMS9MK1laOE9IRTRnZEtqSXZBaHd6?=
 =?utf-8?B?MEQ5TWUya3grOXdDOEtaUm5YMDB5em9BWUltQU1hNUNHblFWRko3SHVHR0hx?=
 =?utf-8?B?dTAyUFVuK2g3dmZTWXd2MkJFdHdpdjdVaEdqbDhUelhZSTJVWWE2d1psMWNx?=
 =?utf-8?B?dzZxTUJqMkdVdTVrQnREc2NSTVoxNmdNbkpKcEM4VzQ3QVMzSk5UVzdHMW5M?=
 =?utf-8?B?U252QVR4UUpMemI5allmV0hxeTdYeC9SN3p4NStpdnFCWTdGSGNLWVBKdVRs?=
 =?utf-8?B?cjc4WURxdElMNUxVS2tZb2p4Y3d0MlhVOEhDRkpkMHVjZkJDK1d4Q0pVUnJn?=
 =?utf-8?Q?UJRNRnfNbhM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHZwQVNMUThLb0FhN3VrMitvRHZoaFlQSnZKNVBHOHZjOEJsTzRmWGRSY2pm?=
 =?utf-8?B?UkQyU3FmSldnVzB3eEkrZ3cyci8xRStoOHFzRzQyUHgrazFaY0NvbjRjaUpj?=
 =?utf-8?B?ZDBpbzBtd2d4aEtKTWtNdWRBS2dBcnNpSjFOcFdkUTBoeGNSWDU2eWs2K1o0?=
 =?utf-8?B?U2pleFhxQ0p6eG84QXdEejdnanNteGRiSFF2MmRWWjc5Q0NMb0hGMmRFVzZG?=
 =?utf-8?B?R083WllIeTd4V2NWa0dtaDM5SUpjb05jZldoSWY0R0ZNTnNvZlZReWVyZ1M5?=
 =?utf-8?B?MUJxdG5hamJMTHh6YXBPVkxLYkRXYTFEcU9YU054cjVvOGtZaUlLMTZkWlY4?=
 =?utf-8?B?OWdSZjdKV3FERUhlV2ZPSHI2UU00UGpWcUh6UStLanFueEluM1VEU25UdFIw?=
 =?utf-8?B?bW9qV1hCclVjNGtXMGs0dHZEK1h4ZkNrL0s4SGR4SUJJZEYrU0pIQ3didkFZ?=
 =?utf-8?B?Vk1uV0pMN0dsQ3hXQXpabk1abHcrQ1VlZ0pmNXlodnFLbERySFRlRG9xcWtG?=
 =?utf-8?B?Y2dJejhSazRuS3BvVzlNYWNZb280R0VVUnhiWGFvK0RiVFJzNlpzMFdGVzBS?=
 =?utf-8?B?MDdac09hL0FEKytCTXloZlllVyt6OURzTkpoaG1qYnFGUVBieFRvOXFSYVlw?=
 =?utf-8?B?M0Y2RWdUSVNOZjZPMWU2eG53RFdCaUttU2JlNW44N3V1K0lkdVJUSm5EdHN4?=
 =?utf-8?B?YXhZWVZuWURBQ2k5bkhCckdpNlhuRm5pUjlCVjZTNm13dVN3Q3ErdlA3UnFV?=
 =?utf-8?B?RGFLZUV5S0R6aytrUGV2V0FxNEp2WWFiT09OQ084cUxZQTdSN1Ayd3prdjBk?=
 =?utf-8?B?OUVUZDNkalhpV3hDQXBTV2NGaDIwQ3lTTEtRWVZqUlczK1lZSEFsTlZTNlUr?=
 =?utf-8?B?OW9mQmpzb09oaVVoUzJQdmZmS1hmaWkyTitSMzhYd1NTUkp4MFFwVnk3dmNJ?=
 =?utf-8?B?Mlo1M2lEVG5TakRIUkhJc0hXMmlxUlg2c21jSlFyVU5vUXZyc1gzejdPMUlQ?=
 =?utf-8?B?VWdQcEsxa2g3U1owTTAyc3puRFdzY1duZDdXUkg0bG1CK0dFWWFMeTQ0SUhz?=
 =?utf-8?B?dGlFckF0L1F3S0o0NG9UUHJXcExGTHdadnpBaU9WMVhEK3NTdVVHa3ZTUTZp?=
 =?utf-8?B?Q09lTGY2aWtVYkZPeVVPbzY3OXljN2IycGkrUHJ3WlJvYUFueXErUFdHblpW?=
 =?utf-8?B?QmNvVTVXa2VXWHNlSnVObEdya3FhTW1SUmZocFlpUzc1cHZxNVFGRUpIM3Jy?=
 =?utf-8?B?K1g3VU5FR0lmUFRxMXJYd2VzcG5oWXRhTGpHQUtjR2liaGFnWEpObFFGbWdC?=
 =?utf-8?B?K1ZHTUh3eHNJb0x6YmhtR01VSUc4OEFhYjVjSE1YQ3h5S1Bkak84Q3EzV0FF?=
 =?utf-8?B?Zm1qeU5PTUorN1MyUjQvY3BhZjVnQWJhNjcwbFZ0WDV0TXdBUWwySEZCbFF3?=
 =?utf-8?B?K1IwNmREWkdFZEpwSmhjQW0wU3RtcDZKS2JKcFNQc25TeXA5MDh3cmxib2NV?=
 =?utf-8?B?eS9PaVhKcklyZVVWTWw2bGVMUHEyaml6RlhMNy9FWXI0RW1yaWd4UWpsZ0hQ?=
 =?utf-8?B?dTFNTDZ2MmZWV0VKOWM5K1hlUVQ0Zng5d3ViV0ZxRksxeHc1cUI1NVp4ZUxB?=
 =?utf-8?B?Y3RWbzNBNTFWVWJnRnF5S2dxR1pBcEc2RWprcnR3QXhWRERTdWs2SWZNMW5G?=
 =?utf-8?B?R0ZXRTQwZnpOU3JzbTY5bGE5UjZUTEpZeTZ0TEdYd1dBWWVyN1RMNnhLRjNr?=
 =?utf-8?B?eXhCVWdCSjAwTmJRVzJEYTJ4OE9PeTAycVBURjJKRHJVeEtOaThOd21ISUFM?=
 =?utf-8?B?T1RMQS9PUVZQaUVPRTg3a2UrOTRYUkZDUFl2V29NTTZUWkIxTEM3emI0RElS?=
 =?utf-8?B?SjljdGQ5bklRcnV4aWovUzZzN3JXc0dWbk1TYzQxWWF0QkxTZ0ExUW9LMXFE?=
 =?utf-8?B?Yk9XaFhZbUZoSjh5VzZVclZQMjBreHg0S2JiK2FyYk5kREpMa1NkUUtnOUNZ?=
 =?utf-8?B?d1htQTlkV2R6UWlLeDZRVzFWbm1zbkM4TFBHU0VHWitjNUxpZ1VoeWYxb0RV?=
 =?utf-8?B?ZDBlbU5hNUw2TEFFZjUxeHd6YXJGcXpISlJqOXZUMFdXWlNUSVQ3QlBLS2JM?=
 =?utf-8?Q?sVUxljUsIPqBnhBU4btEO4MZ0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b4a364-c14b-4b45-1dfa-08dd7b47060d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:25:13.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCcG+Xaj0MXAlkCla0TD8DaYGmMpBWIhlUOd8QVjfHW15ZWaQBJNamAgc2h143AQ4QOwCXGo9VyofT1cyttsIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6672


On 4/14/2025 4:39 PM, Hannes Reinecke wrote:
> On 4/14/25 12:53, Aithal, Srikanth wrote:
>> Hello,
>>
>> With below patch in todays linux-next next-20250414 and v6.15-rc2 we 
>> are seeing host boot issues. The host with nvme disk just hangs on boot.
>>
>> If we revert this patch or disable CONFIG_NVME_MULTIPATH then host 
>> boots fine.
>>
>> commit 62baf70c327444338c34703c71aa8cc8e4189bd6
>> Author: Hannes Reinecke <hare@kernel.org>
>> Date:   Thu Apr 3 09:19:30 2025 +0200
>>
>>      nvme: re-read ANA log page after ns scan completes
>>
>>      When scanning for new namespaces we might have missed an ANA AEN.
>>
>>      The NVMe base spec (NVMe Base Specification v2.1, Figure 151 
>> 'Asynchonous
>>      Event Information - Notice': Asymmetric Namespace Access Change) 
>> states:
>>
>>        A controller shall not send this even if an Attached Namespace
>>        Attribute Changed asynchronous event [...] is sent for the 
>> same event.
>>
>>      so we need to re-read the ANA log page after we rescanned the 
>> namespace
>>      list to update the ANA states of the new namespaces.
>>
>>      Signed-off-by: Hannes Reinecke <hare@kernel.org>
>>      Reviewed-by: Keith Busch <kbusch@kernel.org>
>>      Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>>
>> Host console starts dumping a lot of errors and log size is more than 
>> 100 MB. So I am not posting all logs here. I am pasting part of the 
>> logs here:
>> ...
>> ...
>> [   49.361223] nvme nvme0: controller is down; will reset: CSTS=0x3, 
>> PCI_STATUS=0x1010
>> [   49.434564] nvme0n1: I/O Cmd(0x2) @ LBA 0, 8 blocks, I/O Error 
>> (sct 0x3 / sc 0x71)
>> [   49.443123] I/O error, dev nvme0n1, sector 0 op 0x0:(READ) flags 
>> 0x80700 phys_seg 1 prio class 0
>> [   49.457080] nvme nvme0: Failed to get ANA log: -4
>> [   49.506511] nvme nvme0: D3 entry latency set to 8 seconds
>> [   49.536300] nvme nvme0: 32/0/0 default/read/poll queues
>> [   49.605281] nvme 0000:41:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT 
>> domain=0x0018 address=0x0 flags=0x0000]
>> [   80.081190] nvme nvme0: controller is down; will reset: CSTS=0x3, 
>> PCI_STATUS=0x1010
>> [   80.154109] nvme0n1: I/O Cmd(0x2) @ LBA 128, 8 blocks, I/O Error 
>> (sct 0x3 / sc 0x71)
>> [   80.162864] I/O error, dev nvme0n1, sector 128 op 0x0:(READ) flags 
>> 0x80700 phys_seg 1 prio class 0
>> [   80.177032] nvme nvme0: Failed to get ANA log: -4
>> [   80.225460] nvme nvme0: D3 entry latency set to 8 seconds
>> [   80.255395] nvme nvme0: 32/0/0 default/read/poll queues
>> [   80.301278] nvme 0000:41:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT 
>> domain=0x0018 address=0x0 flags=0x0000]
>> [  110.789207] nvme nvme0: controller is down; will reset: CSTS=0x3, 
>> PCI_STATUS=0x1010
>> [  110.861990] nvme0n1: I/O Cmd(0x2) @ LBA 2048, 8 blocks, I/O Error 
>> (sct 0x3 / sc 0x71)
>> [  110.870842] I/O error, dev nvme0n1, sector 2048 op 0x0:(READ) 
>> flags 0x80700 phys_seg 1 prio class 0
>> [  110.885040] nvme nvme0: Failed to get ANA log: -4
>> [  110.933460] nvme nvme0: D3 entry latency set to 8 seconds
>> [  110.963447] nvme nvme0: 32/0/0 default/read/poll queues
>> [  111.009276] nvme 0000:41:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT 
>> domain=0x0018 address=0x0 flags=0x0000]
>> ...
>> ...
>>
>>
> Can you try this?
>
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 78963cab1f74..425c00b02f3e 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -4455,7 +4455,7 @@ static void nvme_scan_work(struct work_struct 
> *work)
>         if (test_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events))
>                 nvme_queue_scan(ctrl);
>  #if CONFIG_NVME_MULTIPATH
> -       else
> +       else if (ctrl->ana_log_buf)
>                 /* Re-read the ANA log page to not miss updates */
>                 queue_work(nvme_wq, &ctrl->ana_work);
>  #endif


I applied it on top of next-20250414, tested and it fixes the issue.
Tested-by: Srikanth Aithal <sraithal@amd.com>


>
> Cheers,
>
> Hannes

