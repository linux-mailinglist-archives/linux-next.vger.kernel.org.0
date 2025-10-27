Return-Path: <linux-next+bounces-8712-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA465C0BB1C
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 03:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEA6B189A3DB
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 02:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742EB2D3725;
	Mon, 27 Oct 2025 02:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="cqupaV5z"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F82D24B8;
	Mon, 27 Oct 2025 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761532932; cv=none; b=lpzgAxTl6ETwT6908GJjkpU1Qc1YU9Q2rkMAlPjQQqjATS6AsrLIjm+08l3V4I0taVSDwEdOsomRuvcCNH5kUngMxk1ESxqRyPTCw++N9xlsJF5+nHhU1lm1on2eGQf0SKHcaWHguklOgfkCdvrhslsnC6zOfZKUBSAROGxTeB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761532932; c=relaxed/simple;
	bh=6ajdjtDvJ9TPhiIgC2lfAsB/99n0oP7GTZig7ku7xF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWc+wX1nhMLPpjMSUfugI5ezwP5ygwbxjYehab5rZoNTsBL80A/aXaXTnR072AhiN3eL2lMrshMbtfjK2EtCXZEUxCdoWO32mD55Z1ypi+WdH+fuTb/ifUcfH6xKIWPK1m2QmIl8/huwx1TJk3nWxsS3sn12+UshH1sdM4Lte1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=cqupaV5z; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761532792;
	bh=9tmLjtcs2eyDxRfT51jIz66kx3WBptin9RD3Ln0ghU4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cqupaV5zoN1VuTKxrUsez/sADxaV43IncBVI5GP6alESV6/9oQ0P7UiyXu1D/Har9
	 WbB9n4J957fGob5h223Ljyx60BYJaVvWUdQ5lfaAEXRlwo2sdk43pPpLVxDBUG03dM
	 iKW/Irdid3D4bAQg2To/42t1FdqI4FtlvFEOQczs=
X-QQ-mid: zesmtpgz1t1761532785t724140c3
X-QQ-Originating-IP: bsapEcVVlFgEffV0ZewBuqyVBdoWgWC9dSN4wU3DT6I=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15698116009631844435
EX-QQ-RecipientCnt: 8
Date: Mon, 27 Oct 2025 10:39:43 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jinmei Wei <weijinmei@linux.spacemit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <CC98F1397C1BC467+aP7bb005VjZNJmS3@kernel.org>
References: <20251022141705.714b19b5@canb.auug.org.au>
 <D5657B8E8DB8995E+aPt-p1EXhoFLm9aW@troy-wujie14pro-arch>
 <b436e795-188a-4b62-95f5-1b11d2d10c77@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b436e795-188a-4b62-95f5-1b11d2d10c77@infradead.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NrrGCwiNZLLZ9AedfdakARrtPIKUj/zEjlbOL9VkeQ30xi9qKyC+lFNM
	vKVLnPQBL3j5vOBA3yODIBSVWUav1L0ZEVcHt6NsI9duKmhsyXlIfCgF3cyutKUMCnU9Oed
	WU2oWYNvn+dji+olMDdHgTVtLl/2BMfoRvu5eiQyowIMijhy2QEegQq6Wu2dbDCL7LK4Rnq
	6x54fam0vujbsnZFSucJ1ZS6G44aPz1Oi8AnrBkdH4YjoKKLTaEoie7ICcDCZiSNCmgbPMI
	SJXhB4ajteN/Qhw7cbGeTHqguy+kmgIB3Os/9pnZ8EYNml2oyg6fIW+DgFFA/59D99ILNRh
	fBP+SRbzEx2X8xruMINwkZnAiixV4no16M256xXd/6IcSchDSYiervQ9oRwbQE59LxewWPE
	HADRheIFQ8+su4c/R1FIH0ULLRCt92vr1VIYDH+mUCKCRmQvU6oxTMpQLOyEpQtuEU9Pl64
	eIreQ9jkcxPBLuB0Cp/KrQ0Dv/L0d7We0/30Gh1pCY0+GDXIa1fOFutxHt0SIxxRVtQIljh
	OM8bM9800XA0cfe8rwa81WiHx5qySZUBSfMMvtPiNBA+pcJhYTFD6lejzDR0DpyPFXFa5VU
	ar14m7maqnUfZ0ZrtqCN/pqhLhIEoizRhkuqQcl9ItXqp1hCcyzwBFyWUSjzpWZN3uTXNvd
	YcDI9+CCtq/z0p8AlQDZJMbOYA57vdnxnQdVQKF5kxcMuKTaqk07rRiTPJVwOvF/GAWGa0a
	Y2zJbCoT15Mvo3gM3mpdWBISlz9/dbQwRpPGTiTrAG8MNcp7tQuTzVLdbXCbwiVhcXhQb3C
	D1oTu+h1dwFodDr9ubj5/KYmmbLwOMW3DV8J5T3CJE5jPQ8yoBk1b3Eu299yxPMYr38OKOa
	bIocdqGMagPuOYKd040PoqX4LFtZgTDqzaBBGRUBiKRA+eN4fRHQ6Tfl59GTZ1C4fBW96qI
	XeiMSy0HqeqKRJuanEDOAdy042WcMR601aOle6Pa+OjRpzJXeYfq880YGRQlC26o5OUX34O
	4XXbJMXOWsxxg3QnVju5VZeTUtf2lGPPvzigLwciRsn/owqFZ+4jljHAKuwJw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Fri, Oct 24, 2025 at 12:40:07PM -0700, Randy Dunlap wrote:
> 
> 
> On 10/24/25 6:27 AM, Troy Mitchell wrote:
> > On Wed, Oct 22, 2025 at 02:17:05PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> After merging the sound-asoc tree, today's linux-next build (powercp
> >> allyesconfig) produced this warning:
> >>
> >> WARNING: unmet direct dependencies detected for DMA_CMA
> >>   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
> >>   Selected by [y]:
> >>   - SND_SOC_K1_I2S [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]
> >>
> >> Probably introduced by commit
> >>
> >>   fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
> > Sorry, I didn't realize that this email ended up in my spam folder,
> > and I just saw it today.
> > 
> > I am considering directly selecting `HAVE_DMA_CONTIGUOUS`,
> > but another possibility is to make it depend on `DMA_CMA`.
> > Can anyone advise which approach would be better?
> > If there are no objections, I plan to send a patch on Monday:
> > select `HAVE_DMA_CONTIGUOUS`
> 
> Hi,
> 
> My read of how HAVE_DMA_CONTIGUOUS is used is that an arch or
> platform selects it to show that it has this capability.
> Drivers don't do that.
Oh yes, that's true.
> 
> Possibly ARCH_SPACEMIT should select HAVE_CONTIGUOUS_DMA but that
> wouldn't help here since this is COMPILE_TEST=y, which did
> its job here.
> 
> I think this driver should
> 	depend on DMA_CMA
> That will take care of being dependent on both CMA and
> HAVE_CONTIGUOUS_DMA.
> 
> Or IF the driver can operate without DMA_CMA being enabled,
> the driver Kconfig could do
> 	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
> and then have alternate code paths for whatever is
> enabled.
> 
> This driver could
> 	select CMA if MMU
> 
> or it could do
> 	depends on MMU
> 	depends on HAVE_CONTIGUOUS_DMA
> 	select CMA
> 
> but
> 	depends on DMA_CMA
> wraps all of driver dependencies into one statement.
> But no, not
> 	select HAVE_CONTIGUOUS_DMA
Yes, thank you for the clarification.
I will go with using depends on.

I also think I no longer need to select HAVE_DMA_CONTIGUOUS
in ARCH_SPACEMIT, as it is handled here:
arch/riscv/Kconfig +154

                          - Troy
> 
> -- 
> ~Randy
> 
> 

