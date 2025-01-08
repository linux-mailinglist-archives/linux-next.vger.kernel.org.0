Return-Path: <linux-next+bounces-5087-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D97A05185
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 04:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDC53A761C
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 03:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF491990AE;
	Wed,  8 Jan 2025 03:21:53 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE00A3FBB3;
	Wed,  8 Jan 2025 03:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736306513; cv=none; b=GzjQYnoYh79jtstyzLplwA685+roq+cUzQhb7htzGG2z5xdCuuMOPDLBXAPVTpuuzkDKfJPFUhqCy2Ai9oiaKanOjij2DcprY3KWeFlCqGPbtw/ZKqY8+faJ9TFguqXJWhgYU38YiFDGo+l0ISx8i/YpJk97fgQNcEFdjov/4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736306513; c=relaxed/simple;
	bh=WXGQ3OhcU6Qtp1X5Yb5ac7y9iOFPNfVswT4z7YSrCmU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpF4SxTblfdoN7JVl2+gVHG8IE+SDVu+eZQeNlL/ErcwNMXLOBufVKKXqC84zfraK7wOGcp74BtaRUSDfz/v0GJyy75p89O68bm1gZjjkqpY9yHJkc0SIHcB7BSGj6HZcqGrpMno3F+jyviFdsgc4w/8NABhDfACeOhS7xPtXnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9027EC4CED6;
	Wed,  8 Jan 2025 03:21:52 +0000 (UTC)
Date: Tue, 7 Jan 2025 22:23:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Kuan-Wei Chiu <visitorckw@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20250107222321.5fd6970a@gandalf.local.home>
In-Reply-To: <20250108133207.265a6f47@canb.auug.org.au>
References: <20250108133207.265a6f47@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Jan 2025 13:32:07 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   scripts/sorttable.h
> 
> between commit:
> 
>   0210d251162f ("scripts/sorttable: fix orc_sort_cmp() to maintain symmetry and transitivity")
> 
> from Linus' tree and commit:
> 
>   4f1d0c914628 ("scripts/sorttable: Move code from sorttable.h into sorttable.c")
> 
> from the ftrace tree.
> 
> I fixed it up (I deleted the file and applied the following merge fix
> patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 8 Jan 2025 13:23:17 +1100
> Subject: [PATCH] fix up for "scripts/sorttable: Move code from sorttable.h
>  into sorttable.c"
> 
> interacting with commit
> 
>   0210d251162f ("scripts/sorttable: fix orc_sort_cmp() to maintain symmetry and transitivity")
> 
> from Linus' tree.

Thanks for letting me know. I'll likely just rebase it on v6.13-rc6 and
retest it.

-- Steve

