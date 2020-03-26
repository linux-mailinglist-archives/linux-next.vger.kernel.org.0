Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2F4F194698
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 19:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgCZSgO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 14:36:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40643 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgCZSgN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2020 14:36:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id c20so674427pfi.7
        for <linux-next@vger.kernel.org>; Thu, 26 Mar 2020 11:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iXlxt2aYlNdrmXy9xrh62320KX+jShx79PK1R5/xAp0=;
        b=JQuCPnbnMGiAGC1aOyMcC4MmPwZxC6Oi3BG7HdZ54668Q1XbFffRXR0GwZhhSzbFjy
         2H+CppEVA/1s0X82dxzmDwfpwkayVvIS3xDh2hcImj75t/xQo9Q93jFRKycRVcxVq7x4
         OYRVuQpXPPRZfZpouGVANjeKzLLoTxyHwxTes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iXlxt2aYlNdrmXy9xrh62320KX+jShx79PK1R5/xAp0=;
        b=t9rclE79lOcD++RaPEzJ8Li/VIh9nVjzy7em/4pvt16AcsgJDQPbPxS7u3cbEcE1eg
         JZyoza7CPVfQ/d1WyUn7sgn9r3ZHqsMHmNjdb4Zq57OGaX1lemGbfwy4lOi0kVSUS7q1
         jitLVfalls7UKiAA/Avefc5UQHyzOkvrrQ/RXnUMLBdqJ6krOWUMSXMo+JjRUFSW3rjl
         IaIA5Eei6UZ/VNJSFBAldhW8IBsuUYy84eGeL6EwFAVVIErsm8yVK3PkCBA34fES3ZbO
         DsZLQYQ/Z/Umo3WZVC/dPhcSe4QNrWQvg5Oyxea9eDlGPAyqEvBZAIkh5SYKCumizWes
         ZgRA==
X-Gm-Message-State: ANhLgQ2/WuWwfNzl0/NnYwuV+idxck+oYmvchf5iM6moHgNBHTAOeQRi
        m5dxKu6S1PL34VdehS9FdmJDcA==
X-Google-Smtp-Source: ADFU+vuidts8P9YSHqfhFKUIj0CYmlitPay4HIJ1OiYEifPM79lkB188HfB6F4kzetKdTpHlb0KBtw==
X-Received: by 2002:aa7:9811:: with SMTP id e17mr9806248pfl.33.1585247772777;
        Thu, 26 Mar 2020 11:36:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c15sm2242138pfo.139.2020.03.26.11.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 11:36:11 -0700 (PDT)
Date:   Thu, 26 Mar 2020 11:36:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <202003261133.814BEE9F@keescook>
References: <20200319173326.oj4qs24x4ly5lrgt@treble>
 <20200319174028.azzaisoj5gbss7zk@treble>
 <20200319174550.4wpx4j357nw67nzz@treble>
 <20200320082613.GA20696@hirez.programming.kicks-ass.net>
 <202003201131.9B688BC@keescook>
 <20200324164433.qusyu5h7ykx3f2bu@treble>
 <202003241105.4707F983@keescook>
 <20200324222406.zg6hylzqux353jhq@treble>
 <202003252251.771EF5EC5F@keescook>
 <20200326163110.n35lxcgkfcar7vd5@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326163110.n35lxcgkfcar7vd5@treble>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 26, 2020 at 11:31:10AM -0500, Josh Poimboeuf wrote:
> On Wed, Mar 25, 2020 at 10:57:02PM -0700, Kees Cook wrote:
> > > In the meantime I can still change objtool to ignore unreachable UD2s if
> > > there aren't any better ideas.
> > 
> > It'll still need the objtool change for CONFIG_UBSAN_TRAP, though based on
> > the clang bug discussion, I'll probably _also_ be adding CONFIG_UBSAN_WARN
> > which won't have an unreachable (and won't bloat the kernel). Testing
> > still under way... it is possible that CONFIG_UBSAN_TRAP will go away
> > in the future, though. If that happens, should I also remove the change
> > at that time?
> 
> I'll go ahead and make the patch and post it soon.  It should be pretty
> trivial.  We can always revert it if CONFIG_UBSAN_TRAP goes away.

Awesome, thanks very much. After digging into the WARN-style option,
it seems that TRAP is unlikely to go away because it's Clang only;
GCC doesn't support the "minimal runtime" option. Yay compilers.

Anyway, I'll still get the WARN mode sent out. Thanks for looking at this;
can you CC me on the patch? I'm trying to get more familiar with objtool
so I don't have to bug you when objtool is angered by crazy stuff I do. ;)

-- 
Kees Cook
