Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B76AC4E2E2F
	for <lists+linux-next@lfdr.de>; Mon, 21 Mar 2022 17:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351273AbiCUQj3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Mar 2022 12:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350010AbiCUQj2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Mar 2022 12:39:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4643855BA
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:38:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w7so25512641lfd.6
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vLuZZpUnsm9KBxk/6Ba1/rk7zP3V19U4V2RRUcKnlUU=;
        b=CxLg6iI6FqAS0PFMX63IExeZr6f76g1o7l9nUfGVicC1LNk5HV1MqsTRRe9CQdmMOd
         L12XNcMd0u/oWXZrvuZ12lN0gUP/uSoxbpWa8i3E3VOJ+CG/6Swp/FYN4Mz3gKef+Fr2
         md03VSCIy+BFM1RkCswovuJY4FekLTyETX3P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLuZZpUnsm9KBxk/6Ba1/rk7zP3V19U4V2RRUcKnlUU=;
        b=kRutKGK4ifGJKXUkDauBjAlXZoYaRpcvUd7xuYp79RjTgZrhJwA6HAbG1nrRBwsZl9
         6fIQlMXy66HIaaNbXuYvCNRsOOAejNIThimXQOr5g8z6c133hYAlmb/C/IqxQDipadQL
         f3OtZ9eionq9DPdcxgdvCu6j4DVMr5BOnjtLsLRpTtAiQrZNunEV63f81NEH2S/6i5Hr
         8DucrjgaFRmAIFpsbm43xKeRGlWZYKYbE17rt3n7HGEDv1LJyO5lJB1mLMChQVNTC4O9
         2qEDA0Y0QK1f/xfKOaQUP6qWdGlupUnxUS3MTf39EV6itb7519H6tl05XmIvzRdLG4y5
         q/Qw==
X-Gm-Message-State: AOAM533gGDTvELBA6BwUuSAVSnQHj3jNp4jaXqyeicri/5AEFr4fEiNs
        myz9y+Xnx/YRmSmGQjsOOfiQwCEFUQ/fEuUV
X-Google-Smtp-Source: ABdhPJyt9FHrOSKms/bRqkXflycF30HBJL3pRBAqQN+XyP9eZwboNxeq08paQSODgANmRGQYbTug1Q==
X-Received: by 2002:ac2:4116:0:b0:448:99df:5ec5 with SMTP id b22-20020ac24116000000b0044899df5ec5mr14693767lfi.181.1647880676140;
        Mon, 21 Mar 2022 09:37:56 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id x11-20020a2e9dcb000000b00249800fc660sm577588ljj.17.2022.03.21.09.37.52
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 09:37:54 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id a26so7513047lfg.10
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:37:52 -0700 (PDT)
X-Received: by 2002:a05:6512:2294:b0:448:6c86:3c78 with SMTP id
 f20-20020a056512229400b004486c863c78mr14728551lfu.531.1647880671749; Mon, 21
 Mar 2022 09:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220321140327.777f9554@canb.auug.org.au> <Yjh11UjDZogc3foM@hirez.programming.kicks-ass.net>
 <Yjh3xZuuY3QcZ1Bn@hirez.programming.kicks-ass.net> <Yjh4xzSWtvR+vqst@hirez.programming.kicks-ass.net>
 <YjiBbF+K4FKZyn6T@hirez.programming.kicks-ass.net> <YjiZhRelDJeX4dfR@hirez.programming.kicks-ass.net>
 <YjidpOZZJkF6aBTG@hirez.programming.kicks-ass.net>
In-Reply-To: <YjidpOZZJkF6aBTG@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 09:37:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wigO=68WA8aMZnH9o8qRUJQbNJPERosvW82YuScrUTo7Q@mail.gmail.com>
Message-ID: <CAHk-=wigO=68WA8aMZnH9o8qRUJQbNJPERosvW82YuScrUTo7Q@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the tip tree
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Alexei Starovoitov <ast@kernel.org>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        linux-toolchains <linux-toolchains@vger.kernel.org>,
        Andrew Cooper <Andrew.Cooper3@citrix.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 21, 2022 at 8:46 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> This landing in -next only today (after having been committed last
> friday night) is another clue it should probably go next round.

I went and looked at lore to get the context that I didn't get in this
email that I was added to the participants for.

I didn't find the context there either.

Sure, I found the thread, but the whole "that x86 patch" that you
refer to was never actually specified even in the full thread as far
as I can tell. I see that there is an arm64 equivalent too of what you
are complaining about, and I have no idea about that one either..

Mind actually giving the full details so that we don't have to go
re-do the work you already did?

Because right now I know something is wrong, I know the warnings, but
I don't actually have any handle on the actual patches to look out
for.

It's presumably not in any of the pull requests I already have
pending, but it would be nice if I saw some details of _what_ you are
complaining about, and not just the complaint itself ;)

                     Linus
