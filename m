Return-Path: <linux-next+bounces-4280-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E23199F856
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 22:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 906701C21E53
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 20:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE40F1F9ED7;
	Tue, 15 Oct 2024 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="acWLlWt8"
X-Original-To: linux-next@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A81F80DD;
	Tue, 15 Oct 2024 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729025822; cv=none; b=iCsYl9IL2AaexVuCN+K0eRzTdm9E7fhlvWJjnWxsLay/W4ULfeH6xquIqWkaK0aNgs/PW6xeOt1dwJOj/yHaO+5f+JJEuhdNYs9OPXegp8URz6E6GR+WK7nSqJed66jl+IhreBjTxnU1AcDQO2r9wK834YSjKalh/eFXZrHo1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729025822; c=relaxed/simple;
	bh=nhVq3bNEY/qdT3pYPq0FK313mDsysoleMV6NBIGcCW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DU0/ZSWzyvdloEfMJCRe6htftVJ3XTDkULaEUe8FNjjpEwOIq4TpHtKcFH+batbP10igkms2MugHUreSNOQw4XG7ZlnOsgxZm6MHevOE+Y3XVtQhs36jP4sn8x7vufVvY/XNV9FCH+UjwjcWfAGs/icAgs4Hk8v45AjOa0S1OOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=acWLlWt8; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=+GFRM+u+p5Z9aG1BT9r5S7bGz8OWiDpD8m6rtv8kuJs=; b=acWLlWt8x1JdqczW
	Hk+dyAJOyjQdj4NV0myjmJRW9F60tGqnDqUr9F08cgi5k4R0yDjSilqV3FT5MEtbO2Esm4jAiNUSd
	YrWgo4/86wpskviSgRCjD+ZSR0R1it86RRNnv8T4uEJpgobOVNU1KZE/cJCiPvp4tFTe9vQk0O0Hs
	CbXRrfBwLwVMeSiFkE2xoio1uvo22OkyVWeeN7gbEALRIW8JInqqt43oebC4y3ndUDE6WOZZBIddm
	cqnuomqo/+nBihrQpSMiVuAN7qJLyAEf27qqHPNRJDbD3QSm9y2m3LtyMbrD1vCOnBtL56JBStR+D
	cZiV/DPdugPPGvCJ7g==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1t0oau-00BIbA-1p;
	Tue, 15 Oct 2024 20:56:40 +0000
Date: Tue, 15 Oct 2024 20:56:40 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <Zw7XCCfedYmRTJMS@gallifrey>
References: <20241011135515.75317b03@canb.auug.org.au>
 <20241011175516.37dc061b@canb.auug.org.au>
 <87bjzle5g4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87bjzle5g4.ffs@tglx>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 20:55:38 up 160 days,  8:09,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Thomas Gleixner (tglx@linutronix.de) wrote:
> On Fri, Oct 11 2024 at 17:55, Stephen Rothwell wrote:
> > On Fri, 11 Oct 2024 13:55:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> After merging the tip tree, today's linux-next build (powerpc
> >> ppc64_defconfig) produced this warning:
> >> 
> >> kernel/time/clocksource.c:1258:13: warning: '__clocksource_change_rating' defined but not used [-Wunused-function]
> >>  1258 | static void __clocksource_change_rating(struct clocksource *cs, int rating)
> >>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Yes. I fixed it up on my tree and then forgot to push it into
> tip. Sorry!

Thanks for that and apologies for not spotting it in my v1.

Dave

P.S. If you get a chance I'd appreicate if you could look at another
deadcode of mine in x86:
  https://lore.kernel.org/lkml/20240913005753.1392431-1-linux@treblig.org/

> Thanks,
> 
>         tglx
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

