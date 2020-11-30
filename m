Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362392C80FC
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 10:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgK3J2J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 04:28:09 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:47478 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgK3J2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 04:28:08 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606728446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UflFX9lPkyfMGeR8pF9iqkI1gz6FB4j+LgH3VAqeSec=;
        b=WDu9AhUGqZPleSmSCRFzGGDAWQJnWvY15MbmZCkO7uPYYMDqSizArnb5oT7DEYP472UeMG
        lmE9yNI79k0V0pXXYNSK3IXSVv4O3U78IYCitcsG5p1C9UiHlr+ncj/cGRL05qwCGkwlmS
        9Vnp92XDcIveIsSzLAoV/DGWSilf+hR5V7f/gKx49x1MchH7coLG9+/DT4Fm25qHRliyFG
        o1GY2Ti/SP0cjbU8gYrzAFza8p/zV2LwR/+xU5FGkVrmoFrmTcVNspEUjaCuUBlfW9bM6x
        m7uI/gEdmqoN4dMhbsNp0xwoU/L9/bfXpadfImczN2FsRr3r2VdOjC4Y65oe9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606728446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UflFX9lPkyfMGeR8pF9iqkI1gz6FB4j+LgH3VAqeSec=;
        b=t5zceugKengLO3VIRmaEu658R8cBf+gUGJ4OYVcpIUzJWATRIOMwo4vub6PU3/j/QNcuSF
        Xql48eve/hpHZLAA==
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
In-Reply-To: <20201127115411.GF4077@smile.fi.intel.com>
References: <20201127183924.36696fb0@canb.auug.org.au> <20201127115411.GF4077@smile.fi.intel.com>
Date:   Mon, 30 Nov 2020 10:27:26 +0100
Message-ID: <87v9dni48x.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 27 2020 at 13:54, Andy Shevchenko wrote:
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>
> Thanks, from my perspective looks good, dunno if scheduler part is okay.

The final outcome in -next looks correct.

Thanks,

        tglx
