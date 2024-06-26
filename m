Return-Path: <linux-next+bounces-2676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D013C918032
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 13:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EB931C239BB
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 11:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CBE18130E;
	Wed, 26 Jun 2024 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="New132iK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE91180A9F;
	Wed, 26 Jun 2024 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402637; cv=none; b=PyVavWz6h2iuLIHmV/8ntgjDdOaMPKGQQu7hsKLIbdWy+QiLXVzv6J7y7RN+wQEHz4Fpb/fqqtRud0NsFqyVN2Dlw7gCWcqihFKsLrCutzuK+8nfFrNrImxazy9+Xd8cjf/RsZkCWN3OHfZsuPxX2gX/y9ZHY06TWMFIPiQ6NE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402637; c=relaxed/simple;
	bh=SaIU/2dEnekDrk5wU+9WLeL+H51aE9uNonF6YvUiL5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoMoC/bwvd0vHMaaTXa+VmSxYfpOHK07Tc8q8s3IiZ7z9vI5kAaDZ6PSHh7Fw7bwWXpdRZDW1GTNKuV9i5KuAB0+fm2WPba/bToEDcImhk1EbtfYB2+WHBQyNzoQKtlzTaLPh69VB5jsfTXlEku7MwXKfEUkYVSW2EL7pImZFS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=New132iK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD8DC32786;
	Wed, 26 Jun 2024 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719402636;
	bh=SaIU/2dEnekDrk5wU+9WLeL+H51aE9uNonF6YvUiL5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=New132iK9iJBrUPriS8BqUxxVo0eBII6Cu/xNK+kGcDNw/SJLjttzSoe68O6CRtFe
	 kaSnYW8z9OUitusGnpXBPfP+mJKZPHhgpXjpmPjBnkQoYs6ILkVqmVDvutP6FGtJEa
	 2+/HKz5rKjFSIRvT8nhq6KnQX1gXhYJn6FEbksHA/lp8DEdYZ9m3UK+/fxkCZTui49
	 qnpuNyWNMVtQl3AyRVkYEMZOTMuyiACADLPjB4/N9pYIbgdbbe6055J1QUDpys3n11
	 syL/t2xOBeICtnsoNj3Bpw7RBdwvm79WGoJD5aSmO2mOIOQNjzM0r+Y/H0HKCXVyEQ
	 eJ/HOHS2BHO+A==
Date: Wed, 26 Jun 2024 19:36:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <Znv9PgzW8b7rd-Ia@xhacker>
References: <ZnrXSitgAnCO0EG9@sirena.org.uk>
 <87sex051ib.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87sex051ib.ffs@tglx>

On Tue, Jun 25, 2024 at 08:19:08PM +0200, Thomas Gleixner wrote:
> On Tue, Jun 25 2024 at 15:42, Mark Brown wrote:
> 
> > Hi all,
> >
> > After merging the tip tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:33:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'dw_apb_ictl_handle_irq'
> >    33 | static void __irq_entry dw_apb_ictl_handle_irq(struct pt_regs *regs)

I will try to fix it. I tested arm/arm64, but didn't try x86 :(

Thanks for the information.

> >       |                         ^~~~~~~~~~~~~~~~~~~~~~
> > In file included from /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:15:
> > /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c: In function 'dw_apb_ictl_init':
> > /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:206:32: error: 'dw_apb_ictl_handle_irq' undeclared (first use in this function); did you mean 'dw_apb_ictl_init'?
> >   206 |                 set_handle_irq(dw_apb_ictl_handle_irq);
> >       |                                ^~~~~~~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/irq.h:1331:23: note: in definition of macro 'set_handle_irq'
> >  1331 |                 (void)handle_irq;               \
> >       |                       ^~~~~~~~~~
> > /tmp/next/build/drivers/irqchip/irq-dw-apb-ictl.c:206:32: note: each undeclared identifier is reported only once for each function it appears in
> >   206 |                 set_handle_irq(dw_apb_ictl_handle_irq);
> >       |                                ^~~~~~~~~~~~~~~~~~~~~~
> > /tmp/next/build/include/linux/irq.h:1331:23: note: in definition of macro 'set_handle_irq'
> >  1331 |                 (void)handle_irq;               \
> >       |                       ^~~~~~~~~~
> >
> >
> > Caused by commit
> >
> >   7cc4f309c933ec5d ("irqchip/dw-apb-ictl: Support building as module")
> >
> > (I think, I didn't specifically verify.)  I have used the tree from
> > 20240624 instead.
> 
> It comes from irq/core. It'll be gone tomorrow.

