Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11771FDF8B
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 14:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfKON72 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 08:59:28 -0500
Received: from foss.arm.com ([217.140.110.172]:59582 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbfKON72 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 08:59:28 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 508CD31B;
        Fri, 15 Nov 2019 05:59:27 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A7863F8F4;
        Fri, 15 Nov 2019 05:59:26 -0800 (PST)
Date:   Fri, 15 Nov 2019 13:59:24 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the arm64 tree
Message-ID: <20191115135923.GA32389@arrakis.emea.arm.com>
References: <20191115135357.10386fac@canb.auug.org.au>
 <20191115122513.GB41572@lakrids.cambridge.arm.com>
 <20191115084827.6e04ec9f@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115084827.6e04ec9f@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15, 2019 at 08:48:27AM -0500, Steven Rostedt wrote:
> On Fri, 15 Nov 2019 12:25:14 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> > Steven (Rostedt), what's your preference for handling this?
> > 
> > We can drop revert the arm64 change to vmlinux.lds.h for now (and I can
> > send it as a subsequent cleanup), or you could merge my
> > arm64/ftrace-with-regs branch and fix this up in the ftrace tree.
> 
> Or we can just make a note of this, and mention it in our pull requests
> to Linus.
> 
> We could make a single branch where we merged the two branches, fix it
> up (as I believe Stephen did it correctly) and tell Linus "here's the
> fix up".
> 
> This is a common occurrence and Linus has no problems with this. As
> long as he's given a heads up.

I'm fine sending Linus the pull request with the conflict as long as you
and Mark are ok with Stephen's resolution. The only nitpick I have is
that the two comments prior to MCOUNT_REC should be merged into a single
block (I guess we can leave this to Linus to sort out out).

-- 
Catalin
