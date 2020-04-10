Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFCE1A4ABE
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 21:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgDJTlh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 15:41:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37594 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgDJTlh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 15:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=POIx3XHs+z1B1LYmbchLvd+6mRZG4jjVrzB1XvFaETU=; b=K5H6j5Z8UAjUqgnZal2eZP5NdF
        8pu9HK6BV/ZEhIieqpKOXdk68oFiI4nbhRz2MI/Uwpfujyjt6vQLnEWT/9LN2igNpanJvPAC7t2S5
        R9w13AOCdEc/ifa0GmlR2HWuM/jDnQa0/7GHk1Va9Q7lfAsIUYt6/lgxhQ0CdpNjWWyKCfTllO9vK
        NuMHm2hxTf4yj+7kwjDE86avOS51voEMAGm81QUuHSau3Si7EUc1pkcPZhPqClC9h++d7z/UU0ILG
        eOOihowmxiMDHtTOTz10tCt/Uo/UhdPwrEs7HpAK32RLIyZRE9aPj/1k4sPDqL/taDiUmX/bU9Eiz
        G4i41mtA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jMzWy-0000T1-MB; Fri, 10 Apr 2020 19:41:36 +0000
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20200410132706.170811b7@canb.auug.org.au>
 <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
 <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org>
 <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org>
Date:   Fri, 10 Apr 2020 12:41:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/10/20 12:05 PM, Linus Torvalds wrote:
> On Fri, Apr 10, 2020 at 11:29 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>> I wonder if these scripts aren't well enough known, I see a lot of raw
>>> dumps that could be immensely improved with a little scripting - but
>>> they need the original vmlinux binary with debug info, so you can't do
>>> it after-the-fact somewhere else..
>>

> But even dump_stack.sh can't sort out how it got from test_printf_init
> to software_node_unregister_nodes even though it usually is good about
> following all the inlining (in this case selftest -> test_pointer ->
> fwnode_pointer).
> 
> That may be because of something like a DEBUG_INFO_REDUCED option.

No, that's enabled. (see below)


>> [  561.071144] _raw_spin_lock_irqsave (linux-next-20200410/rdd64/../include/linux/instrumented.h:71 linux-next-20200410/rdd64/../include/asm-generic/atomic-instrumented.h:695 linux-next-20200410/rdd64/../include/asm-generic/qspinlock.h:78 linux-next-20200410/rdd64/../include/linux/spinlock.h:194 linux-next-20200410/rdd64/../include/linux/spinlock_api_smp.h:119 linux-next-20200410/rdd64/../kernel/locking/spinlock.c:159)
>> [  561.074868] ? _raw_write_unlock_bh (linux-next-20200410/rdd64/../kernel/locking/spinlock.c:158)
>> [  561.078495] ? ida_destroy (linux-next-20200410/rdd64/../lib/idr.c:538)
>> [  561.082144] ida_free (linux-next-20200410/rdd64/../lib/idr.c:495 (discriminator 2))
>> [  561.085694] ? fprop_new_period.cold (linux-next-20200410/rdd64/../lib/idr.c:486)
>> [  561.089228] ? kasan_slab_free (linux-next-20200410/rdd64/../mm/kasan/common.c:466)
>> [  561.092738] ? kfree (linux-next-20200410/rdd64/../mm/slub.c:1478 linux-next-20200410/rdd64/../mm/slub.c:3035 linux-next-20200410/rdd64/../mm/slub.c:4003)
>> [  561.096183] software_node_release (linux-next-20200410/rdd64/../include/linux/list.h:132 linux-next-20200410/rdd64/../include/linux/list.h:146 linux-next-20200410/rdd64/../drivers/base/swnode.c:613)
>> [  561.099644] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:697 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739)
>> [  561.103109] kobject_del (linux-next-20200410/rdd64/../lib/kobject.c:629)
>> [  561.106457] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:690 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739)
>> [  561.109785] fwnode_remove_software_node (linux-next-20200410/rdd64/../drivers/base/swnode.c:784)
>> [  561.113061] software_node_unregister_nodes (linux-next-20200410/rdd64/../drivers/base/swnode.c:721 (discriminator 2))
>> [  561.116274] test_printf_init (linux-next-20200410/rdd64/../lib/test_printf.c:685 linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
> 
> It does print out those multiple lines for some things, but doesn't
> have the nice "inlined by XYZ" I sometimes see that makes it really
> obvious.
> 

This is with FRAME_POINTER, not UNWIND_ORC. Maybe that's the difference?


> So it ends up still just looking like ida_free -> _raw_spin_lock_irqsave.
> 
> Strange. But it's all the same freeing path:
> 
>> [  561.278921] Freed by task 1454:
>> [  561.289528] kfree (linux-next-20200410/rdd64/../mm/slub.c:1478 linux-next-20200410/rdd64/../mm/slub.c:3035 linux-next-20200410/rdd64/../mm/slub.c:4003)
>> [  561.292183] software_node_release (linux-next-20200410/rdd64/../drivers/base/swnode.c:624)
>> [  561.294865] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:697 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739)
>> [  561.297501] kobject_del (linux-next-20200410/rdd64/../lib/kobject.c:629)
>> [  561.300154] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:690 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739)
>> [  561.302784] kobject_del (linux-next-20200410/rdd64/../lib/kobject.c:629)
>> [  561.305344] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:690 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739)
>> [  561.307914] fwnode_remove_software_node (linux-next-20200410/rdd64/../drivers/base/swnode.c:784)
> 
> so it at least superficially looks like software_node_release() might
> be called twice.
> 
> Maybe the child node is released after the parent node - and the child
> node seems to do the
> 
>         ida_simple_remove(&swnode->parent->child_ids, swnode->id);
> 
> and maybe it's that the parent->child_ids was already free'd by the
> previous software_node_release() call? Do children not keep a refcount
> to their parent, perhaps?
> 
> Somebody who knows the driver core thing needs to look at it. And
> since I don't play with linux-next apart from checking when I pull, I
> don't know what might have happened in this area..
> 
> Adding some driver core people to the cc.
> 
>                 Linus-- 
~Randy

