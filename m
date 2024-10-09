Return-Path: <linux-next+bounces-4181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE8D9963B3
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 10:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5BF1C23A2D
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 08:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A0218E778;
	Wed,  9 Oct 2024 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ed50BljF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBCA18E05C;
	Wed,  9 Oct 2024 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463567; cv=none; b=dcxPEVnYgEbHSvM7ihWdFoYGyiJDOerpcZuOjUwJ/JsLGFZ77lCpNRFaR5HqOv3jIwIR0SrkSWEsAfW6FnlPntuUFOqxhN2l4oN4R40HhJyocRzkVV2vc8JjcP17KABVAtKtqnfVN7Qejv8YKeqjqYEDn5Gcpu2x/X5QKohiWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463567; c=relaxed/simple;
	bh=ZijqrjhFN0LXySL/+druOJOfsofJU7TTWVUT/y1qpaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQE6RHzNORAHG8WKzg1owjIhK2q3oLt41HLmVmW6fxow9hF7DN7YdBOZQQPD+CFQHv8iK1b1N6/Lxe/2y3geQNH7ICGL3JW0WSmJDk74Pz8P56ukY6DY2LOSL98KUWlcHG5bxUx24ysszqkdJRgKVufrBjZzIxlOkhCMp14qubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ed50BljF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B43AC4CECE;
	Wed,  9 Oct 2024 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728463566;
	bh=ZijqrjhFN0LXySL/+druOJOfsofJU7TTWVUT/y1qpaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ed50BljFsmlPMx68ZWCA50+MRtbDFg4ESjeTWO09nbtIyO6CfPt7ZL4pxGIsOwHmb
	 jJIasY9inuhqKzQJBL7Up/Hu6DnaxJR7AIddT/aaj2/RoL50OECv9Kpr/2xlBB7tpN
	 z7MIicWQptlqWXdSIKaC+/zJwP1xNv9JhA9JIquItDQ4MzQJfakfvZvyYI4jR7i+j4
	 KgtrZcSxjOsLSt7NL63Pdm2cWM8HZYaQLL1ysqLG7RVnKZtbPmC4RfTr0CcTPjpBgp
	 Ha5xZmfXhTXXA2J1ZX93rKmHb18ecP4kkDiP6c2zzrHNLY96hHqDto6MSbQ47PIjFX
	 IMOxvIiXvvz9Q==
Date: Wed, 9 Oct 2024 10:46:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: NeilBrown <neilb@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] fs/bcachefs: Fix __wait_on_freeing_inode() definition of
 waitqueue entry
Message-ID: <ZwZCyTx_HbPWZ8zJ@gmail.com>
References: <>
 <ZwY6gWsZCq_SdDKI@gmail.com>
 <172846224138.444407.2293511819402322368@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172846224138.444407.2293511819402322368@noble.neil.brown.name>


* NeilBrown <neilb@suse.de> wrote:

> On Wed, 09 Oct 2024, Ingo Molnar wrote:
> > * NeilBrown <neilb@suse.de> wrote:
> > 
> > > On Wed, 09 Oct 2024, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > > failed like this:
> > > > 
> > > > In file included from include/linux/fs.h:6,
> > > >                  from include/linux/highmem.h:5,
> > > >                  from include/linux/bvec.h:10,
> > > >                  from include/linux/blk_types.h:10,
> > > >                  from include/linux/bio.h:10,
> > > >                  from fs/bcachefs/bcachefs.h:188,
> > > >                  from fs/bcachefs/fs.c:4:
> > > > fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
> > > > fs/bcachefs/fs.c:281:31: error: initialization of 'long unsigned int *' from incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
> > > >   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
> > > 
> > > The fix we want is to replace that line with
> > >    struct wait_bit_queue_entry wait;
> > > I should have checked more carefully - sorry.
> > > 
> > > I guess we wait for rc3?
> > > 
> > > Kent: could you please make that change?  The inode_bit_waitqueue() does
> > > initialisation equivalent of DEFINE_WAIT_BIT() so you only need the declaration.
> > 
> > Since the breakage was introduced via tip:sched/core, I've applied the fix 
> > below.
> > 
> > Does this look good to you?
> 
> Perfect, thanks.

You are welcome!

	Ingo

