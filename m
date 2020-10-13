Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1CA28D43D
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 21:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgJMTJ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 15:09:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:58674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729603AbgJMTJ1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 15:09:27 -0400
Received: from quaco.ghostprotocols.net (unknown [179.97.37.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3340D20E65;
        Tue, 13 Oct 2020 19:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602616166;
        bh=kNQlVTeHNAfONSQgXkp3RK1JocNH8x9dldRu804OQHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=txJOU0N7+OPVuzvB9htxvbuAi/4kPjv0O/wPEPx981bTqxJ4eAQAg/7Z48gnwY1Bo
         pyuUeZYt0zt5ak5/EDwEJpwCJjE8XHDgzX3WrqY/TpwW9c2TKMUxrGHHLPg0K8uiTd
         TUEaIrYqVu7+js8b/zro2yVWX8bHjscURA4ZcG3k=
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 3339F4047F; Tue, 13 Oct 2020 16:09:24 -0300 (-03)
Date:   Tue, 13 Oct 2020 16:09:24 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jiri Olsa <jolsa@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH RESEND 1/1] perf build: Allow nested externs to enable
 BUILD_BUG() usage
Message-ID: <20201013190924.GB3100363@kernel.org>
References: <20201009112327.GC656950@krava>
 <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
 <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
 <20201009124111.GD656950@krava>
 <20201012085936.241cc62d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012085936.241cc62d@canb.auug.org.au>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, Oct 12, 2020 at 08:59:36AM +1100, Stephen Rothwell escreveu:
> Hi all,
> 
> On Fri, 9 Oct 2020 14:41:11 +0200 Jiri Olsa <jolsa@redhat.com> wrote:
> >
> > On Fri, Oct 09, 2020 at 02:25:23PM +0200, Vasily Gorbik wrote:
> > > Currently BUILD_BUG() macro is expanded to smth like the following:
> > >    do {
> > >            extern void __compiletime_assert_0(void)
> > >                    __attribute__((error("BUILD_BUG failed")));
> > >            if (!(!(1)))
> > >                    __compiletime_assert_0();
> > >    } while (0);
> > > 
> > > If used in a function body this obviously would produce build errors
> > > with -Wnested-externs and -Werror.
> > > 
> > > To enable BUILD_BUG() usage in tools/arch/x86/lib/insn.c which perf
> > > includes in intel-pt-decoder, build perf without -Wnested-externs.
> > > 
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>  
> > 
> > that one applied nicely ;-) thanks
> > 
> > Acked-by: Jiri Olsa <jolsa@redhat.com>
> 
> I will apply that patch to the merge of the tip tree today (instead of
> reverting the series I reverted in Friday) (unless I get an update of
> the tip tree containing it, of course).

Applied to perf/core that will go to Linus this week, maybe even today.

- Arnaldo
