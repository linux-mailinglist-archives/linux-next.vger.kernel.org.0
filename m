Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874EF2C19E9
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 01:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbgKXAXO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 19:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgKXAXO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Nov 2020 19:23:14 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77EEC061A4D
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2020 16:23:12 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id t21so15835309pgl.3
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2020 16:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=5ue+P3JzpGrU6tlzGx5XVuYQaSyzNcLFnV35XJjjspQ=;
        b=i9XFnBH+MXLis9WH+r0LmXB7kMbK3QJnfcO+0O2lFecH43DRqKs0w1BfAmToymVRCe
         Kq3WLay7IYMalLVYOYd1EN4jYdZrJZnIAaD9ge1SUKAcWTsguAeh2DvGkm4MXrAiN7iH
         X5XBeXPrtdx9uSLu4KVAV5Wr1nbUz9HRxf1us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=5ue+P3JzpGrU6tlzGx5XVuYQaSyzNcLFnV35XJjjspQ=;
        b=TKrRtaS6w1szUPa9X+mpaGD+4JKJ389qcqPQi8gY2G4l7b5cgiwOQGdBEhT0f2rLbl
         d8TItqPBkPPqOtSlcEW84W+BicQkFZGpLm13kNyF2Vu6dfJnAa6pEmnIjUZKZvJeUyTO
         3Yx/yz1Q3CwGRDwG8ONZAfIlnoJ27o1lFAmseCoVjlruRyhnaHg3l6FaLFY2tRBFcYyh
         wmK4Nuvd7SWq2kWQBg9MhRcc8CFmS25htLgHrvSD9n+nFPz8NnXq6v0TpF6saWpWZRu5
         khvGYJhC9EX2wykPAeP87ztKkLnBzvIOO05jnLmxzxBKADqsWlWlAu+2bgHjWwvwiFfN
         mtYQ==
X-Gm-Message-State: AOAM533VT46L/8psnmPTHqc99MqDM4BXboUEZK0KxlMvPP1uyaE88BDF
        ALfFns8PbC7hNitwKQyWkWo4Kg==
X-Google-Smtp-Source: ABdhPJzYctHCNliFHjrbwMjHJFs6e+hFtU/VNaPxXW2QdrQCHT7+xY7UbMaIV6qL8EKUz7UjqzVl4A==
X-Received: by 2002:a17:90a:f406:: with SMTP id ch6mr1619681pjb.134.1606177392399;
        Mon, 23 Nov 2020 16:23:12 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-1113-ab2f-0962-4f90.static.ipv6.internode.on.net. [2001:44b8:1113:6700:1113:ab2f:962:4f90])
        by smtp.gmail.com with ESMTPSA id y19sm12837831pfn.147.2020.11.23.16.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:23:11 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Michael Ellerman <patch-notifications@ellerman.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure in Linus' tree
In-Reply-To: <160617472873.1817800.16473753588453276266.b4-ty@ellerman.id.au>
References: <20201123184016.693fe464@canb.auug.org.au> <160617472873.1817800.16473753588453276266.b4-ty@ellerman.id.au>
Date:   Tue, 24 Nov 2020 11:23:08 +1100
Message-ID: <87h7pfhac3.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks sfr and mpe.

> Applied to powerpc/fixes.
>
> [1/1] powerpc/64s: Fix allnoconfig build since uaccess flush
>       https://git.kernel.org/powerpc/c/b6b79dd53082db11070b4368d85dd6699ff0b063

We also needed a similar fix for stable, which has also been applied.

I guess I should build some sort of build process that tests a whole
range of configs. I did test a few but clearly not enough. Is there a
known list that I should be using? Something from kisskb?

Kind regards,
Daniel

Michael Ellerman <patch-notifications@ellerman.id.au> writes:

> On Mon, 23 Nov 2020 18:40:16 +1100, Stephen Rothwell wrote:
>> After merging most of the trees, today's linux-next build (powerpc64
>> allnoconfig) failed like this:
>> 
>> In file included from arch/powerpc/include/asm/kup.h:18,
>>                  from arch/powerpc/include/asm/uaccess.h:9,
>>                  from include/linux/uaccess.h:11,
>>                  from include/linux/sched/task.h:11,
>>                  from include/linux/sched/signal.h:9,
>>                  from include/linux/rcuwait.h:6,
>>                  from include/linux/percpu-rwsem.h:7,
>>                  from include/linux/fs.h:33,
>>                  from include/linux/compat.h:17,
>>                  from arch/powerpc/kernel/asm-offsets.c:14:
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: data definition has no type or storage class
>>    66 | DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Werror=implicit-int]
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: parameter names (without types) in function declaration
>> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access':
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:6: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
>>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>>       |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>>       |                              ^~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: note: each undeclared identifier is reported only once for each function it appears in
>> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access_return':
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:189:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>>   189 |  if (static_branch_unlikely(&uaccess_flush_key))
>>       |                              ^~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'restore_user_access':
>> arch/powerpc/include/asm/book3s/64/kup-radix.h:198:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>>   198 |  if (static_branch_unlikely(&uaccess_flush_key) && flags == AMR_KUAP_BLOCKED)
>>       |                              ^~~~~~~~~~~~~~~~~
>> 
>> [...]
>
