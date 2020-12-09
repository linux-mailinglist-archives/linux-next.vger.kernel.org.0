Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11F32D4D2B
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 22:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388223AbgLIV7S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 16:59:18 -0500
Received: from mail-bn8nam11on2072.outbound.protection.outlook.com ([40.107.236.72]:55514
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727030AbgLIV7S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 16:59:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzCXjno3bXyWkKf7lHBOz3nAV6PI/SUxtyhmj740IevR8Ivgrp39dcr3CHn4qWMw1f7tBddmWWx2izILt/mh3HDAkPHb3qlvB5+uNoxCOlhrEHpD3rxLPHOcdTuynP5FItEYqlbMlZkkeDZbPknJLLs+cwBuSS/mBzxpBwdh3E7YNmC4L4aDDPAYOZZVnSqTCR9vjplROAKAzFv6MdM3ACbbnlWkmB9Ff4Y1qfOH2WEie8XXEJZzzOQIv+4r8pphA/PmwFp85AxOndQNadFXM65s9WvPvewzbHZt+zvV57/5euLuoBzPEL4KK1eW15gGSxqg9c0u+5yO++oWpC7hFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7ns8YrhfeYDOZ7fjzSSFx5McWgYveAKLfWkcbVlT38=;
 b=gzqtE9XMaD9RSPtBwVEZS6By0BhqqrGANqfk0cSbr01tTz1njcsyFrPgIQX8B+pq2+xJieBvEtkL3/0j5iYIkcjBQoAwpEBWbcqFtWFnS1vfguP7LaBNEbnnd0eCeRDDb7TuRrIcMWrzcYUF7R5+0+sGUELunlNTYE2R8+63YijAb581bYp0F0AramHOmgOG3qkhrH5Cz2TIo6+FXlQlss5QyP9rCywNd3hLs5Dccwt5c7w1zLX/pzp5ievnkqeGp8ujgqELg5T/kssyroCn08M61x9Burq5P+59/g21e7JYvpLy+Ec5y4sGLae7+NzZpGODIzVkzWGXAEWF0MrVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7ns8YrhfeYDOZ7fjzSSFx5McWgYveAKLfWkcbVlT38=;
 b=BDW34uZSXCbu7DS/S4Zt9BCvcPv7HgCrU37jbOnh/+G46wrfQ+7jcxpLXqpIELpRTlAbUdICVgAOXbSLu33ueagMGcgsXGac9Pfa/nbj0gkSRPG2kNfc1iiNqNljejbADch6GcmqaZ/HjwYplFD3XP6LJXMK2T1X2EZHl/ekqaY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3467.namprd12.prod.outlook.com (2603:10b6:5:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 21:58:25 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 21:58:25 +0000
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
Date:   Wed,  9 Dec 2020 16:58:07 -0500
Message-Id: <20201209215807.75983-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.404.ge67fbf927d
In-Reply-To: <20201209210211.306f3c61@canb.auug.org.au>
References: <20201209210211.306f3c61@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 21:58:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55e5c900-51a4-48ee-eaf0-08d89c8d8d83
X-MS-TrafficTypeDiagnostic: DM6PR12MB3467:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3467CFECD008560F0C02E38E99CC0@DM6PR12MB3467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvz8yBk9eNgip+cqxBMtqagRlESpEoDrIx3HRmpEc9r0bovrzPp+GkVVYYMbLjko4FN6QiV0OGtQDvDF/K2ZplUBFFB2SksphdE73j8OMsYF7C3s+DmxLKtpHNfXf8RS5Wg5uOuZRBrCWBIvLv/Wn+PCSKutJi94inXIserZI2GRdJsSrIijGLX6Ztuf+CnBzgvzWiIe77kY0pHKwu+2328IhKD+qr7oacFZutwFoiaBBhiABOKHdNqelPX3hXLrs2CeZFyqVTJkEllYcIncgU3aIxRZ3tGubvqjdCgkSIf2DRrQDQtQTGOwZ0zW4YVPf8eBL3ft6ksH2s4ijdZPPkHR/iTjmlZD14A8rRteqlOs5kxy/Iik3lbyFe0B/Zpu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(66476007)(54906003)(34490700003)(66946007)(26005)(83380400001)(16526019)(36756003)(66556008)(110136005)(86362001)(52116002)(7696005)(508600001)(2906002)(6666004)(4326008)(1076003)(6486002)(44832011)(8936002)(5660300002)(8676002)(2616005)(956004)(66574015)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzBOT0JNUTlrbUg5NnF4LzQyUzA0YmVCMmd6dHArbjNzRFl4cGMvbnZXWks1?=
 =?utf-8?B?MHYrUkVHdkxvVGRwN1RWQmg5dzlaSE9KMEFwT05ZMXNMTXhBMnpPQU81NUo0?=
 =?utf-8?B?Kzl6NGNabDdFNmpyVko1V3V2dnJnUlNNdURMMUFjbTFrd01adnppWFN1QXc0?=
 =?utf-8?B?RUZEU0RZTjJ1cFFBVVM2NnNTMHFLaHdMRWdUOVZPUmhjY2JheXFqdWlab2Zp?=
 =?utf-8?B?NEoyRlFXdzI3VmtCN2xaWG01dk1sWU1XS2xGWDllRmFpNmUwRVBFaVF4MCtv?=
 =?utf-8?B?YnlqVUlnQVFmZEkxUHlNdG9LVlduazYrYVp2TnRoenIvTXlqY1RXa0dCQmo4?=
 =?utf-8?B?NHkvYUdaT1Q1bGV0dlVnRndnYmszL3kxSVNuT0lOdUZjdG9pZEpJaEREczFI?=
 =?utf-8?B?UnlXK3dWOVBTS0NJUGFBemFWY29qRERDR21KS295by9keTZVQXZsUlZBQW96?=
 =?utf-8?B?R2piY0hYSTlPTzdoem51eittNUMvbitzWEVUd1ZmMUQwZEYrQTk4ZjBHUEpI?=
 =?utf-8?B?aVlvdmNqSysxU0RvUHJNUHpSRE16TXh6WkRZMDJPQlFFckhqajM1dVFCbXQ0?=
 =?utf-8?B?dXZ2dkloY0xDQ2dEcXAwSFk0ZStQbUhySFluWStnaHNKNDBYS3BwK0NTcU5j?=
 =?utf-8?B?dnkrTC9zRjJtcWRxREJSa29Ld1pOUDlKbUZmc3lwKy9YSXJrd2FIdEMveUs2?=
 =?utf-8?B?cS8xSU9MODZ5eXFOeUtweTFTUjVycmtVOFhTcnNVb25wY2ZSM1RnMDcrVUtl?=
 =?utf-8?B?d2pLT21DeCtudnBlM0plejkwYWVFUEZQV3l0T3QyOG1IY3NnZFFoeVMvdUpM?=
 =?utf-8?B?Um1Sb2xGZVpGUVBlVEpvc21UR0hXZG9McEdWdnc0Yk16U3ZxbWpsM0ZuOTdw?=
 =?utf-8?B?TFhqZnpZMEZaZHVtaWRtdVVicWtXYk5oVCtjc2ZvL1lMSmdaZzFYUDY3Sm1G?=
 =?utf-8?B?L1ZZcXZ6MXJRN3J3NktOVWgvWElidzV3a1pGNDFqSDgwQTlXRE1uM2JOdy94?=
 =?utf-8?B?aE4vaURkYUxQbWQ1ZGlDNlNISW83VGpvMWFyUWYwY1h0KzdnMDBlOVlmUlk0?=
 =?utf-8?B?WVRmdXZaSHp5bHNZaXZ5Q1pTelk1OW12bVhmazJHbjFUcTFWU1dFTTlPTjNJ?=
 =?utf-8?B?cjg0amJPdUFjSHp0TlpCY00wTDFTc3pUTGVwdnBrTE1icDErMVNWREVObzR5?=
 =?utf-8?B?djdJWTBLOXJwZjd4Njd0R1hqSFEzUzdTemx3d0JiTzVIRlRXM2ltYmNBSlJn?=
 =?utf-8?B?NW1JRU9tN1FRZnVsYWZ1bzN3ZGNNNGdmcnBWMEFnTFNJakNtVndwTmtzaURi?=
 =?utf-8?Q?xEjuSp53jSvc/6y+mO74Wlyj1XjXC3TYAk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 21:58:24.9920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e5c900-51a4-48ee-eaf0-08d89c8d8d83
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uBxQtJNss89IuYBppj/OrPxXCUvAJZELZprwmn/bFmYB/1lZ6t1uHDXLXix9XVn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3467
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Add a missing structure comment for the recently
added @list member.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
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

