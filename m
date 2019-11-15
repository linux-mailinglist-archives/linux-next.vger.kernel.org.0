Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 561BAFDFED
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 15:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbfKOOVh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 09:21:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:46438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727417AbfKOOVh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 09:21:37 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48AE620715;
        Fri, 15 Nov 2019 14:21:36 +0000 (UTC)
Date:   Fri, 15 Nov 2019 09:21:34 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the arm64 tree
Message-ID: <20191115092134.41f460b1@gandalf.local.home>
In-Reply-To: <20191115135923.GA32389@arrakis.emea.arm.com>
References: <20191115135357.10386fac@canb.auug.org.au>
        <20191115122513.GB41572@lakrids.cambridge.arm.com>
        <20191115084827.6e04ec9f@gandalf.local.home>
        <20191115135923.GA32389@arrakis.emea.arm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 15 Nov 2019 13:59:24 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> I'm fine sending Linus the pull request with the conflict as long as you
> and Mark are ok with Stephen's resolution. The only nitpick I have is
> that the two comments prior to MCOUNT_REC should be merged into a single
> block (I guess we can leave this to Linus to sort out out).

Agreed,

I pushed up the merge conflict resolution to:

 git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ftrace/aarch64-conflict

Feel free to point to that branch as a reference to the conflict
resolution.

-- Steve
