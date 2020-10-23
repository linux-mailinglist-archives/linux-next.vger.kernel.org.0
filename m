Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5D12967E8
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 02:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901374AbgJWAXR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Oct 2020 20:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2508393AbgJWAXR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Oct 2020 20:23:17 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DF5C0613CE
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 17:23:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d24so4462908lfa.8
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKRAxIo6c5FisvVeBU9yqsWIDr+qdhruysORLXOncrM=;
        b=bS2jLvh7vQ7kVcl9lNidPdK72YodR3TdlvHITcAlNYbV1H5WvtWBHkH3n72zN5qksn
         hhTGaYZupVEqQDijLXzlvu27kjGqNTTSQHebcdWKhIDs1IxhBoQmiF2fzAUbTd+hIJwi
         P6mCkiBawvH/9GPgqnfBayA/RDSiwcxFNhm+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKRAxIo6c5FisvVeBU9yqsWIDr+qdhruysORLXOncrM=;
        b=S5OX5XZv1Fqn2nYgGwRVaSJTKrM7Oq7a0plfZ19/SM7JV7X+VseB8JmUGVeQkUnzOv
         gls4piYvWsrUPJ1OMZn2QepK8EjdPxRYT3TMK6EywvooeqNDj2GRWmY/mD/4Ge8NSoEa
         +LoDmTtFMjA5vrSO4dpC2gXqGDe6FTpEIuBKQ1B2uUpgg2MEpTqQHmdSXT6278/tJ4Im
         cYIh8qS7pcdBVQSdATqnMKJam6qfzRcgPcyqHyaUsB22EXRCF7p2cds422UX8xvn3zLb
         FbJiJHMCMaebTYNCvnDDEu1C9u1DpSaWaY4jvt7qn5etVy6U8tkxNLbjuNMuKB3gB2uU
         tczA==
X-Gm-Message-State: AOAM530qOnMeEnpSqCcB2Hu+AbsL0Mtom6vBjgEqWmN7N+j9GFLEFB7+
        PJYTcUlRNelwdIhIQTmo/nhhFU8vSqIVDQ==
X-Google-Smtp-Source: ABdhPJzwGcofDmfMKo+N24qPKc0zMoEM8Ph2hB9PBQqgyvCWkdaveTwhPCsxNbtIiBMfeRwGtNvisQ==
X-Received: by 2002:a05:6512:32b8:: with SMTP id q24mr1558775lfe.176.1603412594503;
        Thu, 22 Oct 2020 17:23:14 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 131sm420878lff.198.2020.10.22.17.23.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 17:23:13 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id y16so3906645ljk.1
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 17:23:12 -0700 (PDT)
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr1747084ljp.421.1603412592176;
 Thu, 22 Oct 2020 17:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com> <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
In-Reply-To: <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 22 Oct 2020 17:22:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgeHE7AS2Q4kPrkC5dMqfx_6+E84+FcEDYJSTugxqivUA@mail.gmail.com>
Message-ID: <CAHk-=wgeHE7AS2Q4kPrkC5dMqfx_6+E84+FcEDYJSTugxqivUA@mail.gmail.com>
Subject: Re: mmstress[1309]: segfault at 7f3d71a36ee8 ip 00007f3d77132bdf sp
 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        X86 ML <x86@kernel.org>, LTP List <ltp@lists.linux.it>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        zenglg.jy@cn.fujitsu.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 22, 2020 at 5:11 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> In particular, I wonder if it's that KASAN causes some reload pattern,
> and the whole
>
>      register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);
> ..
>      asm volatile(.. "r" (__val_pu) ..)
>
> thing causes problems.

That pattern isn't new (see the same pattern and the comment above get_user).

But our previous use of that pattern had it as an output of the asm,
and the new use is as an input. That obviously shouldn't matter, but
if it's some odd compiler code generation interaction, all bets are
off..

                Linus
