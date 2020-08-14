Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433C52447E0
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 12:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHNKWL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 06:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgHNKWL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2020 06:22:11 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62E9C061383;
        Fri, 14 Aug 2020 03:22:10 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id bo3so9341662ejb.11;
        Fri, 14 Aug 2020 03:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=04U/JyVCq8HzNFNtt8PnwdArTiazRQ31ar9uuWKl7UY=;
        b=suqR4YluRA5IhG0SHVtNDhL70Dzo8bdNHl7ev0BE3R7rFGVEPZ2pjjDkd6AOvt2G0q
         gDLWd3kZ67AGlRbGi2FZu0oZPgOojvOIrPR1KKeG57n5WFO39+SQAiNxufYQTcBOrVXM
         GxP9sQYqtkgcG6Z4JKB09ubvupll6yH4PcVLl4L577PRgqBTRSfLaZkJQEInQyPca/Gj
         8pVfIA1ebCQA7+nKHbp6FkcvgMAtNVg6KMgt5lMQV/C07wpZ8bDpfOeQahgEz04CtbDG
         XBWGiuDCY8DhPBT73+9mLqOiWoQgS8USfD9El1qJsutbT8y0C8+KW9wt33+yV4OyfWwQ
         /STQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=04U/JyVCq8HzNFNtt8PnwdArTiazRQ31ar9uuWKl7UY=;
        b=i5TbMU2iSPsvqYQZnLLzboxiMIwXJsJhw5/jeoo3PpREGcwRqwPzaA8AK1RcHcyWMp
         06y0x85YYI80/drv+lxpF63ypQfBON4lA684LYyDPB9NzkEyiOBPFk3ZiJKV7D7gGKo1
         S/Pd4nAUij4Gwp7q7fhh1Lf/qzr0PAP6pASgQs+m2rHRBLIkPKGKG1ernhBWGq0reyvp
         V4R0iIYaNMoWZ0W/m2A69ONznBn/uRtf5uSEIcFEBNpi6QRepNTAL6kXwtJ6Uvj6fkH5
         uwz/sd204bzbRojgCWnb8fcykvrZFHA2YmZ9N/zLGUSUZzEPOBOF8JQWhegxSqdRn12m
         uxXQ==
X-Gm-Message-State: AOAM53321dAQjomndDEeBsGlyFJblwGGxah1eRXq8hTIDOj/5dGFFL6u
        1m5NK/Rz9GBhga+DDThvBTY=
X-Google-Smtp-Source: ABdhPJyfb+2aFXmmubH+Qkzo7wwJpoay02/UILq46GvduaermHJKvviXcCdAA1dXKdkKuYXr2rZ0QQ==
X-Received: by 2002:a17:906:eca4:: with SMTP id qh4mr1638276ejb.255.1597400529446;
        Fri, 14 Aug 2020 03:22:09 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id z5sm6338260ejm.111.2020.08.14.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 03:22:08 -0700 (PDT)
Date:   Fri, 14 Aug 2020 12:22:06 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new build warnings after binutils update
Message-ID: <20200814102206.GB2367157@gmail.com>
References: <20200811143130.0ca95b8d@canb.auug.org.au>
 <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Ard Biesheuvel <ardb@kernel.org> wrote:

> (+ Arvind, Kees)
> 
> On Thu, 13 Aug 2020 at 22:58, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After upgading some software, builds of Linus' tree now produce these warnings:
> >
> > x86_64-linux-gnu-ld: arch/x86/boot/compressed/head_64.o: warning: relocation in read-only section `.head.text'
> > x86_64-linux-gnu-ld: warning: creating DT_TEXTREL in a PIE
> >
> > I upgraded binutils from 2.34-8 to 2.35-1 (Debian versions).
> >
> > $ x86_64-linux-gnu-gcc --version
> > x86_64-linux-gnu-gcc (Debian 9.3.0-13) 9.3.0
> >
> > Any ideas?
> >
> 
> Arvind and I have some patches on the list that fix various relocation
> issues in the decompressor binary.
> 
> As far as I can tell, Arvind's patch to suppress runtime relocations
> [0] addresses this exact issue.
> 
> Unfortunately, in spite of various pings and attempts to get the x86
> maintainers to notice this series, it has been ignored so far. Perhaps
> this is a good time to merge it for -rc1/2?
> 
> [0] https://lore.kernel.org/lkml/20200731202738.2577854-6-nivedita@alum.mit.edu/

It all looked good to me but was a bit late for v5.9, will pick up 
after -rc1.

Thanks,

	Ingo
