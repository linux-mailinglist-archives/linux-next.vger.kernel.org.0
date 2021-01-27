Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E9E30640E
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 20:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhA0TbT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 14:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbhA0TbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 14:31:18 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F1FC061573;
        Wed, 27 Jan 2021 11:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=NggY11F5bHVB0CVZTN9Izuj9i9PL4oNzJYxr25pZC5U=; b=1d/uim2qcNKJjsbEm8wQPYYxDe
        SW3voU4iz6FsunX1cxneyTpJAgV/GWgcok10V3tqGBcJOsvPXqKSGicVQE7vDVPBLJbV5twJxjbeg
        5K4PSP8TpVXTXNqqklJdX88chFXirI4rVCKnqFL3L3FTxZqzABvdKRWockevcU2lPH1FP6GSZQuXr
        KH3MYY9NNxtC3u8/YAyD+iz085tpMQ/FApCXPigaJ3oZYFblOLBLuLdk3zGCHT4RCf5rVyLIRB/8X
        f+dMYGO085FXjHVihDl9EBspZ71oFl8lyeXirqsn1e9dlN56rOjXUKRzErWlGfEkMQc7EBQ+5N0uU
        sSfj7bvg==;
Received: from [2601:1c0:6280:3f0::7650]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l4qWL-0001c0-Dg; Wed, 27 Jan 2021 19:30:29 +0000
Subject: Re: linux-next: Tree for Jan 27 (drm/i915)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
References: <20210128014419.55ea9ae4@canb.auug.org.au>
 <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
Message-ID: <669b3538-9edb-cb32-6746-10615d0500b0@infradead.org>
Date:   Wed, 27 Jan 2021 11:30:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f173c63a-d71f-15bd-02ef-518736600cf1@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/27/21 11:08 AM, Randy Dunlap wrote:
> On 1/27/21 6:44 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Note: the patch file has failed to upload :-(
>>
>> Changes since 20210125:
>>
> 
> on x86_64:
> 
> ../drivers/gpu/drm/i915/i915_gem.c: In function ‘i915_gem_freeze_late’:
> ../drivers/gpu/drm/i915/i915_gem.c:1182:2: error: implicit declaration of function ‘wbinvd_on_all_cpus’; did you mean ‘wrmsr_on_cpus’? [-Werror=implicit-function-declaration]
>   wbinvd_on_all_cpus();
> 

My apologies: this was in Andrew's mmotm 2021-01-25.
Sorry about that.

-- 
~Randy

