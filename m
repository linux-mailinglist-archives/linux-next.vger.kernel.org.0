Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F52D2D5A7E
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 13:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbgLJMZp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 07:25:45 -0500
Received: from mail-eopbgr760051.outbound.protection.outlook.com ([40.107.76.51]:51194
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728013AbgLJMZh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 07:25:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghlvbhGqQ3/W9aVMg/5aE+f7VhlzyrXo1jtoYul/33jDPx5fc6mTCqm5BXoYe640ohNRKIG7Il97OLJ7Zt++jGa2S8OnKJVcNBQm7cGXXQ7HuJc6yT8FOnzHwp7UBzf2JAtxlKFMKdInjUYgixLX/NZCzoOkXEcCTOViwEY2P8OCSt0n3kCtHq6j5qshM+LlShhyGtqAqUygfhlJL+hnvwY2VzzfI9RSh5ZnOVuViVAT9FZCBPFqrOGipTFyNAFl309Mgjp4JyAsMJVx2U/DWH52avNYwrbZUrcwMwh7fBnlb+BuFEhFDYnVcU3jeK/X+gSPhVZdGlVXX+j289OHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR3ZLzjD8cIfGTzri+RkE4t1eaT/0eOvEYa+pd6AllQ=;
 b=Xs2crY+TI6q7hyNi0hFQC/hlarh8aqWdOvCEVE+v2av9whpIFp6PUMNH72FkYiJqGNQ+Dhawzhx3PfvwrlOsGRK6gpakJaVKQeZWJPZUmrhkok7qVZD67e8wHE6MiBoJ4ytZ/D2g8mYTZAqEyYv893Sc7x7JbRA4Bm32r5gDqJp0oh30Zbhd/pwA7O3nGyhO2hyN+tahlEyPRstDfxKEM2QfDbXVbQPyZdLck3dUTotCek0xURl/WjL9g3lRUEIsh5DuAA3Fgj86jVfqDj2LUuLJjF4+dNppQCXr0RmAn0NMKsCIjQcEwvVLDtPw06yEbfl5B26R4Y7l/eTV6fyCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VR3ZLzjD8cIfGTzri+RkE4t1eaT/0eOvEYa+pd6AllQ=;
 b=AQ2a4YNaQV1kevptUdrZHGWc002XBsEzwyjcpgGhwcH5LePTsr5RUE9m+95RqUleKBcKsgM9MqU5PxOh8xCkvSZPbkgXAZ2s1psNQ1P6juYkHYBIx4S7SCDI3YHFGknatr22UzjUTM3kUKXIvIVRiq8BgVIZtqlJJPLp1DKi1OY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4784.namprd12.prod.outlook.com (2603:10b6:208:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 10 Dec
 2020 12:24:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Thu, 10 Dec 2020
 12:24:49 +0000
Subject: Re: [PATCH] drm/sched: Add missing structure comment
To:     Luben Tuikov <luben.tuikov@amd.com>,
        dri-devel@lists.freedesktop.org,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201210092435.253b12aa@canb.auug.org.au>
 <20201209223142.78296-1-luben.tuikov@amd.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6f7c8af3-83e8-548c-3ab2-099501c41f10@amd.com>
Date:   Thu, 10 Dec 2020 13:24:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201209223142.78296-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR06CA0094.eurprd06.prod.outlook.com (2603:10a6:208:fa::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 12:24:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c7ee694-561b-40f0-8d4f-08d89d0696c4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47840990E8D0544EFAD5AD1183CB0@MN2PR12MB4784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbnA+sI2RS+OWhLzC2DUOIAup6p2It8sxO2Ip92+b+69fJqU2Qz5kB+Ev+3I3Sv47myAqLQIMiGbYWc/X4BmhUOXDmEAt6KaRXPsNgNUWqyvuiRHFQxdOLNNJNVHI4hiudk78g8Ljd9hdRoTrs5iUJouWsqiW3MDeqsNllBbYJ9IpfipEWO3DGtJxsJFNAs1/u5um6RBqE3pEBIwK8mtnE0t+n6Ccxolkas5qihHoihSN58f5im9XPAoZdG3QBhwRY9zQVDcJ7EKtF+qGk/R8r75eUtZLJpXJ2Q7BGI/8dwcyBE8UhkkdUZRlyWGm9Txzfp8AipCQMWeLNURTCTsYwoFTWFDhM+HoYFzw75VWAQ/wqTdsRuzo5XN8Kr9oe2cSrPcYqMRs2SUOLVpQ5jgvYhpvCR9s+P8lt2Zc4SRslPmfreF2ih+Xf0GX7ptrKX9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(83380400001)(66574015)(34490700003)(36756003)(6486002)(6666004)(2906002)(4326008)(508600001)(186003)(2616005)(31686004)(16526019)(86362001)(31696002)(8676002)(8936002)(54906003)(66946007)(66476007)(5660300002)(66556008)(52116002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UElsWUFSNTEvZFlZWEk0MTZPb3REUzBDRjBwTXg1ZXFTc2xvMkhxM1cyRnZQ?=
 =?utf-8?B?eHNoVmN6WDJkOXFFOWc2ZkZEeVE1ZE84RVFjVEJhaU9HTFV1UDJxSHdZMGZ0?=
 =?utf-8?B?MjVjcWNMQzFzcHc3NGF2cDd4U2hrbDMxQnJPQjZjSHo3T1V0ZzVQMWhOS04x?=
 =?utf-8?B?RUVxZGtobGcyTU1TenN1UUxyMzlkVUx1MHVxZW8rMnk3c0xKSVphVS8xVzRM?=
 =?utf-8?B?RkVYa3BBWGsrSEp0RzhoZFlVaTdDZjVBM05WNUNrRWZzKzZyWWhlMThhWkhV?=
 =?utf-8?B?aHB6VHFvYzNrc2lWc2RQQ1ViTCtGWmxBdWw1dEpVaFk1T29nWUVYdlJ4Q2NH?=
 =?utf-8?B?N3plQ1ppSFUxS0RJeS9XZGViRmJwQ2s4bGJEdC91c2hLZzJIemlQYjN4b1NQ?=
 =?utf-8?B?bExoQnBGU1ZUS1ZGZEN4dkwzNjdJVDNhWVZES2c0VUpMcU1ScGtzWlRSa1hr?=
 =?utf-8?B?VXpZQ0pBbmdOMVBrYjhKbDB6UFVZN3djd2ZBWWVvby82Tm1RKzBDZmdtQTZh?=
 =?utf-8?B?TlZ1R2c0RnVRdDZOVisxRmt3c1hHLzZVdnNTTUxHMWlsQ0t3ekNlYmI5NmpV?=
 =?utf-8?B?OUpLY2JKVXJ5YWZ6QStzdUZUelJ1MjJ0d1cxUk1lYy96bytxcDRYSkduZHFK?=
 =?utf-8?B?Z052cm5udFV6cTkzcHV0VlRXODIvaGl3ay9YM2lINGJkMlBMSUFrVitvMzdl?=
 =?utf-8?B?ZmV2WmpZTHQrV21SR2VmUmRzYWRnbVRSeC9LbTVkbld6MDd5eklhTDZ5a0xl?=
 =?utf-8?B?dW84MjRacnNPUENxRHVFSTY5cmhvMHVpR0M1d2hSWGRxbU9naERZejl3eDVn?=
 =?utf-8?B?NHhZZGZ6UEZNejVXakwyTysrK25CdWZsbzR3b241Z2gwbjVoZTU1MmUwY2lo?=
 =?utf-8?B?UVkzdzZ2cmsyYm50ek9NSkdrOEVSd296d0F2elFMOTZSSlN2OE9zWkhtRFF5?=
 =?utf-8?B?WjhhNy9DR21MS1VtTVR6d1Z0Ynlzay9rTW9zOTNUaTJTUThPMWZITkx0L3Nq?=
 =?utf-8?B?Zk96akFhclRFUC9ua3g3QW95V2tQV0hUL3l0UGdESGJCczZPbGR6TzlRWVlm?=
 =?utf-8?B?WGd0d0pFMkJIZ0JTd3ZiaWpQWlVoY05ZcjQvVUxaZjVDbCt6ZVBmaWxJVkov?=
 =?utf-8?B?b0kzOElhbC9Jc3FNcmRJYkZ3V0tVb3o1dk1CaWhKYnBqcTFwaU5UU0dDVGx2?=
 =?utf-8?B?TFVlT3lmUDFTRjRpR3RQSDl5YWhiaWNTNElESFJTQ3VLQzJCelltdGNhUVhD?=
 =?utf-8?B?YXRKa2ZZdXNwRXBncHcrajhpOWlTMnZ3OS9Lc29ac3M1VkI4MmU4QXlucnc1?=
 =?utf-8?B?ZWtzOVZUVVVscFJBVWJkbmFINlVpVmtaTXU4UmRHTFBublFnNW1lVFc0Q3Zk?=
 =?utf-8?B?T0xNbndEN2FlTmRUcGEvaXlTbFd5UG1PWm1NNzhqWHF1NVU5YmxmOXY3RkQv?=
 =?utf-8?Q?+G3ikpSH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 12:24:49.6873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7ee694-561b-40f0-8d4f-08d89d0696c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZWECbuvOqy3VCtLJLAJt6hQes/qFN48BtMevHWDopmZL2A45ZGD+zlbuGezU3zV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4784
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Am 09.12.20 um 23:31 schrieb Luben Tuikov:
> Add a missing structure comment for the recently
> added @list member.
>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Fixes:  8935ff00e3b1 ("drm/scheduler: "node" --> "list"")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

Reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   include/drm/gpu_scheduler.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 2e0c368e19f6..975e8a67947f 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -171,10 +171,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>    * struct drm_sched_job - A job to be run by an entity.
>    *
>    * @queue_node: used to append this struct to the queue of jobs in an entity.
> + * @list: a job participates in a "pending" and "done" lists.
>    * @sched: the scheduler instance on which this job is scheduled.
>    * @s_fence: contains the fences for the scheduling of job.
>    * @finish_cb: the callback for the finished fence.
> - * @node: used to append this struct to the @drm_gpu_scheduler.pending_list.
>    * @id: a unique id assigned to each job scheduled on the scheduler.
>    * @karma: increment on every hang caused by this job. If this exceeds the hang
>    *         limit of the scheduler then the job is marked guilty and will not

