Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A973AB535
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 15:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhFQNyO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 09:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbhFQNyN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 09:54:13 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08ACC061574;
        Thu, 17 Jun 2021 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wWpwrgGiZhe98tfTjncAJgLFY4m6Azvsm8WQSDSbfDo=; b=e2ZRYQbeDE65xcaiJL8SARSxLM
        +WuQ5rjIWVyj9uDrmzZDygWp447lezi09/aq5Hk6yELSR+YTrynEhs9PdDtFC+IpoAaK9iog3pRrn
        aIiwuyGekbaZqqBhTnAE6hIxbKj561NcsLOmlSWiZKlJtYvIFuSxdSPQgXEPQ84xGwG1ssbEDG9XL
        Il43zRIMEzTTqPcXbZSIYRTfaL1WBkm7V62TdwlMp9VvgL22E4Z6uLYVLLPqRE9aORXm2WAfqlcMY
        19IRXywyJVyyldtdhVvyfiIDiFGeBORxemVioWOcYmE+LilveCWOJ+weH66QwXe9uTXeRdV+m36ca
        A6z5kQog==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltsQv-009Bek-8o; Thu, 17 Jun 2021 13:51:52 +0000
Date:   Thu, 17 Jun 2021 14:51:49 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Stephen Boyd <swboyd@chromium.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Baoquan He <bhe@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@redhat.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Sasha Levin <sashal@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vivek Goyal <vgoyal@redhat.com>, Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to
 `__compiletime_assert_342'
Message-ID: <YMtTdU2b9fI3dnFD@casper.infradead.org>
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
 <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 17, 2021 at 06:15:45PM +0530, Naresh Kamboju wrote:
> On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
> > mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
> 
> The git bisect pointed out the first bad commit.
> 
> The first bad commit:
> commit 928cf6adc7d60c96eca760c05c1000cda061604e
> Author: Stephen Boyd <swboyd@chromium.org>
> Date:   Thu Jun 17 15:21:35 2021 +1000
>     module: add printk formats to add module build ID to stacktraces

Your git bisect probably went astray.  There's no way that commit
caused that regression.
