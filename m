Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9124F1918B9
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 19:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgCXSSK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 14:18:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37882 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgCXSSK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Mar 2020 14:18:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id x1so3714945plm.4
        for <linux-next@vger.kernel.org>; Tue, 24 Mar 2020 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3sq9pHcqHya5zue49kGUODENoCs0RsvxG0c3HBz2PjI=;
        b=B9NDjm09JdWYdq785zCJY1ixxoSeYv/L3VKvu6pp9N1R8gQKphIIWsTFh6+eUTcQ1I
         cYoh9t++OOoLfXFnxVND7MZ+d9tAe5/WX7j2cyLi9vQcQCKFPnS4sPorZOzb9fKWSl8s
         VrWYuLTsac7M2DXCgpMJsZ7RK+ynK8ba7I9Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3sq9pHcqHya5zue49kGUODENoCs0RsvxG0c3HBz2PjI=;
        b=dvWun/Q0mLx196hwYW4nwCCuQ/6o3ZDnEPkPRnYA+FzijuCZAklUR+kRKwMV9t2l01
         LP2XNLyruGjFT3h02by+0QzpAOXfO/D8dFlNjmKAL7kEe02W19Dkn44Q4DBabk4DqFqP
         jvyug20vlP+EKlfneKkwZFzOM6aC5+kWVlbdBZOL7GxnTeqK4Y2FtoHABV2MWnD/4UNi
         M69bkpzT/7KChyXfK+/xhq3JdXptwYmQ+0SscZux6HsRqQBOFVvNnBprfqaaC22IUZTZ
         ZYAvpbTpdfczA9jdDPa9uIdla+WWtbZSiAW5J8N1Rw3hNaI2WotXujVcZ+qyp3ihp0Qx
         188Q==
X-Gm-Message-State: ANhLgQ0QtnargDkIyl4LLya+igE2kUkzG1FBxXpeHIQZYZJep7BJb0/0
        USw0PCZSFlgkr0PbKEnfkwDKCQ==
X-Google-Smtp-Source: ADFU+vsEdFjUwKZMsDQJKL6uR+OwPrlMyVYGwn2fM3M+jtHNpKg5OMxuVN1yJ+wVohL9JFtMAz4L+w==
X-Received: by 2002:a17:902:8bc8:: with SMTP id r8mr27128809plo.48.1585073889258;
        Tue, 24 Mar 2020 11:18:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 135sm17293101pfu.207.2020.03.24.11.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:18:08 -0700 (PDT)
Date:   Tue, 24 Mar 2020 11:18:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <202003241105.4707F983@keescook>
References: <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
 <20200318182352.2dgwwl4ugbwndi4x@treble>
 <20200318200542.GK20730@hirez.programming.kicks-ass.net>
 <20200319173101.wufpymi7obhqgoqd@treble>
 <20200319173326.oj4qs24x4ly5lrgt@treble>
 <20200319174028.azzaisoj5gbss7zk@treble>
 <20200319174550.4wpx4j357nw67nzz@treble>
 <20200320082613.GA20696@hirez.programming.kicks-ass.net>
 <202003201131.9B688BC@keescook>
 <20200324164433.qusyu5h7ykx3f2bu@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324164433.qusyu5h7ykx3f2bu@treble>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 24, 2020 at 11:44:33AM -0500, Josh Poimboeuf wrote:
> On Fri, Mar 20, 2020 at 11:35:37AM -0700, Kees Cook wrote:
> > On Fri, Mar 20, 2020 at 09:26:13AM +0100, Peter Zijlstra wrote:
> > > On Thu, Mar 19, 2020 at 12:45:50PM -0500, Josh Poimboeuf wrote:
> > > > > On Thu, Mar 19, 2020 at 12:33:31PM -0500, Josh Poimboeuf wrote:
> > > 
> > > > > > Actually I suspect it's the __builtin_unreachable() annotation which is
> > > > > > making UBSAN add the __builtin_trap()...  because I don't see any double
> > > > > > UD2s for WARNs.
> > > 
> > > > Actually, removing __builtin_unreachable() *does* make the extra UD2 go
> > > > away -- I forgot I had some silly debug code.
> > > 
> > > LOL, check this:
> > > 
> > > "Built-in Function: void __builtin_unreachable (void)
> > > 
> > >     If control flow reaches the point of the __builtin_unreachable, the
> > >     program is undefined. It is useful in situations where the compiler
> > >     cannot deduce the unreachability of the code. "
> > > 
> > > Which, I bet, is what makes UBSAN insert that __builtin_trap().
> > > 
> > > What a friggin mess :/
> > 
> > What I'd like is to be able to specify to UBSAN what function to call
> > for the trap. I'd prefer to specify a well-defined exception handler,
> > but at present, UBSAN just inserts __builtin_trap().
> > 
> > Can't objtool be told to ignore a ud2 that lacks an execution path to it?
> 
> It can ignore unreachable UD2s, if we think that's the right fix.
> 
> I was hoping we could find a way to get rid of the double UD2s, but I
> couldn't figure out a way to do that when I looked at it last week.

As far as I could tell, this needs patches to the UBSAN support in gcc
and clang. I have opened bugs for each:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94307
https://bugs.llvm.org/show_bug.cgi?id=45295

-- 
Kees Cook
