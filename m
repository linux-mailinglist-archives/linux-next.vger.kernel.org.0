Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359902A8D1E
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 03:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgKFCq4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 21:46:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgKFCq4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 21:46:56 -0500
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31A0F20782;
        Fri,  6 Nov 2020 02:46:54 +0000 (UTC)
Date:   Thu, 5 Nov 2020 21:46:52 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20201105214652.4105c050@oasis.local.home>
In-Reply-To: <20201106133902.2ec6a1e9@canb.auug.org.au>
References: <20201106133902.2ec6a1e9@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 6 Nov 2020 13:39:02 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I fixed it up (the latter removed the code updated by the former, so I
> just used the latter) and can carry the fix as necessary. This is now
> fixed as far as linux-next is concerned, but any non trivial conflicts
> should be mentioned to your upstream maintainer when your tree is
> submitted for merging.  You may also want to consider cooperating with
> the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen,

Yeah, updates caused errors that needed to be fixed, which we knew were
just a work around till the next merge window. Which is why that commit
had in the comments: "Nested is a workaround that will soon not be
needed." ;-)

-- Steve
