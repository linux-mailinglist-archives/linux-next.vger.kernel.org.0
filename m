Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666BC2C8394
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 12:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgK3L6u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 06:58:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:34252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgK3L6u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 06:58:50 -0500
Received: from gaia (unknown [95.146.230.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0AF72073C;
        Mon, 30 Nov 2020 11:58:07 +0000 (UTC)
Date:   Mon, 30 Nov 2020 11:58:05 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20201130115804.GC3902@gaia>
References: <20201130182840.02a96a67@canb.auug.org.au>
 <20201130184835.18b5f4de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130184835.18b5f4de@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 30, 2020 at 06:48:35PM +1100, Stephen Rothwell wrote:
> On Mon, 30 Nov 2020 18:28:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the akpm tree got a conflict in:
> > 
> >   arch/arm64/kernel/mte.c
> > 
> > between commit:
> > 
> >   e710c29e0177 ("arm64: mte: make the per-task SCTLR_EL1 field usable elsewhere")
> > 
> > from the arm64 tree and commit:
> > 
> >   44a7127eb3a4 ("arm64: mte: add in-kernel MTE helpers")
> > 
> > from the akpm tree.
> > 
> > I fixed it up (the former just removed some of the context for what the
> > latter added) and can carry the fix as necessary. This is now fixed as
> > far as linux-next is concerned, but any non trivial conflicts should be
> > mentioned to your upstream maintainer when your tree is submitted for
> > merging.  You may also want to consider cooperating with the maintainer
> > of the conflicting tree to minimise any particularly complex conflicts.
> 
> A couple of the following patches in the akpm tree also conflicted with
> the arm64 tree.

Thanks Stephen. While the conflicts are not too bad, the variable
renaming (e.g. gcr_incl -> gcr_excl) makes them look pretty messy. I'll
drop commit e710c29e0177 and the subsequent one from the arm64 tree and
either merge them via akpm or defer to 5.12.

-- 
Catalin
