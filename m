Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B81FA11A726
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 10:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfLKJb6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 04:31:58 -0500
Received: from mga05.intel.com ([192.55.52.43]:48558 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727829AbfLKJb6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 04:31:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 01:31:58 -0800
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="207613299"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 01:31:54 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "S\, Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Qian Cai <cai@lca.pw>, Ingo Molnar <mingo@kernel.org>,
        Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
In-Reply-To: <20191210094224.4a294cb7@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191210093957.5120f717@canb.auug.org.au> <20191210094224.4a294cb7@canb.auug.org.au>
Date:   Wed, 11 Dec 2019 11:31:51 +0200
Message-ID: <87a77z4394.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 10 Dec 2019, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> [Just adding Dave Airlie to the cc list]
>
> On Tue, 10 Dec 2019 09:39:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drm-intel tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:

FYI, I've now backmerged drm-next and thus v5.5-rc1 to
drm-intel-next-queued, resolving the conflict.

BR,
Jani.


>> 
>> In file included from include/linux/spinlock_types.h:18,
>>                  from include/linux/mutex.h:16,
>>                  from include/linux/kernfs.h:12,
>>                  from include/linux/sysfs.h:16,
>>                  from include/linux/kobject.h:20,
>>                  from include/linux/of.h:17,
>>                  from include/linux/irqdomain.h:35,
>>                  from include/linux/acpi.h:13,
>>                  from drivers/gpu/drm/i915/i915_drv.c:30:
>> drivers/gpu/drm/i915/gem/i915_gem_object.h: In function 'i915_gem_object_pin_pages':
>> include/linux/lockdep.h:635:2: error: too many arguments to function 'lock_release'
>>   635 |  lock_release(&(lock)->dep_map, 0, _THIS_IP_);  \
>>       |  ^~~~~~~~~~~~
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:294:2: note: in expansion of macro 'might_lock_nested'
>>   294 |  might_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
>>       |  ^~~~~~~~~~~~~~~~~
>> include/linux/lockdep.h:352:13: note: declared here
>>   352 | extern void lock_release(struct lockdep_map *lock, unsigned long ip);
>>       |             ^~~~~~~~~~~~
>> In file included from include/linux/spinlock_types.h:18,
>>                  from include/linux/spinlock.h:83,
>>                  from include/linux/mmzone.h:8,
>>                  from include/linux/gfp.h:6,
>>                  from include/linux/slab.h:15,
>>                  from drivers/gpu/drm/i915/i915_irq.c:32:
>> drivers/gpu/drm/i915/gem/i915_gem_object.h: In function 'i915_gem_object_pin_pages':
>> include/linux/lockdep.h:635:2: error: too many arguments to function 'lock_release'
>>   635 |  lock_release(&(lock)->dep_map, 0, _THIS_IP_);  \
>>       |  ^~~~~~~~~~~~
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:294:2: note: in expansion of macro 'might_lock_nested'
>>   294 |  might_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
>>       |  ^~~~~~~~~~~~~~~~~
>> include/linux/lockdep.h:352:13: note: declared here
>>   352 | extern void lock_release(struct lockdep_map *lock, unsigned long ip);
>>       |             ^~~~~~~~~~~~
>> 
>> Caused by commit
>> 
>>   e692b4021a2e ("lockdep: add might_lock_nested()")
>> 
>> interacting with commit
>> 
>>   5facae4f3549 ("locking/lockdep: Remove unused @nested argument from lock_release()")
>> 
>> from Linus' tree.
>> 
>> I have applied the following merge fix patch for today:
>> 
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Tue, 10 Dec 2019 09:37:07 +1100
>> Subject: [PATCH] lockdep: fix up for lock_release API change
>> 
>> ---
>>  include/linux/lockdep.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
>> index 5bbfd5866081..664f52c6dd4c 100644
>> --- a/include/linux/lockdep.h
>> +++ b/include/linux/lockdep.h
>> @@ -632,7 +632,7 @@ do {									\
>>  	typecheck(struct lockdep_map *, &(lock)->dep_map);		\
>>  	lock_acquire(&(lock)->dep_map, subclass, 0, 1, 1, NULL,		\
>>  		     _THIS_IP_);					\
>> -	lock_release(&(lock)->dep_map, 0, _THIS_IP_);		\
>> +	lock_release(&(lock)->dep_map, _THIS_IP_);			\
>>  } while (0)
>>  
>>  #define lockdep_assert_irqs_enabled()	do {				\

-- 
Jani Nikula, Intel Open Source Graphics Center
