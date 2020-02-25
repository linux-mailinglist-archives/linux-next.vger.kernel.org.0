Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E732E16ED1E
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 18:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731318AbgBYRxh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 12:53:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:36720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731067AbgBYRxh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 12:53:37 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB96F20838;
        Tue, 25 Feb 2020 17:53:36 +0000 (UTC)
Date:   Tue, 25 Feb 2020 12:53:35 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bootconfig: Fix CONFIG_BOOTTIME_TRACING dependency
 issue
Message-ID: <20200225125335.5bbc3ed4@gandalf.local.home>
In-Reply-To: <c9604764-bd0f-67e9-56c8-fb6ffaf9b430@infradead.org>
References: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org>
        <158264140162.23842.11237423518607465535.stgit@devnote2>
        <c9604764-bd0f-67e9-56c8-fb6ffaf9b430@infradead.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 25 Feb 2020 09:49:25 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> > Fixes: d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by default")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>  
> 
> Hi,
> I'm no fan of "select", but this does fix the kconfig warnings and
> build errors that I have reported.  Thanks.

I'm not big on select either, but this is fine (I'm running it through my
tests now).

> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Is it OK if I change this to "Tested-by:"?

-- Steve
