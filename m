Return-Path: <linux-next+bounces-902-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A405841D22
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 09:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E825A1F23B8E
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 08:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8BD54F93;
	Tue, 30 Jan 2024 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IbrVPHni"
X-Original-To: linux-next@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2021.outbound.protection.outlook.com [40.92.102.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB854736
	for <linux-next@vger.kernel.org>; Tue, 30 Jan 2024 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706601730; cv=fail; b=Hl1MgLlJkETOxnfV3u97pnVBRO+SZx4jGSfyMePxZD8dc+fOR7qyNLLluw+hSbdTyApROoqxwLWrqPCfdjoVCIO7XRAPDwabWNBNEum7G3AZ1Jxalon62ANYnttqnUaA2rWO2boCndkh9e1N6IyysXMxjUnD+kZphqGetugPVfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706601730; c=relaxed/simple;
	bh=afOPAUC1WplYViakvXQnyNF0zNWcpA4Jyh5OI7mnZFk=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=l9UO/IXm5mWrxzMsRGmWnzTwuYIi9qlzD3oZoRq5xh4bdA0TicUNAyMCCFbuabtCJFVojuIAx+QMr64z4CdhZnfb8D8bB/N9SXsMZmoehSjiLh7oDPeO8rB2LnhexizLb9xjIlzfH0AizrC0UEW0QvxCDEXnWePB12weXVgxz2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IbrVPHni; arc=fail smtp.client-ip=40.92.102.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjsTXNQoHEtnJFb0SkW7tKT+SKQPi86A73MWGc7yDIaBC2FC5WTRadJaFakRokDLtfmQpT43HZWJ2GIBYsqCwenaMsdTEAn97xrMwePOZVcYaW2T38hKdRLc+eZP+KwCT37OjpP9+jl9l7d0iZr/AaCcQ0pkY9+1yC94YtLVt93hCbvpOlqsGqzeevTDoqhZY9I/M5uuR95aK1WvPpELUwa4j1VgRsWGx3WOWLShKpHa6MYXSYfMSGLGHDmedWBhSgQDJJMjjsAvVI64YAgsP9lYZo6XAlKo3WReBP7kwnxJSdGY5ndVO91bJZVr4IMBe82LLuwERwWIkvDt1YWXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vmez4sTRq21msY6bwQ6763rL+JjgqoR1Gi7HH1ohiOc=;
 b=UT/ILRbb+lYpagLjaTYZIuCdPNMTHW7hnoJhC3CckidgV3FVfRU9pxK3Jvc4PZS1WVm0P5BAtO+XQPu387fkheT134rwLP+4uoerir2GoWe9id5i8oI7ej8Eu0kQ6brSdUzgeB7eCnEAueZu7A486SKfTID7COByJJgTklCxcGWJHhTnu1HY5OnHAhEqLyianvtUGA1wMUhhStjr9HTnHOA+oGe/vlAmApaQR5NEQWernQ3EVrDk+lrQA0UT4RhbiGCwAXr8yl2Mm4xygcbx85eH3ddN3EXL6Ts3HTe/4BKDqviIBzSonzlXrA0WzOOJwLYdVrXH30OCNFUVpFhLvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vmez4sTRq21msY6bwQ6763rL+JjgqoR1Gi7HH1ohiOc=;
 b=IbrVPHniwy7ZGfhNk5YBK9T6P5/vz8i8gs4XDy0Kn3rKiwPG9/XuJxMvY3z7lzo6fXuLaR3/8KKipLLtXGUAA8Q3vh/pju71b8zDhsagjrbHDhXoCid2LrIehqggUCVSvUIAfKFXhNYVaPCdseh4mSUKXdfV6WW7N/WYZL3HFSQXzW/yIFsMpKiLB8t1lCJZ3ylZBM9GbOT8p18wazT6jd3UYmC5VsjbsRDTVAcoQ5vuCx2UE6nftqTLhlNAzJzhhXtTXzuYNu3KeyPFu8ALppi9A2zzWlKv5u1xJ+kicxNeilGjt/3/KuVWOCSdZtguRtV5IiI9fyLn/tcnrHDa6A==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1493.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:180::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 08:02:04 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 08:02:04 +0000
Message-ID:
 <MA0P287MB2822E0B2A8CCC033CC5AB2CDFE7D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 30 Jan 2024 16:02:01 +0800
User-Agent: Mozilla Thunderbird
To: linux-next@vger.kernel.org, sfr@canb.auug.org.au
Cc: Inochi Amaoto <inochiama@outlook.com>, Conor Dooley <conor@kernel.org>,
 unicorn_wang@outlook.com, Chao Wei <chao.wei@sophgo.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Include in next: sophgo/linux.git
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [iOYbPqjwtGHI/ZwY/XfpYV1RXtxzbdTy]
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <dc944f05-217a-4ce8-897f-49d5b052e967@outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1493:EE_
X-MS-Office365-Filtering-Correlation-Id: 9591bfe8-110f-4a93-baa5-08dc2169bee8
X-MS-Exchange-SLBlob-MailProps:
	Om8TgR6f4EDOtflKzMeFuErs4pnn5SfOfBxXjZfvuQFiA+mnWkqcQrjrZHaVj8ry/iMKVrEB5BItpotKB6Fqv3QLUPvkOL/a4SmqVYgKM7I69o/DzbQvjOCoSG6EhG4wr5Bx8CrGTWNgVL8AfoubXwkYI+b7nzhQObVV+qxldnUwwa23TWP2VJh9vx5u8TrC2ZTQrGF9fbTiEeyiW0cetlqjfslcZcTHqj4u/JNJKaXj46YAgZO1/0QbyuRyO1XiYljG6rtTBuAk52USzx0CXnHF2yQQ9AWKzIHzjz107WUw3bMV78SDwxXzn6xwL4mOw3zzOMuFMUwEE2qtUOgiN4S/k7HP0X0wORT0vfE4xXZ0czK5pP2QkRhhgiIGgV7Nvf5Fpu6nQ2gIq40MXzBOSc8BaqiNAI8rRs4riDVNlFcAL4cDaQeC64GyvOTl/KcXUgl73ikfxL1sCeOlly4xvgHFcV6ScxMB4qMtmfNKJsyoU0NM0dXtsDdJX/3oOfJ1hGJg0OGVamZ/3iGmEVosMTOs8Ska7wOmCy5dC62cJOwtubJ+j5ON7ZK09EpIQzUh9wPc2rcT0+Kqfopv/8QzT1qL0NGMwOMdYeLefonXefG44j8+nFQKgvwywqLAlEN5UXje4+Or5/cCdZ+YFdRZsLlzHhWt5SgaX6lhntYMoBU3c6EjQPhdWWqweRq8x+mxH6TRlTxPfdvSqPKXGR8E1OXFdMPLy/S9PwKcH67yRcrHIWd5LPWFKRY5tfPTuVDxE3HkqeXfYTKceoyzEOGYZlgXMw9fiMtisQp8FZblliUZ4xFJFFZTSPJNERDU+7uWEkziy4L0ezTob7tRTknlC5Ryx3LWDKS+
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bdguPh1DRymWTv5D+xs3VjahQFdHDMsYZsqpQZA9Dsff/S7YUUJq0II3k25k2oSWhmfV3itl3h3ijADS1XwPMWi7XtMIJizKq0dhCxd6ea470EBZbonLGWW6KClWPaE+aPp0yFgtrAbHUqcDnlkbfIyjsANtbJGEd3uujY4uV2DVlI7J+Cpx2l/S5Yg+Lg+uvKbpfeFDLYLFDFpzdmRj5cagN8GRjkmQI2vlshiehkqccg7fSYqvJt0wEUpijTpGGYt9DOvZYF+wyLHIBWwgH6ud8ucadyClvxwH6/JVkDhCJsuLPgN7qTV712APq7GsBrfaS3KwjkCH9Rm00yxYOVKH0lwQ6EV++tt1PeLeKOqXPuBTcxmLuSEyr4ammsTePcH/qxdRcnselutmIBxUwyupXP4at4FjyeM17xiOFSN4wX7elQ1paIlWDfzfpsd4ApOoQL1/wWOtFmj2hjTU6boCjYyagNP1nTXMB6Mjis53kboa3Jlm7B4iPOkqKa+XwO3lhDcQYyliXFDn5yl1rDZ3XIbr3oCG1riikodg5X7Zbb5ycbBRrlbGvoKtEILp9shvD8qt6MOd7iWYsFJtC3XoGvpzGIQN3Qu7nnmSOoBGJeL1HbAZlkHT+TQRxZq9BHMkkUqDacszKMbwQxTcLFJezSi+ff2IKFzMaY7nhTM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWxiYk5mMlRVbm82WDU5MDBtRVZHNFQ1NUtPRUZnTlNtR2htVHNmL3lyMFRC?=
 =?utf-8?B?eW5YV0RKVkxheDRKWEgrYVVxOUlKU3Zmd2ljRUxVcXpkSFVKeGw2KzEzOURY?=
 =?utf-8?B?NFo1dE9VbFVZWnMzTFl4dGJmSGROdlpkRWRYNjlNcDNpV1h1VEx2dkVNd0hK?=
 =?utf-8?B?bTlSMUJoWHc4eUpZalB1MHZ2ZGtkRWdtMElna215d2FvaWp0S1lnV3BqV2tv?=
 =?utf-8?B?M2xMcjNhd3VucTVqNjJmemtabVA0VldZaHR3QStNckdmUXVBQXA4UU45d3FM?=
 =?utf-8?B?OFBXYlJ0OGxhRW4razhjK3hlOStKVDBjRUE4VG9xV2hIQ2xPOEszTThRaHMx?=
 =?utf-8?B?OE5CcUUrdDhTbG1jcmdLdVYyVXJGQXhQaTdkYk9tL29kN2gyQ3JYYjUzSitU?=
 =?utf-8?B?NTZBRUlsMGtUd1g4RHRUOWRma0JrSWdyYXk2K0UvcDJtdFU2Zncwa3A4M0VL?=
 =?utf-8?B?bkMwN0V6Y3BrbENrQU1GZGFlYVB0d0tRN0pBdVlYUjlxc2pZa1g0VWxJWWJE?=
 =?utf-8?B?OVRHNDRNVWNDMmRWb0NaV1gvOW4rQ3YzdHdvUGhieTdMMkZHOFFSMFVyVGlu?=
 =?utf-8?B?Z1BOcUdodDcrOUNCVEpBQWYvMXNzcXNTMlptakZnSmF6RzArRlRPT0ZKYk1s?=
 =?utf-8?B?bjJySENHZmN4V2pBUStNT1ZIZi9PMzEydUlYVHJYWmZhWlBhK2o2Y2g3aVM3?=
 =?utf-8?B?Z250ZDVXd1NTSWtIZm5jYmpzM2NBaUpzUGhCbjB2VE9sc2JqRDlDUkU5dTZY?=
 =?utf-8?B?QXJlUDJLdlEwMUtVTzFya2JxdStKRk0rdUJBSVhJM21iWUJwUG53K0lIaWE3?=
 =?utf-8?B?Rm44U1h0TU9sdEY3M2pQdytBWkVnNDRKdW5RRmcyVDhWc1pVV2RBYU9zUXJx?=
 =?utf-8?B?Z2VEVFRtbzZ5eHJuc3BsYzNLQzY3YjA2ZUZKNGVDRUFTUHhwanVZRmNuYWQ2?=
 =?utf-8?B?cWNmQncwZ3A0ZWU4Y3E2dlRYVnFrZTBHT1pTdXJFZXpKRW9sRnoxcjJ2Mm9O?=
 =?utf-8?B?aS8xNTk0N2pIcWlYUTJsVzZ6NElXUDlIdjVTQllPUmE0ZWZKRjV3bTZUdlI0?=
 =?utf-8?B?dVJ2OWtEZms3N2hpdEVNVENVOXRJSmNzMnNlVUpNOWJLNlprdWN2aTNzcVY4?=
 =?utf-8?B?OEZ6VGhQT0VyOFZOTHNOUmwzVTMvVFBPNDg2eHpYenZyU2hIak1lWk1ja1Vj?=
 =?utf-8?B?Vk1UTTd5cHR0dkNwWWNoKzNtS3ArL0sreFZ5dC9EOXkycEhqN2RveU5nRnpi?=
 =?utf-8?B?WHo4aUhPMWVnc0ptcUxYaXoxU1g3d2d0REJJY1V4SDd4cjZ2OUl5bWEwb0pD?=
 =?utf-8?B?Sk1jdlhJRzJuWVRwdFI4MEhjdmNYZWtXZnRkL1hLSjNibHVpdE81bVk4M2dv?=
 =?utf-8?B?ZFFWZ1FBK2xsM1pIUW9ocCtCdHM1VVZmR3pBSWozMGdjQnFPS2JlYm9yYUVT?=
 =?utf-8?B?RDF5M3VBZkwwbW1yUnhVKzd0YVF5b2lnSi96V3poR295Y09DcXozVWZsaVpa?=
 =?utf-8?B?R045RXV2UU1kRUpISW5zSFRwWG1xMTVUa3RxM0Q0aEFLVWFFT2VMdEZ4WCsy?=
 =?utf-8?B?RC9jcC9UTE93eGczM1BYdVgzbkh3QWhReXFOZmU5RnRtQVhPRnlSbnptZk9y?=
 =?utf-8?Q?Ren5Uen7hlfEbLuNr2Aj6gS6DFSPXKUEzl6SCreKv6EI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9591bfe8-110f-4a93-baa5-08dc2169bee8
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 08:02:03.9656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1493

Hi Stephen,

Please kindly include in the linux-next my new tree:

https://github.com/sophgo/linux.git


branch for master: for-next

branch for pending-fixes: fixes

Repo will be collecting patches for Sophgo SoC which recently we (both 
Inochi and I) took over:

https://lore.kernel.org/linux-riscv/IA1PR20MB4953B158F6F575840F3D4267BB7D2@IA1PR20MB4953.namprd20.prod.outlook.com/

The patches in the tree will be sent to Arnd Bergmann and soc@kernel.org.

Best regards,

Chen




