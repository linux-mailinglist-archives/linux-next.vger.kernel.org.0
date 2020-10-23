Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA6A2974B7
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 18:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751435AbgJWQjL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Oct 2020 12:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750328AbgJWQjK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Oct 2020 12:39:10 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29263C0613CE
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 09:39:10 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 184so2839710lfd.6
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/+Z2DTY0X3UNE1zOAnDc3GMvU3/neAbYyAwV9Uv1sQ=;
        b=bKJlp5Zi29qle5D9opf4NXlbOWJhqSLbkPTTzs3cyEfB6yY5yL2nVp+B2qxgDBuenW
         Ld6FBX1RcXCS8NhhbFgQYSvjxx2DmHG9Bt0hUX7JvJOKxhXXzfzBAxggPWaZ91DMIf/e
         dpBAABcXoHgqg2SosGBxhJHT4bBdoCmPY82fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/+Z2DTY0X3UNE1zOAnDc3GMvU3/neAbYyAwV9Uv1sQ=;
        b=M2m24fecJ7IonlrsF+X1FSpLpLkke9PuRFS6KpMu49D9JHqVTEwXWId8FsnEsImt5z
         PW3j+zvCIm3YqsUCSjg/LrVxHtbTuh41K3KxtcKlpNAr47rVyseop7JAfxFwQz9kiG9O
         M+bG0/8oVyaDJ3WzgDXR2qVdyaO3BNoYF/YtGjb8h0cuaiOhEu8/XAKHacEsbZ9tmJ5+
         qDGmkQjHSPNZ/fQGfAYt4gwX2vtWMr2TFy4ZzR0ROFqQO3bHSmYGBisaZXvzsQ149Ral
         utJ5/wWJwIo8yDxeH6MUfGxr5iHeX1MuvYj1ugs9DmawpDdDK9zN/ZMDT2q9Tq+4hP42
         YS2g==
X-Gm-Message-State: AOAM530f35rLcaWr3pOnr8wn8zKhmHzWIFAfcjO7BYAU2GzTZN+sacce
        mGMOnQ24fu8Vf9JUrtG+zhaPz15MDXT4Mw==
X-Google-Smtp-Source: ABdhPJyCrmme5kf9j+F8IZ1Hbqxh6rwYPkNbY0/+4RYbX2+itXa9pbtxwYb6zPcYAEhGwb1E5YT6xQ==
X-Received: by 2002:a19:3fd6:: with SMTP id m205mr133744lfa.1.1603471148236;
        Fri, 23 Oct 2020 09:39:08 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id z7sm181847lfb.221.2020.10.23.09.39.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 09:39:07 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id l2so2864046lfk.0
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 09:39:07 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr971141lff.105.1603470790607;
 Fri, 23 Oct 2020 09:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com> <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
 <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
In-Reply-To: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 23 Oct 2020 09:32:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
Message-ID: <CAHk-=whGbM1E0BbSVvxGRj5nBaNRXXD-oKcgrM40s4gvYV_C+w@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        zenglg.jy@cn.fujitsu.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: multipart/mixed; boundary="000000000000e2112705b259227d"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--000000000000e2112705b259227d
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 23, 2020 at 8:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> >
> > That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> > could break something else), but the obvious first step of rearranging
> > so that the ptr argument is evaluated before the assignment to __val_pu
>
> Ack. We could do that.
>
> I'm more inclined to just bite the bullet and go back to the ugly
> conditional on the size that I had hoped to avoid, but if that turns
> out too ugly, mind signing off on your patch and I'll have that as a
> fallback?

Actually, looking at that code, and the fact that we've used the
"register asm()" format forever for the get_user() side, I think your
approach is the right one.

I'd rename the internal ptr variable to "__ptr_pu", and make sure the
assignments happen just before the asm call (with the __val_pu
assignment being the final thing).

lso, it needs to be

        void __user *__ptr_pu;

instead of

        __typeof__(ptr) __ptr = (ptr);

because "ptr" may actually be an array, and we need to have the usual
C "array to pointer" conversions happen, rather than try to make
__ptr_pu be an array too.

So the patch would become something like the appended instead, but I'd
still like your sign-off (and I'd put you as author of the fix).

Narest, can you confirm that this patch fixes the issue for you?

                  Linus

--000000000000e2112705b259227d
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kgmh3alt0>
X-Attachment-Id: f_kgmh3alt0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRl
eCBmMTM2NTk1MjMxMDguLmQwMDZhZjkxNWQ0YSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAt
MjExLDEzICsyMTEsMTUgQEAgZXh0ZXJuIHZvaWQgX19wdXRfdXNlcl9ub2NoZWNrXzgodm9pZCk7
CiAjZGVmaW5lIGRvX3B1dF91c2VyX2NhbGwoZm4seCxwdHIpCQkJCQlcCiAoewkJCQkJCQkJCVwK
IAlpbnQgX19yZXRfcHU7CQkJCQkJCVwKKwl2b2lkIF9fdXNlciAqX19wdHJfcHU7CQkJCQkJXAog
CXJlZ2lzdGVyIF9fdHlwZW9mX18oKihwdHIpKSBfX3ZhbF9wdSBhc20oIiUiX0FTTV9BWCk7CQlc
CiAJX19jaGtfdXNlcl9wdHIocHRyKTsJCQkJCQlcCisJX19wdHJfcHUgPSAocHRyKTsJCQkJCQlc
CiAJX192YWxfcHUgPSAoeCk7CQkJCQkJCVwKIAlhc20gdm9sYXRpbGUoImNhbGwgX18iICNmbiAi
XyVQW3NpemVdIgkJCQlcCiAJCSAgICAgOiAiPWMiIChfX3JldF9wdSksCQkJCQlcCiAJCQlBU01f
Q0FMTF9DT05TVFJBSU5UCQkJCVwKLQkJICAgICA6ICIwIiAocHRyKSwJCQkJCVwKKwkJICAgICA6
ICIwIiAoX19wdHJfcHUpLAkJCQkJXAogCQkgICAgICAgInIiIChfX3ZhbF9wdSksCQkJCQlcCiAJ
CSAgICAgICBbc2l6ZV0gImkiIChzaXplb2YoKihwdHIpKSkJCQlcCiAJCSAgICAgOiJlYngiKTsJ
CQkJCQlcCg==
--000000000000e2112705b259227d--
