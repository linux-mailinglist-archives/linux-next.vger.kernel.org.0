Return-Path: <linux-next+bounces-7333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5487BAF7245
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 13:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50BE52809D
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FC5255E2F;
	Thu,  3 Jul 2025 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="hqt2k/3H"
X-Original-To: linux-next@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64610238C0D;
	Thu,  3 Jul 2025 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542231; cv=none; b=M2NDt551bPSKsUjs1Q8b/1ftgI3oKdjxv2VRf/yTdsplBP3XDfjRWMqkx8cHqzYoKI3xCwe4HrDtsNAKHUfDQlpDls2Jy53Xjqt0rU9bxVztx4lI6aG80XHJwoCrcO+nwXGRRWm+Nz98tHFOaAAT6Fdnuzlq/CEUY9uO7u+ezNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542231; c=relaxed/simple;
	bh=L7YD3bHig/KW6hapzYsFVB3o8PsscrReJ+ureajmCy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI7FiasdKW0OcLvmAgVnTiRHevhZz5PJBKfMse9+joLXkGYw5cGnw9SR3TCI2UYxhQtZNUsdWYUy11VxJ4utGCKce2hJyvOBrjMTy3878qFRJ0XDYVnDIwhqTC9Ynx/y0IdZOSl0Dvkua1jhG7WQe+Ybp8bzYqngDjlJpjAUQ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=hqt2k/3H; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=LBJrcyiBOP+fKWC86q9OLSIWWY9q5SKuo2qTzUlY+xc=; b=hqt2k/3HEQ+RZnol
	RIjVdzxgNpdQGlZes4130Xgmi6OemrIPekHDequ5ozE01sXgf5hMbuPu/p4dixrk3un9XJcBKB9s2
	dFu3eloIsSnhRLmEwUH4wWdsL8EFIrY8r5/9QdSPRvyBe8DQTEtepAWNcSlWmxnML4QHhyQwD9s/9
	BKY5mHmk3Omcm7FPJBBwMPzXzXU1df9ckr5O4K6VGb8cWTITfhywDBOSh48i5LD49UTwQAQZ0ZzKt
	fAbTh6jZPkxYGhH4TpiWHQjlAzi/DOAkqvH6vEa85OnpKlJVMDMbtJ4ioZTTgn7h5vbivvgStWvjJ
	wNuQt8L7U578HY74EQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uXHlH-00DqYX-0z;
	Thu, 03 Jul 2025 11:05:51 +0000
Date: Thu, 3 Jul 2025 11:05:51 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <aGZkDynnq2Li4EdN@gallifrey>
References: <20250703142348.45bb8d28@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250703142348.45bb8d28@canb.auug.org.au>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 11:03:54 up 66 days, 19:17,  1 user,  load average: 0.05, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> Hi all,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/media/radio/radio-wl1273.c:12:10: fatal error: linux/mfd/wl1273-core.h: No such file or directory
>    12 | #include <linux/mfd/wl1273-core.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/wl1273.c:10:10: fatal error: linux/mfd/wl1273-core.h: No such file or directory
>    10 | #include <linux/mfd/wl1273-core.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   17f5c6fa85e5 ("mfd: wl1273-core: Remove the header")

OK, so I see Lee has picked up 3/4 and 4/4 in the
series, but the one that removes the radio-wl1273.c is the
first one in the series; see 
  https://lore.kernel.org/all/20250625133258.78133-1-linux@treblig.org/

> I have used the mfd tree from next-20250702 for today.

Dave

> -- 
> Cheers,
> Stephen Rothwell


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

