Return-Path: <linux-next+bounces-2305-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA7D8C5E18
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 01:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97DBF1F22066
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 23:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8EC182C93;
	Tue, 14 May 2024 23:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbVot32k"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF8B13D619;
	Tue, 14 May 2024 23:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715729268; cv=none; b=NMGkO4pBQn7268SXDVEvAy885mtarWNRX6VV4qem7CRdS/z9Sq7ypO8hTFIUeoIJswqjZtynwZj2Cllpbc/Os+ldK1d0FlH9qGxvo8PZGCuXoukgw+zzP7rDuOq54cdovlWkJEHxBcB0bxXe3/xseN/8px6eLrpKREnVTcUu4BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715729268; c=relaxed/simple;
	bh=vMpfE4JJi3Tq6kFlIf6DCfa/McCwdHMZC9EdblSI0QI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MiIfLE1y93ogDIhu655iY5YiO596BKsGfHZKU0UsHht0NaKz7Ea/1fu+k2hINX3ctdXdZ05zg7igy+0cYgNEInUGModaG5zp9WTDbuntjwp5yb6HOR4UXeI/dFg9h4Spo0pfxnY1uf+71mUZm0/ZuScAug0SG8LTJPhFSLCpZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbVot32k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07187C2BD10;
	Tue, 14 May 2024 23:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715729268;
	bh=vMpfE4JJi3Tq6kFlIf6DCfa/McCwdHMZC9EdblSI0QI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=jbVot32kuO5unADU2yYakj5L7HW9/1Z/HeCh5ifJLqx81ksuXsIqhB11S5lzKxbj8
	 U7C9u90OkVLjeyoIx35qcPYqr8H7TfwYLPKzCPlWzijOHAhquV2SsLuwD3qh06M70B
	 BZy7xaIjNLpy1rRTYoN19hE5u+ii7tXB4XmBHCK2ECZ1NlY7LAPZlXtZRogX525gwW
	 /dceWR4AUltUcWB0Vjit7HjFDkpy+cHPLDs9CkF9zC0upvTQKKA2PokXo6lwq1B5Vi
	 RqJvO8V8WYm3Nra3x6J8rOa4HYjfZNia8exJCrVYP0Rx96L3yTfOL9dLRuzhi811QA
	 llla+U7ucxbww==
Date: Tue, 14 May 2024 18:27:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the pci tree
Message-ID: <20240514232746.GA2089475@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514-nerd-acclaim-04cf23e62926@spud>

On Tue, May 14, 2024 at 11:58:38PM +0100, Conor Dooley wrote:
> On Wed, May 15, 2024 at 08:31:45AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commits are also in Linus Torvalds' tree as different
> > commits (but the same patches):
> > 
> >   8b77e887b96c ("dt-bindings: gpio: mpfs: Add coreGPIO support")
> >   8c24b6f1709f ("dt-bindings: gpio: mpfs: Allow gpio-line-names")
> 
> Neither of these, nor commit ff26bed00278 ("dt-bindings: riscv:
> microchip: Document beaglev-fire") should be in the PCI tree really.
> 
> ff26bed00278 ("dt-bindings: riscv: microchip: Document beaglev-fire")
> I don't mind if the PCI tree takes though, I didn't apply it for this
> cycle so there shouldn't be a clash there.

Hmmm, yeah.  I think we should drop these from the PCI tree:

  ff26bed00278 ("dt-bindings: riscv: microchip: Document beaglev-fire")
  8b77e887b96c ("dt-bindings: gpio: mpfs: Add coreGPIO support")
  8c24b6f1709f ("dt-bindings: gpio: mpfs: Allow gpio-line-names")

There's no obvious PCI connection for any of those.

Krzysztof, can you drop them from pci/dt-bindings?

> > These are commits
> > 
> >   6e12a52c1459 ("dt-bindings: gpio: mpfs: add coreGPIO support")
> >   f752a52d34cb ("dt-bindings: gpio: mpfs: allow gpio-line-names")
> > 
> > in Linus' tree.

