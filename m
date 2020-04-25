Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE75F1B868D
	for <lists+linux-next@lfdr.de>; Sat, 25 Apr 2020 14:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgDYMmO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 25 Apr 2020 08:42:14 -0400
Received: from mail-dm6nam10on2065.outbound.protection.outlook.com ([40.107.93.65]:6035
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725925AbgDYMmO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 25 Apr 2020 08:42:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViqYDtmEDjIqBWMA2qZt1ip8ynEIhfVwjlhYXtiUoqsz5hrE90atBuRUeLf9ZcjhUiQhcYRNDkRZPbKNxaTjWAsdc6VuupOQcUe2FZ+3y7q/sFz+54OO5MosgPGHuPjgNSTo1PomQcJ+wa4+ZsQnkZWQbiHl1YHz+l0EDrDgnkUzUajI5v7JAqpp9upYuDtHOTPPvqW03F48nE8K1oPbYwFgtDaX3WNei9xVEeMKfjSVLLBWIpPoJ5bdw+hsWnbnT8PuP3nS3ob9djOz6Jz/uRjhTdzDemPYiM2qpzHdxNwFnjJuh3OOWvs4Jf09WRdlGV4xtYISpoJWAcjAHfnV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPofOWq5UCeYtnQMxl8CCHuMcLPZmBxbkq++ziA0lgI=;
 b=XBe3qoxbyfxiyXg0xxo92goMaDsAPj6qm93cMN2DfH+dYO+wJk1fzr5tZwHH+JSnxBkQjh0g+Seg+Idp24mWkGLDyndZizXRo8awSaT2Fa+e92vLVBhnW1oy8fP7V3gQ0IaGSLzo+Wkt/FhH2k0zeBgCZ31rUlvVil4GZpHZtx2zYdU5qAoVYyDZhF/y+AYjSmXHSpOdadc2g8Cs9vOHG55uENaJxz0guNSgpCvjXQsax9WYVejMvJxOmaQIe0e0RLycGReLRQFj97kVaB9fQtYGIn8YLgkFO53mSB9L0tmtAURrcVv5h0jIXWb4VujGVGZNKdXJBJjwkfMNCnSq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPofOWq5UCeYtnQMxl8CCHuMcLPZmBxbkq++ziA0lgI=;
 b=cgghHXZvLBfjObsAp7MC77I3EDyI5N2Y4FJ4uR3aaokimgLatFkObvWUJOZ0PxFE87BGXXZUM7ANge4QX+FReTTKlvSihWotpQmec0RZ2A8FAPnz6Ahd1F2apCfKpOYL+S+FeGJVM2LhfUjPlLdijUzVdPNPaZtQFKSSWKbnXxQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Sat, 25 Apr
 2020 12:42:11 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.020; Sat, 25 Apr 2020
 12:42:11 +0000
Subject: Re: Coverity: gmc_v10_0_flush_gpu_tlb_pasid(): Program hangs
To:     "Tao, Yintian" <Yintian.Tao@amd.com>,
        coverity-bot <keescook@chromium.org>
Cc:     "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
References: <202004240826.F065651@keescook>
 <MN2PR12MB3039B02A90B9A1D3ED38B3E8E5D10@MN2PR12MB3039.namprd12.prod.outlook.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <408ab628-cb2f-c1d4-859b-216294aaf9d0@amd.com>
Date:   Sat, 25 Apr 2020 14:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <MN2PR12MB3039B02A90B9A1D3ED38B3E8E5D10@MN2PR12MB3039.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::17) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0101CA0049.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sat, 25 Apr 2020 12:42:09 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed20316b-cbd9-444c-ebd8-08d7e91612cd
X-MS-TrafficTypeDiagnostic: DM6PR12MB2601:|DM6PR12MB2601:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2601DA0906645281F43B401783D10@DM6PR12MB2601.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0384275935
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(86362001)(2616005)(52116002)(966005)(316002)(45080400002)(31686004)(478600001)(5660300002)(8936002)(81156014)(53546011)(110136005)(36756003)(54906003)(2906002)(66946007)(8676002)(186003)(16526019)(66556008)(4326008)(6666004)(66476007)(31696002)(6486002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJIClmmdGOPpiNbDGv0wFFxCinpKdJmQXRAcg6jx2M72JpBtuj9LheiPrDDdQoOi+zL8D7FAkwcOlUYMMwlxmfxr2sorwhLXUlU3md6AVa8Drewf8gpHInvIv2slnsj9lv7j7EjGA7ZnrWDymn1/SP0iiiiL9gZcTSbKBQqDpyhCw25Sy5TsJPHWshohMYuKEVNNvO0mjPOtjLxIbDjEswXU3al8G9dwYtudt+1wjbAqA/Z+q9gSrrETOu+lHLhi5icJUZhubHb4I1h1VmHrGmPvPPyYCbULMNiKPocsh9OrJDirVkBkHosHrnZ8rNHtlEQDxKbjO2eJaiI/pXLWhg6sNPOWgmPGDppfO6WMExQNL32yVOreYoEjegppuWVFoZxIAbjfY0Q+HPIqL9QBKSOB4YRliSkX+hzcRKhMZenNPwGxPxRriMW+Dgh/30r2vk2PA2/d1JZWygvs5tCvMAYzYYZTMdYwO1t9fM1ABFyxAYCD+11N1tIOh95XM121P/ealie8QvUFDssjD/SqsQ==
X-MS-Exchange-AntiSpam-MessageData: gcCrFC0LkAB7GYmyRwwEsJ71mSEOm1bk0HMKrEDb67g6s1rVydHhSI5jTlWZdrWY9VOoeb6Lttr5wlteasAayDqvA1eXSj1fXoWbcMNz7T5+a+jzZ6DmjItgywkKNbhVC1knOtF02REgNXdvXDChIWIs+lIN8dnrEiY1RPaefoA3vHz0meFZ3iexWY57kXjtzC6012GXgnF7QJUUTW8HT8d9kNUS5ffIQ2JWuV+YH0lOcNqrZdLuNRQbV0I3XVGmFhkv2vmdRNt6rPZIwkDFPzLBj4+xNO5WFYxfGUxqiQ/bsMrEDPyE0VKto7Bpixb3Sl7t+E/jw1+kPeEr6oPKSY6ZJdY7XUlOwtImNtQMYCE1aYaJLGiTTIe2JHnlYfdY/iTkWc3ZZZ2SWQ8TCkY0xPutfsO+dHYchTKg1+mSEkId4oyhc8JMjTB2+/5i1K8sX31ZqBPfwdrFPD0GZcoJR3R3HJrlsa6UHYLjBxpfWjaQevEMeWFVb4ZlhrqQ+neNF4fMCQL03FFRsIMj7x/yDjGd61a9iwTfaPzB/VgFcSfoYP19neDp7yrQoa88jVB/ZPUtbfKXPj8R1MlbfOIxATpFyhhdZU1zXM2OghItsvkk63Uf31LTIXN15NxGSeP4CffvAFpFlgVspnCGWDEjwppLoMIC1fhAMcDc5Cm1YoesOUnrcL4XukISlw3yUDLx7LpAqWBNRa0RgIBBquTskkisuTlVdluxHYNm9Jkf+umZqSe7neK/lBTsLxHM0GpSthDjybBipiCr0/4kuIWPVuLMalZ/A6c1biQhP8kjlu7gonIKe1EDTSIkUxdmmIs5gziYtCaVre1OdysVAxUAAr5TQMTp8wLx1OBhOhc+wgs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed20316b-cbd9-444c-ebd8-08d7e91612cd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2020 12:42:11.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: el5UtxFP87i4OGfrOql+j+BskIokolFD4kZ9ne9wfpLo+NLuvxnCtma4Jy04s+tW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2601
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi guys,

yes Yintian is right this is essentially the same lock just different 
pointers to it.

Looks like that Coverity is not doing an alias analyses to figure out if 
two pointer point to the same thing.

On the other hand we could probably use the same pointer in the code for 
both locking and unlocking.

Regards,
Christian.

Am 25.04.20 um 08:46 schrieb Tao, Yintian:
> Hi
>
> This is a false positive. Please have a look at the code, here &kiq->ring_lock is equal to &adev->gfx.kiq.ring_lock
> Because kiq is fetched from adev->gfx.kiq. These two expressions are equivalent.
>
> Best Regards
> Yintian Tao
> -----Original Message-----
> From: coverity-bot <keescook@chromium.org>
> Sent: 2020Äê4ÔÂ24ÈÕ 23:26
> To: Tao, Yintian <Yintian.Tao@amd.com>
> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Gustavo A. R. Silva <gustavo@embeddedor.com>; linux-next@vger.kernel.org
> Subject: Coverity: gmc_v10_0_flush_gpu_tlb_pasid(): Program hangs
>
> Hello!
>
> This is an experimental semi-automated report about issues detected by Coverity from a scan of next-20200424 as part of the linux-next scan project:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fscan.coverity.com%2Fprojects%2Flinux-next-weekly-scan&amp;data=02%7C01%7CYintian.Tao%40amd.com%7Cb4e164ff3f1542f14c2008d7e863dae8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637233387886678181&amp;sdata=QyZO8PdGBQF6NrWhXb1Ym0aoQhzotuCzwT3M1TwYQfk%3D&amp;reserved=0
>
> You're getting this email because you were associated with the identified lines of code (noted below) that were touched by commits:
>
>    Thu Apr 23 12:05:54 2020 +0800
>      82478876eaac ("drm/amdgpu: protect ring overrun")
>
> Coverity reported the following:
>
> *** CID 1492715:  Program hangs  (LOCK)
> /drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c: 434 in gmc_v10_0_flush_gpu_tlb_pasid()
> 428     		kiq->pmf->kiq_invalidate_tlbs(ring,
> 429     					pasid, flush_type, all_hub);
> 430     		r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
> 431     		if (r) {
> 432     			amdgpu_ring_undo(ring);
> 433     			spin_unlock(&kiq->ring_lock);
> vvv     CID 1492715:  Program hangs  (LOCK)
> vvv     Returning without unlocking "adev->gfx.kiq.ring_lock".
> 434     			return -ETIME;
> 435     		}
> 436
> 437     		amdgpu_ring_commit(ring);
> 438     		spin_unlock(&adev->gfx.kiq.ring_lock);
> 439     		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
>
> If this is a false positive, please let us know so we can mark it as such, or teach the Coverity rules to be smarter. If not, please make sure fixes get into linux-next. :) For patches fixing this, please include these lines (but double-check the "Fixes" first):
>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1492715 ("Program hangs")
> Fixes: 82478876eaac ("drm/amdgpu: protect ring overrun")
>
> Thanks for your attention!
>
> --
> Coverity-bot

