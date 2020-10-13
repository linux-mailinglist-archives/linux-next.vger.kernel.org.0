Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECC928D435
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 21:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgJMTH7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 15:07:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:58364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727033AbgJMTH7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 15:07:59 -0400
Received: from quaco.ghostprotocols.net (unknown [179.97.37.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86CDF208D5;
        Tue, 13 Oct 2020 19:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602616078;
        bh=EM4GBfxKTQMj47QgWsy8GdC130nGidSSNpq+tco0KGw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E6GQKemhD6XOSM1sXIh8Zh7t4BqWCzE0JUnFj1hQ26QmYEp0KHyu129OtoJk6CNs4
         KcqX888/qnnv1B/ohnAKcTdFgjeC6X+3QjHv1PVRXVWQ/bZJPZerjJTZ2K98ULaFEH
         DhA5P7jWx6EBKgI7GpUzr3Y3sMlCXoRYKozEuyf4=
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 724174047F; Tue, 13 Oct 2020 16:07:56 -0300 (-03)
Date:   Tue, 13 Oct 2020 16:07:56 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
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
Message-ID: <20201013190756.GA3100363@kernel.org>
References: <20201009112327.GC656950@krava>
 <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
 <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
 <20201009124111.GD656950@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009124111.GD656950@krava>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Fri, Oct 09, 2020 at 02:41:11PM +0200, Jiri Olsa escreveu:
> On Fri, Oct 09, 2020 at 02:25:23PM +0200, Vasily Gorbik wrote:
> > Currently BUILD_BUG() macro is expanded to smth like the following:
> >    do {
> >            extern void __compiletime_assert_0(void)
> >                    __attribute__((error("BUILD_BUG failed")));
> >            if (!(!(1)))
> >                    __compiletime_assert_0();
> >    } while (0);
> > 
> > If used in a function body this obviously would produce build errors
> > with -Wnested-externs and -Werror.
> > 
> > To enable BUILD_BUG() usage in tools/arch/x86/lib/insn.c which perf
> > includes in intel-pt-decoder, build perf without -Wnested-externs.
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> 
> that one applied nicely ;-) thanks
> 
> Acked-by: Jiri Olsa <jolsa@redhat.com>



Thanks, applied.

- Arnaldo

