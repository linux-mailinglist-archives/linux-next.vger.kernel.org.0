Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A45E1EF498
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 11:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgFEJsv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 05:48:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:39086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbgFEJsu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Jun 2020 05:48:50 -0400
Received: from linux-8ccs (p57a23121.dip0.t-ipconnect.de [87.162.49.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C834D206A2;
        Fri,  5 Jun 2020 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591350530;
        bh=7VfmUbTNfgHA8phpYfCqhYWcZsAaPsLsQoqo+K9rgpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HALIUzIARJO3m52oj9SlPwbge4MTdKsjO+gUs+ViVI9J9qA83rV8SEdBk860eSUAX
         rk0QrB+sdnKGwhW2f6ZoWJn4yxdx2a9czWZkqUTk5JMjELyYH8OPXqJkMDMi4vhAuM
         Wfh+c7IM8ZUsCHJBFKfYkQ2uA8A/CJUgesQHIrPA=
Date:   Fri, 5 Jun 2020 11:48:46 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20200605094845.GA24474@linux-8ccs>
References: <20200605083715.1a6c29ce@canb.auug.org.au>
 <20200605000439.v75kbagqcxvctqam@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200605000439.v75kbagqcxvctqam@treble>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+++ Josh Poimboeuf [04/06/20 19:04 -0500]:
>On Fri, Jun 05, 2020 at 08:37:15AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the origin tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> kernel/module.c: In function 'do_init_module':
>> kernel/module.c:3593:2: error: implicit declaration of function 'module_enable_ro'; did you mean 'module_enable_x'? [-Werror=implicit-function-declaration]
>>  3593 |  module_enable_ro(mod, true);
>>       |  ^~~~~~~~~~~~~~~~
>>       |  module_enable_x
>>
>> Caused by commit
>>
>>   e6eff4376e28 ("module: Make module_enable_ro() static again")
>>
>> This config has neither CONFIG_ARCH_HAS_STRICT_MODULE_RWX or
>> CONFIG_ARCH_HAS_STRICT_MODULE_RWX set.  This failure was hidden in
>> linux-next due to commit
>>
>>   db991af02f11 ("module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRICT_MODULE_RWX #ifdefs")
>>
>> from the modules tree. I have cherry-picked that commit for today.
>
>Sorry, I guessed we missed that dependency between the live-patching and
>module trees.
>
>Jessica, are you planning on sending a pull request?

Yep, just sent. So hopefully this gets resolved in the next day or two.

