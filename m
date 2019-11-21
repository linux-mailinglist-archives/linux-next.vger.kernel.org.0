Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A55101059D2
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 19:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfKUSny (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 13:43:54 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43638 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfKUSny (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Nov 2019 13:43:54 -0500
Received: by mail-oi1-f195.google.com with SMTP id l20so4123896oie.10
        for <linux-next@vger.kernel.org>; Thu, 21 Nov 2019 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oehb3N8x/6VYNF5g8Ikynmg31kRc2XRlRmBTauKlHqE=;
        b=cOv3U23E45yrBccLHgBCjp65/tLymOEVGJP140ZxBWObRTcCYHjftGMcP+OxJ94YaV
         kUzYJg8CdO0iFTk15+rSnq33a8FHyj5P4cXDYTJqyIQAtjMy6uj90Xkx+3jy0LeUHXxj
         /bTfNQ2YJDN7f0RpEZO1PDCT6KdM2K5BzpKdsT+C9d65e4KFQ/PZq72rBHB9CLevWmPa
         VQJYlv1IHnLlrA6pQdSZYWdHzON0lqzyNCGRmukle+mK3b4npqWyVieYn8KzjA/iznVF
         CNI6OtmgdyMmWLxtIdg1gf+jKmGNId36rcFvPC5IYVDToW5Sp8N5B9Ad/xd5e+h40T9N
         vS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oehb3N8x/6VYNF5g8Ikynmg31kRc2XRlRmBTauKlHqE=;
        b=hRONi5uuXOmY2JMA4WGPL6uyWJTB36IOjX9ZEiVtpDt1mUBVprH+4xqxAXS/JLZy11
         0k8koWRv17zfe4Sv/1iOHfkQSBzdz8jM8JRGZjZE/d+csmsOWaP58HcZe6Jd1auGt+jz
         Hplw1pfMUSaLEj/DmQvlOFUwX6lnVbu2MQJx25bCY3m5Ccd+t6+8XFN/fe1/FE9mSpL1
         etA+U9xqcVF5E0oyG/DMuUYmO9obxvxq9yvP2FygiaS2uZwFo1wxGZ35v/rk7/Sry9Qa
         A8ls6487SzoK+sP2OWpw9rUYgaS9Q4NHluRhhDb1//a2jj23IEzkdYzsKQEM9vqM4RRT
         COaA==
X-Gm-Message-State: APjAAAWX/yYqKSwpYw91B4mtEMveu6p6Fwl73VDzLMR1mi6FUQBrY19P
        cTAOQtrqdz0TdCZixtaQativ9FlG7kqEX9GkgfvIng==
X-Google-Smtp-Source: APXvYqwT+4xRnhgdAO1a5oE5atRewqWe1SbAhSQ4Ouij9K+zoSC2vh2437x4G63SsvTvsyrKH9zFulLuEYKwAVtvOm0=
X-Received: by 2002:aca:5413:: with SMTP id i19mr9210836oib.121.1574361832039;
 Thu, 21 Nov 2019 10:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20191120203434.2a0727b3@canb.auug.org.au> <58708908-84a0-0a81-a836-ad97e33dbb62@infradead.org>
 <CANpmjNOHTyTRCeo3oxEPTY__TCjAQ8nMvcqDSZ6Otfs7vVESSA@mail.gmail.com> <20191121183711.w2qnysscwnbxocc4@treble>
In-Reply-To: <20191121183711.w2qnysscwnbxocc4@treble>
From:   Marco Elver <elver@google.com>
Date:   Thu, 21 Nov 2019 19:43:40 +0100
Message-ID: <CANpmjNMzue4xatqy5hik1sBNohHUR_VYND6_2qWaK5Kwy1aiLQ@mail.gmail.com>
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

On Thu, 21 Nov 2019 at 19:37, Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Wed, Nov 20, 2019 at 08:48:41PM +0100, Marco Elver wrote:
> > On Wed, 20 Nov 2019 at 17:18, Randy Dunlap <rdunlap@infradead.org> wrote:
> > >
> > > On 11/20/19 1:34 AM, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Changes since 20191119:
> > > >
> > >
> > > on x86_64:
> > >
> > > kernel/kcsan/core.o: warning: objtool: kcsan_found_watchpoint()+0xa: call to kcsan_is_enabled() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_read1()+0x13: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_write1()+0x10: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_read2()+0x13: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_write2()+0x10: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_read4()+0x13: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_write4()+0x10: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_read8()+0x13: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_write8()+0x10: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_read16()+0x13: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_write16()+0x10: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_read_range()+0x13: call to find_watchpoint() with UACCESS enabled
> > > kernel/kcsan/core.o: warning: objtool: __tsan_write_range()+0x10: call to find_watchpoint() with UACCESS enabled
> > >
> > > kernel/trace/trace_branch.o: warning: objtool: ftrace_likely_update()+0x361: call to __stack_chk_fail() with UACCESS enabled
> > >
> > >
> > > Full randconfig file is attached.
> >
> > Thanks.
> >
> > This is due to CONFIG_CC_OPTIMIZE_FOR_SIZE=y. It seems the compiler
> > decides to not even inline small static inline functions. I tried to
> > make this go away by adding __always_inline, but then we're also left
> > with atomic64_try_cmpxchg which never gets inlined.
> >
> > The optimized build simply inlines the small static inline functions.
> > We certainly do not want to add more functions to the objtool
> > whitelist, especially those that are private to KCSAN.
> >
> > We could fix it by either:
> >
> > 1. Adding __always_inline to every function used by the KCSAN runtime
> > outside user_access_save + also fix atomic64_try_cmpxchg
> > (atomic-instrumented.h).
> >
> > 2. Just not compile KCSAN with -Os, i.e. have the Makefile strip -Os
> > and replace it with -O2 for kcsan/core.c. #2 is the simpler option,
> > and would probably make KCSAN more effective even with -Os. Although
> > it might violate the assumption of whoever decided they want both
> > CC_OPTIMIZE_FOR_SIZE and KCSAN. It might also mean that future
> > compilers that have a new inlining algorithm will have the same
> > problem.
> >
> > What do people think is better?
>
> I haven't had a chance to look at this yet, and probably won't be able
> to do so until at least Monday...
>
> Adding PeterZ who's the objtool uaccess expert.

Thanks. I have a patch which does #1, since it's probably cleaner. I
will send it out soon.

If there is a better way to resolve this, any suggestions welcome.

Thanks,
-- Marco
