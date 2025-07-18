Return-Path: <linux-next+bounces-7624-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A53CB09E1A
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11951A43918
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B140292B2A;
	Fri, 18 Jul 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OKgUOx7x"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C81820E71D;
	Fri, 18 Jul 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827601; cv=none; b=LnwfAdJlauGdaZlW57FB5P5X1AeRgYzT3cKw5RrQAHK/VNcuHnCyHVrJAPk31pL1wTtb0VC4CVGuHx4UiUb2SZ+x+2vL1kGml0zWHlpbM7ZC8401yEhT7FnLHSg5/4Os6WtYbSQGM7UZ1JCXV4+LxYVaYHPV0Z1i9f+W0bKPTyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827601; c=relaxed/simple;
	bh=J0la2E51liPRAU72Jdnl5lCR48J9xdBV8TdPsieZgXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwrBIfqzO6sPHCSL+rV1VfMaURf6jqIsthx4DNQDLE9HsxstNoOmmSCBPjyEQwitJ5y5YytoOhbw2HkbahjpxvNhJTLz25Pss1lgnlW4a/xa5gs3zt1E+LMf+Ym0OlA0+DeIvgXSwK1ENd8p3Q7jjSQoxNCOp38kvGNzKCXzIts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OKgUOx7x; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J0la2E51liPRAU72Jdnl5lCR48J9xdBV8TdPsieZgXc=; b=OKgUOx7x/Q074rsbXBD/OJgSLn
	jWLaEbbtzAtmSmuwTAEDa/dzYbAwFSFwhdcUYBYTSjPUDfXF/LStMPeRe6jiEGQ2Kr0g8AmbZJzPw
	oUrZDFYdSxd+Ne6FbbhHc1mWskeK400gL4nXujWLHrclp2jzlIrnE8K8TE6MPYA6+A246y2P9Toku
	sgiD363eAczJ6qNAo7CZ9yiFygZJngOF30gSHUvDxe5schUrkbbpFrnsgaQTUcv9fTeOOmq2qnV+8
	E7JgioGrJRm89tgNO90Zye+U+5W3BTWuYyfnOUPzMp3PLkwZ6y4pSyoC9SVAGM/MRkLtbgiIen5Yj
	BzxZ0Gng==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgWt-0000000C3Wi-00S1;
	Fri, 18 Jul 2025 08:33:19 +0000
Date: Fri, 18 Jul 2025 01:33:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Carlos Maiolino <cem@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <aHoGzku_ey2ClrzD@infradead.org>
References: <jZld0KWAlgFM0KGNf6_lm-4ZXRf4uFdfuPXGopJi8jUD3StPMObAqCIaJUvNZvyoyxrWEJus6A_a0yxRt7X0Eg==@protonmail.internalid>
 <20250718100836.06da20b3@canb.auug.org.au>
 <hmc6flnzhy3fvryk5c4bjgo7qehhnfpecm2w6wfyz7q7wly3a4@nvo6ow5j3ffl>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hmc6flnzhy3fvryk5c4bjgo7qehhnfpecm2w6wfyz7q7wly3a4@nvo6ow5j3ffl>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Jul 18, 2025 at 10:30:56AM +0200, Carlos Maiolino wrote:
> Thanks for the heads up Stephen. I didn't catch those errors while build
> testing here. Could you please share with me the build options you usually
> use so I can tweak my system to catch those errors before pushing them to
> linux-next?

You'll need CONFIG_MEMORY_FAILURE and CONFIG_FS_DAX to trigger this.
All my test setups seem to lack the former.


