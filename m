Return-Path: <linux-next+bounces-6365-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC56A991EE
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 17:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCFA01B87B17
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 15:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFE12820BC;
	Wed, 23 Apr 2025 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OW2Cmwms"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB421EEA3E;
	Wed, 23 Apr 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421561; cv=fail; b=KD5X2iGxMVorbjXtaIPgps+qElWykuRd6EXxNH56rORUictQUA9wJw1dcOj9vYxUYSZkO+ahuLCQfqnEypPzLHKmaVEUdsrnRLOkOapS71p/TY1mhQnxx7BNfYa8IIG8fzV/Y2tWCLmw8p0ug0aJd1CJyX8hcFbUc0mYi2CzyeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421561; c=relaxed/simple;
	bh=Tj2GJscqgIA/p4q5iDZJgsK2Yf+ShNFZleoHXBdvpwI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UPgJ0hQ2kQ+BGCOR64Yjcnepec+vwKlJXl/89Eh0Mo2PYga23WaC1uTdFVR8yG9IwDNYmtTixgR+sjBZN35Wtl7VKDG3H6hlTYnwW06kwvHGuBE8x5QT1L5M4bRaizwIz4VPYxxbfUYhN5AjSd1WcvCgE3oICvqfhOnRxbOIheA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OW2Cmwms; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEzfhQ2hBgUu9Ns9rdPtJopfe5Lga+5XB5xbGi97rR7o9Z2HRyWFxAhE/UJpJga0/gZEFtdIC3n2VTzuIKySVmACNPZVYuU7Ol4u0p2OoIsB8JiYIyGNsouNg/jeeK6ttsll/IBNItthDKjQ6TsKfwMvIa3JfCahDXgvT8TTaiSvfgHpz/vbBHMSQSaYIVltrei/ryU80BO9k/JOjTyi7JzvbZtlKBOxHIB6occp5n1jnOYiXR4kCDwAd9h3N8CCiKMYuYi+palnybXzbloAxakSqpplQN9owzymvOTxmZCqrGJLcC+xxxbH6CLpvPun8tqe34tB2eeXjE5P1g1goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Y75ZrFC8gwXuK/4N+GQoND/GSOFyyCAn7wCjvWy5S8=;
 b=nGZOWBB50++SFomJF4nhksgrpxd0iAKvp2ynm7U/kjRFuBVilF/izQblhL8KAEvayEWUD4Rl4cJ18cAJtKULK8xxpuXujEJt5K7Jq2jbunDJx6DWMbD4B+ArBIg8pMpRjuNI+xqrCA/+1e5plhJqETyT5a/S21LKFaUGupo9f7ejRe7VY2ocmTK6Xow/Xzdz7JweOIcCBuapy79dsftanmy779NVQb027Wh3E+wDxZmXow/nwO9O3FLaJxSZiHlSVpBTojI+d1dFAey5Z+KPxFVmWQqzn+QdDpaugvAhVgZ4J7vPp+NvDh9lGRn7oalF7OGH5gu4SZBUGFbN5ix4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y75ZrFC8gwXuK/4N+GQoND/GSOFyyCAn7wCjvWy5S8=;
 b=OW2CmwmsHRpVBQC6siSf7r5Zo8uGKL6SaNfgiBCT2V9mvpcqmSj4V8evAeYGRNsUHhJjx7waaVW4vVJ2/hyheSE9Wx7wADoB4djWiD6cPDdPREjanjv/OF5O+QNAqmvQvX337GEa8zlIncXgnFpWGJHOyUdhl2A3685u42g+dpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 15:19:14 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 15:19:14 +0000
Message-ID: <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
Date: Wed, 23 Apr 2025 20:49:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
To: paulmck@kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::8) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|CY8PR12MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: c7898de6-d36e-42da-c313-08dd827a3506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QU11QnhXSkd5cmV0bUlRNmQvcEt3Qit5Tm5iL1IxMWpnN1BKVzVVV09xeTAv?=
 =?utf-8?B?a0xVYTVkZG5lUHdxUlRwTXI3elRpdlRJK3UzWGYrZEZtVVBpMFRKY1R3RWZH?=
 =?utf-8?B?am42UU9Id2JzTzJYRHNLNmM0bytYQTVrUis4VmQ2WjhVeFRmQ3g2ekRkTElW?=
 =?utf-8?B?YmREWGRmMTRsdkJzNHpPbkdwb2Q4cFFMSUxTV3ZPUnlIQ2JrV1IxQXpKaWFh?=
 =?utf-8?B?LzR5OWt3V1NXdzU2Yko3Z1Fjc3hNQWxRZkkrcG0yQ0JJNWE2NHEzbEpnQUhp?=
 =?utf-8?B?UURyOG9SdHVhR2FlK1NaQ2hZam02bE0rRHB4WWpJYUZWZlJpQTFscUNTelpo?=
 =?utf-8?B?dFZ5UjQwRXhpL3NyRE9JMjZVc0ZRSGNzYktTSXZPM2tWRjNLYU1LWmNHZGpL?=
 =?utf-8?B?WklsTU5LOGZQUjkzZXZnUjFRd3NiYWtCamdseDViMHpiTkN1YlJIbDZpNDNa?=
 =?utf-8?B?dStRR25hREZrQXNqLzVVOXJvWndRQ2F2OXRLa0pCNlRXSVpwQk8xeUlTeEZX?=
 =?utf-8?B?Q0tpZkZXUEREb3ZYd1VLSkFFcGN4aDFsT1M5VXlUczh1a2JtZm5uOFFMd1Jo?=
 =?utf-8?B?eExOcDlzbTdqZzdyMm5oSTd6VDV1QisxU0xzc05pOGQrVnVsam9veEsvakJO?=
 =?utf-8?B?M1ZmWnVBUnhZdjFnQytTOVlkaXZTdHIyL2VFV2d1dkZSV2d3WHBZVWFrMHNl?=
 =?utf-8?B?aWdMVEpkRzNxUlNXWnNDM3o5UkdXOHdrdWt3clVnL0NBdUl3SlJMZitlNVY3?=
 =?utf-8?B?aGl0cjdyOFczMVErUFhKaWswODFUMS9weXBESGlKQ3ZyeHp5U3JXNDN6WGhk?=
 =?utf-8?B?d21FRTJaSlBzdENLZDg5ejlGRWx0TmwzeTdpSVNKUVJXQVZDSEUyb3JGMjlE?=
 =?utf-8?B?bUY0OVp5RW80TFVxVldWcjlDdkdPaXhBd281bTFWVXQrbm0ySWxCa0lkNjBn?=
 =?utf-8?B?TktVTGo4UGdoeXQrYWtGT2RBdG55bVkyNjY5cTd0ZGRNYTNwSW03UWFGdlBz?=
 =?utf-8?B?eXZlRWFHWUJGUmJ6dzhMTzR1NGoza3JkKytQanM0SUNyYjhiRlNzREE2N0ZI?=
 =?utf-8?B?WkVFZUNwR2tvTEx0L0dYbkhaUHdBdzlhaEI3YksvcWtxZzF3Znl3NWpTSml5?=
 =?utf-8?B?anhZZVRZQllyT2w3SC9sWmk2WjQ0RE8rRFVQL1VaRmlub1NKUXFSUGtlbEFE?=
 =?utf-8?B?OGZZVXUzUWVhOEMyZ1k2VFpMSHlrL254WjJRUWExVE9teEpRR3R0TDYyNW1v?=
 =?utf-8?B?QTFWUFk4SW9GZUJBMC93NUtYMEthaGNGTEpSeU9lbEFLS3ZMejQzaENsVkNj?=
 =?utf-8?B?TUxEWDRSZTZ1TnFpbjRqWXd0SDlYc0RyUk5nSXVaMlhIWTlRWFV4WHRvUDFn?=
 =?utf-8?B?OGRFSFZXd2xZSzdxNlpsb1hyMU9kV1RDQk9IdDNyM3N4c2NmNW8yMGJjcDlZ?=
 =?utf-8?B?K2JHb3EwQmUrUkJWa3ZPejluU29WbXo3S1I3bmdTMHVESXcvU3l6eHcrUHBW?=
 =?utf-8?B?eE9wa3hMaERTR2FMS013dnJuS01YNWk0RGlvVVJhMytKQUoydDBIK0ZZT1pM?=
 =?utf-8?B?aVVFeVVYbUt2Q2dYYTdUUFBhYVFIcEpIbDVCNjUxWUU0am9DUnE2WkJXQmdY?=
 =?utf-8?B?d1cyRTY3SzU1anJBRmRMNDlselFDR3Y1dzJYMm8zdjVlREp4djhnSnpMRUNx?=
 =?utf-8?B?Y3ZrRDU0MXJURUJqa1piWEd5cWhSVGNKL1BRL0tlSitUejJReTZyNzlhYXVi?=
 =?utf-8?B?SlZsdFpZVGNYN0tyNXVaeFVURGc4N29CQ0JOQUhWajZjTlFYQ0JSaWZlMVBx?=
 =?utf-8?B?bm0yeGpwU2RaendqVTE2RlJKT3V5R2pGYkJDa3NQeGZRd1FXZFZtV1BSdEli?=
 =?utf-8?B?ajhtdFZMZnRodFBTbFFKU0I4dThiZkNEa25mWUp4emo4SGwvKzNOMENJcEFG?=
 =?utf-8?Q?Br2aB2D6M1w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wjhna2JvKzQzanVJL3ZZTmZ4SG0vNDJCVW9zQmtOSW5CZUpqVTRleHFHMWdY?=
 =?utf-8?B?MGRsa3g5akdpODVOZnF3QnhZOHNuOHExQkZnb0tZbTBBOFA5eDNXYjdUcDR0?=
 =?utf-8?B?TGgrYTRzWVoyWXRnQzllSWZkRTNKbElqcXdyNGY2RTRoejBwK2hFbXViSFND?=
 =?utf-8?B?Z3pBcG55Q0U1NEI5SFByV3FpMGJUOW12RkJVblE5bkN6SmJZTGt3Z1QxZXNC?=
 =?utf-8?B?T2FZaGYvNjhHZXdlOXl0TlFwUUhKU0hScUdhMjVEWmhDOEx3K3daRWdUU2ps?=
 =?utf-8?B?Qmh6b28zYzI5bkxkd1VoMXBROEkwWmtXOC9pY1RPdCsyRHhOWi94WEh4amxQ?=
 =?utf-8?B?UDdPYWxLR2NFV0RkWEdpSUpubW9nMTY1eVRyTVEwM2w5cnlrbldUTnp3Qzg0?=
 =?utf-8?B?SFdQUHJLbjg3dDlpUTk0Q29KbUF6MmgxSEhuVzR4YkFCQmh5WGwvallZaDN5?=
 =?utf-8?B?a3oxMGdmVXgvK29qenRFOEJ0OHh4czkxaVpvcFJoNDQ4ZUFFU2w1NzRrQ1Fk?=
 =?utf-8?B?azNoeWRUVHp1aDA3WFdaM1NkeDFTV3U0dWVzNWprSVpzOHdSREFWeXZ5SzNE?=
 =?utf-8?B?azV1OEJwQ0l2VUJXUUExMTM1TGt3WURoTkN0aUVENVlaaUJ5cDNpM2s2UFVp?=
 =?utf-8?B?b1pUOVQyNFprRFlzVnZFSmVuRHRhTU00dVIyT1JLY21aeSthUlZlcjNzMlVz?=
 =?utf-8?B?TGJzYW9WVmlLU0RxSmNaTksvT1lPVlk0cWloSXlHZUFhaHhLeEdyNzFHZm9r?=
 =?utf-8?B?eXhPcVV3YkVvcnVDVEtMUmdzeUgrQkltbUpYMWRaRktMbytrRGRHWTBmRWVj?=
 =?utf-8?B?MEhoaG8zWGt1TnJETzhGSXQ1bFFwWXRFYk1mYzRUeGVYdmVSbFpZd3hDdXcx?=
 =?utf-8?B?bXhCTjlya1N2UTR1WFFMSG1WKzR0VnJnbVpRK3cwcEEwWks0aVpjZ01oSzBH?=
 =?utf-8?B?bFdldVA5Wmo4Vytvc1Bna0REMS9GMjIwUVdFRnpGMFlmZCtRT3F6VEU4bUx5?=
 =?utf-8?B?WkVlTVZ5bzlGQVV5elBJd3pDclBlRUpDY01BMk5KNWZNK1YwQjNYSnFqejdv?=
 =?utf-8?B?L2F3OVZnZGUxS3dXOHZTdkUwQkhFSEhwRjNsUm80L1ZpYmtvZGJaTWRBZlR5?=
 =?utf-8?B?WTdNcmtGVG9XWEJjWlRDMG9RWEdaVFFYODJwUU5PWWxQcTJPTHJWeXdvODRu?=
 =?utf-8?B?a25ZSS9yV3VORzUrY200OVIzVWlDQlVUNjdxVGdoQ244Y2kxNHNEVzlTSENh?=
 =?utf-8?B?WFp4WWJLYVkzbE5YV0UrUEc2VkRnN2V6TGpqNUdvUVlSeXJKRms2VkE3bXEy?=
 =?utf-8?B?c3A2bEV4cDBNL1FtQTh5VGdtMG5ISk5OMlA4MDNuMmYwZ1Q0eVNxS2pOZFpC?=
 =?utf-8?B?eTVjczFzaTN2cE5RSis2SDlCRVZRVUYzbE1qT3RmQjBCb2cvWnJXbjBYRnkz?=
 =?utf-8?B?ai9YTVZOU3l0QUVxOFdnZXhuMkJCUlFUUW05eTlSZ0ZIRStSUEVFTWErRXNU?=
 =?utf-8?B?ZmwwSlNiZGRLa2dQRU9MWWRMcFN5VFc1cjJ3eVI2all3ZVRlVWhzUUl5R2ND?=
 =?utf-8?B?bWplNWgvQVEwK0ZpNDlyVVFJZ0lsWFRKQk9BRGNjVW1JN0dua0srdElNNXBJ?=
 =?utf-8?B?NVU4RTNvamtyWFhrYkt1ekpVRWlUa1EzZnR0RkV4bGtWclBhMjRYQ2dmbm1N?=
 =?utf-8?B?TzFyK0Myb2xIR3NlRDcrc29LSmY5WEVXQk53bWdqTVJtcVRwWnhudmtXVWNN?=
 =?utf-8?B?TC9wVy83NUNmZjdjYlAxZllQYzlVSDM1OEN5cm40ejdqTC93ZjBRNTN0QnVV?=
 =?utf-8?B?eW11VStQdW5qTzFKbmkvVXRZeUdOTTgxSUVGakpTUEhtWXlGRmVQaGxYWitS?=
 =?utf-8?B?aytFTU4zMldVdktCQUlsSHlFRmI0NDlwRWliQ3V0L0NEeXR6UXphUXJJOVZa?=
 =?utf-8?B?Q0ZHRWF6TWpiRTRUTEkrb0ExSnZ4SUI2Nit5a1luc0NacjRZRFN3L0NmSTB1?=
 =?utf-8?B?L293V3AwVUd2dGVBSXFhQzM5K0VEQUg2ZFMvMS9pZ1pmeUtqMHV3ekNZb2ZD?=
 =?utf-8?B?UVBvV1NQcG9QUjRoNmpMck55M1JCa1AzcnB3dEptL1h6U2ZWU292TlBEdm9G?=
 =?utf-8?Q?fMwAmpsulmCpe/ZMLBVoLbsqx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7898de6-d36e-42da-c313-08dd827a3506
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 15:19:14.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8D+IZ2nC9SjhI5BwRXqBeCJDJSVcV4nfHk31ZTLH5oif2PxZ7ha78D3ugWJT+dqT6SMr529wk89hRNKydkGeMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124

On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
> On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
>> On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
>>> Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
>>> debian sid. When booting kernel message appear on screen but no messages from
>>> init (systemd). There are also no logs written even thought emergency sync
>>> via magic sysrq works (a message is printed on screen), presumably because
>>> / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
>>> commit dd4cf8c9e1f4 as the first bad commit.
>>> Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
>>
>>
>> Hello,
>>
>> On AMD platform as well boot failed starting next-20250422, bisecting the
>> issue led me to same commit dd4cf8c9e1f4. I have attached kernel config and
>> logs.
> 
> Thank you all for the bisection and the report!
> 
> Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
> Force re-initialization when rate-limiting re-enabled"):
> 
> 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")
> 
> Then please apply the patch shown below, and let me know what happens?
> (Yes, I should have split that commit up...)
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 04f16b8e24575..13ed636642270 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
>   	unsigned long flags;
>   	int ret;
>   
> -	if (!interval || !burst)
> +	if (interval <= 0 || burst <= 0)
>   		return 1;
>   
>   	/*


I applied above patch on top of 13fa70e052dd ("ratelimit: Allow zero 
->burst to disable ratelimiting") [linux-20250423]. This is fixing the 
boot issue.

Tested-by: Srikanth Aithal <sraithal@amd.com>



