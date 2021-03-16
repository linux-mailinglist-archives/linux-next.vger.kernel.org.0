Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7971D33D655
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 16:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237672AbhCPPDD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 11:03:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:49708 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237673AbhCPPC7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Mar 2021 11:02:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BC8E9AC75;
        Tue, 16 Mar 2021 15:02:57 +0000 (UTC)
Date:   Tue, 16 Mar 2021 16:02:54 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juergen Gross <jgross@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Kelley <mikelley@microsoft.com>
Subject: Re: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20210316150254.GC18822@zn.tnic>
References: <20210315143505.35af617b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210315143505.35af617b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 15, 2021 at 02:35:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the hyperv tree got a conflict in:
> 
>   arch/x86/include/asm/mshyperv.h
> 
> between commit:
> 
>   a0e2bf7cb700 ("x86/paravirt: Switch time pvops functions to use static_call()")
> 
> from the tip tree and commit:
> 
>   eb3e1d370b4c ("clocksource/drivers/hyper-v: Handle sched_clock differences inline")
> 
> from the hyperv tree.
> 
> I fixed it up (I used the latter version of this file and then applied the
> following patch) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Right,

so tglx and I took a quick look and came to the conclusion that it would
be best if you - provided it is not too much trouble - keep applying
this patch so that linux-next can get tested properly and we - Wei or I
- explain this merge conflict in our pull requests during the next merge
window and ask Linus to merge your patch ontop. This way we'll save us
the cross-tree merging dance.

Thx!

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
