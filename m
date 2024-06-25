Return-Path: <linux-next+bounces-2672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90503917002
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 20:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BD492824C4
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 18:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B60179203;
	Tue, 25 Jun 2024 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2xGHTXdx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h88RpE1v"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D793178CFD;
	Tue, 25 Jun 2024 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719339551; cv=none; b=o8MJDd6UkaBibDL0BkzxaijzvcsjalAlt9AdzOwNPFE6XIjAGtCvei4AXbfFasc1YKaN05dMw6v+7ongUP/h1jiSvVfz0ia4+aNcMavQhu8k4bMTmOnLaJekkssWX0w+0REbY37lq666k64ddhE8G3TLvetIz62nPHy8EsJj8WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719339551; c=relaxed/simple;
	bh=sWfgKQAKWRN1bxsTLtOx+QXxi/EMIY4Oaiof9qYsDj0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VCBuUok1HWDV3gPypMIibkEwwNhe5oUnrrzhHF5MpWcaFylt3bTfvygbbOqUaLNbLtAWdHyuHf7apbTUJ5x9C/ugkhOoM903MNKZ01/chQWWw7QgySRqP6YWmZakv/w7dtaDnh85bpM6N2RCr89dnJ40ipPD0vVa6MwMlNq3CGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2xGHTXdx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h88RpE1v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719339548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Izt7X2Ump6bqomeHDq6AkRm+hADEbBol4mL7qD9AqZ0=;
	b=2xGHTXdxgeoXUHdLMlEO57cOvI+tUUooyTIo2Jw/Taj486JxnbNnuh/hz2VPwBpwlvueH0
	7m9wnX3LBv53F2lZmHasiSIgwr+c0roXW9epqjIk6Zx6XXORPEtMzP8IbWbbjEpysQYEjV
	EEt3erl+QOVfeuxa4qczlE8Io2RPKXzOhJActzZvMBVuEqweSvGHqADzOIntwHETpusw3h
	jZB3tCcV3GpugsowL8Njc7F+j5LhVuEzPBfhPbACQe9gnok0Dv6e0XloWFBnkissO47MHV
	1ouOqCDm810r0qOzNlIsI/7/nNFtoDY23LnOHuoiHCNSflyknKA7ZLCbUsdbOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719339548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Izt7X2Ump6bqomeHDq6AkRm+hADEbBol4mL7qD9AqZ0=;
	b=h88RpE1vSLOZFz383Iitr9GgfXBns0bFlLVV4VG+/b8EuPsMQkmRzLXTJkINOrMB0D9F6n
	HHpy9hzyE5Gu+pDw==
To: Mark Brown <broonie@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
In-Reply-To: <ZnrXSitgAnCO0EG9@sirena.org.uk>
References: <ZnrXSitgAnCO0EG9@sirena.org.uk>
Date: Tue, 25 Jun 2024 20:19:08 +0200
Message-ID: <87sex051ib.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 25 2024 at 15:42, Mark Brown wrote:

> Hi all,
>
> After merging the tip tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:33:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'dw_apb_ictl_handle_irq'
>    33 | static void __irq_entry dw_apb_ictl_handle_irq(struct pt_regs *regs)
>       |                         ^~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:15:
> /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c: In function 'dw_apb_ictl_init':
> /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:206:32: error: 'dw_apb_ictl_handle_irq' undeclared (first use in this function); did you mean 'dw_apb_ictl_init'?
>   206 |                 set_handle_irq(dw_apb_ictl_handle_irq);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/irq.h:1331:23: note: in definition of macro 'set_handle_irq'
>  1331 |                 (void)handle_irq;               \
>       |                       ^~~~~~~~~~
> /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:206:32: note: each undeclared identifier is reported only once for each function it appears in
>   206 |                 set_handle_irq(dw_apb_ictl_handle_irq);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/irq.h:1331:23: note: in definition of macro 'set_handle_irq'
>  1331 |                 (void)handle_irq;               \
>       |                       ^~~~~~~~~~
>
>
> Caused by commit
>
>   7cc4f309c933ec5d ("irqchip/dw-apb-ictl: Support building as module")
>
> (I think, I didn't specifically verify.)  I have used the tree from
> 20240624 instead.

It comes from irq/core. It'll be gone tomorrow.

