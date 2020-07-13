Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315DE21CD29
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 04:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgGMC0V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 22:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgGMC0V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jul 2020 22:26:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EFDC061794;
        Sun, 12 Jul 2020 19:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=1YPJ7BPo3bLI1LJBMxd8JhrL056FNIrP/ad+GWM9uL4=; b=IRrHmCR2zAJ5D6uTPftxgvDEvV
        KpQSd8Lm4A03GT2xoKuxOpZNMDWXU3fBEIoayxYtsvWTNO3AmTopvDmBBRFRDpOp+8USueHu4HoeD
        gnPv8FQNbG9zzKgiQWSmVWN9PLAGtNaDmMOgc9tDHpBEYeJTVXtYvOSk6yPrsXUi+B5IOQfUxOZ4E
        T81fZ0yoMp+rkMCOl8613m1FBUBzdX2mDSQhyj69AmpIXXVXJiQUKTJ+XT+kz2MHNKNYTOgdZqpt+
        gnYqOvAY24BTtelSNhnAsXuQ8wRA8nvpv3mdENJO99wAjwYTufQwrdgZjGIkap2Fx7Pov23f3YjE7
        BpdI5hmQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1juoAc-0005T4-QT; Mon, 13 Jul 2020 02:26:19 +0000
Subject: Re: linux-next: Tree for Jul 10
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20200710183318.7b808092@canb.auug.org.au>
 <20200712155604.GA342822@smile.fi.intel.com>
 <20200713080152.63ee1246@canb.auug.org.au>
 <e519f1c2-9761-4866-4878-09cc3da23d1f@infradead.org>
Message-ID: <31e99bdc-1243-3be7-74aa-59c01820ed8e@infradead.org>
Date:   Sun, 12 Jul 2020 19:26:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e519f1c2-9761-4866-4878-09cc3da23d1f@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/12/20 7:19 PM, Randy Dunlap wrote:
> On 7/12/20 3:01 PM, Stephen Rothwell wrote:
>> Hi Andy,
>>
>> On Sun, 12 Jul 2020 18:56:04 +0300 Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>>
>>> On Fri, Jul 10, 2020 at 06:33:18PM +1000, Stephen Rothwell wrote:
>>>>
>>>> Changes since 20200709:
>>>
>>> I can't build it on Debian with Sparse enabled
>>>
>>> CC      init/main.o
>>> init/main.c:760:20: warning: no previous prototype for ‘mem_encrypt_init’ [-Wmissing-prototypes]
>>> 760 | void __init __weak mem_encrypt_init(void) { }
>>> |                    ^~~~~~~~~~~~~~~~
>>> CHECK   /home/andy/prj/linux-topic-uart/init/main.c
>>> include/linux/compiler.h:309:16: error: typename in expression
>>> include/linux/compiler.h:309:16: error: Expected ) in function call
>>> include/linux/compiler.h:309:16: error: got :
>>> ...
>>> (All READ_ONCE() entries fail)
>>>
>>> Is it known issue?
>>
>> Not that I am aware of at the moment.  Does next-20200709 work?  Does
>> Linus' tree work?  The only obvious thing I can think of is commit
> 
> I'm hitting this same thing on 5.8-rc5. (x86_64)
> 
> 
>> 6ec4476ac825 ("Raise gcc version requirement to 4.9")
>>
>> The commmit message says:
>>
>>     Using _Generic also means that you will need to have a very recent
>>     version of 'sparse', but thats easy to build yourself, and much less of
>>     a hassle than some old gcc version can be.

OK, no problems, newer sparse fixes it.

-- 
~Randy

