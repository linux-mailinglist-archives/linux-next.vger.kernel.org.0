Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D85193837
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 06:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgCZF5J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 01:57:09 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33928 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgCZF5H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2020 01:57:07 -0400
Received: by mail-pj1-f65.google.com with SMTP id q16so3035794pje.1
        for <linux-next@vger.kernel.org>; Wed, 25 Mar 2020 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0JJ8+aPGeaSlCEBK71IQ80VWEumq0V2uPxN3u9idId4=;
        b=gnVwPE4HbdbdTpveW0e/FJsiE13SbxlC14C3lLD/yHJ+mVEHGSqlVoOhVrOLcRNjw3
         Md2t0DU2mvrHR7NU3JgwNS4CXCk16mlqdZer3NjEOqzvSdx6CrhQAd98WYCvAO24EyDI
         xWA8iB2C1T+PyZr2Ng51UcY7+Gn9tcyl/VjTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0JJ8+aPGeaSlCEBK71IQ80VWEumq0V2uPxN3u9idId4=;
        b=BdV15uYJO9VupwSGMWoACfObr17OXmoGjD/eXilShQlsT9z/o+Rt9w6Y6ZVQ6zNKaz
         w1xs6LpXtr4OpVd7BOK+Wz1LN5SU5fv1gG9sL2z2KTmv/T7VwYUc/xOi1j8PWBt2NUh9
         JEJksZ6HZ5NeCb5201DkORxP9ydXkoqDRmk9ceJbzEzu66RAM7B9XdzmB2zx+VpdiRvk
         9H0mKPY3+ywgJsOxSiDlNjAJ47/WeslIj7dUdN6BH2WtpeCb6pyN4r94cTrf95qestfk
         HU7ZzG3VQ7b2cK0RrjW0IHnqHSWq7RwGHEdoL/TraD+910+ehJZgWnS2rOlHWnQ4Rkpd
         oC+A==
X-Gm-Message-State: ANhLgQ0Q7Zht2IH8cCV/PkCaxaA3m2J8NreYj9vbKP5fMSEYG7+Repzl
        k1b4kt+j6npij9VCpdxP0IKOEQ==
X-Google-Smtp-Source: ADFU+vtna803293zLiyIcPUihdLZHrN3v2iENBM+0ZWbXtjkteVQxCTZftS/JzYDBDkCWo1CgoGhSQ==
X-Received: by 2002:a17:90a:fb94:: with SMTP id cp20mr1317542pjb.117.1585202224803;
        Wed, 25 Mar 2020 22:57:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m11sm759191pjq.13.2020.03.25.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 22:57:03 -0700 (PDT)
Date:   Wed, 25 Mar 2020 22:57:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <202003252251.771EF5EC5F@keescook>
References: <20200318200542.GK20730@hirez.programming.kicks-ass.net>
 <20200319173101.wufpymi7obhqgoqd@treble>
 <20200319173326.oj4qs24x4ly5lrgt@treble>
 <20200319174028.azzaisoj5gbss7zk@treble>
 <20200319174550.4wpx4j357nw67nzz@treble>
 <20200320082613.GA20696@hirez.programming.kicks-ass.net>
 <202003201131.9B688BC@keescook>
 <20200324164433.qusyu5h7ykx3f2bu@treble>
 <202003241105.4707F983@keescook>
 <20200324222406.zg6hylzqux353jhq@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324222406.zg6hylzqux353jhq@treble>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 24, 2020 at 05:24:06PM -0500, Josh Poimboeuf wrote:
> On Tue, Mar 24, 2020 at 11:18:07AM -0700, Kees Cook wrote:
> > As far as I could tell, this needs patches to the UBSAN support in gcc
> > and clang. I have opened bugs for each:
> > 
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94307
> > https://bugs.llvm.org/show_bug.cgi?id=45295
> 
> So it sounds like this would replace the second UD2 with a "call
> some_ubsan_function()"?
> 
> That might be slightly better, though it would still need an objtool
> change to ignore unreachable warnings for such calls.

Well, there are basically two modes (actually three as I've just
discovered on the clang bug): warn and fail. I hadn't found a way to get
"small" warns, so I wired up the fail path which injects an
"unreachable" as part of its logic.

> In the meantime I can still change objtool to ignore unreachable UD2s if
> there aren't any better ideas.

It'll still need the objtool change for CONFIG_UBSAN_TRAP, though based on
the clang bug discussion, I'll probably _also_ be adding CONFIG_UBSAN_WARN
which won't have an unreachable (and won't bloat the kernel). Testing
still under way... it is possible that CONFIG_UBSAN_TRAP will go away
in the future, though. If that happens, should I also remove the change
at that time?

-- 
Kees Cook
