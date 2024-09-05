Return-Path: <linux-next+bounces-3619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C66E596DD5E
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 17:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A82C1F21C19
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDA41A01AE;
	Thu,  5 Sep 2024 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EK3wcKHV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7CD1A01A1;
	Thu,  5 Sep 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548851; cv=none; b=I1koRGkHjYbRJRi0quT/otVKHiUY2Jt2UrD1uXkzQm5aoVq/k2baqq9lU9eZvg1KZKkkYpSB8DKBl5q5mXLR6elIfq+KAEFc/xifOdbv/nhaRqmD4zb657+js34xW0NrNlYCaB+fEYPtjMh0aYUSypI+mukpBH31Q7QS9LbSbDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548851; c=relaxed/simple;
	bh=ww8EkVCPB6s28Jr31zz3eqdZLXzUxrSoKTexWsgo+DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJdvcKD7MXZ2Mf60M5dcB69gHX/AOT6JshINIg5KKrb74oBSwEdfWGNoFtDQGoGRt+lFL/bIJSLQRwj5o6Q4621D8uHRiTGsqnOemsZKOBgvkfaEVsIiS75hAdA9Xz2i3wErMyyCbh8BH6zXNEtBw81tBeYdVN5q0y4eF3iVCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EK3wcKHV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07ABFC4CEC3;
	Thu,  5 Sep 2024 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725548849;
	bh=ww8EkVCPB6s28Jr31zz3eqdZLXzUxrSoKTexWsgo+DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EK3wcKHVMuXgbqNLwvY8QRppCwo6SJpINLdOAjWCM4qe4U/ArLZCQT3lEf10FKZ5G
	 w9R1iyKxGuiCgozVFJ8uibsSobTf1+fZnelbzL+qE0MgopEVL8pBoYHeFW7DBkybVG
	 P0gR90pic6U7pMH5KfDrUJ/+M+l0ROqfGY2GM9PbAh86kXfsaL7FSiEJe6MlJEO9V5
	 DRyxP9BbXy+21uYObdvifuI/Ph3cZi5wYfFhaT5QOWg5evTnvo1dOXOO5xbzVimspd
	 8CF37H/sC5OqeOq07oXsR0GAtO/LbZkmUsi2iokWO3viuVekb7gKdg0Q8x8VkzP2bM
	 Eu9QLTqM6XxcA==
Date: Thu, 5 Sep 2024 12:07:26 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the perf tree
Message-ID: <ZtnJLkO5cTIlwnSb@x1>
References: <20240902105121.1a5b25f8@canb.auug.org.au>
 <20240905084208.78279c14@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905084208.78279c14@canb.auug.org.au>

On Thu, Sep 05, 2024 at 08:42:08AM +1000, Stephen Rothwell wrote:
> On Mon, 2 Sep 2024 10:51:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > The following commits are also in the perf-current tree as different
> > commits (but the same patches):

> >   6236ebe07131 ("perf daemon: Fix the build on more 32-bit architectures")
> >   2518e13275ab ("perf python: Fix the build on 32-bit arm by including missing "util/sample.h"")
> >   74fd69a35cae ("perf lock contention: Fix spinlock and rwlock accounting")
> >   37e2a19c98bf ("perf test pmu: Set uninitialized PMU alias to null")

> > These are commits

> >   478e3c7ebbe7 ("perf daemon: Fix the build on more 32-bit architectures")
> >   4cb80590f12d ("perf python: include "util/sample.h"")
> >   60f47d2c58cb ("perf lock contention: Fix spinlock and rwlock accounting")
> >   387ad33e5410 ("perf test pmu: Set uninitialized PMU alias to null")

> > and this last one is causing an unnecessary conflict.

> These latter commits are now in Linus' tree.

I did the usual merge of torvalds/master into
perf-tools-next/perf-tools-next (devel) when perf-tools/perf-tools
(current/fixes) gets merged upstream and fixed up the trivial merge
conflict.

The end result is at the tmp.perf-tools-next branch while I do the full
container build tests, the merge commit has the explanation for the
resolution:

  Merge remote-tracking branch 'torvalds/master' into perf-tools-next

  To pick up fixes from perf-tools/perf-tools, some of which were also in
  perf-tools-next but were then indentified as being more appropriate to
  go sooner, to fix regressions in v6.11.
  
  Resolve a simple merge conflict in tools/perf/tests/pmu.c where a more
  future proof approach to initialize all fields of a struct was used in
  perf-tools-next, the one that is going into v6.11 is enough for the
  segfault it addressed (using an uninitialized test_pmu.alias field).
  
  Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Thanks,

- Arnaldo

