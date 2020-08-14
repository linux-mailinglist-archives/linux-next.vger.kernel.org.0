Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC1F2447E7
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 12:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgHNKYU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 06:24:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:39822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgHNKYT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 Aug 2020 06:24:19 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04BBC20829;
        Fri, 14 Aug 2020 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597400659;
        bh=xpEWHoqKcEB494GdnCC72/J441Ze+im3K0PAdDimVq0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CnO/lzW0GFCUo4JqS9GDRNFB2dK1h9YMMqYKm818t96yYflwsyZ4bg1pTvfIE5EtJ
         g1hd0zbKOHR2ipHVWd1xvHRSNNqkZcAGMFIfr/6yZuah9iYO8UFxwqJF0Hagu4fMto
         iLa/QIp1378FN0gCIDqTNrbrN/MVSJwm5j7SE7ig=
Received: by mail-ot1-f46.google.com with SMTP id v21so7166721otj.9;
        Fri, 14 Aug 2020 03:24:18 -0700 (PDT)
X-Gm-Message-State: AOAM530sFrhnFAYV2a7F88zEdRfRi0AzP2KmZKEMn+32BTdhovfieQcu
        W1jtwP28DzQqoKh8RutKb2CRotrLbHrAHSqhZXA=
X-Google-Smtp-Source: ABdhPJwlY3BdEYsGjQjte9jImnyQYoMB7rPQOzQJEyh+CfsWC1HyIJKedgF0lx0hhUi6itI6Q335i0wtkxMA/k66lKE=
X-Received: by 2002:a05:6830:1d8c:: with SMTP id y12mr1452059oti.77.1597400658377;
 Fri, 14 Aug 2020 03:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200811143130.0ca95b8d@canb.auug.org.au> <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
 <20200814102206.GB2367157@gmail.com>
In-Reply-To: <20200814102206.GB2367157@gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 14 Aug 2020 12:24:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFrtjw5JdOsjJi0mw=S0H8KJEufOdv+GCYCwqhPSaf3eQ@mail.gmail.com>
Message-ID: <CAMj1kXFrtjw5JdOsjJi0mw=S0H8KJEufOdv+GCYCwqhPSaf3eQ@mail.gmail.com>
Subject: Re: linux-next: new build warnings after binutils update
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
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

On Fri, 14 Aug 2020 at 12:22, Ingo Molnar <mingo@kernel.org> wrote:
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

Thanks Ingo.
