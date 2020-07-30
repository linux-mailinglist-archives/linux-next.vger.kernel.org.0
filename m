Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DBB23388C
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 20:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgG3SrZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 14:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgG3SrY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 14:47:24 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F58C061574
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 11:47:24 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id kr4so3072172pjb.2
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=20EbUEqeYpd3RRZUZK1aesXR8taUEzkknvo8JthXpRA=;
        b=mGjup5h1kWARxWONoDVI2PHrZazfbUi5lBQ0bXcOsbujHQq2gF2Jr5Hjanq+FS/GK7
         AJ4vM5eaPU6+EeStZkPwAcLTaK/csiqXJDmm+rF53e9D2zFhxyRVE6ueu34xfxf51RRs
         s2cOtYC3OvjXZBd/SLGSAK9FJ6zlFi6Tg0Z5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=20EbUEqeYpd3RRZUZK1aesXR8taUEzkknvo8JthXpRA=;
        b=RYMtapEDjcxT64HPyw2cF5NzjBYJFrvajlVnrn/x62tuJ/A45VREUikeBhnSZ3ba9l
         V+FHJtOQvYdbqwQ7G6xcTrCNWzA4sxklt9uVvZP0awytOKcEIdIxwe4ejHmL4Xxzd48c
         IYRFJJzzPtPLRXVHdpWGe1B6C9MniWZfnWYcFzJIpdoTJ5doVO4IoFMf1h++rxJtJOcK
         JAxFPDG6+VZDgg7+7DxBeXuUl7nD+1NO6Pqz6WfqRM8C/g6YD5GqH0FQOPTZ89f9P9O4
         Zv6ciAaxrPWgYGt98Q8s5c2ifqe9Xlowij1TJwUP4wNvUFHpdiSpvF4/qQ6oK1yZk9qu
         QEpQ==
X-Gm-Message-State: AOAM530CIGIbeukdoLXnUwZHJpUCGFoGSUNacoZAF+eEMnj70Q+GeNuA
        OInp5xHymcNJusczjibDikBBhQ==
X-Google-Smtp-Source: ABdhPJyQX1XNcftoW/MpbN6UWTl2wh1bt4Xo8RHzLBHCtvzshUMKwTYpwnID02muvX0tix70g3Y+Jg==
X-Received: by 2002:a17:90a:348d:: with SMTP id p13mr479596pjb.108.1596134844313;
        Thu, 30 Jul 2020 11:47:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i1sm7221219pfo.212.2020.07.30.11.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 11:47:23 -0700 (PDT)
Date:   Thu, 30 Jul 2020 11:47:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <202007301138.D8B018CB@keescook>
References: <20200730090828.2349e159@canb.auug.org.au>
 <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
 <202007292007.D87DBD34B@keescook>
 <CAHk-=wivHdh7yWmPMLDLVWzO-gVtu94KBq5RETPeU8EoBR2Qqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wivHdh7yWmPMLDLVWzO-gVtu94KBq5RETPeU8EoBR2Qqg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 30, 2020 at 11:24:44AM -0700, Linus Torvalds wrote:
> On Wed, Jul 29, 2020 at 8:17 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > I'll look into this more tomorrow. (But yes, __latent_entropy is
> > absolutely used for globals already, as you found, but this is the first
> > percpu it was applied to...)
> 
> Note that it was always per-cpu.
> 
> The only thing that changed was that it was declared static in
> lib/random.c vs being externally visible.

Yup, thanks. I realized that a bit after sending my email. :)

> Unrelated side note: I notice that the plugins could be simplified a
> bit now that we require gcc 4.9 or later. There's a fair amount of
> cruft for the earlier gcc versions.

Yup -- Masahiro keeps poking the build system, but I haven't cleaned up
the header file macros to keep up with the recent jumps. (It falls a bit
low on my TODO list since it's a bit of a mechanical cleanup. I'm open
to anyone that would like to send patches, though!)

> I'm not sure how seriously the gcc plugins are actually maintained (no
> offense) aside from just keeping them limping along. Does anybody
> actually use them in production? I thought google had mostly moved on
> to clang.

They're part of regular testing, and there is ongoing development
(e.g. see Alex Popov's recent series[1], which is in -next waiting for
the v5.9 merge window). I hear regularly from folks using randstruct,
stackleak, structleak, and latent_entropy. But yes, Google has moved
to Clang where we're using Clang's implementation of structleak
(auto-var-init) but there has been work to get randstruct ported (as
desired by at least one Android vendor), though it's currently stalled.

-Kees

[1] https://lore.kernel.org/lkml/20200624123330.83226-1-alex.popov@linux.com/

-- 
Kees Cook
