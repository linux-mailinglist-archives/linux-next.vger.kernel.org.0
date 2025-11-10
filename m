Return-Path: <linux-next+bounces-8913-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C6C46F06
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 14:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58613AA0E4
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 13:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B553081DC;
	Mon, 10 Nov 2025 13:33:40 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493AA199E9D;
	Mon, 10 Nov 2025 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781620; cv=none; b=Z7Ba2t+6wsXCsJZ7gkDRZkLsvAe+dK+uP2RU3n4ZozqiCq7awz0HKk021rTRAYL3yxgMaJ9tmNTPztcQ20puVRS8Q7mYa61iufMemtfl+KoctPTLsPwllircTHkGkL5qyvnCIBZIlRyjaW4u8WRqdmYqlMbBrszAdeoUhJF04A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781620; c=relaxed/simple;
	bh=/AJQbHKcFXtTR5Au3sJaXSFUmeM56FVXchR9JACyr6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILJwNzB0Mh2Zo1HoJWwHl/VW9FoJKohdeNaDZ3ZL8KyTH0/0llYv/lak6Z+xhXsCCw8LalkmCxI7wcn8lcLIG5jDc4YBFPl9DI8QRo6HreQ+N7nCBG6jyQ15/P3Jtbv5qh+9t0RvvMkvcSl9eej/ByTFnZ54MvOkSGNTTjDbYGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A073B227A87; Mon, 10 Nov 2025 14:33:33 +0100 (CET)
Date: Mon, 10 Nov 2025 14:33:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20251110133333.GA10241@lst.de>
References: <20251110082808.7df5b060@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110082808.7df5b060@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 10, 2025 at 08:28:08AM +1100, Stephen Rothwell wrote:
> Fixes tag
> 
>   Fixes: b037d41762fd ("block: introduce blkdev_get_zone_info()")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: f2284eec5053 ("block: introduce blkdev_get_zone_info()")

Yes, sorry.  I had a locally rebased tree when creating the commit.

> 
> -- 
> Cheers,
> Stephen Rothwell


---end quoted text---

