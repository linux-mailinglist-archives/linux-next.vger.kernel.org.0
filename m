Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0729A24B0F8
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 10:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgHTIVz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 04:21:55 -0400
Received: from mx2.suse.de ([195.135.220.15]:37416 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725824AbgHTIVw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Aug 2020 04:21:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 37476AC83;
        Thu, 20 Aug 2020 08:22:18 +0000 (UTC)
Date:   Thu, 20 Aug 2020 10:21:49 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Stefani <luca.stefani.ge1@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200820082149.GB17365@zn.tnic>
References: <20200820161239.25a9b3f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820161239.25a9b3f4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 20, 2020 at 04:12:39PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   71aefb9a89d4 ("RAS/CEC: Fix cec_init() prototype")
> 
> Fixes tag
> 
>   Fixes: 9554bfe403nd ("x86/mce: Convert the CEC to use the MCE notifier")

Hmm, this came from the original patch submission:

https://lkml.kernel.org/r/20200805095708.83939-1-luca.stefani.ge1@gmail.com

the 'n' is already there.

> has these problem(s):
> 
>   - The SHA1 is not all hex

If your script which verifies that is in python, per chance, you could
give it to me so that I can add it to my patch massaging script. :-)

I have no Fixes: tags sanity checks so far and have never considered
that they could possibly be wrong but this here is a case-in-point
example.

I guess I'd need also an "is the commit ID an actual upstream commit ID"
check, while at it.

> Presumably
> 
> Fixes: 9554bfe403bd ("x86/mce: Convert the CEC to use the MCE notifier")

Fixing...

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
