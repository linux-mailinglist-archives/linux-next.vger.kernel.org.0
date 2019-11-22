Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1C8210752D
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2019 16:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfKVPsd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Nov 2019 10:48:33 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41988 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfKVPsd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Nov 2019 10:48:33 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so413018otd.9
        for <linux-next@vger.kernel.org>; Fri, 22 Nov 2019 07:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VoLw4CussgMLLZxAWl96Nmphb4wWEeXh0ad0ursaGQc=;
        b=GNOwZ31nRkkRtCObNuW1iTtfgqFs92bLcrWVBnJDrDrWXxmhu5jHB1W3qmVloZkxvv
         I7lirUZJKHODNPKD8Lnhi1ZLbKVQi7hxFaJzn/8+1mFtnqWsCvgnOwcKT0a6fk0Mla7C
         lx72owbQ9FRTQQcHSyruPmj48sUfj0BaZnq2eCQ8XSe/1cCVnNtF2jxyft38Pdxbwy+D
         BsjLNJnCvMgH+MyHNHBALbAnxXC3D5Hk0RwttL4/6f2iEN6bso1fq9MkYaIS8VQwNkNR
         HrqaQ3hAl2JuwpjiD912NpJ2AAxN7ZNLl0ehoc2hXpCxpqDZWuMounqR9hupqFGVoJC5
         3kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VoLw4CussgMLLZxAWl96Nmphb4wWEeXh0ad0ursaGQc=;
        b=YQ2XQk9meMrWpgTjZbfBfTnlCAxdI68eOH0G39X70pQAHDeG2cAHW5vOrznwNgm46m
         ddQEGOzmZgoPimrkzqKXAHjAIMiwVVHEy2eLilWga5TLta4tQkuo82KaCq3UHnI6Ee0Y
         i5IwxTD4hpwr0Bx9+ioRGd7Krug7NNz7LFQjECwGeKG+juTAK1Khrm9rSyQYFHj8uoKu
         nOgR7zEUpsURD2mb2ORV46Pu9+3EIoJQuPaCWo027dTHktt63wrPtcDC+9gVPzFBI/yf
         kdsmS3Vh4a6RxQArCFPBur5PKzGqDkWPCCBSGcz7nPp7kkGlItU3waKmGssIg4+OymwI
         I3wA==
X-Gm-Message-State: APjAAAXi8s8mUAPbJNH3eBT0WIKCRBq5MkeKsp2vqgjHhNrV4LD5O+YN
        j1g5MEsaxEQEba99uhs4MDRRtyg+VTLnyoRUAwZHmA==
X-Google-Smtp-Source: APXvYqzm/YERgO6yBcRziIJSES+wmUAc8m20DC+ayxZKVrwIy53nf8oLq6Ni05wdArtcO9BBvTQUv0BZID2e1YEgGdE=
X-Received: by 2002:a9d:82e:: with SMTP id 43mr11609145oty.23.1574437711101;
 Fri, 22 Nov 2019 07:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20191120203434.2a0727b3@canb.auug.org.au> <58708908-84a0-0a81-a836-ad97e33dbb62@infradead.org>
 <CANpmjNOHTyTRCeo3oxEPTY__TCjAQ8nMvcqDSZ6Otfs7vVESSA@mail.gmail.com>
 <20191121183711.w2qnysscwnbxocc4@treble> <CANpmjNMzue4xatqy5hik1sBNohHUR_VYND6_2qWaK5Kwy1aiLQ@mail.gmail.com>
In-Reply-To: <CANpmjNMzue4xatqy5hik1sBNohHUR_VYND6_2qWaK5Kwy1aiLQ@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 22 Nov 2019 16:48:20 +0100
Message-ID: <CANpmjNO4-ENQc_QgxrUqfXgm46DNngvDP6pMT3iv8toyRJtw0g@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 20 (kcsan + objtool)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 21 Nov 2019 at 19:43, Marco Elver <elver@google.com> wrote:
>
> On Thu, 21 Nov 2019 at 19:37, Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > On Wed, Nov 20, 2019 at 08:48:41PM +0100, Marco Elver wrote:
> > > On Wed, 20 Nov 2019 at 17:18, Randy Dunlap <rdunlap@infradead.org> wrote:
> > > >
> > > > On 11/20/19 1:34 AM, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20191119:
> > > > >
> > > >
> > > > on x86_64:
> > > >
> > > > kernel/kcsan/core.o: warning: objtool: kcsan_found_watchpoint()+0xa: call to kcsan_is_enabled() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_read1()+0x13: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_write1()+0x10: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_read2()+0x13: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_write2()+0x10: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_read4()+0x13: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_write4()+0x10: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_read8()+0x13: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_write8()+0x10: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_read16()+0x13: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_write16()+0x10: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_read_range()+0x13: call to find_watchpoint() with UACCESS enabled
> > > > kernel/kcsan/core.o: warning: objtool: __tsan_write_range()+0x10: call to find_watchpoint() with UACCESS enabled
> > > >
> > > > kernel/trace/trace_branch.o: warning: objtool: ftrace_likely_update()+0x361: call to __stack_chk_fail() with UACCESS enabled
> > > >
> > > >
> > > > Full randconfig file is attached.
> > >
> > > Thanks.
> > >
> > > This is due to CONFIG_CC_OPTIMIZE_FOR_SIZE=y. It seems the compiler
> > > decides to not even inline small static inline functions. I tried to
> > > make this go away by adding __always_inline, but then we're also left
> > > with atomic64_try_cmpxchg which never gets inlined.
> > >
> > > The optimized build simply inlines the small static inline functions.
> > > We certainly do not want to add more functions to the objtool
> > > whitelist, especially those that are private to KCSAN.
> > >
> > > We could fix it by either:
> > >
> > > 1. Adding __always_inline to every function used by the KCSAN runtime
> > > outside user_access_save + also fix atomic64_try_cmpxchg
> > > (atomic-instrumented.h).
> > >
> > > 2. Just not compile KCSAN with -Os, i.e. have the Makefile strip -Os
> > > and replace it with -O2 for kcsan/core.c. #2 is the simpler option,
> > > and would probably make KCSAN more effective even with -Os. Although
> > > it might violate the assumption of whoever decided they want both
> > > CC_OPTIMIZE_FOR_SIZE and KCSAN. It might also mean that future
> > > compilers that have a new inlining algorithm will have the same
> > > problem.
> > >
> > > What do people think is better?
> >
> > I haven't had a chance to look at this yet, and probably won't be able
> > to do so until at least Monday...
> >
> > Adding PeterZ who's the objtool uaccess expert.
>
> Thanks. I have a patch which does #1, since it's probably cleaner. I
> will send it out soon.
>
> If there is a better way to resolve this, any suggestions welcome.

I have sent a patch which addresses the issue:
http://lkml.kernel.org/r/20191122154221.247680-1-elver@google.com
It is currently based on the locking/kcsan branch of the tip tree.

Thanks,
-- Marco
