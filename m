Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65A331A617
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 21:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhBLUd7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 15:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhBLUd4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2021 15:33:56 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286C4C061574;
        Fri, 12 Feb 2021 12:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=9uw9IAr8lyqmrfip3LyZc7NlrzYPAAm/36VrnVIikDg=; b=eoBsNoHgUjJxhXfuNEv5Yz2LMQ
        jPN5Kq6W+kpMzV52pkqwqKK8A+ctKUoFLzdnTG2SHwrh46QnXJU9pFTm02MXbqkZzFqGguQvrs236
        EvtAM2JJ/PdvTffkVLJgThfhKnfmWmWNGUPxudIWs8Y8u8WKdNueKd2VS/KV48rvMrQJK5R09iJ83
        CBVkHJQ5Rpnx8v3X9dJ4YG4sEHSLoLkrhTru+dnk/wHsHJZ5fbzZKrIqJLaf++wzd12nP8lUhqmsi
        mgFsY2AvPw/YopThXX2ECKR7CV9Ux4ImXNEBUzTEEAFgmdyDLUXt8lpIYIwpdrFmlyXV+5iW52sOs
        WXWZCiOQ==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lAf7o-0007qq-7W; Fri, 12 Feb 2021 20:33:12 +0000
Subject: Re: [PATCH v2 1/2] cpu/hotplug: Fix build error of using
 {add,remove}_cpu() with !CONFIG_SMP
To:     shuo.a.liu@intel.com, linux-next@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qais Yousef <qais.yousef@arm.com>, linux-kernel@vger.kernel.org
References: <20210212165519.82126-1-shuo.a.liu@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e3095871-ac55-baba-8712-9afaa94b41f8@infradead.org>
Date:   Fri, 12 Feb 2021 12:33:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212165519.82126-1-shuo.a.liu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/12/21 8:55 AM, shuo.a.liu@intel.com wrote:
> From: Shuo Liu <shuo.a.liu@intel.com>
> 
> 279dcf693ac7 ("virt: acrn: Introduce an interface for Service VM to
> control vCPU") introduced {add,remove}_cpu() usage and it hit below
> error with !CONFIG_SMP:
> 
> ../drivers/virt/acrn/hsm.c: In function ‘remove_cpu_store’:
> ../drivers/virt/acrn/hsm.c:389:3: error: implicit declaration of function ‘remove_cpu’; [-Werror=implicit-function-declaration]
>    remove_cpu(cpu);
> 
> ../drivers/virt/acrn/hsm.c:402:2: error: implicit declaration of function ‘add_cpu’; [-Werror=implicit-function-declaration]
>    add_cpu(cpu);
> 
> Add add_cpu() function prototypes with !CONFIG_SMP and remove_cpu() with
> !CONFIG_HOTPLUG_CPU for such usage.
> 
> Fixes: 279dcf693ac7 ("virt: acrn: Introduce an interface for Service VM to control vCPU")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
> ---
> I followed Greg's idea that add {add,remove}_cpu() functions prototypes.
> The v2 solution is different from the v1, so i removed Randy's Acked-by.
> Randy, please help have a look on v2.
> 
> v2:
>   - Drop the #ifdef in .c solution. Add {add,remove}_cpu() prototypes. (Suggested by Greg)
> 
>  include/linux/cpu.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index 3aaa0687e8df..94a578a96202 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -108,6 +108,8 @@ static inline void cpu_maps_update_done(void)
>  {
>  }
>  
> +static inline int add_cpu(unsigned int cpu) { return 0;}
> +
>  #endif /* CONFIG_SMP */
>  extern struct bus_type cpu_subsys;
>  
> @@ -137,6 +139,7 @@ static inline int  cpus_read_trylock(void) { return true; }
>  static inline void lockdep_assert_cpus_held(void) { }
>  static inline void cpu_hotplug_disable(void) { }
>  static inline void cpu_hotplug_enable(void) { }
> +static inline int remove_cpu(unsigned int cpu) { return -EPERM; }

I would have done: return 0;

Anyway:

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


>  static inline void smp_shutdown_nonboot_cpus(unsigned int primary_cpu) { }
>  #endif	/* !CONFIG_HOTPLUG_CPU */

thanks.

-- 
~Randy

