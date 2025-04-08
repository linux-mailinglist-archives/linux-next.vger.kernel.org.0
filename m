Return-Path: <linux-next+bounces-6177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 835CDA7F1FE
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 03:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56A97189571B
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 01:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE82D1805E;
	Tue,  8 Apr 2025 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Sk6sXUwh"
X-Original-To: linux-next@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B547A47;
	Tue,  8 Apr 2025 01:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074408; cv=none; b=Aas7vmbFfARSOdm8SWZsBOGH25GMfvRQ0d5DJOlYAaqyydqPZ41T6n6XKQEDkb4jLCPWzVCC5qyWzSYbfGhYZfY37zcAjzQKOPD+obRQIRIi1hrdL7NC3gWXGBcFXCyiM217hc7xsZclXQIvr97xemN1KaEzGnPcZQgnIImyceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074408; c=relaxed/simple;
	bh=GlWqQdKpzwTcgIA4iQRuXwwV8MKJ7t34bafkRJQLmW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePuKMjuanXH2Dq2LyQcMcLVx89KRl60WAOe2F6TmkypRTyyXZyLw3/QavkQg2spJAfsGLmbK9zaOUQY90A7zdgk/q/6T4OHsvlIIZb++hsq42ilKsShB0lvNwnqsqmh68a8pj3DIAZbUMlI5d6cla4YoDNeYbTYoNPWWl/gxovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Sk6sXUwh; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=W/pw3Cf0YcI/LQNvU3r1N+3wtaVcN1U5fMoqAQq4CBk=; b=Sk6sXUwhdH1RozKG
	cztxbqs9TCd6eUVTUKL1jP3b4QdjtBE6BGNedtVIEH1OQ/rU+D+uKE5gZU/Z64mkdZOiqc24DYgTT
	NCOwuemUJ8WZiYCo5Esh9ld+rO6I9LHUadEMZmryv0akdfemMrU7l9SofdzaEjsdKaqlxPMpfvheh
	oNJpIGKYabzQmpnesSE+75MJYvP3bEOK3sO12aLm4dc6u2EPQKajeDulWy5v7MwB/sFW4UpSPZrha
	2W8VivA5MAwJV+4AMAxLZzU9s93HSo7DMU7IVZciBzlea0X6dVLBS7xN9V+q4VaHUUNnXAOipg96C
	N/JGgGrGqS+HOaK4Mw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u1xQ4-009hzA-2m;
	Tue, 08 Apr 2025 01:06:28 +0000
Date: Tue, 8 Apr 2025 01:06:28 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Balamurugan S <quic_bselvara@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Ath10k List <ath10k@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ath-next tree
Message-ID: <Z_R2lEVjqn2Y3_sP@gallifrey>
References: <20250408105146.459dfcf5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250408105146.459dfcf5@canb.auug.org.au>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 01:05:37 up 334 days, 12:19,  1 user,  load average: 0.00, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> Hi all,
> 
> After merging the ath-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
> drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-function-declaration]
>   337 |         del_timer_sync(&ab->rx_replenish_retry);
>       |         ^~~~~~~~~~~~~~
>       |         dev_mc_sync
> 
> Caused by commit
> 
>   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> 
> I have used the ath-next tree from next-20250407 for today.

I guess a clash with the recent:
Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")

Dave
> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

