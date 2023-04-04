Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE74C6D6501
	for <lists+linux-next@lfdr.de>; Tue,  4 Apr 2023 16:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbjDDORp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Apr 2023 10:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbjDDORo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2023 10:17:44 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16BC173E
        for <linux-next@vger.kernel.org>; Tue,  4 Apr 2023 07:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdebPm8L+fjt6KSjngaVoeEZuWkM/A/t2dKJXyiNAulK5uH18zjf6pbgdDZLn+s3xvVQbaN/xoSlMOvyMQ7aZFB6wdLMayqukjBaOZim32EqYI1IglPxkVVoQON232+0gB+TSwhVt/iaKe9+K683Qiw2j0tyeK6sSTjQYNAbOWjOL1ObS5XJaTANafr8MGl+xAAcv7hw8rAkfn8NmKqAIbEYveVGJa8Ph6uQM6ouQSULuVBNjn0ZRN9kzenoY8cZ7EiyprKs7aEDY5J1zSvZr4O4FtSQbIN+fSmJWZlmq7QCScVtrXQqPtgxwZOCqf0jwxjkLrIn9X/WXVPV+YLpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl8qjs9cgmsdAlwsE3D2UKMKsUBIphH1Jfr0sFKlv8s=;
 b=KI9yYU6qmgxEGANO2VyLbKHPJfenSo0ZptoIPDtLvnr+ShpCw8/hq5+yadMgDz2iVR919MoOuCI7SaVfkeko1+zFl+Xr9LDhHrPyOeG7OW2blIMVGftPta8fr/55MeVUwH6jf8CaF/Evv3EflAk8F718QujQuCwXy6GFI7eG5wwP+7L/vvTyooB73u4BTuM4Wmol32I6Tk46T8azeHf1y8w6/ME+HnzkFWJqm/CLpb7EP5nabYJQaBqO0/c+bSIOiiy6EdjAwLrdbO/r2DpRMj73lZ7320cZKocJgkssmh0RsaF8Tiwj6jK+YIzsD+/Yu9Y/cxlUHlIP6apl2avodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl8qjs9cgmsdAlwsE3D2UKMKsUBIphH1Jfr0sFKlv8s=;
 b=kKMjNUKTONIyjVrTB5YKaXERO/KUDv1/iYTZvQoO9AO8Rgteu7MytWesIuefSYUMnHC6A8gA0n5exyljl+vz5bWRf+pkZGDarhv9YYda++ArE2SH/dWGmk0S/7bDwuc174jIX8NylU87T2G+whjjrq65C5CoiS7BbZLY4EyIErA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by SA1PR12MB8143.namprd12.prod.outlook.com (2603:10b6:806:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Tue, 4 Apr
 2023 14:17:40 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::e748:b085:209a:1a71]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::e748:b085:209a:1a71%9]) with mapi id 15.20.6156.028; Tue, 4 Apr 2023
 14:17:39 +0000
Message-ID: <c3d3f1c5-d9b0-9fe2-a481-6595a8f2729c@amd.com>
Date:   Tue, 4 Apr 2023 19:47:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: next-20230404: amd64: drm_crtc_next_vblank_start - kernel NULL
 pointer dereference, address: 0000000000000074
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>, linux-next@vger.kernel.org,
        robdclark@chromium.org
Cc:     sfr@canb.auug.org.au
References: <dfd986d8-b7b7-a307-0a5c-87d03afba136@amd.com>
 <6e16291a-4765-0b85-b80b-f96e1482e11c@gmail.com>
From:   "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <6e16291a-4765-0b85-b80b-f96e1482e11c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::12) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|SA1PR12MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 1890743b-5856-4554-dc5e-08db35175894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xq5Ie5BusanxsnB1BCBin+k4e25T6qfuDmeCaXA1/YgOGrYRyOEhBHgVgrFav3giionZeq+eAG1+dBbEa9MdTv8c2BWhkjyqrQqHM/kGYbLcrWiDx9/wJIssMqkKOE2o2oqk4cgp8kAtvp9Lp/o9ixZFeoW+FmNRiY2JZD1eI3xm209JrdKvnbxzQ4N/LsQcmT0R7j12iisx1pJoLTSlVZkatAEi+oR9JCvwpt37+MQdJZCTTwWO2+WXHheHuuNHyhlksXDB/vDbIGW8NuJrmnLxgwf3F52SNn2ueJ1zUZR+Xt+BSO2+NNNM7xotcMJYcoCys0mxhjF8pqEdGYckpp/uYX7QHOzO2kVPotGpIg/9bNQk6e/m5Jq8ZwTZDpb4kx9p7YqG2nGo+W9FCTTeMV5cBV+KmtJPxZ8wth2T0FugqxfvQCrnoL/Wj6uNGraQb+OSPO7jVg3onetzZGDJ+Fllmzh+6EmQI84A0ZmZQP7+RsyQAt0InmKsxapPQCnAqNnaJXeMiuOLdSl0aH+tet0eaSxyrPHy3JXIaNelG4IWQ5JH+enBw/GcSv2uRj3jgToX4EctwyP+Eyrrn6Nc7VCBZV5J88RelebItPqB7F9MZVMdbkLoJZdJK9nYfpq2cFUKbuw73IMI6+82wKpnBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(38100700002)(41300700001)(66476007)(8676002)(66946007)(66556008)(5660300002)(8936002)(316002)(31686004)(4326008)(478600001)(2906002)(31696002)(83380400001)(45080400002)(186003)(6666004)(966005)(36756003)(53546011)(2616005)(6512007)(6506007)(6486002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3BLV2VnZUxvQU5odHlzdjNmWTM1UnVqRDNCM0daWFVsUGk3M1lzeFlWR0Ju?=
 =?utf-8?B?UmxzaldROUVBeGh4TW10ODRVUTRFMzhQbUZPWTlOUWVxSDlMd05BRGNyMUR1?=
 =?utf-8?B?c0QxL0p0Yy95QXV1RVo4U1Y5VjFLczFqZkpNYnpBcU9mRnhMZEN5ZWI2SUU2?=
 =?utf-8?B?dUdmcVVDb3RaZlpnY0dld1RSMmozbUxzRHNDQmtXVDJMZVMwQmFLWi8yNzc2?=
 =?utf-8?B?eDhTR0htOXdQWDJqSE9tT1RUNjJmZ0Y5QVY3MkJ4SEtnVHlFeU85V3pRSXlz?=
 =?utf-8?B?VWJXelo0SWpKZGx5R2M1TTBVdWV1MUtKR05WK09YNmFtTTlJYnRneVE1bk9Y?=
 =?utf-8?B?Z05Ic2lNSWV3Z0U4OXRVUXpST2ZZQUp1QU1BdTlrUmhmY3BpbDRhNVFYbC90?=
 =?utf-8?B?TW1RTlRER0grVm5GZDJiRVQxUUxrY0dQOVduc29jSC9mbk91NWNNZFZGMXNO?=
 =?utf-8?B?c01XeWhoR0wrYmRiZzVHRkJWcUlDU01XYWpETWtjREUvY1lRUEN1clNpMGNl?=
 =?utf-8?B?VlJGL1NrcHAwQ3dTNUp1SjlpUW4zcVJiUjYvVStETzIwZnNabkRHY2pMMWw3?=
 =?utf-8?B?M254MHVVbE1tc25MOVVaNWJPTmJCRStvb1cwRHFrdGtMTk1RT0NLVzcrei8r?=
 =?utf-8?B?MDIxWUtHRTNYSm5NejJkWDFEa1NrS09XMTZ6R3cyUEtvSXZrOXppenZiRlRS?=
 =?utf-8?B?LzV5SXd3YjNMdjZna2U1ZGsweElEZjNwOGZraDZQNUE2L0JrUGZUekU5NlFQ?=
 =?utf-8?B?NGZUU0pNWEVlTklVY2M4VlJjUUFIYzROU2Q0UG5EVytsRFk1eXlEMFB3SEVZ?=
 =?utf-8?B?VDdodGVRbjNZZVNXMXhFU2JiQWRYRmF2b0Y5b1cxSndqVmsvUS9zNzRjRWpE?=
 =?utf-8?B?VSt2TnhwRXE4c0VQOGRpL0FtRDV5NFc2RjFCOEZtbkppRTFjMHcxVVpvcFhj?=
 =?utf-8?B?Mmx5dW9IRVlwdlFYNUt3VFNIV1U5a3NzU2VVUmJ5THJrckh3TmpZN2d1dWlw?=
 =?utf-8?B?bUVGZU5odWZSeG52bDRaM01ZTmYxdW8ybzdEejl3aXU4TFp0OGFKVTJJZFh6?=
 =?utf-8?B?TU9XcjV0aVl4NU0vZXdZdzdpUVRtMlNyK3kxUDF5VDhSSG9vbkR3emNvMWtt?=
 =?utf-8?B?SU95MUszaEtXYWtVQ0hyUWZzRGFKQ2VsOVFVT0g4aVJ1NDFoclR2WWpwOGlh?=
 =?utf-8?B?SVI1RzJVL2t3dlNpUTdqVnZ0dHA0WGYxMTVkcCtZd0VYL2FmN1Y5d0grdkt5?=
 =?utf-8?B?VXg2dkxrNTB6cmZrRktnU3FDL0JpbUo3WE5LYTVJOFp5NUxhd011blhEVnBX?=
 =?utf-8?B?dGtFdi9nTGJuLzdxdGJHbXA1Q3dscnJiRGtPVTJXOUp0cFN2bUs0c1BLRjBH?=
 =?utf-8?B?UmkxZzJJTDV5RkUyL0t1SzA0TWVXNmYxc3pwN0FMcXQ2dWxZK3RvVzhBUUVO?=
 =?utf-8?B?bnV0S3ZseHI1MVF0U2ZjZnhMN053VTBNb080SlhHbkNnUi81b1VqSitQbEJT?=
 =?utf-8?B?ekErN25FNjlzeHRWbG1ST1gwbytwa09WcTI1UmpUbjdlRFl3N2JQRi96aDlF?=
 =?utf-8?B?TlBKOWk4SnZhbURRckpqeE5CWjlCQ2xseHpVL3dqVXVOcGowZWJ3Tm5mOVVa?=
 =?utf-8?B?Vy9jU2dRL1NCbExjempQVDhKeGdFRExiWVdDNWVpb056dVZwMExaVEU3aGNn?=
 =?utf-8?B?T0xMTTIzNGZJSWVtblpLYXBGNVg4MFp3YVhOdG5NcjlWTG9nQ1FLZlVIZUor?=
 =?utf-8?B?YnIxZVVmUkF6STYwdDEwQUxaR3M5MnRwWE9QWnhLZW9qbEI2eGJUcHpRSjln?=
 =?utf-8?B?bFhlMXZUcHpIemxnMWFUVUZsNUY0dmw1cnZBa0VLQVJpalJ4NTF5em8yK1Q5?=
 =?utf-8?B?cnpNZGM3NnpHU0x4a1RNa3NncERFSXJJZ0F5WFgwUHNKc1lVdWZ3OXhMTDFp?=
 =?utf-8?B?OTRUYUNqZmN1R2pFL0lOY0c5WjdiSzVsMUl5ZmMvMXJ0MVlURjJJeWRoSHp5?=
 =?utf-8?B?aGRJaXRDL3YzUnhmZUZOaUVWRExHQzBGL0hYNkpONUd2aElqbWM0UElsbENy?=
 =?utf-8?B?SWczY0d0R040RktHTEVGT2dNYW0xaHVmY1V5NmdtTEZBa01oRHBpbm43OS9i?=
 =?utf-8?Q?NzmqHHL10TDShh6TQ8OHm8Ql9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1890743b-5856-4554-dc5e-08db35175894
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:17:39.6132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xUMmC1sRbHWK1xHLafEJ1JW9m3Ik0virH1qCs8Qa51xWprJqm2KFnLR3C9ZUUA0/dSQcmkzad8PJzvNUa/lww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8143
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/4/2023 6:24 PM, Bagas Sanjaya wrote:
> On 4/4/23 14:56, Aithal, Srikanth wrote:
>> Hello,
>>
>> Observing below kernel crash on AMD arch, from next-20230330 onwards till recent build [next-20230404]:
>>
>> [   68.282610] BUG: kernel NULL pointer dereference, address: 0000000000000074
>> [   68.282611] #PF: supervisor read access in kernel mode
>> [   68.282613] #PF: error_code(0x0000) - not-present page
>> [   68.282614] PGD 0 P4D 0
>> [   68.282615] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> [   68.282618] CPU: 24 PID: 905 Comm: kworker/24:1 Not tainted 6.3.0-rc5-next-20230403next-20230403 #1
>> [   68.282620] Hardware name: Dell Inc. PowerEdge R6515/07PXPY, BIOS 2.8.5 08/18/2022
>> [   68.282621] Workqueue: events fbcon_register_existing_fbs
>> [   68.282626] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
>> [   68.282653] Code: 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 48 8d 0c c0 48 89 e5 41 54 53 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 00 <8b> 53 74 85 d2 74 3f 8b 43 78 85 c0 74 38 31 d2 49 89 f4 e8 1c ff
>> [   68.282655] RSP: 0018:ffffb30e0fbf7b00 EFLAGS: 00010246
>> [   68.282656] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
>> [   68.282657] RDX: ffff896b06f26000 RSI: ffffb30e0fbf7b20 RDI: ffff896b06f26928
>> [   68.282657] RBP: ffffb30e0fbf7b10 R08: ffff898a7fcd4000 R09: ffff896b1078f580
>> [   68.282658] R10: 0000000000000100 R11: 0000000000000000 R12: 0000000000000000
>> [   68.282659] R13: ffff896b12280600 R14: 0000000000000000 R15: ffff896b2f375330
>> [   68.282659] FS:  0000000000000000(0000) GS:ffff898a00400000(0000) knlGS:0000000000000000
>> [   68.282660] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   68.282661] CR2: 0000000000000074 CR3: 00000001513b8001 CR4: 0000000000770ee0
>> [   68.282662] PKRU: 55555554
>> [   68.282663] Call Trace:
>> [   68.282664]  <TASK>
>> [   68.282667]  drm_atomic_helper_wait_for_fences+0x87/0x1f0 [drm_kms_helper]
>> [   68.282679]  ? drm_gem_begin_shadow_fb_access+0x29/0x40 [drm_kms_helper]
>> [   68.282691]  drm_atomic_helper_commit+0x9e/0x150 [drm_kms_helper]
>> [   68.282701]  drm_atomic_commit+0x9d/0xd0 [drm]
>> [   68.282722]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
>> [   68.282745]  drm_client_modeset_commit_atomic+0x1e2/0x220 [drm]
>> [   68.282767]  drm_client_modeset_commit_locked+0x5b/0x170 [drm]
>> [   68.282788]  drm_client_modeset_commit+0x2a/0x50 [drm]
>> [   68.282808]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xa1/0xd0 [drm_kms_helper]
>> [   68.282819]  drm_fb_helper_set_par+0x3d/0x70 [drm_kms_helper]
>> [   68.282829]  fbcon_init+0x27d/0x500
>> [   68.282831]  visual_init+0xd5/0x140
>> [   68.282834]  do_bind_con_driver+0x1a0/0x3b0
>> [   68.282836]  do_take_over_console+0x112/0x1b0
>> [   68.282838]  do_fbcon_takeover+0x60/0xc0
>> [   68.282840]  do_fb_registered+0x1bc/0x1d0
>> [   68.282842]  fbcon_register_existing_fbs+0x51/0x90
>> [   68.282843]  process_one_work+0x215/0x430
>> [   68.282847]  worker_thread+0x38/0x3d0
>> [   68.282848]  ? __pfx_worker_thread+0x10/0x10
>> [   68.282850]  kthread+0xfd/0x130
>> [   68.282852]  ? __pfx_kthread+0x10/0x10
>> [   68.282853]  ret_from_fork+0x2c/0x50
>> [   68.282856]  </TASK>
>> [   68.282857] Modules linked in: stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink sunrpc nls_iso8859_1 ipmi_ssif intel_rapl_msr intel_rapl_common amd64_edac kvm_amd kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha512_ssse3 aesni_intel acpi_ipmi crypto_simd cryptd ipmi_si ccp rapl sp5100_tco ipmi_devintf input_leds joydev wmi_bmof pcspkr efi_pstore i2c_piix4 k10temp ipmi_msghandler acpi_power_meter evbug mac_hid sch_fq_codel xfs libcrc32c hid_generic usbkbd usbmouse usbhid hid mgag200 drm_kms_helper syscopyarea sysfillrect sysimgblt i2c_algo_bit drm_shmem_helper drm mpt3sas tg3 raid_class scsi_transport_sas wmi msr autofs4
>> [   68.282891] CR2: 0000000000000074
>> [   68.282892] ---[ end trace 0000000000000000 ]---
>> [   68.302761] pstore: backend (erst) writing error (-28)
>> [   68.302763] RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
>>
>>
>> Commit d39e48ca80c0  is causing the issue. I have verified same issue exists on https://gitlab.freedesktop.org/drm/msm [tag: dma-fence-deadline].
>>
> 
> Should have been fixed by [1], please test.
> 
> Thanks.
> 
> [1]: https://lore.kernel.org/lkml/20230403160314.1210533-1-robdclark@gmail.com/
> 
Tested [1], issue reported on AMD arch is fixed by this patch.
Tested-by: Srikanth Aithal <sraithal@amd.com>
