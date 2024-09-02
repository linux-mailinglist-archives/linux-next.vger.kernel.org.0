Return-Path: <linux-next+bounces-3547-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A9968DC5
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 20:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 553D0B21458
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 18:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5E321C16B;
	Mon,  2 Sep 2024 18:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meR5KYOw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419EF1AB6E0;
	Mon,  2 Sep 2024 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725302556; cv=none; b=TysyATbIu6vGczootAbW5bOiSYdO7y8fXoJhilSbZds9f6xSjPDZOinmHeHWeokNKS/mrihD2dS753Q2/L55QUwluSIlLfgPejaSe0Wob2yx8NQVtfFFMZsmHwHZzgAA6ta6RWNDhpETe39FVeXP/u+ygLpXe+ag73LwfCpK3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725302556; c=relaxed/simple;
	bh=yXthWsprBfAvzb8GE7WgBw3YorQjpADJBD3ZCYrEtH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKRuEQY6aSVrFPoZQdk8qs7W6za5VBqaEEuVd5BrTi2/QK+9fcA5Kh2yF1iUw6m+TakYGILTxuZiZYOXm2rOGYUtM0lVTq6GDt7AfludTLgE0ohF+06nIOsOuMMy7bmFfKY6XdRzF2ZT6mZ3Qdeh4M+vu40bnOlcix1VIWskwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meR5KYOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D150C4CECA;
	Mon,  2 Sep 2024 18:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725302555;
	bh=yXthWsprBfAvzb8GE7WgBw3YorQjpADJBD3ZCYrEtH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meR5KYOw8XPveCXcMh8KKXh2h6D0i3LgSSL8CDBG870zWA3rR56tcQ3vPILRem5vN
	 cpwTX2I9rI+rPj0kUarsmzdG5bC2pmyrZQiYjJy1XxZEI3mb1j3uZtzT2+DpAwu+4N
	 +4r6fjLDl+hsQeleqrtnk3tddb7+qpF/WIDM/YBzU2bVtI9PT2r5YL+YTAMuOmboW/
	 RNs6hGSeic2aLM79Bj/8DZQ6UAU1MT1KKAQ8Hk6o2msaRgCBvw3K9EkeVy3YT26zmy
	 mGCeHpoNWzaTxjZqIpjIa/ASPzSxikAYs5+I9AFF52dFvIPjNq5zh7PG/hxWtjxABV
	 HcghX0LtFo3sg==
Date: Mon, 2 Sep 2024 15:42:32 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the perf-current tree
Message-ID: <ZtYHGDaoJrwLgs--@x1>
References: <20240902081837.6def2734@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240902081837.6def2734@canb.auug.org.au>

On Mon, Sep 02, 2024 at 08:18:37AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   387ad33e5410 ("perf test pmu: Set uninitialized PMU alias to null")
> 
> Fixes tag
> 
>   Fixes: 3e0bf9 ("perf pmu: Restore full PMU name wildcard support")

In the perf-tools-next I have it as:

commit 37e2a19c98bf99747ca997be876dfc13f9165e0a
Author: Veronika Molnarova <vmolnaro@redhat.com>
Date:   Thu Aug 8 12:37:49 2024 +0200

    perf test pmu: Set uninitialized PMU alias to null
    
    Commit 3e0bf9fde2984469 ("perf pmu: Restore full PMU name wildcard
    support") adds a test case "PMU cmdline match" that covers PMU name
    wildcard support provided by function perf_pmu__match().
<SNIP>
    Fixes: 3e0bf9fde2984469 ("perf pmu: Restore full PMU name wildcard support")
    Signed-off-by: Veronika Molnarova <vmolnaro@redhat.com>
    Cc: James Clark <james.clark@linaro.org>
    Cc: Michael Petlan <mpetlan@redhat.com>
    Cc: Namhyung Kim <namhyung@kernel.org>
    Cc: Radostin Stoyanov <rstoyano@redhat.com>
    Link: https://lore.kernel.org/r/20240808103749.9356-1-vmolnaro@redhat.com
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

As I have:

⬢[acme@toolbox perf-tools-next]$ git config core.abbrev
16
⬢[acme@toolbox perf-tools-next]$

And scripts to make sure we get enough resolution to avoid such problems

I just checked and yeah, on perf-tools/perf-tools it is:

    Fixes: 3e0bf9 ("perf pmu: Restore full PMU name wildcard support")
    Signed-off-by: Veronika Molnarova <vmolnaro@redhat.com>
    Cc: james.clark@arm.com
    Cc: mpetlan@redhat.com
    Cc: rstoyano@redhat.com
    Link: https://lore.kernel.org/r/20240808103749.9356-1-vmolnaro@redhat.com
    Signed-off-by: Namhyung Kim <namhyung@kernel.org>

So I suggest Namhyung fixes up the Fixes tag to have a longer prefix for
the sha and Veronica to run:

⬢[acme@toolbox perf-tools]$ git config core.abbrev 16
⬢[acme@toolbox perf-tools]$ git config core.abbrev
16
⬢[acme@toolbox perf-tools]$ 

- Arnaldo

 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Actually, the quoted SHA1 is too short and is ambiguous in my tree:
> 
> $ git show 3e0bf9
> error: short object ID 3e0bf9 is ambiguous
> hint: The candidates are:
> hint:   3e0bf9fde298 commit 2024-06-26 - perf pmu: Restore full PMU name wildcard support
> hint:   3e0bf93e0354 tree
> fatal: ambiguous argument '3e0bf9': unknown revision or path not in the working tree.
> 
> so you should use
> 
> Fixes: 3e0bf9fde298 ("perf pmu: Restore full PMU name wildcard support")
> 
> -- 
> Cheers,
> Stephen Rothwell



