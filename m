Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94BF104630
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 22:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfKTVyc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 16:54:32 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:35714 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfKTVyb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2019 16:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jA44cDlCYtFxTSE0zLSv7o10kem9ZSkmgN7lwhPboHE=; b=cfJhrH4+1dDqhuhuXQgOY0X9q
        /P+s6xpxhX8Skj8CX0KgqC4mTqkcoOVOG8vZXBlwTOb9CHb/EoMG2TuuexfOE25yB1/5p953c2N1U
        JcPjGb92UgJ/RXjCtHBtNlzBuU58+ctFBZ1u8T+pzEwfpa05lzqiyCiGoWzfhmwpSRbqu1wGiTzng
        R7Xx4UpX5q8JA308lBpyR66MrZKZ0PjZANMpq3SzKHZ6oSJkR6xF1IBqHxBC4cCwtmWRHPFrHNZoM
        SNxmmvk/KCeY3j+RiYuvDhJt2VI5ZZYURPOGl3cvp0Ypn8M68wyY5hOvrDom+tqUo8mOvisgrEUFL
        ergq6QRhQ==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iXXvi-0003DB-TU; Wed, 20 Nov 2019 21:54:30 +0000
Subject: Re: [Intel-gfx] linux-next: Tree for Nov 19 (i915)
To:     Chris Wilson <chris@chris-wilson.co.uk>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20191119194658.39af50d0@canb.auug.org.au>
 <1d30acd4-9947-d228-967f-c4e76ebca832@infradead.org>
 <87k17uwmlv.fsf@intel.com>
 <157426899658.13839.6346197595846229766@skylake-alporthouse-com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fd7a54c4-99b4-abb2-15d1-96324fdff111@infradead.org>
Date:   Wed, 20 Nov 2019 13:54:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157426899658.13839.6346197595846229766@skylake-alporthouse-com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/20/19 8:56 AM, Chris Wilson wrote:
> Quoting Jani Nikula (2019-11-20 16:15:08)
>> On Tue, 19 Nov 2019, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> On 11/19/19 12:46 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20191118:
>>>
>>>
>>> on x86_64:
>>>
>>> ERROR: "pm_suspend_target_state" [drivers/gpu/drm/i915/i915.ko] undefined!
>>>
>>> # CONFIG_SUSPEND is not set
>>
>> a70a9e998e8e ("drm/i915: Defer rc6 shutdown to suspend_late")
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 060ee0f44c70..982040ecbd01 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -275,7 +275,7 @@ void intel_gt_suspend_prepare(struct intel_gt *gt)
> 
>  static suspend_state_t pm_suspend_target(void)
>  {
> -#if IS_ENABLED(CONFIG_PM_SLEEP)
> +#if IS_ENABLED(CONFIG_SUSPEND) && IS_ENABLED(CONFIG_PM_SLEEP)
> 
> Declared under PM_SLEEP.
> Defined under SUSPEND.
> -Chris

Aside from being a slightly incomplete patch (missing 3 ending context lines),
this works fine.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

-- 
~Randy

