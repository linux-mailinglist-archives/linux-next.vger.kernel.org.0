Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35776244B07
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 16:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgHNOER (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 10:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgHNOEL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2020 10:04:11 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83F1C061384;
        Fri, 14 Aug 2020 07:04:10 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id a24so8216929oia.6;
        Fri, 14 Aug 2020 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=l7qAZHlwpAfFDjUxIVbnGJtoyTbh3th5DAv9R8mDvnI=;
        b=KvAg9/yXCUX2u+WovBrDP84L91SacWSuc/f5lkKrcTsZEBKdeHdT0OWjFsJF++zE0q
         F5YDoKk59DLQ/jLcnQDZWJ2DnWf0onNv5w1sQUuPuyC/FaE9LY43G4HcHPyu+8gN2PM6
         AnJvTTfnKLAlNSissXB1O4r4FEsseZrCmE06zodPylBtIPRlRzxJr5K+J6Eg7ug2fnrr
         IAAuCEXnc0k6UfcNuWCQOmjdH9+0ADtBC/maDjz5YfL+zFjeykIXBNzTR9zShhgcJW1M
         NxxwIRrM0xGk09CiC6iuR/ZcBI8hngJR+wg/8bSKQzlg5TgZ5OE7dBFT7aeQmeXsUryy
         rtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=l7qAZHlwpAfFDjUxIVbnGJtoyTbh3th5DAv9R8mDvnI=;
        b=VPvcGtuW2D/s5/pBYBjmstOUgw5o0GO/cxErfA/bCtTGHb3BhkhQU4S4P2BuPuvCTC
         banwu66HLc+nt9tHKLJhrkIU/a89X/7Ff7kyLiQMk8Z/+M5T9rxYKPECsen1Qy9M36Yz
         NDyZ7MyBUzSALq9bBW83AGcrkCJft6a7BZCbGFAvhBx4vu572SlcxkPKKoUtJKJxLP9o
         hixDr/nhrDyc/Zug5s4AxCJIAdJhvEAQaispJxKHyexq0oAKO4SCNjKZhPbp12uGHos9
         0zm+LOTb6HbJ88Z7UFEqUNb4rpAGh18dTQvN1TMTZ4awVf6FZj2+/Cu11rA3sqv7KBOg
         BKFA==
X-Gm-Message-State: AOAM533tyIDCAv97eKs5DRztybQxBRXB4eJSMB1swane7HbHvFxRprSP
        285Pr11xxR/GzTO3T4Zy9MvK8kGTfwiwB2kuWnI=
X-Google-Smtp-Source: ABdhPJyoWmPw0vLLG5fF2q5gc1/a49BHT0yNW0u0oHbhwp3G3kpl8UKDyBEe8cQYQieQPBNY7ucmh8XmNWLGJi0TYio=
X-Received: by 2002:aca:4e92:: with SMTP id c140mr1499399oib.70.1597413850167;
 Fri, 14 Aug 2020 07:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200811143130.0ca95b8d@canb.auug.org.au> <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
 <20200814102206.GB2367157@gmail.com>
In-Reply-To: <20200814102206.GB2367157@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 14 Aug 2020 16:03:58 +0200
Message-ID: <CA+icZUWYaSnudhHfRWOc_3wx6jRK1aPs-FUpvfq6RQ4_grY5QQ@mail.gmail.com>
Subject: Re: linux-next: new build warnings after binutils update
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 14, 2020 at 12:22 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > (+ Arvind, Kees)
> >
> > On Thu, 13 Aug 2020 at 22:58, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After upgading some software, builds of Linus' tree now produce these warnings:
> > >
> > > x86_64-linux-gnu-ld: arch/x86/boot/compressed/head_64.o: warning: relocation in read-only section `.head.text'
> > > x86_64-linux-gnu-ld: warning: creating DT_TEXTREL in a PIE
> > >
> > > I upgraded binutils from 2.34-8 to 2.35-1 (Debian versions).
> > >
> > > $ x86_64-linux-gnu-gcc --version
> > > x86_64-linux-gnu-gcc (Debian 9.3.0-13) 9.3.0
> > >
> > > Any ideas?
> > >
> >
> > Arvind and I have some patches on the list that fix various relocation
> > issues in the decompressor binary.
> >
> > As far as I can tell, Arvind's patch to suppress runtime relocations
> > [0] addresses this exact issue.
> >
> > Unfortunately, in spite of various pings and attempts to get the x86
> > maintainers to notice this series, it has been ignored so far. Perhaps
> > this is a good time to merge it for -rc1/2?
> >
> > [0] https://lore.kernel.org/lkml/20200731202738.2577854-6-nivedita@alum.mit.edu/
>
> It all looked good to me but was a bit late for v5.9, will pick up
> after -rc1.
>
> Thanks,
>

Good news :-).

- Sedat -
