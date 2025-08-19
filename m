Return-Path: <linux-next+bounces-7992-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2BB2B5BE
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 03:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989A71961F51
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 01:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED421B3937;
	Tue, 19 Aug 2025 01:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="S1Fv/5sD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF75B676;
	Tue, 19 Aug 2025 01:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755566079; cv=none; b=rAfnlfDbpwrwcw7r17PdwxsqKZI/YQs/tVcXPpnALWS2PZYqiHIUpgg9bnfRpK0AUq8fShrVFq5fywD2UlDjMU2dADDL1OmEOiYdL1U3lli77dL65F2K+SDrn2h12YRu7R4aSlTRuMBEfD4Mo3d4qU56s5zl+Ln7RWszUgHnvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755566079; c=relaxed/simple;
	bh=G2eQoDbmo7kXFMxyY8mLXlnH03V5sb0aREqtO5GZvvU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rQyHc9l4Jwx5wGB//5uSURbYexffAA4iTB97KanYGWC35r9HHGo27SCNhq7ATm+V6gcZFPn3S7yQOx9MzYoHj/FRZm9vobdUvyDX9A5HgdqHg6dZfi2qaXlXUTBgow0wkZNPZ+u4p+35r+wiEN/dpApuQ0PAdGLgi/EgCWJ7Cgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=S1Fv/5sD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5A3C4CEEB;
	Tue, 19 Aug 2025 01:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755566078;
	bh=G2eQoDbmo7kXFMxyY8mLXlnH03V5sb0aREqtO5GZvvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S1Fv/5sDXlCdKZ4ZQ5KHV7QVA5RPn/OMhY+Cfl8WskwV0R8FxA0luOXNjp92PqXWO
	 b09uepSXMUKpmv4rn9iMIAP6QR/nExvDPYKh2GzIbohe5el8Ep08akq32C5SYA9JRY
	 MjoAlt6Asu0ycXV6AeAIEPYQ/9QAc+jNNBt2e1+4=
Date: Mon, 18 Aug 2025 18:14:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, SeongJae Park <sj@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mm-unstable tree
Message-Id: <20250818181437.318ed154f87f98946203a993@linux-foundation.org>
In-Reply-To: <CABFDxMHSkmH3LLmZYZN6-Ymj+yRNoaA3=9zg=4P7ZrOxrBs8bg@mail.gmail.com>
References: <20250819072328.509608a3@canb.auug.org.au>
	<CABFDxMHSkmH3LLmZYZN6-Ymj+yRNoaA3=9zg=4P7ZrOxrBs8bg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Aug 2025 09:59:20 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: a0b60d083fb6 ("selftests/damon: test no-op commit broke DAMON status")
> 
> You're right. I think it might be changed at the point rc1 -> rc2 on
> the mm tree.
> Is there anything I can do? Or maybe Andrew can help?
> 
> I didn't mean to bother you guys.  Also, original patch is from here [1]
> 
> [1] https://lore.kernel.org/all/20250816014033.190451-1-ekffu200098@gmail.com/

I deleted the Fixes: tag.  The quilt filename
selftests-damon-test-no-op-commit-broke-damon-status-fix.patch means
"this will be folded into
selftests-damon-test-no-op-commit-broke-damon-status.patch"

