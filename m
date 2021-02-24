Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA443245C8
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 22:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234354AbhBXVau (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 16:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbhBXVan (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 16:30:43 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B6DC061574
        for <linux-next@vger.kernel.org>; Wed, 24 Feb 2021 13:30:03 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 201so2190748pfw.5
        for <linux-next@vger.kernel.org>; Wed, 24 Feb 2021 13:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SFrYa/g2KhZxDM1QcNAwYDyDlpxACMJJJgJHoGagEkU=;
        b=L5+ESNm7SdrsGsVbeE5Kv7w/t2Pu3dHB+QgXMUl4Qt3vW1PMLPDE0ra+lnAljXmA5v
         5t20FopDOqh9JneqPw922FvyMYoPy14+JsuWaDF2tRIwZCBBaotmMF6RAkhrmWgmVizk
         ISTKL6j5i7tma7e4c39GM2ncXx/Jen//Toiww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SFrYa/g2KhZxDM1QcNAwYDyDlpxACMJJJgJHoGagEkU=;
        b=f06VYfnko6Utq/TEQhOlTES1qvHmapPRNUIrY2NYYuK6wJwR1G6XD+WfBzBbs3Ccv2
         8f9D9weoAoXfMFsQio7Wpvfi0lpZslatR5+jBpjVZaFcN5vnFZTrHQLZGIq6E85UmUAV
         DUTJtZCYQpJhWlX6ODkaJJ6e3qW5SZ+g7mzhHzdBcOSUhlm7pVV2bF4keuw1LGuHyT46
         rsFPRxUM/cgHuKm0zFwRHyKakFGGAJK45bqFj1SqX5SG7YTfM7RA9mZQ1YcXZ/xkOeFg
         QJ+2U6A7NnsRCGVevDH7x3LIC+GHHB9iXzuQRrXcMJ/Lkb5Z2A3EcMfv34P8jHKHIKLD
         tsKw==
X-Gm-Message-State: AOAM5337LYP1soTamqtWdSZv9mIuVLeJWvHhvJwr9isrCBPJkdFWnPc9
        c/EGe8mKzR83azPwxtK+g2jmyKtlIMguzQ==
X-Google-Smtp-Source: ABdhPJwYejHHBFJ92aIQ82xsJ3BJ9AuVEfMFV/MvrCLBIZ+hDrzBUsQDMtUMScc2E/rT/LXiPATtig==
X-Received: by 2002:a63:1565:: with SMTP id 37mr8383973pgv.391.1614202202605;
        Wed, 24 Feb 2021 13:30:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n4sm3705459pgg.68.2021.02.24.13.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 13:30:02 -0800 (PST)
Date:   Wed, 24 Feb 2021 13:30:01 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Signed-off-by missing for commits in Linus' tree
Message-ID: <202102241324.E784B6A0@keescook>
References: <20210224113108.4c05915e@canb.auug.org.au>
 <CAHk-=wi1FEJfk9r4Jw90kU3aayXka4Y4HOWdgAtVQHRFTgpQ+A@mail.gmail.com>
 <20210224114942.4b07cece@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224114942.4b07cece@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 24, 2021 at 11:49:42AM +1100, Stephen Rothwell wrote:
> Hi Linus,
> 
> On Tue, 23 Feb 2021 16:33:47 -0800 Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Feb 23, 2021 at 4:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > are missing a Signed-off-by from their committer.  
> > 
> > Gaah. Maybe I should do some pre-pull hook or something to notice this
> > automatically (like you clearly do).
> 
> I have attached the scripts I run over things after fetching them, but
> before merging them (so not a hook, sorry).  check_commits runs
> check_fixes - but just for my convenience.
> 
> -- 
> Cheers,
> Stephen Rothwell

Based on the pre-push.sample file, here is what I've added to my
.git/hooks/pre-push hook:


z40=0000000000000000000000000000000000000000

while read local_ref local_sha remote_ref remote_sha
do
        if [ "$local_sha" = $z40 ]
        then
                # Handle delete
                :
        else
                if [ "$remote_sha" = $z40 ]
                then
                        # New branch, examine all commits
                        range="$local_sha"
                else
                        # Update to existing branch, examine new commits
                        range="$remote_sha..$local_sha"
                fi

                if ! $HOME/bin/check_commits "$range"; then
                        exit 1
                fi
        fi
done

(and I modified check_fixes and check_commits to exit non-zero on failure)


I wonder if we need this in Documentation/maintainer/configure-git.rst
and to put check_commits and check_fixes into tools/ somewhere?

(Though goodness, please never aim your hook at your tree's tools/
directory.)

-- 
Kees Cook
