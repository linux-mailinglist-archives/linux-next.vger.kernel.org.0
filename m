Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51DF41A49B5
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 20:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDJSL0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 14:11:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41067 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgDJSLZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 14:11:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id n17so2732150lji.8
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 11:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qoUTKN447rYhDUCN56uMR/chlcP88GGyZtE/qIjuFKs=;
        b=ASQgGesINz9Opxq6FAkIyEhtbvVy6t/vRm6CLWHckpnYIPBB1/bRzQ1FKUHNTr5ex4
         gDG2zfBq+7Bgxe7+c5T6qMf12anoHl04FiB0vjhkgO52a6kOGPLuIGhRH+pEsJPp6WwA
         csl/5VJt+wHmaaLPKcl7b+pvZHcz1OurBHfJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qoUTKN447rYhDUCN56uMR/chlcP88GGyZtE/qIjuFKs=;
        b=mUycG5ASbQxJgIGaiMi8sJUq8OwoEtC82V3dmiPteGGDbVFbkQarCJElbrm68NH6rv
         +6IrrXA3MBrvdEaNnzSgCW5JGO3leL5hLstZZi1I4H98v79cpjQvusEbGNE8yMaHAR67
         +1DL+FS1lcWGAjlRnT9giWM2f3yucZZCPdhUqEQIokdxXmHX6Oi7lvWuBMS14n8mnkgh
         pr0JpTZTUzGj7gxqB69euORYqw8Lq9g+vYz0Q/XyeLYqn07UxRM/ygL3H2iAX/R3WTGD
         LcgKJJlPrPdA0W+4IZp8QhdM/PQMPXkV/Tqbq9vKyv9Drp3uAGibZjJR0PBYBl23nqOB
         iQ7w==
X-Gm-Message-State: AGi0PuaNzlkJ42SVlTMc/+36W+pw4MvcCBLrmDzn0Jj9gx0tFSvy/ulN
        PYbrqTbUEiAsqPVuUTF4EJbe3dR6n44=
X-Google-Smtp-Source: APiQypKT/xl5oVjmCyEAXUsFih8szxjfD4sop1haO2RD7JJ75KqvDBnLFTjz4C8XNb6C4SIDwK9HMw==
X-Received: by 2002:a05:651c:120e:: with SMTP id i14mr508799lja.12.1586542282899;
        Fri, 10 Apr 2020 11:11:22 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 78sm1526930ljf.76.2020.04.10.11.11.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 11:11:21 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id r24so2761422ljd.4
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 11:11:21 -0700 (PDT)
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr3471575ljc.209.1586542280902;
 Fri, 10 Apr 2020 11:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200410132706.170811b7@canb.auug.org.au> <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
In-Reply-To: <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 10 Apr 2020 11:11:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
Message-ID: <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 10, 2020 at 9:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> KASAN detects a use-after-free in _raw_spin_lock_irqsave while
> running lib/test_printf.ko.

Btw, can you run these kinds of reports through scripts/decode_stacktrace.sh?

If you have debug info in your build, it will give much more
meaningful backtraces with file names and line numbers (and points to
inlining decisions etc too)

(For individual symbols, use scripts/faddr2line, but the
decode_stacktrace script does them all in one go).

I wonder if these scripts aren't well enough known, I see a lot of raw
dumps that could be immensely improved with a little scripting - but
they need the original vmlinux binary with debug info, so you can't do
it after-the-fact somewhere else..

                Linus
