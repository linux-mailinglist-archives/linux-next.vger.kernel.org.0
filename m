Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA9E16F515
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 02:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729346AbgBZBeP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 20:34:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:50966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729170AbgBZBeP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 20:34:15 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 607C521744;
        Wed, 26 Feb 2020 01:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582680854;
        bh=Kjuv90ZjEjmAGSmEae/Z2LP6m0gsb/GyA826skbWBVk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qtFhlcLkuLnklw/zhFq2+nIRHrqcdOKiqeh49JeEuMwArKOtQac6s5U4OzVwmB/Qk
         Dy7q+tZBilxcx1HhrEF84Ew4i9cBqjxgAGENDtQ4R5BNHc9RxqQNes9NzHCQ/lhz8o
         M9aR/VTDW+GbONklVlWdohIqfw+LTR+HWAaj2s/A=
Date:   Wed, 26 Feb 2020 10:34:09 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bootconfig: Fix CONFIG_BOOTTIME_TRACING dependency
 issue
Message-Id: <20200226103409.9036c0384866979025232c6c@kernel.org>
In-Reply-To: <aa78add3-a6d9-e316-cfba-3432e347bec4@infradead.org>
References: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org>
        <158264140162.23842.11237423518607465535.stgit@devnote2>
        <c9604764-bd0f-67e9-56c8-fb6ffaf9b430@infradead.org>
        <20200225125335.5bbc3ed4@gandalf.local.home>
        <aa78add3-a6d9-e316-cfba-3432e347bec4@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 25 Feb 2020 09:59:25 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 2/25/20 9:53 AM, Steven Rostedt wrote:
> > On Tue, 25 Feb 2020 09:49:25 -0800
> > Randy Dunlap <rdunlap@infradead.org> wrote:
> > 
> >>> Fixes: d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by default")
> >>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> >>> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>  
> >>
> >> Hi,
> >> I'm no fan of "select", but this does fix the kconfig warnings and
> >> build errors that I have reported.  Thanks.
> > 
> > I'm not big on select either, but this is fine (I'm running it through my
> > tests now).
> > 
> >>
> >> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> > 
> > Is it OK if I change this to "Tested-by:"?
> 
> Yes, as long as someone doesn't read (interpret) that as runtime-tested-by. :)

Thanks Randy and Steve!

-- 
Masami Hiramatsu <mhiramat@kernel.org>
