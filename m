Return-Path: <linux-next+bounces-7035-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A34ACCD3A
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 20:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37401189790E
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 18:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2A51E885A;
	Tue,  3 Jun 2025 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZA06n8k"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE11DDC1A
	for <linux-next@vger.kernel.org>; Tue,  3 Jun 2025 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976128; cv=none; b=EyrBp9VplQZEj5pWbjDm/ubA9R/LIVuST3z2xLuk3wfQU/mjmGQbrURtUCxY7qGH1FnyJsX8eFLhgSeJuJABWQazRBf2V8LwLORhg4DJR42k4cvOHgktqTMG9omwDXPjmubShIT3ZhCK0VGsqemNJyOio/P/E3NtpGmhzJ8p1UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976128; c=relaxed/simple;
	bh=RgbiVc8eou7fsgBphwR5e56GYKJ8u0X2Luh6j2TfV58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCL7dHnIHDD5EugvVhU9E/zck5/dFYWjIWoELo7zDo0Bs6cn1HxnSpHq4JDAMhHT8ScGHBKk1RDQEjEA5a7LrC5zp95ntGMNSQ/mbekDmgShsvjG0bMoTLBzuFmrA7Kw2KWQw88qSbkOMThe52f5yAsGcHoBN4dZjZQZNQlFQQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZA06n8k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0634CC4CEED;
	Tue,  3 Jun 2025 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748976128;
	bh=RgbiVc8eou7fsgBphwR5e56GYKJ8u0X2Luh6j2TfV58=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DZA06n8kio1jPnbAjFpE5qGOpAd8B3IroFosWc+7z4W9bAkSY+B1LYwSS+9tdFDgB
	 6HajCYLMfV1klsPLfpUCQvBGPl+5qe4Q/wyz27FsjQMBdTqb36COW3QnNOQ7NJkNhJ
	 4fcqIe7xtIHqg3S9V5GiV/8Q2vik74JxodBuUShg3XL6kCOxv6tdEIxTMB++64fPdQ
	 rbwiAg5Au2gcHrA7wCED/91q/7bO7SKzjuOr2An6QYIv2RO/cTrQ+c4ZsDOcsJCVQD
	 IIaDV7sm2JUUik2xbKx2bQ/8gReHP3ym7oOmTd7fa+/WJ58k9rAEjgJKS8DOCt4GSb
	 u+LU2k75Q1XZA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A5E19CE077D; Tue,  3 Jun 2025 11:42:07 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:42:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: JP Kobryn <inwardvessel@gmail.com>
Cc: klarasmodin@gmail.com, tj@kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000020
Message-ID: <d3210dc8-6163-4cbf-9772-28e28e7a46b4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <04ca279b-8c96-4072-9b19-0001e7da5124@paulmck-laptop>
 <adf2842b-a5a4-4a7c-86b7-8bcfbf2b7b01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adf2842b-a5a4-4a7c-86b7-8bcfbf2b7b01@gmail.com>

On Tue, Jun 03, 2025 at 11:26:23AM -0700, JP Kobryn wrote:
> Hi Paul,
> On 6/3/25 8:02 AM, Paul E. McKenney wrote:
> > Hello!
> > 
> > Running rcutorture scenario SRCU-T on next-20250602 gets me the following
> > splat, with CONFIG_SMP=y and CONFIG_PROVE_LOCKING=y appearing to be what
> > exposes this issue (alleged fix at end of this email):
> > 
> > [    0.584099] BUG: kernel NULL pointer dereference, address: 0000000000000020
> > [    0.584530] #PF: supervisor write access in kernel mode
> > [    0.584530] #PF: error_code(0x0002) - not-present page
> > [    0.584530] PGD 0 P4D 0
> > [    0.584530] Oops: Oops: 0002 [#1] PTI
> > [    0.584530] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-next-20250530 #5184 NONE
> > [    0.584530] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> > [    0.584530] RIP: 0010:lockdep_init_map_type+0x1c/0x230
> > [    0.584530] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 41 55 41 89 cd 41 54 49 89 d4 8b 15 fc 59 f1 02 55 48 89 fd 8b 44 24 20 <48> c7 47 08 00 00 00 00 48 c7 47 10 00 00 00 00 85 d2 0f 84 a2 00
> > [    0.584530] RSP: 0000:ffffffff83a03e30 EFLAGS: 00010246
> > [    0.584530] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> > [    0.584530] RDX: 0000000000000000 RSI: ffffffff837ff493 RDI: 0000000000000018
> > [    0.584530] RBP: 0000000000000018 R08: 0000000000000002 R09: 0000000000000000
> > [    0.584530] R10: 0000000000000001 R11: 0000000000001f20 R12: ffffffff850436e0
> > [    0.584530] R13: 0000000000000000 R14: ffffffff83b66da8 R15: ffffffff83c00ec0
> > [    0.584530] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> > [    0.584530] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.584530] CR2: 0000000000000020 CR3: 0000000012a50000 CR4: 00000000000006f0
> > [    0.584530] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [    0.584530] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [    0.584530] Call Trace:
> > [    0.584530]  <TASK>
> > [    0.584530]  __raw_spin_lock_init+0x3a/0x60
> > [    0.584530]  ss_rstat_init+0x4b/0x80
> > [    0.584530]  cgroup_init_subsys+0x170/0x1c0
> > [    0.584530]  cgroup_init+0x3cb/0x460
> > [    0.584530]  start_kernel+0x689/0x770
> > [    0.584530]  x86_64_start_reservations+0x18/0x30
> > [    0.584530]  x86_64_start_kernel+0x102/0x120
> > [    0.584530]  common_startup_64+0xc0/0xc8
> > [    0.584530]  </TASK>
> > [    0.584530] Modules linked in:
> > [    0.584530] CR2: 0000000000000020
> > [    0.584530] ---[ end trace 0000000000000000 ]---
> > 
> > This bisects to the following commit:
> > 
> > 731bdd97466a ("cgroup: avoid per-cpu allocation of size zero rstat cpu locks")
> > 
> > Part of the issue is that the comment's assertion that "arch_spinlock_t
> > is defined as an empty struct" can be inaccurate.  First, the
> > cgroup_subsys structure's ->rstat_ss_cpu_lock field is not an
> > arch_spinlock_t, but rather a raw_spinlock_t.  Although this is empty
> > in production kernels built with CONFIG_SMP=n, in debugging kernels
> > built with either CONFIG_DEBUG_SPINLOCK=y or (in the case of SRCU-T)
> > CONFIG_DEBUG_LOCK_ALLOC=y (which is selected in kernels built with
> > CONFIG_PROVE_LOCKING=y) the raw_spinlock_t structure has non-zero size.
> 
> This was fixed with a patch [0] that was applied to the cgroup tree's
> "for-6.16-fixes" branch. It should make its way to linux-next soon.
> 
> [0]
> https://lore.kernel.org/all/20250528235130.200966-1-inwardvessel@gmail.com/

Thank you, and apologies for the redundant report!

On to the next -next failure.  ;-)

							Thanx, Paul

