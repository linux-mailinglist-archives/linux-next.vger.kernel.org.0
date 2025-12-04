Return-Path: <linux-next+bounces-9344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46BCA5B2A
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 00:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D396F309B4C4
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 23:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE851A9FAF;
	Thu,  4 Dec 2025 23:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaUqJQO+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DEB4A32;
	Thu,  4 Dec 2025 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764891710; cv=none; b=oQDqd19zvQIEuPZWDLdKJljc5pVDux8/unffEYSz7DReOddSA4Z4UeGrYLcXvj+w1xYb0RRHFmEulT0frJCGPtjUb78hV1/tMXw2lIs7Ojc5IxCYsjcfhXm2rs7j2il+R8YX+52myqaPbzZF0/kvPkE7kNizt5UW8NzUHuudUns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764891710; c=relaxed/simple;
	bh=Pv0BzTCtT56oYwujf+3pTsweWMLw3Z3GJXCqIBPNFLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhZNepLfwWCBuhKtcAUeMmlmDbDBHLoaVpJpjN774JlU13PDUDgeyWG4qOB9LY4nCzs2iGk7jb7ueMjQxwufjhgZSoGY5+bvvbcq456bIc6CiweMykGfxin7J2h6d0p4pYUcqvbgiEsHywHff5ZsHuWKFm/aPIaTxiCoGtdYwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaUqJQO+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029F1C4CEFB;
	Thu,  4 Dec 2025 23:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764891708;
	bh=Pv0BzTCtT56oYwujf+3pTsweWMLw3Z3GJXCqIBPNFLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaUqJQO+5Pb8fCY9T/1G5YLjYCE5Cvn18lr5VmNIqiLLIADJtZi10nPzElLeB0lUb
	 1hAnO/gCSHm+fnhwp1fF4d0ZOg/JHN/0ZszlOkINyOxAUtc0d6DkCcYxYVE2IopnXW
	 NxRjw7XS0d/vlPrdblQCOeOnisGb8kx0MaT9LdneamrHCDEuSJbFVvZnkuOTDO8nhz
	 04K0B+Ss92QlJN3iFg7kNrzbd6DmgERctU/OqaiiNesYpK3VS2UbWHtbtU0MSCTO0H
	 uY9t7nM3BmxyR8M/+o1c0qV0B110vnyZ0Vku1Zx+1YgfUdhSW/BXeDs1to0f4S3Oiy
	 NlDhuM+Vp0TOw==
Date: Thu, 4 Dec 2025 15:41:45 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <aTIcOXF13DRLAI2q@google.com>
References: <20251205092428.3e2b94e3@canb.auug.org.au>
 <CAP-5=fWf614AVPUcnf8wT04hXSpCVhfXuw7BrALUHubTPRbAPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWf614AVPUcnf8wT04hXSpCVhfXuw7BrALUHubTPRbAPQ@mail.gmail.com>

On Thu, Dec 04, 2025 at 02:52:34PM -0800, Ian Rogers wrote:
> On Thu, Dec 4, 2025 at 2:24 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   6528cdd61590 ("perf tests stat: Add test for error for an offline CPU")
> >
> > is missing a Signed-off-by from its author and committer.
> >
> > I presume the original patch was truncated somehow.
> 
> Yeah, there was log output that had a line starting "---"
> https://lore.kernel.org/lkml/20251203214706.112174-7-irogers@google.com/
> 
> Sorry for the trouble this has caused.
> Ian

Oops, actually that's the reason I prefer having spaces in the front.
I'll take care of it and force push soon.

Thanks,
Namhyung


