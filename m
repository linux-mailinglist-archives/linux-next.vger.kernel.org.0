Return-Path: <linux-next+bounces-6570-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3FAAD930
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 09:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 830DA16D11E
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 07:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F97D221704;
	Wed,  7 May 2025 07:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ReNxx6uj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JiGqIm1O"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C07D223714;
	Wed,  7 May 2025 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604516; cv=none; b=MEZvOC2Hf+5RCVKdmIGsBFKi5ljKTUpZG/ku/1eksX/H8BP7ubvRa/7CksREU+4CZRJkxiJmVEPSACMWkeIeuDWthGrxYoDsagytq7mQ9OltnyXK0WYvVZd2GiAxGaNVPDjDKlECGW+35LFZjOiozXwMCDTJYlWDT5kvTvlcPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604516; c=relaxed/simple;
	bh=j4zwaV988Qe6aMB5L8k6UmCsLbXX3a72FZD72kZs3xc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JkryB8jP+N8x2uyFaS+DAAcnn1vzCd9KLZsL94BdBamFTUGvYEBh8jM2zsQJ8L1ByMciuQAjKcVQ7+juQrfwUajy2VSg80+EEYuDhFNmyP4V7Oo5tqe1autXo7rn6yPGAQEuQ2WF9VQhO/paW3pE++Nok6sbh1awWzKwd03MXBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ReNxx6uj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JiGqIm1O; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746604506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WhJFG8YVaecQP8RT69+qhbWoUEjiVbQ8B+rAiila9c=;
	b=ReNxx6ujSZ730BscGanYilr/KFZhpoyzzysJVoq7uXj5e4qOaIy2x7NGsQeNEpkokUydrH
	JWBlDV7MR6bKel3hAfXroex6zomLxqDRStVuxG93UkVjeWwX3nISGpWT7elwy7wno+0fIB
	d+q6oot4d/4DLofiihX+WPOG0L2PuLhH+HWil62McdcHKY6akOvXpTG9DcIXz6Q5TCjAvg
	GDtDa3AE5JKn2yEknsUbtlvxFQA065jJiZwHTmRWEAn6zNs+y6QguQGPne4bEYxFnEG0ny
	YtuDOrj82hjx5zBRTn5RtXCMg5wCdXg5FRbiDWURuekXXYz1Wb+O436tRZLS3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746604506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8WhJFG8YVaecQP8RT69+qhbWoUEjiVbQ8B+rAiila9c=;
	b=JiGqIm1OuN/oixW7CxtGDrmANlpPhfswybK5sFeshWlD1W7UJXo969d3AwYJcmySqgnb5F
	C5GXg03A6yGPAnAw==
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
In-Reply-To: <20250507132247.3e3076e3@canb.auug.org.au>
References: <20250507132247.3e3076e3@canb.auug.org.au>
Date: Wed, 07 May 2025 09:55:06 +0200
Message-ID: <87tt5wn9d1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 07 2025 at 13:22, Stephen Rothwell wrote:
> The following commit is also in the uml tree as a different commit
> (but the same patch):
>
>   48199713a6a8 ("um: Use irq_domain_create_linear() helper")
>
> This is commit
>
>   7633b8b1e793 ("irqdomain: um: use irq_domain_create_linear() helper")
>
> in the uml tree.

I zapped it from the irq/cleanups branch, which is the sink for all
irqdomain cleanup patches which have not shown up in next.

Thanks,

        tglx

