Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB3FF2968A3
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 05:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460262AbgJWDF1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Oct 2020 23:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S460253AbgJWDF1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Oct 2020 23:05:27 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDEAC0613CE
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 20:05:27 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h6so292602lfj.3
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Na94wtC1BhSlnxPRS1UAdX72oiIY6E2rGP3IXkaaAPI=;
        b=dvQpU+FB9bJIevPoyZUx0Zefem4fScj4c1Gi0SaeCK5Q9yI9nesRnzjd+UaB+pY0Io
         MQlmn/KIjYgbmrUu++HqyEv1sajyLI/DtsrPFcq1odZmHAA9otSr14zvP3X3mR7rw59T
         axPQewjAT8o4TjKIP1JKavPS6yuA49BTh5Ujg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Na94wtC1BhSlnxPRS1UAdX72oiIY6E2rGP3IXkaaAPI=;
        b=t967eXs0dQCOKETXzdZbxkDzt05mcmCWhrXVhcriYpQ518hv04R2ZVdyujEcMz5qMN
         J9bZkM3lAhExoblIY0DljwBrU2LT2ZxK9ULsVvoGxhG9bK/b0Jkanj+MWrL7ZmC/mR7o
         ekEaMVaI3TM53j4ACJ5Rz65tKqvqpfEHucDmn+Imd829lrLjuKSkEQwkQeywenqqWmpP
         XojmULZHeygcRprgr0G0AZT1Bwncmu0aIYd6mtLloAcu43ARknvp0Aw5cj5JSPeG3OC7
         hBFDrpEi1af8I0MoP1u7cElkPRgL4olT/9tLDhqEbsvDYr70hnyGMXhxV4B/NCI3RcK8
         cJLQ==
X-Gm-Message-State: AOAM531nvcKeCT8A9wX0eMzBCOxWraFlrfzRehGdUsfU5vyoSP4nTV2T
        4ql+J9cjEFgOFE0Qm70taJMHKqzLEp62Wg==
X-Google-Smtp-Source: ABdhPJyW4GXaa86q5QjXjxmQGKOoXKNkZji9INOW1ADlyquzOTW4A4ZkUIyXIwvCgaYGEobDt338aw==
X-Received: by 2002:a19:87:: with SMTP id 129mr33881lfa.164.1603422325004;
        Thu, 22 Oct 2020 20:05:25 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id b14sm14334ljo.16.2020.10.22.20.05.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 20:05:22 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id j30so285412lfp.4
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 20:05:22 -0700 (PDT)
X-Received: by 2002:a19:83c9:: with SMTP id f192mr33971lfd.148.1603422321812;
 Thu, 22 Oct 2020 20:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com> <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
In-Reply-To: <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Oct 2020 20:05:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
Message-ID: <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
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
Content-Type: multipart/mixed; boundary="000000000000eb07d805b24dd94f"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--000000000000eb07d805b24dd94f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 6:36 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> w=
rote:
>
> The kernel Naresh originally referred to is here:
>   https://builds.tuxbuild.com/SCI7Xyjb7V2NbfQ2lbKBZw/

Thanks.

And when I started looking at it, I realized that my original idea
("just look for __put_user_nocheck_X calls, there aren't so many of
those") was garbage, and that I was just being stupid.

Yes, the commit that broke was about __put_user(), but in order to not
duplicate all the code, it re-used the regular put_user()
infrastructure, and so all the normal put_user() calls are potential
problem spots too if this is about the compiler interaction with KASAN
and the asm changes.

So it's not just a couple of special cases to look at, it's all the
normal cases too.

Ok, back to the drawing board, but I think reverting it is probably
the right thing to do if I can't think of something smart.

That said, since you see this on x86-64, where the whole ugly trick with th=
at

   register asm("%"_ASM_AX)

is unnecessary (because the 8-byte case is still just a single
register, no %eax:%edx games needed), it would be interesting to hear
if the attached patch fixes it. That would confirm that the problem
really is due to some register allocation issue interaction (or,
alternatively, it would tell me that there's something else going on).

                  Linus

--000000000000eb07d805b24dd94f
Content-Type: application/octet-stream; name=patch
Content-Disposition: attachment; filename=patch
Content-Transfer-Encoding: base64
Content-ID: <f_kglo76xr0>
X-Attachment-Id: f_kglo76xr0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5k
ZXggZjEzNjU5NTIzMTA4Li4wZjNlMjAyZDllZWEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAg
LTIxMSwxNCArMjExLDE0IEBAIGV4dGVybiB2b2lkIF9fcHV0X3VzZXJfbm9jaGVja184KHZvaWQp
OwogI2RlZmluZSBkb19wdXRfdXNlcl9jYWxsKGZuLHgscHRyKQkJCQkJXAogKHsJCQkJCQkJCQlc
CiAJaW50IF9fcmV0X3B1OwkJCQkJCQlcCi0JcmVnaXN0ZXIgX190eXBlb2ZfXygqKHB0cikpIF9f
dmFsX3B1IGFzbSgiJSJfQVNNX0FYKTsJCVwKKwlfX3R5cGVvZl9fKCoocHRyKSkgX192YWxfcHU7
CQkJCQlcCiAJX19jaGtfdXNlcl9wdHIocHRyKTsJCQkJCQlcCiAJX192YWxfcHUgPSAoeCk7CQkJ
CQkJCVwKIAlhc20gdm9sYXRpbGUoImNhbGwgX18iICNmbiAiXyVQW3NpemVdIgkJCQlcCiAJCSAg
ICAgOiAiPWMiIChfX3JldF9wdSksCQkJCQlcCiAJCQlBU01fQ0FMTF9DT05TVFJBSU5UCQkJCVwK
IAkJICAgICA6ICIwIiAocHRyKSwJCQkJCVwKLQkJICAgICAgICJyIiAoX192YWxfcHUpLAkJCQkJ
XAorCQkgICAgICAgImEiIChfX3ZhbF9wdSksCQkJCQlcCiAJCSAgICAgICBbc2l6ZV0gImkiIChz
aXplb2YoKihwdHIpKSkJCQlcCiAJCSAgICAgOiJlYngiKTsJCQkJCQlcCiAJX19idWlsdGluX2V4
cGVjdChfX3JldF9wdSwgMCk7CQkJCQlcCg==
--000000000000eb07d805b24dd94f--
