Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23EA216BE87
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 11:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbgBYKXJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 05:23:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:34226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729952AbgBYKXJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 05:23:09 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2349320714;
        Tue, 25 Feb 2020 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582626188;
        bh=DYiay3oUSGnjUy47lcrMMw5qfTeq2ck0vpHNo8qT5c4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k+YSZJtOOBoQBU4BrsLXSp3OshcrZ6TP+oNBa4LF8i/EPKTyHq1BfvPqQx85qXydv
         KjchrgmH7hmARWdj68OazcHspXQcpYC0oo17JfBV5iX803kXiEZd/fVJXKOrVRPcKf
         qE9y+XPLSNA/lKu027fqnaQ3bcM6i4ftfRDElTMY=
Date:   Tue, 25 Feb 2020 19:23:04 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Tree for Feb 25 (BOOT_CONFIG)
Message-Id: <20200225192304.f3ccd36bd1c451e3a1969255@kernel.org>
In-Reply-To: <7e8f78b4-12f9-6bd3-72dc-08152fbe9345@infradead.org>
References: <20200225142452.14d4e169@canb.auug.org.au>
        <7e8f78b4-12f9-6bd3-72dc-08152fbe9345@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 24 Feb 2020 22:58:01 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 2/24/20 7:24 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200224:
> > 
> 
> 
> on i386:
> 
> WARNING: unmet direct dependencies detected for BOOT_CONFIG
>   Depends on [n]: BLK_DEV_INITRD [=n]
>   Selected by [y]:
>   - BOOTTIME_TRACING [=y] && TRACING_SUPPORT [=y] && FTRACE [=y] && TRACING [=y]

Oops, thanks for reporting!

So I made the Boottime tracing selects the bootconfig, but the bootconfig depends on initrd support.
Hmm, should I make BOOTTIME_TRACING depends on BLK_DEV_INITRD??

Thank you,

> 
> 
> Full randconfig file is attached.
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>


-- 
Masami Hiramatsu <mhiramat@kernel.org>
