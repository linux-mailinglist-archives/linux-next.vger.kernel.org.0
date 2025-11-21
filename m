Return-Path: <linux-next+bounces-9149-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B4C7BD0E
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 22:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 10209353A83
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 21:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE922F3626;
	Fri, 21 Nov 2025 21:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoOs6clk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438902F1FDF;
	Fri, 21 Nov 2025 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763762304; cv=none; b=lTPQ2BPMXkzJ/kYPgVJ2U6j1cvbiMDky/x98whuEedrV6+3SrYAq0xX/lOqz6OulnAlYSktzamIez4y+E0TkqzSXznxBNBMQQ7NygXF9AAFogcxvRV4Ehj0gHBv/S26ce/oWItCQ3m2ZLUuqScS2N2x2gALwLM2g7ePgjeSTc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763762304; c=relaxed/simple;
	bh=n+kovUuGccZ0u970pTw2K5c8zERrymNbuteXqtMGhTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXR5HX0qBPviw2aGdX+8Bcywuun/3BTKZ0TqMfIn1XSSMbTEDsbmhvnmSN4euvlEOth2XRYJrqRgWwGZQD5a0mUZrhY8g6oN7eqAdIHZf3FRNyL6sdcBg4AGwgT5J8bcGI1HQl6+GsiUU6dKvH7e1IxzLmWT7tCZAxV0JB4OsC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoOs6clk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FF2C4CEF1;
	Fri, 21 Nov 2025 21:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763762303;
	bh=n+kovUuGccZ0u970pTw2K5c8zERrymNbuteXqtMGhTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoOs6clkqz0FgeJj7lCZcoTKH8LLaQySgVIy5EJU0NS7G2ehbDDkYvDYePUYjiN61
	 Y3Zz9rvGz9cS/wEKowkQC2MXxSr3RdXcIuHhb+emede96EBJg/z9NT3yguUxTXJ8u7
	 u2USUklIACxR4SYp1X8dAodMY4xGrKIiU17f/qAIuDx6gfAjgC3Ou0NrPNQzhv4amp
	 FyzHldRF3Mndm8ywEth1A2oejpmjUzJimpxJ3PwNF4aU9Aa+li87c0NV0xYS/7F64F
	 2yULUbkco2w6DKA2BIT0R+sl/5jcU5xqbCIYZ/Y/t/fwIsRokWXCZKzhuYwMu4uUhu
	 msnkoVXdUELHw==
Date: Fri, 21 Nov 2025 14:58:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <llong@redhat.com>
Subject: Re: linux-next: boot warning from the final tree
Message-ID: <20251121215819.GA1374726@ax162>
References: <20251117202214.4f710f02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117202214.4f710f02@canb.auug.org.au>

On Mon, Nov 17, 2025 at 08:22:14PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next qemu boot (powerpc pseries_le_defconfig) produced
> this warning:
> 
>   ftrace: allocating 48915 entries in 288 pages
>   ftrace: allocated 287 pages with 6 groups
>   ------------[ cut here ]------------
>   DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>   WARNING: kernel/locking/mutex.c:156 at mutex_lock+0xcc/0x100, CPU#0: swapper/0/0
>   Modules linked in:
>   CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-rc6-09359-g921087e37218 #1 VOLUNTARY 
>   Hardware name: IBM pSeries (emulated by qemu) POWER9 (architected) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
>   NIP:  c00000000148041c LR: c000000001480418 CTR: 0000000000000000
>   REGS: c000000002957a10 TRAP: 0700   Not tainted  (6.18.0-rc6-09359-g921087e37218)
>   MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 24022240  XER: 00000000
>   CFAR: c00000000021123c IRQMASK: 3 
>   GPR00: c000000001480418 c000000002957cb0 c000000001a3a100 0000000000000028 
>   GPR04: 00000000ffffe04a c0000000026abe88 0000000000000001 000000000000004b 
>   GPR08: c0000000026abd28 0000000000000000 0000000000000000 0000000044022240 
>   GPR12: 0000000000000000 c000000002ae9000 0000000000000000 0000000001bff430 
>   GPR16: 000000007e68f070 c00000007f79c480 c000000002969160 c000000002a0f5d8 
>   GPR20: c0000000026a1138 c0000000026a1120 0000000000000000 c0000000019541b8 
>   GPR24: c00000000218a480 c00000000296e1d0 000000007d612000 c00000000380be10 
>   GPR28: c00000000380be20 c00000000380be00 c000000002640100 c00000000380be20 
>   NIP [c00000000148041c] mutex_lock+0xcc/0x100
>   LR [c000000001480418] mutex_lock+0xc8/0x100
>   Call Trace:
>   [c000000002957cb0] [c000000001480418] mutex_lock+0xc8/0x100 (unreliable)
>   [c000000002957d20] [c00000000024a60c] alloc_workqueue_noprof+0x38c/0x8ec
>   [c000000002957e00] [c00000000203018c] workqueue_init_early+0x4d8/0x6ec
>   [c000000002957f30] [c000000002004448] start_kernel+0x74c/0xa4c
>   [c000000002957fe0] [c00000000000e99c] start_here_common+0x1c/0x20
>   Code: 4182ffb4 3d2200f3 392971e4 81290000 2c090000 4082ffa0 3c82ffe0 3c62ffe0 3884bfe0 3863bf68 4ad90d45 60000000 <0fe00000> 4bffff80 60000000 60000000 
>   ---[ end trace 0000000000000000 ]---
>   rcu: Hierarchical RCU implementation.
> 
> I have no idea what caused this.

I noticed this warning in my QEMU boot tests as well and bisected it
down to commit 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()").

  $ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc64-linux- clean ppc64le_guest_defconfig zImage.epapr

  $ curl -LSs https://github.com/ClangBuiltLinux/boot-utils/releases/download/20241120-044434/ppc64le-rootfs.cpio.zst | zstd -d >rootfs.cpio

  $ qemu-system-ppc64 \
      -display none \
      -nodefaults \
      -device ipmi-bmc-sim,id=bmc0 \
      -device isa-ipmi-bt,bmc=bmc0,irq=10 \
      -machine powernv \
      -kernel arch/powerpc/boot/zImage.epapr \
      -initrd rootfs.cpio \
      -m 2G \
      -serial mon:stdio
  ...
  [    0.000000][    T0] Linux version 6.18.0-rc2-00016-g3572e2edc7b6 (nathan@ax162) (powerpc64-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45) #1 SMP Fri Nov 21 13:55:26 MST 2025
  ...
  [    0.000000][    T0] ------------[ cut here ]------------
  [    0.000000][    T0] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
  [    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/locking/mutex.c:156 mutex_lock+0xd4/0x100
  [    0.000000][    T0] Modules linked in:
  [    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-rc2-00016-g3572e2edc7b6 #1 VOLUNTARY
  [    0.000000][    T0] Hardware name: IBM PowerNV (emulated by qemu) POWER10 0x801200 opal:v7.1-106-g785a5e307 PowerNV
  [    0.000000][    T0] NIP:  c0000000014b2974 LR: c0000000014b2970 CTR: 0000000000000000
  [    0.000000][    T0] REGS: c0000000029979f0 TRAP: 0700   Not tainted  (6.18.0-rc2-00016-g3572e2edc7b6)
  [    0.000000][    T0] MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 24000220  XER: 00000000
  [    0.000000][    T0] CFAR: c00000000021ed7c IRQMASK: 3
  [    0.000000][    T0] GPR00: c0000000014b2970 c000000002997c90 c000000001a78100 0000000000000028
  [    0.000000][    T0] GPR04: 00000000ffffe04a c0000000026ed958 0000000000000001 000000000000004b
  [    0.000000][    T0] GPR08: c0000000026ed7f0 0000000000000000 0000000000000000 0000000044000220
  [    0.000000][    T0] GPR12: c0000000026ed880 c000000002ba0000 0000000000000018 0000000000000000
  [    0.000000][    T0] GPR16: 0000000000000000 c0000000026e2b88 c0000000026e2ba0 c00000007be5a400
  [    0.000000][    T0] GPR20: c0000000029ed0e0 c000000002aaf7e0 0000000000000000 c0000000019911b8
  [    0.000000][    T0] GPR24: c0000000021ca400 c0000000029f2150 0000000079c90000 c000000003081410
  [    0.000000][    T0] GPR28: c000000003081420 c000000003081400 c0000000021cce98 c000000003081420
  [    0.000000][    T0] NIP [c0000000014b2974] mutex_lock+0xd4/0x100
  [    0.000000][    T0] LR [c0000000014b2970] mutex_lock+0xd0/0x100
  [    0.000000][    T0] Call Trace:
  [    0.000000][    T0] [c000000002997c90] [c0000000014b2970] mutex_lock+0xd0/0x100 (unreliable)
  [    0.000000][    T0] [c000000002997d10] [c000000000258ddc] alloc_workqueue_noprof+0x44c/0x8c8
  [    0.000000][    T0] [c000000002997df0] [c00000000203080c] workqueue_init_early+0x4e4/0x700
  [    0.000000][    T0] [c000000002997f30] [c000000002004388] start_kernel+0x638/0x938
  [    0.000000][    T0] [c000000002997fe0] [c00000000000e99c] start_here_common+0x1c/0x20
  [    0.000000][    T0] Code: 4182ffa8 3d2200f8 3929d134 81290000 2c090000 4082ff94 3c82ffde 3c62ffde 38846d98 38636d20 4ad6c32d 60000000 <0fe00000> e9410068 4bffff70 38210080
  [    0.000000][    T0] ---[ end trace 0000000000000000 ]---
  ...

At the parent change, there is no warning.

Cheers,
Nathan

