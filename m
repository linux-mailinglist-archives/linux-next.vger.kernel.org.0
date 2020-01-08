Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8540413455D
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 15:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbgAHOw5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 09:52:57 -0500
Received: from foss.arm.com ([217.140.110.172]:45672 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727164AbgAHOw5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 09:52:57 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AD2831B;
        Wed,  8 Jan 2020 06:52:54 -0800 (PST)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.194.52])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6E023F703;
        Wed,  8 Jan 2020 06:52:53 -0800 (PST)
Date:   Wed, 8 Jan 2020 14:52:49 +0000
From:   Steven Price <steven.price@arm.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <20200108145248.GA2584@arm.com>
References: <20200106170744.5b6ca678@canb.auug.org.au>
 <20200107151107.1ffae482a8663ada2bbc3bd3@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107151107.1ffae482a8663ada2bbc3bd3@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 07, 2020 at 11:11:07PM +0000, Andrew Morton wrote:
> On Mon, 6 Jan 2020 17:07:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > After merging the akpm tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > arch/x86/mm/dump_pagetables.c: In function 'ptdump_walk_pgd_level_core':
> > arch/x86/mm/dump_pagetables.c:403:1: warning: the frame size of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=]
> >   403 | }
> >       | ^
> > 
> > Introduced by commit
> > 
> >   710fae4f03f2 ("x86: mm: convert dump_pagetables to use walk_page_range")
> > 
> 
> (gdb) p sizeof(struct mm_struct)
> $1 = 1664
> 
> yup, that'll do it.

Ok, looks like I'll have to do something a little bit more clever than
the "fake_mm" hack I used before. The trouble is x86 now has two PGDs
due to the PAGE_TABLE_ISOLATION feature. I was trying to isolate this
quirk to the x86 code, but it looks like we need some way of passing an
"override" down for the PGD.

I'll post a possible fix as a reply to this post.

Steve

