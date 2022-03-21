Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2236A4E2E91
	for <lists+linux-next@lfdr.de>; Mon, 21 Mar 2022 17:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245508AbiCUQyx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Mar 2022 12:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348765AbiCUQyw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Mar 2022 12:54:52 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C49B2AC1
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:53:20 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p15so14854456lfk.8
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utyUaFkr1ZuUiYWhJkaB0qXmsCfjA9OUpKcvX6RwIYk=;
        b=XiheaFj4jTydDhbYvNjr9omQv2Zp/C0MlIIU6zkU5VOIRbLNk0t6VwAsplXScFZ+iT
         0mVfRfx8BrSnrCW60YgtWfXKiVxii3x5D0Ei9Rq/sHLALGwDvddfnWi+PZ2vobYlSfwI
         6TpcGU6cypY7IpP1cZAsdxieS/Uau32wcvBcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utyUaFkr1ZuUiYWhJkaB0qXmsCfjA9OUpKcvX6RwIYk=;
        b=AajKGoGkLSp40j3KQQKas8/7CObRinn5UueBe1QpnqgHopjeC8L3inLrUYZAee3/8m
         nYDd4ndECdzl+e934T4EqnqaQ5CXZgnX0HSWaJ6VAOpFFSi2k6LebRnsogp0Pry+P7lw
         u+kgcxYtN2l9YOrZeRk6il7ZeZVEBzG7SmqSieNc+Y7Cls6ignM8zvHroXU43v1nGISW
         4d7hD6GIM/fadrxH5yNHsIvIXQtGgupQOQVWhKWQdyDodKmXVsOI0ySHTwJPELRUYcNT
         UAKboyDFqdWInO+/NjoUHD2ej582fQfpIn3d1S+7ckUwhkUZT5J3/tjpqlcU75N4Ndwr
         TmfA==
X-Gm-Message-State: AOAM530lXiwL4mxvUTo1cS1UX5aK/cdF759b6cLs3Dq8Ymi6eT9VrwD3
        y5InuiJXzsEN3xFrZxJWDOSHadRs2gyAnl0puXQ=
X-Google-Smtp-Source: ABdhPJwY4kFkGMDIBx1yiRoSJRDiEZH72I3l9DQGFkSVkYlB7sTSY4eC2ic1YI22igBl2cEzdnWQLw==
X-Received: by 2002:ac2:418c:0:b0:43e:8f98:98f0 with SMTP id z12-20020ac2418c000000b0043e8f9898f0mr15715888lfh.604.1647881596265;
        Mon, 21 Mar 2022 09:53:16 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id h16-20020a19ca50000000b0044a25081cf9sm501904lfj.133.2022.03.21.09.53.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 09:53:16 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id b5so2115138ljf.13
        for <linux-next@vger.kernel.org>; Mon, 21 Mar 2022 09:53:15 -0700 (PDT)
X-Received: by 2002:a2e:a78f:0:b0:249:21ce:6d53 with SMTP id
 c15-20020a2ea78f000000b0024921ce6d53mr16250149ljf.164.1647881594869; Mon, 21
 Mar 2022 09:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220321140327.777f9554@canb.auug.org.au> <Yjh11UjDZogc3foM@hirez.programming.kicks-ass.net>
 <Yjh3xZuuY3QcZ1Bn@hirez.programming.kicks-ass.net> <Yjh4xzSWtvR+vqst@hirez.programming.kicks-ass.net>
 <YjiBbF+K4FKZyn6T@hirez.programming.kicks-ass.net> <YjiZhRelDJeX4dfR@hirez.programming.kicks-ass.net>
 <YjidpOZZJkF6aBTG@hirez.programming.kicks-ass.net> <CAHk-=wigO=68WA8aMZnH9o8qRUJQbNJPERosvW82YuScrUTo7Q@mail.gmail.com>
 <YjirfOJ2HQAnTrU4@hirez.programming.kicks-ass.net>
In-Reply-To: <YjirfOJ2HQAnTrU4@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Mar 2022 09:52:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wguO61ACXPSz=hmCxNTzqE=mNr_bWLv6GH5jCVZLBL=qw@mail.gmail.com>
Message-ID: <CAHk-=wguO61ACXPSz=hmCxNTzqE=mNr_bWLv6GH5jCVZLBL=qw@mail.gmail.com>
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

On Mon, Mar 21, 2022 at 9:45 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > It's presumably not in any of the pull requests I already have
> > pending, but it would be nice if I saw some details of _what_ you are
> > complaining about, and not just the complaint itself ;)
>
> Duh, right. It's this series:
>
>   https://lore.kernel.org/bpf/164757541675.26179.17727138330733641017.git-patchwork-notify@kernel.org/
>
> That went into bpf-next last Friday. I just checked but haven't found a
> pull for it yet.

Thanks. I can confirm it's not in any of the pull requests I have
pending, so I'll just start doing my normal work and try to remember
to look out for this issue later.

                 Linus
