Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F36030AD74
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 18:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhBARKS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 12:10:18 -0500
Received: from mail-co1nam11on2056.outbound.protection.outlook.com ([40.107.220.56]:1285
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231674AbhBARKR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Feb 2021 12:10:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFodVOiea6oLRYwM2jlxcTKGcM7KI35yxlOdw9REKDcogDqRNWcPJjZAG0TzYb41aJkNMC7j40v7RYl+SB3GMnPVbJWBgM7CELdO6RpGAQB9+NjnDMqSSaOtDvud4UYP2QYNH4oVrUNa9kVguJovnDfq0BvhtxNjOBhNzaWZcYcjJWr/dBCzWQICCU+J5KD4/gJViLBqR9j35S1aD1zylvZD0mVLk207CnqaVKt5Qn+Zf2uTnk+470CUoe5B4PqdLwgamxQovwNG7CmZWLnbP2kS9eFFco51lXUtgBhofl0EiaLISyuFeCiygS8bGNlpgMpLOopaoHR0/J+oxwWMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3rE9OoeadQ/1VPxWKUhhkkldJQnsrRxzQAws+luwSc=;
 b=E+qMprFxg8m0YUstLYw447HnfoX2pT92/vFP80bX/em0Lxq/qy5wEr7ZdbN6Wdc1MUmmj4j/kpSy3H5iUC3DUb726Zzd9UoKZJQheAF38Y1sQ/GXpUq3rMfbeQV9nd12YJcGPbpCKQ+FYyPz+njcnZDo5o0eU+Ldolspd18GD+6DT58DStAv/1N/8RxDnTvm7Og5vk/u+lQF9UUuYymonH8Bla2xGMFNiVK7Sh1ZRYtvsjPZQW0J5A9yBLqhp5dmVhw5I4eRuZfaeM6ETYL+0aC3dLwOWuAmqh1F+QYQB69tfwWXk59lQFaOF3sjeshKNvgLF9h+J4i5U6dMjvbtnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3rE9OoeadQ/1VPxWKUhhkkldJQnsrRxzQAws+luwSc=;
 b=ZC6f4slKzXNLIRHR2kBmZ+pl2TuUDSNN0BB9cX8h1czXDJf6jERBDKpUP1FV9s0GESE65RwjP2qT6xseEFM1cNYpJc9caRi6uRVulRl1GdFF7XYujYs4vfAXzgtC+l9RLYZY39EGOqpXZNUgMOlErdz5JT1sTuPDB2JmSvgRTcE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB3369.namprd12.prod.outlook.com (2603:10b6:5:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 17:09:24 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::60b7:6bfc:44a0:269d]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::60b7:6bfc:44a0:269d%6]) with mapi id 15.20.3805.025; Mon, 1 Feb 2021
 17:09:24 +0000
Subject: Re: [PATCH] drm/v3d/v3d_sched: fix scheduler callbacks return status
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20210201091159.177853-1-christian.koenig@amd.com>
From:   Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <22f089b7-5a52-9a4f-9d9d-2264f5503bf4@amd.com>
Date:   Mon, 1 Feb 2021 12:09:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201091159.177853-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
X-Originating-IP: [108.162.131.176]
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.131.176) by YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 17:09:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7884303-38b2-4397-879c-08d8c6d4201f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3369:
X-Microsoft-Antispam-PRVS: <DM6PR12MB336953E6C1454C3B96E1F5D499B69@DM6PR12MB3369.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McIU2jPBsNIH+CXulR6U73WnHY2KmXESCo80QbagnCEW5sTCv+rn0F88Ljczc8MMohbEh6ZdUaQFnCM0U8a7MiW5HaZOe2EdL2O6+JFV5MnThocq6HJn+fBVdL6SsuwbMEPHadgpvod8Y2GnNA26+LwTSFFX9crBzjGW10Nnct3latNTK6YdZ5YVK2oDp30NQiNhJP+13kVrPy02bn5GOMSzb70p6hCW326FzL8cxEvhULzdBIjvD2mXmCIliObWq/Ro56GT7Cn9/8diOiI+V0MAKysnVO4wquXJrulbikogL9RW5TmFANAi7E8h8nDvk3ThLng45z29WTeB1ooy5H6OgvSgJxuvlRX+ll9tW0iS/9PE3jCQMfB4/NcbraBq6l/T/WLF8OShjM9DCuf54EgDF3/U+/o7etm3hM/pjllDChRZOyfeEVxyQAja90N9BW6qa2ncWVRFc2Few3moJJT5ztlLVAtCHoT40qR7AjzGqP60zE2lo2FF/k29hq6ykvniA9Jk8GlM8mIRQRmMI34kUVg2NIe8SFjHyUMQhMsCduuSlmxvaTXUEBcP3EPHiPxuRfQ+Qar8KF1XS8sYuNY+1zMBWOVgBkTJW5cVMvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3962.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(2616005)(83380400001)(44832011)(2906002)(5660300002)(66476007)(316002)(36756003)(6486002)(186003)(16526019)(26005)(956004)(66556008)(66946007)(52116002)(6512007)(6506007)(8676002)(55236004)(31686004)(478600001)(8936002)(86362001)(31696002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTJmdktCSVFJQkpvZWhSZUczT05Ha1REdk5jTTBMVGQ2KzVtYjY3UEczV0Zh?=
 =?utf-8?B?ZU1WYWZqejhSMnBkbENCNzlnazdtQ1Rvalp6NlN6Y3kzVlZyVnhSaTIrZ3BF?=
 =?utf-8?B?WUNXSEM2MnNFaEcwK2dtUTdDYmtIYm5Pd0JKRnRyZWxnWU5lVUV5d0JZeGhN?=
 =?utf-8?B?Y0tGUUlLZW1wUVJSdmlQMDRnWXFFVTVvcWhacFBGSUlGSGMzT3JYUG5OeWlM?=
 =?utf-8?B?NHNOZTY4N3dYbGMrb1BGZ25qK3kvcG9rR1ZHakI3eFQzbFBQQmdOWXRDd0tG?=
 =?utf-8?B?QVNURzRqSms3UUpaNmtiajJKSFU0OVVhQUFud2pBYi80bU9HNHVRUkVEVVJh?=
 =?utf-8?B?Qk5WLzk2cXhHVFlVL2RiOHZEUVMwY0lYMW9ocHZ1RTB2b1Q3ODNOZThCUW5p?=
 =?utf-8?B?dXYxUmFwTWlCamRyWE1JUFhtc3dac3B0dnVaNVpRc2w2U1lnMzBhRjlYbklC?=
 =?utf-8?B?VVpveVFoK3NFaGJKUXJEWnMwdnRjZjQ0SkZ4Uk04dDFxL0lsd3AzMlZrbk9T?=
 =?utf-8?B?YUd4NHJNbFFEaUl5WGNTUk55eHpmNTV1ajJqZHIrc2VMQkVnVU9YWkhVWU0w?=
 =?utf-8?B?WmppSVN1b0RNRHlPTm5EY2pPbndEeFhHenZBNE00ZWdSWDFJU2ttUHpYQlVt?=
 =?utf-8?B?cUxNZW5QRDcxUVNjZDJLakUzZ3Q3YTk2MlNKYzB5SGVXQUJDZVIvYStuQ2ts?=
 =?utf-8?B?dU0rVnV4UThsL1NKd28yTEJZcGw4bnBsNHBSTFRYaDMxN2FEN0dMSWVUZXQ2?=
 =?utf-8?B?REJyd1ZPaDJBYnBWL3hVZVF2TWhmL2NVZzNGSGNvL2Y2NHBFZUxUZkplZGpi?=
 =?utf-8?B?Q3dpT0JwVkVmWmRCTEQ2K2JxY0R2RWNlM292Q0Q5cDBibDkvOW1WN0IwMlNC?=
 =?utf-8?B?ZHoyVVVDYWZETDBlMUdCR1YvTVRIOFpMcFdVSDc2eGFFK29YTlRqTVpiL2w3?=
 =?utf-8?B?OHJVY3NYam8wSGNaNUtZeWhwOElkdU9jeGxEWjd2RTJpL0JLWEtYdnVNMkN6?=
 =?utf-8?B?WG56ZTRGbVBBMGRXbmtURENlZm1EK2JLYWN6UzczUEZ5eU9TY2VKQkpicGJn?=
 =?utf-8?B?UTlSdU9SRUxPYVZUMm92VzkrUTllQ0U5bVoxcmlPamZIR2ZpTlBoREJId3Zt?=
 =?utf-8?B?UjM5M0RQVEI2MHE1TkQ5Mlp6MTMyc05lbmxiRlA0dkpOOVFySFlRZWRXWjZK?=
 =?utf-8?B?Qyt3L0ZDditWbXFTWFNlMWlKS3pLeWUxN3BlQ0xyNTY1YWdkazV5VnNkaFlo?=
 =?utf-8?B?eWZOcWZFMVczdkx5T1BjdTlHejNxK2t6ZDFYdGd5YWRNT0Nta1FlRldWTEtN?=
 =?utf-8?B?cExrbzVVeWpWT2FQcEw4WVNmNkhCdG8vMjRZMUl3Tm91eHg0VFptQUNCcUsv?=
 =?utf-8?B?SnlLdmNrSTNTZVdBNFFMS2RwK0VER3gyRzlIaU5tcXJKYTdwYzc1UUpHQS8z?=
 =?utf-8?B?dk1QOTJOc3p4UWsvUGFoTzZXZTFzekRTcHhMazlBPT0=?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7884303-38b2-4397-879c-08d8c6d4201f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 17:09:24.8088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ztr7yL0lPVqfqFGuIbtdFH56Dcn6H79lE50WmfG535Oh6xSGFKm/2TmCFWFp58P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3369
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Ah, thank you Christian. :-)

This did change a few times--sorry I missed it, not sure how it happened. :-)

Regards,
Luben

On 2021-02-01 4:11 a.m., Christian König wrote:
> Looks like this was not correctly adjusted.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: a6a1f036c74e ("drm/scheduler: Job timeout handler returns status (v3)")
> ---
>  drivers/gpu/drm/v3d/v3d_sched.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index ef2338a294ca..ceb33f8e4379 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -259,7 +259,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
>  	return NULL;
>  }
>  
> -static enum drm_gpu_sched_status
> +static enum drm_gpu_sched_stat
>  v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>  {
>  	enum v3d_queue q;
> @@ -294,7 +294,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>   * could fail if the GPU got in an infinite loop in the CL, but that
>   * is pretty unlikely outside of an i-g-t testcase.
>   */
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>  		    u32 *timedout_ctca, u32 *timedout_ctra)
>  {
> @@ -312,7 +312,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>  	return v3d_gpu_reset_for_timeout(v3d, sched_job);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_bin_job *job = to_bin_job(sched_job);
> @@ -321,7 +321,7 @@ v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>  				   &job->timedout_ctca, &job->timedout_ctra);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_render_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_render_job *job = to_render_job(sched_job);
> @@ -330,7 +330,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
>  				   &job->timedout_ctca, &job->timedout_ctra);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_job *job = to_v3d_job(sched_job);
> @@ -338,7 +338,7 @@ v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>  	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
>  }
>  
> -static enum drm_task_status
> +static enum drm_gpu_sched_stat
>  v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>  {
>  	struct v3d_csd_job *job = to_csd_job(sched_job);
> 

