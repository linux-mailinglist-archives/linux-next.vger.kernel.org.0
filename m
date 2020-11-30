Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5395E2C90D9
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 23:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729382AbgK3WSt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 17:18:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:49978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728081AbgK3WSt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 17:18:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 83D3DABD2;
        Mon, 30 Nov 2020 22:18:07 +0000 (UTC)
Date:   Mon, 30 Nov 2020 23:18:03 +0100
From:   Borislav Petkov <bp@suse.de>
To:     "Ernst, Justin" <justin.ernst@hpe.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Travis, Mike" <mike.travis@hpe.com>
Subject: Re: linux-next: build warnings after merge of the tip tree
Message-ID: <20201130221803.GE6586@zn.tnic>
References: <20201130180503.5c173e05@canb.auug.org.au>
 <20201130101733.GA6586@zn.tnic>
 <AT5PR8401MB1300D1F5019C5C489BB20E9887F50@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AT5PR8401MB1300D1F5019C5C489BB20E9887F50@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 30, 2020 at 09:56:27PM +0000, Ernst, Justin wrote:
> After scratching my head for a while, I found that the issue was
> missing empty lines before three different code-block sections.

Oh great.

> The line number is definitely bogus, but I wasn't able to discover
> why.

Very helpful that tool. :-\

> You can find my patch at: https://lkml.org/lkml/2020/11/30/1196 The
> patch depends on the v2 patch set Mike Travis <mike.travis@hpe.com>
> submitted, which hasn't made it to tip yet.

Yeah, thanks for figuring this out.

I'll simply rebase your previous patch on the tip:x86/platform branch
since it is documentation stuff only and there's only one patch ontop
which updates MAINTAINERS but I don't think it'll be the end of the
world if those two got rebased.

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
