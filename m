Return-Path: <linux-next+bounces-9524-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA54DCF18F2
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 02:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F2AC3006599
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 01:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7425B2C0266;
	Mon,  5 Jan 2026 01:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mMtpYtjx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A32E63C;
	Mon,  5 Jan 2026 01:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767576384; cv=none; b=VXy0Wo3kXVhF2pd74+9J9rJFkuNSh3lxycbw7e+UAsSo+OtxVS/kdq33tz0zXTRCJ2ZemG8L+f1odQnOFGtcF+ycXc3fp/78Xm/pyYu54fej0qFpLD+TxtjSGjmPlQvK7jCZKwtpH+CiIjmuTFPNvzQJgSz0Ti9fReHZiky+n4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767576384; c=relaxed/simple;
	bh=1frrz5eswChf1fdBAC0DXdvSUB8jxjrdop1Y52m//DI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YHTGCoAMMg2k0g8g1U9fcxw1MRo2FpsJb0wuNbajyTDl9ww6kzyFpovjTxtZVY6xjZl5biK5ZSh+ILH0CSepaOKRXxtPTauqUJbrB44KTYE6j8vzaqGR8IPvmLJnc+0mrTA5jPLWczgf9fXfZCy+UvdrW2KLL8G/HNg2LtJfVqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mMtpYtjx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808D3C4CEF7;
	Mon,  5 Jan 2026 01:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767576383;
	bh=1frrz5eswChf1fdBAC0DXdvSUB8jxjrdop1Y52m//DI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mMtpYtjx9eXTHXW+8oA3EU7c4B5BHVnGif3tbCqwNykUy4RgMROO5xd84O3IHt6vJ
	 XWL3izRhD0l+PVJOR7+ukAOJsYFRgI3sYy5kbZkS/QZysetb8o9BXHfLJliXIZ0c3R
	 gJ5lKe7IBFVv/Ti1Q2x6OfHjmKnn+PHl1rt1buzc=
Date: Sun, 4 Jan 2026 17:26:22 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Li Wang <liwang@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the mm-unstable
 tree
Message-Id: <20260104172622.ab628adfd6056401b68b2011@linux-foundation.org>
In-Reply-To: <20260105083851.19677121@canb.auug.org.au>
References: <20260105083851.19677121@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Jan 2026 08:38:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commits
> 
>   8bd5f5187a2f ("selftests/mm/charge_reserved_hugetlb.sh: add waits with timeout helper")
>   378d74dfdea6 ("selftests/mm/charge_reserved_hugetlb: drop mount size for hugetlbfs")
>   99f5e30c38ac ("selftests/mm/write_to_hugetlbfs: parse -s as size_t")

huh, thanks.  The changelogs have

: The hugetlb cgroup usage wait loops in charge_reserved_hugetlb.sh were
: unbounded and could hang forever if the expected cgroup file value never
: appears (e.g.  due to write_to_hugetlbfs in Error mapping).
: 
: --- Error log ---

and that "^---$" fooled git-quiltimport into thinking "end of
changelog".  Huh.

I'll fix that and shall figure out some way to check for reoccurrences.


