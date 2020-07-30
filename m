Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B6F233855
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 20:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgG3SZE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 14:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgG3SZD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 14:25:03 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4157FC061574
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 11:25:03 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id p16so12497412ile.0
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8HJPemEM+DsX1ym3tw6eDYthggE6P8XVpHiArahohvw=;
        b=LhoHToaNhTqfFNAglQSgfcTA/R0qG2CUkLAO0ke6yQ9Uhl6H4WM2Q/V0+507Qqu3w3
         HJcLPzVRHx8KSGSR4P/r05Nvll7YyAdcfKR3R5Iqqv5MkEx1+ahjaYBErUMC/uMGNIzB
         QXHFg9FsehPLhU1OyG99/4mmHLMVOqOb/T4zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8HJPemEM+DsX1ym3tw6eDYthggE6P8XVpHiArahohvw=;
        b=aSRPwW0TUhJ+H/KSc67kTyA2bHXrikb5p/BkZxGJ5VWnrG/l+Renu5vndWg5e0a/uH
         +Eo1luiyH9ypZYPA5oB/P9whrT6HmuSQBIPMP7vv8ulifAoNLBBPKrLygXywTte6me0y
         Fasu7H4xKdxiFz1166Vb3q0DUjvHTtSAlYuB69Q6Ca+XsMlnBV2U3VnfZs3sv39D1e6x
         zukUUgAYcXOn1OFvG1Iam+Gl6mWTltfTXXnAsXRyGg7lO0uGpKJ+PnNgb2pjSN4rFxGb
         OiBJ4ujuKuDDjnvCCzO4KpqPMicEn5nThl98bO4XFXqPod/mXu1nfLe2DiKaJUcHgH3k
         08zw==
X-Gm-Message-State: AOAM532kPZIGFN/k4lAKp1eVRndEk5JqyK9pYczgoCu5ANTmPKYUanlV
        QKpt+32juy/xg+4fqxOhM7Mmi3NKdQ4=
X-Google-Smtp-Source: ABdhPJxbF9nmmrghqckwoqWRvkBRV3GhyQegBfewOnPJiQJmXJc6YS1CBej2WxSABkle2IFtSDe6OA==
X-Received: by 2002:a05:6e02:50a:: with SMTP id d10mr282469ils.247.1596133502335;
        Thu, 30 Jul 2020 11:25:02 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id v10sm2973717iom.31.2020.07.30.11.25.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 11:25:01 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id l17so29204957iok.7
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 11:25:01 -0700 (PDT)
X-Received: by 2002:a02:852c:: with SMTP id g41mr599301jai.58.1596133500947;
 Thu, 30 Jul 2020 11:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200730090828.2349e159@canb.auug.org.au> <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
 <202007292007.D87DBD34B@keescook>
In-Reply-To: <202007292007.D87DBD34B@keescook>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 30 Jul 2020 11:24:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivHdh7yWmPMLDLVWzO-gVtu94KBq5RETPeU8EoBR2Qqg@mail.gmail.com>
Message-ID: <CAHk-=wivHdh7yWmPMLDLVWzO-gVtu94KBq5RETPeU8EoBR2Qqg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Kees Cook <keescook@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 8:17 PM Kees Cook <keescook@chromium.org> wrote:
>
> I'll look into this more tomorrow. (But yes, __latent_entropy is
> absolutely used for globals already, as you found, but this is the first
> percpu it was applied to...)

Note that it was always per-cpu.

The only thing that changed was that it was declared static in
lib/random.c vs being externally visible.

So it's not about the percpu part - although that then showed the
arm64 circular include file problem. It's literally that now the exact
same thing is declared in a header file and not marked "static".

Now, I don't think the __latent_entropy code ever really worked all
that well for per-cpu initializations. It ends up generating one
single initializer, which obviously isn't optimal. But I guess it's as
good as it gets.

Unrelated side note: I notice that the plugins could be simplified a
bit now that we require gcc 4.9 or later. There's a fair amount of
cruft for the earlier gcc versions.

I'm not sure how seriously the gcc plugins are actually maintained (no
offense) aside from just keeping them limping along. Does anybody
actually use them in production? I thought google had mostly moved on
to clang.

                Linus
