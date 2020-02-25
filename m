Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 770C616C1A3
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 14:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729800AbgBYNF4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 08:05:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:39440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729193AbgBYNF4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 08:05:56 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9C8D21556;
        Tue, 25 Feb 2020 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582635955;
        bh=+As4mDnnLApyLyfQzFILmdOY51jEVGMNz0BBktEP5V8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B0MNX8mYwhgjQSRUkltS9baZmcWNRjxPdc3tem6vzw9m6VGZZkcMOemqJCOiD+xrZ
         ShKuWcvCzvshiIR8rh3fuDNdOIyR/4wJD+amV/Vpof1hptLAbGIE2KIApfVKbRCWba
         cjq4De6w8vlTQFhBLZj1+Otvk+5Z0fq8IaLbQDCU=
Date:   Tue, 25 Feb 2020 22:05:51 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Feb 25 (BOOT_CONFIG)
Message-Id: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org>
In-Reply-To: <20200225192304.f3ccd36bd1c451e3a1969255@kernel.org>
References: <20200225142452.14d4e169@canb.auug.org.au>
        <7e8f78b4-12f9-6bd3-72dc-08152fbe9345@infradead.org>
        <20200225192304.f3ccd36bd1c451e3a1969255@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 25 Feb 2020 19:23:04 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Mon, 24 Feb 2020 22:58:01 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> > On 2/24/20 7:24 PM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20200224:
> > > 
> > 
> > 
> > on i386:
> > 
> > WARNING: unmet direct dependencies detected for BOOT_CONFIG
> >   Depends on [n]: BLK_DEV_INITRD [=n]
> >   Selected by [y]:
> >   - BOOTTIME_TRACING [=y] && TRACING_SUPPORT [=y] && FTRACE [=y] && TRACING [=y]
> 
> Oops, thanks for reporting!
> 
> So I made the Boottime tracing selects the bootconfig, but the bootconfig depends on initrd support.
> Hmm, should I make BOOTTIME_TRACING depends on BLK_DEV_INITRD??

OK, there are 3 options.

1) make BOOTTIME_TRACING depends on BOOT_CONFIG
2) make BOOTTIME_TRACING selects BLK_DEV_INITRD
3) make BOOT_CONFIG selects BLK_DEV_INITRD (and BOOTTIME_TRACING=n by default)

Or, I'll hurry to implement CONFIG_BUILTIN_BOOT_CONFIG support.

Thank you, 



> 
> Thank you,
> 
> > 
> > 
> > Full randconfig file is attached.
> > 
> > -- 
> > ~Randy
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
> 
> -- 
> Masami Hiramatsu <mhiramat@kernel.org>


-- 
Masami Hiramatsu <mhiramat@kernel.org>
