Return-Path: <linux-next+bounces-4526-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF619B4A39
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 13:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A7C283BC7
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 12:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2669B205155;
	Tue, 29 Oct 2024 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B8E76eaK"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7B188010;
	Tue, 29 Oct 2024 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206440; cv=none; b=WqLWUcEQ5WtyoOlFdQeY9tk12zmbOwC6YtlJaa7J0wKwqb7aGc/+ACBT9F4XL71++g8jAr5LZwpv/efUcVHfJ4LsUAc3IQkY+1bMcCTszz6vDEeEUmm+EKjDGsmA1rPQOH6GDZO7XD0APO1IRUL3/UoL6OhQ8IClcPclhMxOFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206440; c=relaxed/simple;
	bh=Fq5Nw3kWvPQcRl50h6+LTplnlvw20EDxvIDFwfHu5cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtTYOXW+8wQ3U5OPg9o33lC+kAO+foEdzmFJQL7NpEedxJQU90O9iGEtlQj2lTSpHqR+uILKuudzGdAt2g5ehx2pZ5udV7o5Ba4qjX9Vajb9pj3sV+8hJ9O4m2WfHbJn9d2KVzsSd7geAqoGzKY8ptLF0w8BXOjGof3I31m4YPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B8E76eaK; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bsJEbD14F+5zhtH9551psCJLxDd9gre6B71OeSZfA5E=; b=B8E76eaK+KFBJPC9e6MXrw7M4E
	SN6Ga+eETplbhnRHH38PAnBjlQetBzBtzK/Bc5qD2mJuUccIBp6+nusEe1Rbob16fA5x9lKu8snEi
	jgU4qXnjxGXfRrv3jPVvN6mZG64M8NHX7aR3Plzu24ErsV9sqvFflW1KnDMUras0sKQ76WOlpx2vG
	5ZcGG2VYdpsQz6d73e22EzibYT2Z32eA2qoS5UyuCj0FP1oxunGR5jaZbjWMiVylPYPGsdcWGExD9
	21ODpaRBuDtwln1dLEtokP2H36eZkklOUJ52zxgSpml0creEzSatqCs65VhFNTRI6FfwronMJctEv
	6pMYYnAA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ljN-00000009tot-2Hzf;
	Tue, 29 Oct 2024 12:53:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9126130073F; Tue, 29 Oct 2024 13:53:52 +0100 (CET)
Date: Tue, 29 Oct 2024 13:53:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20241029125352.GV14555@noisy.programming.kicks-ass.net>
References: <20241029075021.107877f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029075021.107877f4@canb.auug.org.au>

On Tue, Oct 29, 2024 at 07:50:21AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   b4f5f4934b58 ("sched: Pass correct scheduling policy to __setscheduler_class")
> 
> is missing a Signed-off-by from its committer.

*sigh*, however did I manage that.

I'll go rebase and fix.

Thanks!

