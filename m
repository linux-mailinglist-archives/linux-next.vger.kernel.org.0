Return-Path: <linux-next+bounces-6225-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DCEA88542
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 16:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08909563066
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 14:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A5E29E04F;
	Mon, 14 Apr 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WOAsdQdn"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EC329B78B;
	Mon, 14 Apr 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639015; cv=none; b=brUJNp/QCqfUx4Y1uKjf0sYkSzlZo6vBqY9LweMz1QJQtz4dKkt/CweMiUobsxEc2NgsjxCAztotnap+lR/q4FpjNvvv2AfavVZztOWJKFYC+mQVED4ZESJ7CyvULyyZIuTYmk9qWY4vsIonNriVa0I+x1FVNR/G7cBzKslCKtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639015; c=relaxed/simple;
	bh=mbPf+vDchA19GJ1Z9gNMNutplWkzsOIS8sovhZHGBKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRkQoxfpLWfchhswf8DWNsZfKS2S/9V0zboGw/bXr1l6xECbM3x7AYB5FUCmAhT/JR0xnEVJw/Q0f3725pE2+ilmej3JKpBOZZIOcacKizwqHdVDhD3jO5TXqpqbrvjkyMrbCoZ3Psg5ADwNuGCN7Q4Jo0sTSD5VgRoGIzrgM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WOAsdQdn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IXWuOR44+Sa15sGSrNgI6OipkCUMz1BkU1xH7+yGeKI=; b=WOAsdQdngdJT9R9CNs8YPyhWDg
	LWEw8T6BQxXUN13BJ5pR6bqc/crEDyuJX2eraqxSmDkGZJ4zLh7RTYpDU6iqDT85vb8KgkJ4YFPvK
	Qgmq9gvATp/bNujJ6sxbS2hwZZT+Kqib7xgs/p+Ngv6hCNcxFqla+41QueWLuD3FYLlHyrne1wvQg
	LIN6bqrjKzQZF/qphRr+icCFBGRaqo8pi5LuHxqt6y7Q10ZcSm5Eh9GgflJ4hWLBV9CuLsICtH9Ha
	9xB9tMEyBtXBWOylikyH5hEdfxJ7I+PRf3UY1s1gadYaww58Xs7x9VT1EjCBuvchNzlQt/DBbRqzS
	MLFf0grw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KIY-00000008Cwv-0wWP;
	Mon, 14 Apr 2025 13:56:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 076663003FF; Mon, 14 Apr 2025 15:56:30 +0200 (CEST)
Date: Mon, 14 Apr 2025 15:56:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: syzbot <syzbot+c2537ce72a879a38113e@syzkaller.appspotmail.com>,
	riel@surriel.com
Cc: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	luto@kernel.org, mingo@redhat.com, sfr@canb.auug.org.au,
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 switch_mm_irqs_off
Message-ID: <20250414135629.GA17910@noisy.programming.kicks-ass.net>
References: <67fce34b.050a0220.3483fc.0026.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67fce34b.050a0220.3483fc.0026.GAE@google.com>

On Mon, Apr 14, 2025 at 03:28:27AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b425262c07a6 Add linux-next specific files for 20250414
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10ddb398580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cc26bd6fced8397d
> dashboard link: https://syzkaller.appspot.com/bug?extid=c2537ce72a879a38113e
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/e04788e9f74f/disk-b425262c.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/32ac1bacc159/vmlinux-b425262c.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/99cc84c793ed/bzImage-b425262c.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c2537ce72a879a38113e@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:919 switch_mm_irqs_off+0x686/0x810 arch/x86/mm/tlb.c:918
> Modules linked in:
> CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc2-next-20250414-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> Workqueue: events once_deferred
> RIP: 0010:switch_mm_irqs_off+0x686/0x810 arch/x86/mm/tlb.c:918
> Code: 90 41 f7 c5 00 08 00 00 0f 84 ee fa ff ff 90 0f 0b 90 e9 e5 fa ff ff 90 0f 0b 90 e9 76 fe ff ff 90 0f 0b 90 e9 cc fb ff ff 90 <0f> 0b 90 4d 39 f4 0f 85 eb fb ff ff e9 31 fc ff ff 90 0f 0b 90 e9
> RSP: 0000:ffffc900000e7680 EFLAGS: 00010056
> RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffffffff816ffd4d
> RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88801b070940
> RBP: ffffc900000e7750 R08: ffff88801b070947 R09: 1ffff1100360e128
> R10: dffffc0000000000 R11: ffffed100360e129 R12: ffffffff8ee49240
> R13: ffff88801b070940 R14: ffffffff8ee49240 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff888124faa000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffff88823ffff000 CR3: 000000001b078000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  unuse_temporary_mm+0x9f/0x100 arch/x86/mm/tlb.c:1038
>  __text_poke+0x7b6/0xb40 arch/x86/kernel/alternative.c:2214
>  text_poke arch/x86/kernel/alternative.c:2257 [inline]
>  smp_text_poke_batch_finish+0x3e7/0x12c0 arch/x86/kernel/alternative.c:2565
>  arch_jump_label_transform_apply+0x1c/0x30 arch/x86/kernel/jump_label.c:146
>  static_key_disable_cpuslocked+0xd2/0x1c0 kernel/jump_label.c:240
>  static_key_disable+0x1a/0x20 kernel/jump_label.c:248
>  once_deferred+0x70/0xb0 lib/once.c:20
>  process_one_work kernel/workqueue.c:3238 [inline]
>  process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
>  worker_thread+0x870/0xd50 kernel/workqueue.c:3400
>  kthread+0x7b7/0x940 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>

So I can reproduce, and I I think I see what happens, except I'm
confused as to why the recently merged patches show this.

AFAIU what happens is that unuse_temporary_mm() clears the mm_cpumask()
for the current CPU, while switch_mm_irqs_off() then checks that the
mm_cpumask() bit is set for the current CPU.

This behaviour hasn't really changed since 209954cbc7d0 ("x86/mm/tlb:
Update mm_cpumask lazily") introduced both.

I'm not entirely sure what the best way forward is.. we can simply
delete the warning, or make use_temporary_mm() tag the special MMs
somehow and exclude them from the warning.



