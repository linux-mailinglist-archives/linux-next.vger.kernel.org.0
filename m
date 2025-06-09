Return-Path: <linux-next+bounces-7099-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2EBAD17AE
	for <lists+linux-next@lfdr.de>; Mon,  9 Jun 2025 06:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6C48165DAB
	for <lists+linux-next@lfdr.de>; Mon,  9 Jun 2025 04:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83341E9B31;
	Mon,  9 Jun 2025 04:13:12 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F95475E;
	Mon,  9 Jun 2025 04:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749442392; cv=none; b=X3xnDFpcti9pdcRykfvasMrCabZC0/yGQrFfOE2Tz3FSRsi+fu8mnpycWgpjl/WV6vSxOo4HY9Hvx2wcNOWnyDFUMT0qWqG2PzPoKAuzUfRCOIbc7ScW4YRO36JDTSPP1xAGeLyji4SiX2HzUueuAVGC5E05CjVRvMm+a2gYxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749442392; c=relaxed/simple;
	bh=sU43XR4ELjMkvRmWTzngGULXdxWQ6qw6GWH4DnMgaaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hc/Pj7A6fCvrnCC0LkibNq+FxGg5axddkczHEdW4iCRQhv/UNm71DOyCMT/7JQnyU4M0cflo91FWXAIE85j5uGGdB7UKJFgr1FCaNwEtcxHH4zMz69pRCteEJ8lv2hzD7uayiETpKYu/nWswBw8UgvQffYN1yo+kYJY3HR7RXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 93F5D68AFE; Mon,  9 Jun 2025 06:13:06 +0200 (CEST)
Date: Mon, 9 Jun 2025 06:13:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20250609041306.GA26287@lst.de>
References: <20250606075230.6a13c53d@canb.auug.org.au> <aEISwo8LR8hG0zyV@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEISwo8LR8hG0zyV@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jun 05, 2025 at 03:57:22PM -0600, Keith Busch wrote:
> On Fri, Jun 06, 2025 at 07:52:30AM +1000, Stephen Rothwell wrote:
> > Commit
> > 
> >   10f4a7cd724e ("nvme: fix command limits status code")
> > 
> > is missing a Signed-off-by from its author.
> 
> FWIW, my Signed-off-by is in the original posting, so it must have
> accidently been chopped off somewhere on the way.
> 
>   https://lore.kernel.org/linux-nvme/20250520202037.2751433-1-kbusch@meta.com/

I guess that was me when editing it to make the commit log more
detailed, sorry.

