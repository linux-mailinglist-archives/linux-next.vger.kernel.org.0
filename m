Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA47102C53
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 20:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfKSTF6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 14:05:58 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37550 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfKSTF6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 14:05:58 -0500
Received: by mail-ot1-f65.google.com with SMTP id d5so18882401otp.4
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2019 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0NatauBtPtJXOsbjFvuk9RBByg3dOvLiEzcuEjEIyik=;
        b=Z5T8NRw+0YDFCLzG1USKVrnQoi6akbzWg0AEZin9GQL7FupBZLWGa2T73NmchR7aSA
         pPfLQeAunLtuqxrSAXlTBx+JySV2avVYIQCmFaA05Dey3NogSQBBI4yygA7BCbP5/bpL
         Yz4o8QOp7wohXXlR2Faby+FBLa53lWNSYyaS7OaOdRc+bogOVA/MpJLVJaQtjBISre/G
         VJzG2KEDfV/FObm/rejuXbOc09Rlb98N5iCCm8csk+Bdw3QjvHpR0amM+IzfupcCN6LJ
         eRQqBM94k3KBJvq0hvkBY9LUx/UhTHhZXWIj+4eY3J7AO4aeEvK7IloE+ok2+yYUST7C
         /CuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0NatauBtPtJXOsbjFvuk9RBByg3dOvLiEzcuEjEIyik=;
        b=KOoGd90xCk86yzyAALFggT0BS+ojwZL9Iz5cghb0VC0/LqUONI+SPjmd4jJMiCRQCr
         Ss98DXtIOFfWpsMvGhqmLPt4RzcdmYqd7zDYTZfksGm/FMMK/ZLSQQWTJjo5NtkmQ1YR
         jxJ+hz3ZiWuyul1ahYGNdJ0A3A/S64jknCltsKWNlXaQUAuT/Y2ManMgdb7TOlPWN7SU
         a+Qvcl1ddn9pD2no62vqdyJmQkPZLX/8AUBd+390k9VtIx2FQE0ceOA/RUIAoM9Vladu
         fm3SBNlNB+Dt/txYFHKAkGQeZR5zjIuKwGOASTkP1bm00ISw80P8jwGiOuQ8SqsU5U4n
         YwNw==
X-Gm-Message-State: APjAAAUSMKGdgtNJRDVmPNv9q6gKJMltJtXR+62v7yQCpblNpwCzyX7N
        RMv1xSiOuR0101hBdz9SAFc2WIzPC7hnuyJ8jtfG1Q==
X-Google-Smtp-Source: APXvYqyUZtQAxkb9wAVmkm9Ylw96P/rfxBE9DAOE0RfSEB3iGv1yRwmd6+Rz7VODo0gvsGqNKgLx2YPETkbUgURxTzg=
X-Received: by 2002:a9d:69cf:: with SMTP id v15mr4680730oto.251.1574190357041;
 Tue, 19 Nov 2019 11:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20191119194658.39af50d0@canb.auug.org.au> <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
 <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
 <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org> <20191119183407.GA68739@google.com>
 <1574190168.9585.4.camel@lca.pw>
In-Reply-To: <1574190168.9585.4.camel@lca.pw>
From:   Marco Elver <elver@google.com>
Date:   Tue, 19 Nov 2019 20:05:45 +0100
Message-ID: <CANpmjNMfCNqgsXQdDckOg0kuMgvnD8_jka8N0AT2K3hC=CUe0w@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 19 (kcsan)
To:     Qian Cai <cai@lca.pw>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 19 Nov 2019 at 20:02, Qian Cai <cai@lca.pw> wrote:
>
> On Tue, 2019-11-19 at 19:34 +0100, 'Marco Elver' via kasan-dev wrote:
> > On Tue, 19 Nov 2019, Randy Dunlap wrote:
> >
> > > On 11/19/19 8:12 AM, Marco Elver wrote:
> > > > On Tue, 19 Nov 2019 at 16:11, Randy Dunlap <rdunlap@infradead.org> =
wrote:
> > > > >
> > > > > On 11/19/19 12:46 AM, Stephen Rothwell wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > Changes since 20191118:
> > > > > >
> > > > >
> > > > > on x86_64:
> > > > >
> > > > > It seems that this function can already be known by the compiler =
as a
> > > > > builtin:
> > > > >
> > > > > ../kernel/kcsan/core.c:619:6: warning: conflicting types for buil=
t-in function =E2=80=98__tsan_func_exit=E2=80=99 [-Wbuiltin-declaration-mis=
match]
> > > > >  void __tsan_func_exit(void)
> > > > >       ^~~~~~~~~~~~~~~~
> > > > >
> > > > >
> > > > > $ gcc --version
> > > > > gcc (SUSE Linux) 7.4.1 20190905 [gcc-7-branch revision 275407]
> > > >
> > > > Interesting. Could you share the .config? So far I haven't been abl=
e
> > > > to reproduce.
> > >
> > > Sure, it's attached.
> >
> > Thanks, the config did the trick, even for gcc 9.0.0.
> >
> > The problem is CONFIG_UBSAN=3Dy. We haven't explicitly disallowed it li=
ke
> > with KASAN. In principle there should be nothing wrong with KCSAN+UBSAN=
.
> >
> > There are 3 options:
> > 1. Just disable UBSAN for KCSAN, and also disable KCSAN for UBSAN.
> > 2. Restrict the config to not allow combining KCSAN and UBSAN.
> > 3. Leave things as-is.
> >
> > Option 1 probably makes most sense, and I'll send a patch for that
> > unless there are major objections.
>
> Both option #1 and #2 sounds quite unfortunate, as UBSAN is quite valuabl=
e for
> debugging. Hence, it is desire to make both work at the same time.

Apologies, I think I was a bit unclear with #1. For #1, this just
means that UBSAN is being disabled for the KCSAN runtime and
vice-versa. All other parts of the kernel are still instrumented with
both.

See here: https://lore.kernel.org/linux-next/20191119185742.GB68739@google.=
com/

Thanks,
-- Marco
