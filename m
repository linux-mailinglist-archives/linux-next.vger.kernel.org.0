Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBEBFDF3F
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 14:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfKONs3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 08:48:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727417AbfKONs3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 08:48:29 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81E8E20715;
        Fri, 15 Nov 2019 13:48:28 +0000 (UTC)
Date:   Fri, 15 Nov 2019 08:48:27 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the arm64 tree
Message-ID: <20191115084827.6e04ec9f@gandalf.local.home>
In-Reply-To: <20191115122513.GB41572@lakrids.cambridge.arm.com>
References: <20191115135357.10386fac@canb.auug.org.au>
        <20191115122513.GB41572@lakrids.cambridge.arm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 15 Nov 2019 12:25:14 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> Thanks Stephen!
> 
> Steven (Rostedt), what's your preference for handling this?
> 
> We can drop revert the arm64 change to vmlinux.lds.h for now (and I can
> send it as a subsequent cleanup), or you could merge my
> arm64/ftrace-with-regs branch and fix this up in the ftrace tree.

Or we can just make a note of this, and mention it in our pull requests
to Linus.

We could make a single branch where we merged the two branches, fix it
up (as I believe Stephen did it correctly) and tell Linus "here's the
fix up".

This is a common occurrence and Linus has no problems with this. As
long as he's given a heads up.

-- Steve
