Return-Path: <linux-next+bounces-6731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B455CAB4CEC
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 09:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58DA519E4982
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 07:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337ED1F0E32;
	Tue, 13 May 2025 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DVjBMxid";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SOhWVJpy"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DA26AFB;
	Tue, 13 May 2025 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121990; cv=none; b=tw/PzTltOsOkS5kJfm+jEI/b+ZVI0j5LmdpOJ2E+nIXpvoCyjdfgDJoxLPQpW6H4tiUkltCbiXkQ4pFqOtWSap5vsramOEOCcORH22OQUYyvkBdF95czNo0jZrvj7aCW50uvdYGSM6ij3VHyiCj4HI1j5CAF2IjI0fogG4GqImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121990; c=relaxed/simple;
	bh=WvLCTR3fNxN4J7wyKalvtVWgPuKFp8nP0TrLSLy8sWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l6De+AW9j8c1C6c1NVM9zYuAx3gXc3g+Y/XQ4YKFfZITLseBLQZTD6h2Nen+7qsZN0zlAo2iGjH2WDv8bm1fPdKggK4bhoB8dOvfbSIwxgKRK1k3C/3VUla3Cl0VGAts8r8avOUoLNfLajDlwlvOYqgK0EwlAwTKFVmTkcsKC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DVjBMxid; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SOhWVJpy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747121986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlNVEwGL4cI2wJsUZRWNYyvdArHzwAhJF0ypQd+HF5A=;
	b=DVjBMxid1ViGD3poxgE+hQWyDzBxU4mR4V2C21tf4donG6ySbAneinGo6yScjsIazZJmPb
	qXYTAVfanPgKe2ECZeMe2baQgOXSbY82WXqWa/syv+nnrQtB8IVVtNZyemAffOapjRisWz
	Kf2ADHL+nCPl+kjIHwhJgQCeQfvXMxHUPZhLA4/YSutmh/JpsEta7SOgu01UBAtQlWqS17
	KwYtB9OertqJWhSB5d/DvBObaqkr2KshLKKaLVbyyJEquXSW59SfSO1dX0Fi9jJI4hWpSp
	bWhyrtGUFehcA1Q9UQeNi++Oz+3FxdnMib0Zg8zW8LHQWeVwhgCiJOsA4DX2ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747121986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlNVEwGL4cI2wJsUZRWNYyvdArHzwAhJF0ypQd+HF5A=;
	b=SOhWVJpyXL34/xMJLrsJaJfZ4M47tNH6FL8veq6syJTBMNymlISJ3sgSraZh6iAvEAJwxy
	1jMl6j8seS544bCQ==
To: paulmck@kernel.org, Marco Elver <elver@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [BUG] sleeping function called from invalid context at
 ./include/linux/sched/mm.h:321
In-Reply-To: <a5c939c4-b123-4b2f-8a22-130e508cbcce@paulmck-laptop>
References: <a5c939c4-b123-4b2f-8a22-130e508cbcce@paulmck-laptop>
Date: Tue, 13 May 2025 09:39:45 +0200
Message-ID: <87o6vxj6wu.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 12 2025 at 16:47, Paul E. McKenney wrote:
> I ran this on x86 with clang version 19.1.7 (CentOS 19.1.7-1.el9).
>
> See below for the full splat.  The TINY02 and SRCU-T scenarios are unique
> in setting both CONFIG_SMP=n and CONFIG_PROVE_LOCKING=y.
>
> Bisection converges here:
>
> c836e5a70c59 ("genirq/chip: Rework irq_set_msi_desc_off()")
>
> The commit reverts cleanly, but results in the following build error:
>
> kernel/irq/chip.c:98:26: error: call to undeclared function 'irq_get_desc_lock'
>
> Thoughts?

Smells like what the top commit of the irq/core branch fixes:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core

