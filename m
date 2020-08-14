Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34997244531
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 09:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgHNHGB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 03:06:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgHNHGA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 14 Aug 2020 03:06:00 -0400
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 104CA2074D;
        Fri, 14 Aug 2020 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597388760;
        bh=jipiB9UiE3DAnnrUbRFdE5/dXkTKdC6dJb8cJRjzbco=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gNh3Y+R/eofAnJTw0VhMT2kazOOlboFr+uG4QKFINYc9S5xp6qaOYgLatcAhgTX4i
         oIlatf40IFUBJbd5hkPq+uRsPsWWLvxQfofw6A39dyUb4Xcr2rb+O8+m0thv8Uy2ud
         xheWO0rz4UVdHudzodvvWF6a7V9vSsLI+/YbTTAc=
Received: by mail-oo1-f42.google.com with SMTP id j19so1739352oor.2;
        Fri, 14 Aug 2020 00:06:00 -0700 (PDT)
X-Gm-Message-State: AOAM53364CYBsDsEteVEg4FCwWMr4MK67a+CK9yvPm7UWaIqrSAUSjhx
        +wQuUjTQ+DTaJgtYQV0omcly+JuLiPMdTVG7m88=
X-Google-Smtp-Source: ABdhPJwzv8opkbhcJaht1HkNxp1ufI4bVIinznfnd+WcrCwaf4pkfZRCNJo5L+ldyB9NMQoa/xvEk9nYG1LLAcBsjfs=
X-Received: by 2002:a4a:6252:: with SMTP id y18mr747662oog.45.1597388759433;
 Fri, 14 Aug 2020 00:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200811143130.0ca95b8d@canb.auug.org.au>
In-Reply-To: <20200811143130.0ca95b8d@canb.auug.org.au>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 14 Aug 2020 09:05:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
Message-ID: <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
Subject: Re: linux-next: new build warnings after binutils update
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

(+ Arvind, Kees)

On Thu, 13 Aug 2020 at 22:58, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After upgading some software, builds of Linus' tree now produce these warnings:
>
> x86_64-linux-gnu-ld: arch/x86/boot/compressed/head_64.o: warning: relocation in read-only section `.head.text'
> x86_64-linux-gnu-ld: warning: creating DT_TEXTREL in a PIE
>
> I upgraded binutils from 2.34-8 to 2.35-1 (Debian versions).
>
> $ x86_64-linux-gnu-gcc --version
> x86_64-linux-gnu-gcc (Debian 9.3.0-13) 9.3.0
>
> Any ideas?
>

Arvind and I have some patches on the list that fix various relocation
issues in the decompressor binary.

As far as I can tell, Arvind's patch to suppress runtime relocations
[0] addresses this exact issue.

Unfortunately, in spite of various pings and attempts to get the x86
maintainers to notice this series, it has been ignored so far. Perhaps
this is a good time to merge it for -rc1/2?

[0] https://lore.kernel.org/lkml/20200731202738.2577854-6-nivedita@alum.mit.edu/
