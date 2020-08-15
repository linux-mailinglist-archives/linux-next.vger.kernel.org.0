Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2ED02453A2
	for <lists+linux-next@lfdr.de>; Sun, 16 Aug 2020 00:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgHOVvE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 15 Aug 2020 17:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728475AbgHOVuy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 15 Aug 2020 17:50:54 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89465C0F26F1;
        Sat, 15 Aug 2020 11:15:01 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id c16so13233071ejx.12;
        Sat, 15 Aug 2020 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LMT9eJmgWfVnryacfbbwOLILASNGcjdBzCE+hJadmmA=;
        b=q9OCHHcUld23QLAguCC0Mhve5atQxWPM7SOpVjzmpC4kAyptnOwgxyiFibtct6IAqR
         JU12DoxlOseehnlDh0awrurS/BP1r2bM4doDnzN2cGOiQQEuN2sUe/DG745GoJ3z9aTT
         vIyGtAVG9unaVsHCDQIt+vBk7AQ4qzIFltuumRB5hOFJpjnVfc8DCrH3t44Os6WiUskw
         1TfbM3pLnf01GHPwkXRNGioRRL3BuCmo5FSRFlOt5IyrRo2cMg7T6CxyMOSBLTKNfX9p
         7Xs7OgwZFziQedYrMrGi2D7ke5qM4z9n4ehaq+E+2uKgNfe4HcJiwrLISJBAlDS5mJcT
         TKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LMT9eJmgWfVnryacfbbwOLILASNGcjdBzCE+hJadmmA=;
        b=WTYpeFoDhBDtojYwjoBU9CXNzyTRz6N9WyRyph6LrQQTEErT1VDhplvprUB3YHM+IO
         T1jrPh7R/5sdvtJPaVjNoP/KcVfSmmZZmoyZL4bujwoF2R5auNsXyIbNWv3EB0GaGB9M
         t+DSOLj7twvxJY47W3V73o/C1EyqYelotq0WH+SS9+1QPx+m67oR2DyRhl9qkIsTmbEW
         YlvY71kkEV137entn2EHWqid/mrUKtiR3SPgmsjCDw5aYnFT86gVKziw6zv6kmId1PB4
         U8aUvQ4eT8+dCRpgB1+Ey7FZe+qyA1kSbz073H2VLr3yEpLtRY4k0QImc7xfIlwSxkKg
         jfvA==
X-Gm-Message-State: AOAM530mAvpNjQ/1Ca8xd8K69FhApPfUP/SdAtldHRShBBMMn7LBw+Je
        8Wmr1TxSlYZMZburQ3l7+344QyPJuhI=
X-Google-Smtp-Source: ABdhPJwj5ewtaPyWTr8kWSZ3yL/Ah7r877dtkQoh2EtKIdB2dgc8xl5kP3vR+5g7dSuAQ1pWvOY0gQ==
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr8088081ejw.71.1597515300339;
        Sat, 15 Aug 2020 11:15:00 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id o25sm10278308ejm.34.2020.08.15.11.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 11:14:59 -0700 (PDT)
Date:   Sat, 15 Aug 2020 20:14:57 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new build warnings after binutils update
Message-ID: <20200815181457.GA2719638@gmail.com>
References: <20200811143130.0ca95b8d@canb.auug.org.au>
 <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
 <20200814102206.GB2367157@gmail.com>
 <202008141232.A5A5D8C7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008141232.A5A5D8C7@keescook>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Kees Cook <keescook@chromium.org> wrote:

> On Fri, Aug 14, 2020 at 12:22:06PM +0200, Ingo Molnar wrote:
> > > [0] https://lore.kernel.org/lkml/20200731202738.2577854-6-nivedita@alum.mit.edu/
> > 
> > It all looked good to me but was a bit late for v5.9, will pick up 
> > after -rc1.
> 
> Excellent! Thank you. I'll base the orphan series on x86/boot now. Once
> I send a v6 (there are a few more things to tweak), can you carry that
> in -tip as well (it includes arm and arm64 as well, all of which depend
> on several asm-generic patches).

Sure, that looks the most sensible, since there's so much x86 impact. 
Might migrate the commits over into a more generic topic branch - 
started out with x86/boot to get things going.

Thanks,

	Ingo
