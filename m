Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859032D4DDF
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 23:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388251AbgLIWc5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 17:32:57 -0500
Received: from mail-bn7nam10on2053.outbound.protection.outlook.com ([40.107.92.53]:52033
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388252AbgLIWcu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 17:32:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxUYCyB+rPJL7O+ThiFONUgYg4Uh2wlmfzUhuI02mZVVfPel7BseSnYdNBavvFEcR7NDbg/YTyEV5TLB588OguspK08R6LPQW1Pdr2GrtuXOuMQ0o2IB4j8a4wvWcr+EtUrEsv/qhI1z+oO1wdaMY21qecYBHqyerKCgf7Ox1AFKMPWVXYB3RTzMUka7aqUiS/i6ACrpSJulxiscG0o6iJyUbs7j+obxh1tP8cOZgZWVYNTrZtxtsR9bjrGDuuGf3AoxUXGTCdGSNR9p6KmxW5G3BHKexHxnjQEpiSjw+2V3nSC3o9fhnP2xQVR1mZbJW6FimbEtCMhcB1lDwPwEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vEQk7D4VRNjtpia9UhbvRIbgja/q6/PpWiYSpkjB1w=;
 b=ZrtDyRmaMVr6zWbQ3mXywfHmcsiaEEdwstUxeL4unaXLdkdfB3NPRnfLErfR/Tr4hNb3V9EmZSlaHa/mPuiglX1HYrGRJblRLRH2G1RGmTJJP9xnQ+dauFXnJ9kfC9TLGSelLCjqCzSGQetiPjzsBEFB4m1QTVN3vTF4iPe/GC/d5ioIHRvAwwvj7/YSnQKGIUIkooJA5kDhb1+A1v+1ex53U7AVGlQ43lbq2jjYeRKAG8QbT80hn+r0G1Lhur/mpIFzpXs9rmsQwHOytjdsnQJ9GimBmLXjID1vR+Rrg9f856oimiz1hB2zcZl+4OlGoW0k/HtL62K83q24jXCLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vEQk7D4VRNjtpia9UhbvRIbgja/q6/PpWiYSpkjB1w=;
 b=sw/MI5k0vuZq5dcVtE/7K1QNeuz94v1o+t9NSZIkI8zqDzUZ92z9OphY1id3kS/OhIQ1GHvIOUiNYyPvOAEVW9Z7KWxcMAC7lAPGxaH9vjpaeYWk4OSFGT8am6bUtAC47M9XT3ILpgt5AL3sf9cSUbCvgoz6MwpgmSoHMu9cX2k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3868.namprd12.prod.outlook.com (2603:10b6:5:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 22:31:57 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 22:31:57 +0000
From:   Luben Tuikov <luben.tuikov@amd.com>
To:     dri-devel@lists.freedesktop.org,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Luben Tuikov <luben.tuikov@amd.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/sched: Add missing structure comment
Date:   Wed,  9 Dec 2020 17:31:42 -0500
Message-Id: <20201209223142.78296-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.404.ge67fbf927d
In-Reply-To: <20201210092435.253b12aa@canb.auug.org.au>
References: <20201210092435.253b12aa@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 22:31:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb184e0d-4744-400e-646d-08d89c923cc7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3868C2FE5581BD2A09D9909999CC0@DM6PR12MB3868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FyROITzpjnEcxVr6PqZ6FeLzqeaBJkuUdubWzM4I3iSfKvrmQqCkLa5fBfxs8IeR0C7QT8XAAGRUQ1ZNpbo74qa+8q2w6QgF6UnVpOlssob15JUVu+SaAZ2Oiq4PkXO05m879rRXfwSPuCmdG+gZiRDnJYtIDMAlvw1wDT6OG1tS1g2O9IvsFma+xfHzZMf0TJpiujeP7TxjaqxaiXGHHD/NPmIBxSGZAZvYeaDDTiebLg1M0dz70nPl38fm8ZUe1y+RqXGALECdg8cEVDSMp0NzHC+vxa7DjHJST0+jPzfRyUMXjbpIiHwR6C3XSIjLVNcZST9jsijQ3Rl+T+BuJhBCjvWduq2qMe+1t8JUzHASh2E0Kp1RUubV4jDYowD2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(66574015)(16526019)(186003)(956004)(26005)(6486002)(8676002)(52116002)(508600001)(7696005)(34490700003)(2906002)(66476007)(54906003)(66556008)(2616005)(8936002)(110136005)(44832011)(86362001)(83380400001)(36756003)(1076003)(66946007)(6666004)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGdLci90Y3BPNXVGcENEM2k5dFpQaVJ1djRDTUkrZHRDajk4cDNuWXZyVGIx?=
 =?utf-8?B?SEgwU2FyYWFOVlVwczZ4SEF3VWJySVNyaWFWR0xqZWRlOGR1V08raGpDRHhn?=
 =?utf-8?B?Tk96cHF3cTJKMnlEczd2K0NhRXlpNEF6dmdmek5DTmxwRVBYWGJrcFpPaDd3?=
 =?utf-8?B?WE16akc4bGwwb0dIRlpyWVdGcnZhZzl6U2N5OXA2Sy9BQTlIUmNqUzNyTnFR?=
 =?utf-8?B?SWJOMFA0UDY0Vm40Tk1xVlNOTVMzZHFPenVXaUp2QVV6dGhFL1RRMWxQbDQ4?=
 =?utf-8?B?R1JycjB4ZDRHeFg3S0NZazhqd0M5QkU0dys0TTFrdjZqVW05L0JKRTZoeFZ5?=
 =?utf-8?B?QVZNdE9MUDcwUU53dmxqdjhXeGdIa3lOQWU4dW5TTEhSNUJBMW9ncFAzOHhy?=
 =?utf-8?B?bVlyRmdyRWs0MTkzVmFBRUtPUDlTejFVOEk1clNLTURQRjFLRTBBdEdwRUxR?=
 =?utf-8?B?RzZmamM4VWs4dEd2Q2pyS2I1bmhqZlR6Lzk0LzJiVTZLU0VDaTl6djRyc2Iz?=
 =?utf-8?B?VzArWVdkM0JjZHhxY01SMTR1YUxPeEFhd1I1ek84YXoraWlBQ0Fwc2RXZkI1?=
 =?utf-8?B?RldJb1VqTnFsOUMzcHZLYmxIYjZ0Q0JWd0hqSjNmZmdtNTZiUXdTYlhVQS90?=
 =?utf-8?B?ZjdUTVlxR0dGSk5vMzRyR1h6TDNIcVpXeW5YcGdwdDQxY2QwbmUreWRIK2g5?=
 =?utf-8?B?QTFlRkhCTVhyYkQ3M1BaeVRlUW9Tamc3ai9aSEd3UGx4YmhtZFc3b3dobGh4?=
 =?utf-8?B?eEFEOVpyL2haME90SC8wU1FDdzVWcUd0RnMyUWRFQnZOYmZ4ZHQ4N1lmcnZY?=
 =?utf-8?B?WWorQ2tUNkwyRTNjZVRIcXd5VjE5NUZmdVdiME5IUXYxbXU3SWVLUFoyZEg0?=
 =?utf-8?B?OFVqaldGUTRqZDhHZnJsK3ZiWHpvTGwrb2NCN1BHZWFNalZCTVhtRm5wZUZ2?=
 =?utf-8?B?dmtmYXcrc29kRkpTaElURG12a2lUOXB0blRPejFMZWpEMVE3aUxuRVNoTHJU?=
 =?utf-8?B?QVAyTzZQQ3JyNHFRMCtQZitEc3RLbHkzYVpsd0R3cUpmWm11bk5sa2MzcUZH?=
 =?utf-8?B?dkQxeU1NYzhxOVRhakdJcitQSnVuNmdUTWR0ZFhEUXVjSjVvVDFSUEN3VU82?=
 =?utf-8?B?Z3RRb2pmT1pnQkg0bDhJL2piZnJCMVRGQSs0bFRmcmppMkV1NklDeHViS1Zs?=
 =?utf-8?B?R1U2SVRNVDBuVHNLL3ltK2dISGwvRUNLRE5YdmRDeElXWjc3Y09Cekd3aWl2?=
 =?utf-8?B?SGprZjZsdWpzU2ZHNEdvbm9vNmJETmF3ZlZZc01uaG1GSFBoa05OOHBMVHA1?=
 =?utf-8?Q?w+DFfWi2345QGiw7uRStj7AsOvxZu1qaLJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 22:31:57.0784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: bb184e0d-4744-400e-646d-08d89c923cc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFYuXb0+uetOPACdCy3vCtTQ4dbnVqmGAzEFvbxccJe47jSkEFLXIiYG5Z+WYwPQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3868
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Add a missing structure comment for the recently
added @list member.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Fixes:  8935ff00e3b1 ("drm/scheduler: "node" --> "list"")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 include/drm/gpu_scheduler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 2e0c368e19f6..975e8a67947f 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -171,10 +171,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * struct drm_sched_job - A job to be run by an entity.
  *
  * @queue_node: used to append this struct to the queue of jobs in an entity.
+ * @list: a job participates in a "pending" and "done" lists.
  * @sched: the scheduler instance on which this job is scheduled.
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
- * @node: used to append this struct to the @drm_gpu_scheduler.pending_list.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
  *         limit of the scheduler then the job is marked guilty and will not
-- 
2.29.2.404.ge67fbf927d

