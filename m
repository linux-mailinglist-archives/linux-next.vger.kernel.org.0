Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B02AFDFFE
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 15:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfKOOYg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 09:24:36 -0500
Received: from foss.arm.com ([217.140.110.172]:59988 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727380AbfKOOYg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 09:24:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D1F31B;
        Fri, 15 Nov 2019 06:24:36 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18A163F534;
        Fri, 15 Nov 2019 06:24:34 -0800 (PST)
Date:   Fri, 15 Nov 2019 14:24:33 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the arm64 tree
Message-ID: <20191115142432.GC32389@arrakis.emea.arm.com>
References: <20191115135357.10386fac@canb.auug.org.au>
 <20191115122513.GB41572@lakrids.cambridge.arm.com>
 <20191115084827.6e04ec9f@gandalf.local.home>
 <20191115135923.GA32389@arrakis.emea.arm.com>
 <20191115092134.41f460b1@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115092134.41f460b1@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15, 2019 at 09:21:34AM -0500, Steven Rostedt wrote:
> On Fri, 15 Nov 2019 13:59:24 +0000
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> > I'm fine sending Linus the pull request with the conflict as long as you
> > and Mark are ok with Stephen's resolution. The only nitpick I have is
> > that the two comments prior to MCOUNT_REC should be merged into a single
> > block (I guess we can leave this to Linus to sort out out).
> 
> Agreed,
> 
> I pushed up the merge conflict resolution to:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ftrace/aarch64-conflict
> 
> Feel free to point to that branch as a reference to the conflict
> resolution.

Great. Thanks.

-- 
Catalin
