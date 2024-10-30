Return-Path: <linux-next+bounces-4541-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EAE9B6F93
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 22:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFF12B219D2
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 21:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71FE1C3F0E;
	Wed, 30 Oct 2024 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VmDTSfIh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Xj8E1uEJ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VmDTSfIh";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Xj8E1uEJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B281BD9E8;
	Wed, 30 Oct 2024 21:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730324941; cv=none; b=AsYPjUr5xQldxNZElhJDPapt8MzQ+DNAHJjGFcPCjAGjvbSC1+rdw9Tr4N8bQ4e6CIZaNX3bNV7Ap2RL92WsgDUAvQbeJA+ZjpQRyP/wcCAZZo03udFjLu2j26Zalpng/b6OB1DuLLECOezRwfk44rz0lkgf1KDwsveoXdDMHu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730324941; c=relaxed/simple;
	bh=N2h6GxQ9mevybEktMBvmIcYJX7OZ4S8tI5/Upa3MHYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXwwnqZ6sruYYltmbJaqMrH8N+9IzhoqlJhRiVCKjpZ2JkmxBjHUOV0NBDJF4VmcViCmFoUG71ZlSF37kz1Fu9KWd36t/+nv4lzXySh+BmEU8DEU53YFy+h/Q/TSqwce99vw+wadhhwJ2rppRlFoag7pQOduk5IP4rC47L4HdxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VmDTSfIh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Xj8E1uEJ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VmDTSfIh; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Xj8E1uEJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 17EFC1F7CC;
	Wed, 30 Oct 2024 21:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1730324931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wS6Qj4yMwAu8JhKUkSlwL1XLNze6T0zoqEv8RVutyPI=;
	b=VmDTSfIhNk23K/rwty3EU7n0Xb0c2aG1w1I1GVeVVrq2tumCt4eFWHWqdaSHdq+CT+aU3K
	Na8jZGd2ZciFS/Itc2piDW3nSVXyKU7f3qrYGFitwvHpSJcD3bdqyBPaoVPVpQzg86jwEI
	seffK0QvUbtM1tM+VtFzZjFCiPAn80E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1730324931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wS6Qj4yMwAu8JhKUkSlwL1XLNze6T0zoqEv8RVutyPI=;
	b=Xj8E1uEJTI8SL+SNwJHNfvsNvIPMsy4pFTxDYz0W/thWSnHyfGm5yXmFevwBvOhCTHI8yo
	vWefvAIEAgwCeaCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1730324931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wS6Qj4yMwAu8JhKUkSlwL1XLNze6T0zoqEv8RVutyPI=;
	b=VmDTSfIhNk23K/rwty3EU7n0Xb0c2aG1w1I1GVeVVrq2tumCt4eFWHWqdaSHdq+CT+aU3K
	Na8jZGd2ZciFS/Itc2piDW3nSVXyKU7f3qrYGFitwvHpSJcD3bdqyBPaoVPVpQzg86jwEI
	seffK0QvUbtM1tM+VtFzZjFCiPAn80E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1730324931;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wS6Qj4yMwAu8JhKUkSlwL1XLNze6T0zoqEv8RVutyPI=;
	b=Xj8E1uEJTI8SL+SNwJHNfvsNvIPMsy4pFTxDYz0W/thWSnHyfGm5yXmFevwBvOhCTHI8yo
	vWefvAIEAgwCeaCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E03AA13A7C;
	Wed, 30 Oct 2024 21:48:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZEhXNsKpImfeBQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 30 Oct 2024 21:48:50 +0000
Message-ID: <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
Date: Wed, 30 Oct 2024 22:48:50 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] -next lockdep invalid wait context
Content-Language: en-US
To: paulmck@kernel.org, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Cc: sfr@canb.auug.org.au, bigeasy@linutronix.de, longman@redhat.com,
 boqun.feng@gmail.com, elver@google.com, cl@linux.com, penberg@kernel.org,
 rientjes@google.com, iamjoonsoo.kim@lge.com, akpm@linux-foundation.org
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[canb.auug.org.au,linutronix.de,redhat.com,gmail.com,google.com,linux.com,kernel.org,lge.com,linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 10/30/24 22:05, Paul E. McKenney wrote:
> Hello!

Hi!

> The next-20241030 release gets the splat shown below when running
> scftorture in a preemptible kernel.  This bisects to this commit:
> 
> 560af5dc839e ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING")
> 
> Except that all this is doing is enabling lockdep to find the problem.
> 
> The obvious way to fix this is to make the kmem_cache structure's
> cpu_slab field's ->lock be a raw spinlock, but this might not be what
> we want for real-time response.

But it's a local_lock, not spinlock and it's doing local_lock_irqsave(). I'm
confused what's happening here, the code has been like this for years now.

> This can be reproduced deterministically as follows:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --torture scf --allcpus --duration 2 --configs PREEMPT --kconfig CONFIG_NR_CPUS=64 --memory 7G --trust-make --kasan --bootargs "scftorture.nthreads=64 torture.disable_onoff_at_boot csdlock_debug=1"
> 
> I doubt that the number of CPUs or amount of memory makes any difference,
> but that is what I used.
> 
> Thoughts?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> [   35.659746] =============================
> [   35.659746] [ BUG: Invalid wait context ]
> [   35.659746] 6.12.0-rc5-next-20241029 #57233 Not tainted
> [   35.659746] -----------------------------
> [   35.659746] swapper/37/0 is trying to lock:
> [   35.659746] ffff8881ff4bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x49/0x1b0
> [   35.659746] other info that might help us debug this:
> [   35.659746] context-{2:2}
> [   35.659746] no locks held by swapper/37/0.
> [   35.659746] stack backtrace:
> [   35.659746] CPU: 37 UID: 0 PID: 0 Comm: swapper/37 Not tainted 6.12.0-rc5-next-20241029 #57233
> [   35.659746] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> [   35.659746] Call Trace:
> [   35.659746]  <IRQ>
> [   35.659746]  dump_stack_lvl+0x68/0xa0
> [   35.659746]  __lock_acquire+0x8fd/0x3b90
> [   35.659746]  ? start_secondary+0x113/0x210
> [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> [   35.659746]  lock_acquire+0x19b/0x520
> [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> [   35.659746]  ? __pfx_lock_acquire+0x10/0x10
> [   35.659746]  ? __pfx_lock_release+0x10/0x10
> [   35.659746]  ? lock_release+0x20f/0x6f0
> [   35.659746]  ? __pfx_lock_release+0x10/0x10
> [   35.659746]  ? lock_release+0x20f/0x6f0
> [   35.659746]  ? kasan_save_track+0x14/0x30
> [   35.659746]  put_cpu_partial+0x52/0x1b0
> [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> [   35.659746]  ? __pfx_scf_handler_1+0x10/0x10
> [   35.659746]  __flush_smp_call_function_queue+0x2d2/0x600

How did we even get to put_cpu_partial directly from flushing smp calls?
SLUB doesn't use them, it uses queue_work_on)_ for flushing and that
flushing doesn't involve put_cpu_partial() AFAIK.

I think only slab allocation or free can lead to put_cpu_partial() that
would mean the backtrace is missing something. And that somebody does a slab
alloc/free from a smp callback, which I'd then assume isn't allowed?

> [   35.659746]  __sysvec_call_function_single+0x50/0x280
> [   35.659746]  sysvec_call_function_single+0x6b/0x80
> [   35.659746]  </IRQ>
> [   35.659746]  <TASK>
> [   35.659746]  asm_sysvec_call_function_single+0x1a/0x20
> [   35.659746] RIP: 0010:default_idle+0xf/0x20
> [   35.659746] Code: 4c 01 c7 4c 29 c2 e9 72 ff ff ff 90 90 90 90 90 90 90 90 90
>  90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 33 80 3e 00 fb f4 <fa> c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
> [   35.659746] RSP: 0018:ffff888100a9fe68 EFLAGS: 00000202
> [   35.659746] RAX: 0000000000040d75 RBX: 0000000000000025 RCX: ffffffffab83df45
> [   35.659746] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffa8a5f7ba
> [   35.659746] RBP: dffffc0000000000 R08: 0000000000000001 R09: ffffed103fe96c3c
> [   35.659746] R10: ffff8881ff4b61e3 R11: 0000000000000000 R12: ffffffffad13f1d0
> [   35.659746] R13: 1ffff11020153fd2 R14: 0000000000000000 R15: 0000000000000000
> [   35.659746]  ? ct_kernel_exit.constprop.0+0xc5/0xf0
> [   35.659746]  ? do_idle+0x2fa/0x3b0
> [   35.659746]  default_idle_call+0x6d/0xb0
> [   35.659746]  do_idle+0x2fa/0x3b0
> [   35.659746]  ? __pfx_do_idle+0x10/0x10
> [   35.659746]  cpu_startup_entry+0x4f/0x60
> [   35.659746]  start_secondary+0x1bc/0x210
> [   35.659746]  common_startup_64+0x12c/0x138
> [   35.659746]  </TASK>


