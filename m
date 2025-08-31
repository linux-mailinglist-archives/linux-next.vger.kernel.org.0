Return-Path: <linux-next+bounces-8147-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCBEB3D432
	for <lists+linux-next@lfdr.de>; Sun, 31 Aug 2025 17:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 484D5173B65
	for <lists+linux-next@lfdr.de>; Sun, 31 Aug 2025 15:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4D426E716;
	Sun, 31 Aug 2025 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gwaIVq4d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941126F2A6;
	Sun, 31 Aug 2025 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756654824; cv=none; b=Mw3Tan/ccip4kJhkCSQjLte9sLlBSE0ZkmusfmrB7qQdPgksqZOTY/vDraJPBxniF2wj9twvBDmSNUREWkS508NR1o9Du8O/XJWILYhF96TavP74Nxzkewcg/R1wCv8xVNhg7T1b+XUukZoCuxZOOj13sjn6XqR27S94jIy673s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756654824; c=relaxed/simple;
	bh=4qYM50M1ruW12qVdEyVZT7wDFMW61qFZfd8Vcd3+Gl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8cFhCK6XZwjfRC+MZv1IxqN2JPpTPHbQQJ3oF50JmFsK1NY9VfYT1tk0dK9VpGj3TrZurFTDkSEXL9RUHaQjb46SQJ7D5WCCtLzzalRH/7lMELqnOsqPS9cqbf0A0LasWdLZGvWGrfRnUOi4qfgpdU+oLtd8vF+T5MMztAvtpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gwaIVq4d; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EAD3940E0192;
	Sun, 31 Aug 2025 15:40:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bzt1d1lsJFp1; Sun, 31 Aug 2025 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1756654814; bh=UevTnzICdteIzOhn6dJqcmMyhQOKhAKvJOp7WGbG2U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwaIVq4dv6B7A01+RclqqyndJe0kXjEldcveKKQe9JTqcLjjPN3+xLox+zK75ThUI
	 C+qXuq8eHSghaezPramxtQe2MhrM/4LFQN6k/VGq2rFOy8Q1M9CrtOoJ13L5/uE5QZ
	 zvAgskkXK7vW4gOcSH9wDiM+CkUN3ts76rnulUHy8BP3TujgALc5RSJLUY4QWlUhIq
	 E94hEtN85FohOyQDMmgox9HXMgvODpagd2Jvi1z6EambcDZ4WNF5uVFQW54+vu6WqO
	 9LC77l9Rfo9ed/6zTVrdWGExvzCuGESOfvr/wD5zlkcwQAs0MlMjU1ZAKwgET6JK2b
	 PEvD9mEFFEWsjkBK0QghH5sXxhyIg5DBzHM/kYOAFKXnCm/SYqoQ0X8BTZBDr47DUC
	 qCIU5IrBC3xyenLoS9ELA7SbWdGlIJImXZdUfrYXPuWldtENzpga8WFCK3zAmwmz+o
	 GhVFSvpJkyfmJC9NHW7ku70wLDV7QiRr4qZwNuhHzhrVu4XgVYmpfJSK6pDawDCsGS
	 aSI8Z/bK9Sd4YHf89b12tUWbcKkgvqPBh/PymVaHm/q+6FwFVq862jeck/rbpQWpTH
	 idZWYMSGlPHkoMNS/4hsynyGOhLSnLOo8nkFsWKAOj6N9RWfI3u6vgt4BiKwDrE2t1
	 QgjLZb5EvEgdFs6e2ZE9c3sI=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 7C2A840E0174;
	Sun, 31 Aug 2025 15:40:01 +0000 (UTC)
Date: Sun, 31 Aug 2025 17:39:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Bert Karwatzki <spasswolf@web.de>
Cc: seanjc@google.com, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Jakub Kicinski <kuba@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	torvalds@linux-foundation.org, x86@kernel.org, tglx@linutronix.de
Subject: Re: (Re)boot hangs and refcount errors on next-20250829
Message-ID: <20250831153941.GCaLRsvf1V_ST2GPAd@fat_crate.local>
References: <20250831141426.2786-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250831141426.2786-1-spasswolf@web.de>

On Sun, Aug 31, 2025 at 04:14:24PM +0200, Bert Karwatzki wrote:
> I think I hit the the same error (and some more ...) when booting next-20250829
> on my amd64 laptop (no VMs and no kexec were used here):
> 
> When I try booting next-20250829 on my debian stable(trixie) amd64 system the boot
> process hangs every few attempts (without any log messages recorded). When the
> boot process succeeds the following error message appears in dmesg:
> 
> [    8.337248] [     T44] ------------[ cut here ]------------
> [    8.337250] [     T44] WARNING: kernel/futex/core.c:1604 at futex_ref_rcu+0xe8/0x100, CPU#6: rcuc/6/44

I believe that got fixed, pls try:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=locking/urgent

which got updated to contain the fix for the warning above.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

