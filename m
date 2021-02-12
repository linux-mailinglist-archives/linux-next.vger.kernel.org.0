Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3C9319D45
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 12:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhBLLUk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 06:20:40 -0500
Received: from mga02.intel.com ([134.134.136.20]:13597 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230206AbhBLLUQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 06:20:16 -0500
IronPort-SDR: Qegj80yXQGpmEstzuCdfrA+WapeshJPF+QK1inO4hBlGTJCCeUZlIvw0TUlggnxCwgoajC5aC8
 Qlo4FWX/enZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="169524664"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="169524664"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 03:19:25 -0800
IronPort-SDR: o4XUVyapFaA4ncOLCojy9ctX5wTK4EP0Z8qRnofniDW/2mnGpL1xDKer7kIWCN+4Nan7JWx5bj
 +IaNtV+9xL6A==
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="397941401"
Received: from shuo-intel.sh.intel.com (HELO localhost) ([10.239.154.30])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 03:19:24 -0800
Date:   Fri, 12 Feb 2021 19:19:21 +0800
From:   Shuo A Liu <shuo.a.liu@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virt: acrn: Fix vCPU removing code build error
Message-ID: <20210212111921.GA30008@shuo-intel.sh.intel.com>
References: <20210212045724.77846-1-shuo.a.liu@intel.com>
 <YCYzwVE0wm5osXGF@kroah.com>
 <20210212105853.GF15601@shuo-intel.sh.intel.com>
 <YCZgOrbH7txiOedo@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCZgOrbH7txiOedo@kroah.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 12.Feb'21 at 12:02:18 +0100, Greg Kroah-Hartman wrote:
>On Fri, Feb 12, 2021 at 06:58:53PM +0800, Shuo A Liu wrote:
>> Hi Greg,
>>
>> On Fri 12.Feb'21 at  8:52:33 +0100, Greg Kroah-Hartman wrote:
>> > On Fri, Feb 12, 2021 at 12:57:24PM +0800, shuo.a.liu@intel.com wrote:
>> > > From: Shuo Liu <shuo.a.liu@intel.com>
>> > >
>> > > vCPU removing code depends on CONFIG_HOTPLUG_CPU as it uses remove_cpu()
>> > > and add_cpu(). Make the vCPU removing interface building with
>> > > CONFIG_HOTPLUG_CPU.
>> > >
>> > > ../drivers/virt/acrn/hsm.c: In function ‘remove_cpu_store’:
>> > > ../drivers/virt/acrn/hsm.c:389:3: error: implicit declaration of function ‘remove_cpu’; [-Werror=implicit-function-declaration]
>> > >    remove_cpu(cpu);
>> > >
>> > > ../drivers/virt/acrn/hsm.c:402:2: error: implicit declaration of function ‘add_cpu’; [-Werror=implicit-function-declaration]
>> > >    add_cpu(cpu);
>> > >
>> > > Fixes: 279dcf693ac7 ("virt: acrn: Introduce an interface for Service VM to control vCPU")
>> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> > > Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>> > > Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
>> > > ---
>> > >  drivers/virt/acrn/hsm.c | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
>> > > index 1f6b7c54a1a4..e340788aacdf 100644
>> > > --- a/drivers/virt/acrn/hsm.c
>> > > +++ b/drivers/virt/acrn/hsm.c
>> > > @@ -372,6 +372,7 @@ static int acrn_dev_release(struct inode *inode, struct file *filp)
>> > >  	return 0;
>> > >  }
>> > >
>> > > +#ifdef CONFIG_HOTPLUG_CPU
>> > >  static ssize_t remove_cpu_store(struct device *dev,
>> > >  				struct device_attribute *attr,
>> > >  				const char *buf, size_t count)
>> > > @@ -403,9 +404,12 @@ static ssize_t remove_cpu_store(struct device *dev,
>> > >  	return ret;
>> > >  }
>> > >  static DEVICE_ATTR_WO(remove_cpu);
>> > > +#endif
>> > >
>> > >  static struct attribute *acrn_attrs[] = {
>> > > +#ifdef CONFIG_HOTPLUG_CPU
>> > >  	&dev_attr_remove_cpu.attr,
>> > > +#endif
>> > >  	NULL
>> > >  };
>> > >
>> > >
>> >
>> > Shouldn't the real solution for this be that remove_cpu() and add_cpu()
>> > have function prototypes for when this is not enabled in the kernel
>> > build?
>>
>> Something like this in linux/cpu.h?
>>
>> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
>> index 3aaa0687e8df..94a578a96202 100644
>> --- a/include/linux/cpu.h
>> +++ b/include/linux/cpu.h
>> @@ -108,6 +108,8 @@ static inline void cpu_maps_update_done(void)
>> {
>> }
>>
>> +static inline int add_cpu(unsigned int cpu) { return 0;}
>> +
>> #endif /* CONFIG_SMP */
>> extern struct bus_type cpu_subsys;
>>
>> @@ -137,6 +139,7 @@ static inline int  cpus_read_trylock(void) { return
>> true; }
>> static inline void lockdep_assert_cpus_held(void) { }
>> static inline void cpu_hotplug_disable(void) { }
>> static inline void cpu_hotplug_enable(void) { }
>> +static inline int remove_cpu(unsigned int cpu) { return -EPERM; }
>> static inline void smp_shutdown_nonboot_cpus(unsigned int primary_cpu)
>> { }
>> #endif /* !CONFIG_HOTPLUG_CPU */
>>
>>
>> >
>> > Putting #ifdef in .c files like this is not a good idea at all.
>> >
>> > Then, at runtime, you can determine if you need to create this sysfs
>> > file or not, as you do not want to expose it to userspace if the kernel
>> > can not handle it, right?
>>
>> Right. I don't want to expose the sysfs to userspace if the kernel built
>> w/o CONFIG_HOTPLUG_CPU. But how to implement that if #ifdef is not used?
>> misc_register() creates sysfs with .groups (acrn_attr_groups)
>> unconditionally, then userspace can see the interface even it doesn't
>> work.
>
>Use the is_visible() callback for your attribute group.

Thanks for the guide, is_visible() is good. Seems good i can provide the
callback with 
	return IS_ENABLED(CONFIG_HOTPLUG_CPU);

Will update in v2.

Thanks
shuo

