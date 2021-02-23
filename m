Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59689322D36
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 16:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbhBWPMo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 10:12:44 -0500
Received: from foss.arm.com ([217.140.110.172]:55032 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232651AbhBWPLr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 10:11:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98F171FB;
        Tue, 23 Feb 2021 07:11:00 -0800 (PST)
Received: from e107158-lin (unknown [10.1.195.80])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93C7D3F73B;
        Tue, 23 Feb 2021 07:10:59 -0800 (PST)
Date:   Tue, 23 Feb 2021 15:10:56 +0000
From:   Qais Yousef <qais.yousef@arm.com>
To:     shuo.a.liu@intel.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH RESEND v2 1/2] cpu/hotplug: Fix build error of using
 {add,remove}_cpu() with !CONFIG_SMP
Message-ID: <20210223151056.7j64e3ioyp2lkhkg@e107158-lin>
References: <20210221134339.57851-1-shuo.a.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210221134339.57851-1-shuo.a.liu@intel.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 02/21/21 21:43, shuo.a.liu@intel.com wrote:
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
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---

Reviewed-by: Qais Yousef <qais.yousef@arm.com>

Thanks!

--
Qais Yousef

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
>  static inline void smp_shutdown_nonboot_cpus(unsigned int primary_cpu) { }
>  #endif	/* !CONFIG_HOTPLUG_CPU */
>  
> 
> base-commit: abaf6f60176f1ae9d946d63e4db63164600b7b1a
> -- 
> 2.28.0
> 
