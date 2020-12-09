Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFAD2D4DB9
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 23:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388897AbgLIW3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 17:29:45 -0500
Received: from mail-bn7nam10on2070.outbound.protection.outlook.com ([40.107.92.70]:30817
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388898AbgLIW3j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 17:29:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqE0D0LndGGy3zg2BPNYolAjtqkVaz7J3kpCpPLYZf6c0YbDLq87tAlx98wfzdpnTjFpaCldm3MolwvqxDUBigaRSjO/sj7V29p7it5uO3Lo5bVsV9WZA0YsoNTqbAUka99mwIto4uYPO1dPSQAuLHnrsP8e7CPO1OcMqu+Api69F+TnYzf1uhxSnEJnBTv3J0cNIfvqyBCgAK3M0esyQwZ/gpvOPc8A2ZMAApcQcRO8TMFq3OLB3bnkN+hDpCaJc4ZwPGIOgv1vp/IZi6r1I6tGTQl0Dkf+d3drNB8YU/M6dNPmBQSr4lc65mvfsru3/0YgI8Pci6B8uFThpV85VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx2xbW/gkoE6DhdZBkGXaldrYE58Ood7W0EdBgjKKak=;
 b=aMAnoFi9xDtOlui/rVa0k0Ajn3Y/3Peg7HU44BfAwRaNxrWuKV9d+pPVOt0aKZZe6T2gW2Krabn94D88uf8g5TKJD8t95bjZZMFCLk11nKKckwfgjYOIDFgfQ5zxyXmQ4M074fBQUj33I0GCXgJ0xtwD/drP3/y3Uj5t54hY3uJCIWCUGwXfGLfXmttWJxyk77clsLxgTNpjlmp3a/AJ32/fpivhdCTT/ExdGDWn9hX900kf4cCaaNyV2P7ftcXqLTV415g2Bcsq/Gtn7JLe3MUsQu2SrRSiI2xBUbn7yME7TRGDaFTBA+IViDjb5La1UhqpbM5sKtoKNz6peBi1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx2xbW/gkoE6DhdZBkGXaldrYE58Ood7W0EdBgjKKak=;
 b=h03JDOWie4btOYqP5yVSqgfsZc78SgAKBHSHwQFfGT/RTbvaY1KtvbNb5inHkBoKU/zlpm5dDJOms9Fix2o02SaOnXB9I1tR9ET7hNNUW9lATA+UUIOlEnDNjnBKpKFeyivPS6A05D7vLcV9KcOmMrgjJTBOz3i62YKeV/cGoms=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3868.namprd12.prod.outlook.com (2603:10b6:5:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 22:28:45 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 22:28:45 +0000
Subject: Re: [PATCH] drm/sched: Add missing structure comment
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dri-devel@lists.freedesktop.org,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20201209210211.306f3c61@canb.auug.org.au>
 <20201209215807.75983-1-luben.tuikov@amd.com>
 <20201210092435.253b12aa@canb.auug.org.au>
From:   Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <05188f00-9dc9-74d8-ca10-dd2219c83ed0@amd.com>
Date:   Wed, 9 Dec 2020 17:28:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201210092435.253b12aa@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::18) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.250) by YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 22:28:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7eab8a3-081b-4c27-1de6-08d89c91cabd
X-MS-TrafficTypeDiagnostic: DM6PR12MB3868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB38686C958D96429E8928C0EA99CC0@DM6PR12MB3868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHgjyhOOyQfuo844we2X6Q2Gn9YPhSMDmqWK4g8VOj4Y9nAGHbueFCQYywmTgszm/sXON8lzc3Njq17kVVoK39WB/6lVA2eJWnJGRoefqSYcmkXfSXehe47dJW+5UxlVCwS35BcW5I0w2XGWEyWGgvLJBxG5eYeYEilLIvR81wfxmJRkSTxtoXonPknktEc4KuKim8yUnfXqV+RDTWWQxZTFFYeYrJyPAlg70QWpYUixanpJ096gsVmOSJgIDLIp5XoqneV/9fEM8Nfs7HqkTj70AFk8XAxNRHKrwodADkxfNmp3ax5XwVOauXJms8wkIwDa1k/xHbdSmyrl5VGXq50r1dD4Tj6e5xWLSaPezi4Mkk6nDIV8hCFObSCUYkMj93VNaJlJp4VpG7Elr8XpBA38SSoE85JEpic8hr98raOOOlKz0ZF1639ON+dkrbZr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(16526019)(186003)(4744005)(956004)(26005)(6486002)(31686004)(8676002)(52116002)(508600001)(34490700003)(2906002)(66476007)(54906003)(6506007)(31696002)(66556008)(2616005)(8936002)(44832011)(86362001)(83380400001)(36756003)(6512007)(66946007)(53546011)(6916009)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UGlFbEhKd0VtMkJoL3Q5T1YzbzU3N3NrNEh0bnhydW9KZ2RDNHl0OTk4cDlJ?=
 =?utf-8?B?Y1RuRlM2Y2pzREFsQit3U2FZd1VSbjFna1pSV1QwRWhMcTJjVFhydnNCdzc5?=
 =?utf-8?B?NmMwK0xDSUJaNnpOQ3VUY29PWWNPOENxM0pYei9lQUpmckozdlgwWWdsZFpE?=
 =?utf-8?B?ZW00YnV3N2xXUzUwanZ1RXFHdkZncFh6b3hEMlhFSlg2ZmVzcXpFaDZJeGpK?=
 =?utf-8?B?MEpBSmN0QlF2dzcyWjlBc08veGlrODN0NG1PUnNYN016TExWWXB1MGNVZjNj?=
 =?utf-8?B?MjFmQ3p1cGtheDR1WVlSTEh6eHpjMGhpREg4ZzVDK3BaeUpXUW1NbDZBZU1z?=
 =?utf-8?B?dGdZeVcrMU5KRHNSaXRYcGZ0dmdMUTVKUHNvclJjQjlHYVg1OG5HQVdpcCtC?=
 =?utf-8?B?Mm5jampKRXdkTDkxeElJYnZ1UW9HallNT2tKUml3TFczLzQ0YWZ1MzU0M0d3?=
 =?utf-8?B?RmJzQ0ZNTUpwU00xWmlEOWZWdVBMRURiTzg2bG1qaGlOVUFRbmQwVE5vdk5B?=
 =?utf-8?B?d1piSDVuWUdZMTRaZk5GMHQxRFhwNjZTT2lRdHVPWkFGdFNwVm5GR1h0WUdp?=
 =?utf-8?B?OUFjbHlJTjNaVkJBZTIvYjB2Yks0eWdLSlJqY1B0SklkdnZrTnpFOFQ2Z1lj?=
 =?utf-8?B?VHBnRit2K3A4WE5NUWtUUFI5NUtmV1hZd3JCSUpKMzBLK3Q1ZldnbWI0dTdr?=
 =?utf-8?B?eXlMdjlxMC9oYnIzRm9YdU1UL2lFME5ZVmFUeE9WWDFWZ0x4SU00dlFvUXoy?=
 =?utf-8?B?Rm53OWhTZ2hYUVNSR2w5ZGw3RVpVR0Rnb0RGTjRhM2NtcDZERnBwNGhuVkFO?=
 =?utf-8?B?T3BtaWJGMXNkNHQvNHR4VUtINmE2ZjRmLzRVSDFQd3VmY0lBNkw5ZkN5bkJJ?=
 =?utf-8?B?Z2U0K2FlU0JnM2tDaUVJbllmdElQQnpGd0FKSmt1QzBNaXlXK2E5VkJKU1Fu?=
 =?utf-8?B?Z0s3YlpIaVB0SDZGY2lRWk1iaXBVOUVtKzV6ZE4xVTVlNlFZWCswSUdaMElR?=
 =?utf-8?B?U2h3YWN3Qm0wUG53V2FHeTNxc0dvMHlOL3c2em5KcGhOaGxYWFVORERmK2g5?=
 =?utf-8?B?T0FVaVJnVmZRSlFoTGUyRzBhZHdtUHpQWjl3TWU0ZlRHNXloOVJTa25UU2V0?=
 =?utf-8?B?MTRtUys4MXRqSisvMm9YYUg0c1BHb2VrajVwZlJKOTBQQ3dhSmJZa0Fta2VP?=
 =?utf-8?B?dTZPVlJNeWhvbFliTDJYZlhGMFlzdE4rczFydzJwWVIxMnQyYm5LTk1ZQnVl?=
 =?utf-8?B?QTJneE1VSHlLYVFndEVobXRrSjNFTGhpbXgrbXoxaFhHbDZPMzYwejNlRW0y?=
 =?utf-8?Q?wk2fdz2tDZN/y2JuCCB/k+Md/cyWCkvThM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 22:28:45.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e7eab8a3-081b-4c27-1de6-08d89c91cabd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wzN71JzmDL+BcHSAgeJUNxo5aZc/HyWhv/XQWBS71599LmwGgjwH3H46RsdTzC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3868
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-12-09 5:24 p.m., Stephen Rothwell wrote:
> Hi Luben,
> 
> On Wed,  9 Dec 2020 16:58:07 -0500 Luben Tuikov <luben.tuikov@amd.com> wrote:
>>
>> Add a missing structure comment for the recently
>> added @list member.
>>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Christian König <christian.koenig@amd.com>
> 
> The commit message tags should all be together at the end of the commit
> message (probably with your SoB last).  Also:
> 
> Fixes:  8935ff00e3b1 ("drm/scheduler: "node" --> "list"")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Right! I was just looking into this as the empty
line up there didn't look good.

I'll resubmit.

Regards,
Luben
