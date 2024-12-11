Return-Path: <linux-next+bounces-4944-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3F9ED8F5
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 22:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C86E18884EA
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 21:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F131C5488;
	Wed, 11 Dec 2024 21:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMibYZ+J"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F230F1BD9C6;
	Wed, 11 Dec 2024 21:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733953294; cv=none; b=hV26Up0jafAUCyhiErVVHYcHeCY27CrHO++JGh5fg57jXhCNqliV6d4xZnZ4xl/GDBnZMoBu9OmCWfkJSKOZhErMA72tROL6SvaU3bTwJWsAhi+eU5WW+wGOx8wUhaPDP0PGgUImvFdwt/cRNHZibHGDW0L5blmXrbw0kOHfl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733953294; c=relaxed/simple;
	bh=2NIfMhqP1uj4EPFzd420md4tR5mG9ClSuvduN94uqFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAzrxWkKvK2kuVJtZzpg2+GKFbbyVvL5wb8oHuyIzgu67EEGIXmaiO+YcRGbmSq9mFqdt+SoCGFsr7RrHAg+NJqaT1dGSTQG5UBuiQPIZD/g2ugmdMGRnoz+3WasIUgmTocRstwL1Y5ZgaGn1EhZLFh0nmP41mIsAqYyFngpRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMibYZ+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB955C4CED2;
	Wed, 11 Dec 2024 21:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733953293;
	bh=2NIfMhqP1uj4EPFzd420md4tR5mG9ClSuvduN94uqFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMibYZ+Jnp18SVATXbHMZh/9ylTHRyxBZQlNfi1YUIZmz9pzHBQZMkEHqGrCFIxC9
	 R5tyR6/s/8rpddWDUz1CdLGv7rLaIl+jtB3OUFgDpXKO0yecaDSAQFsbKyUjcxhy6P
	 ekV6qZ7OaputVn5p/iyKg377cwK/p4c75AhWSfpKLcOVij7Yqh9P8i7o4YGM+/IZv1
	 O47WcN5daKv2GW3RCz7JuBfdqO1OdiZPcoGmHFQ9V3giQDsV8EGnws8Vcx5F/9hsQZ
	 U3QoH4TCOPyWwA8KTluLJ5VPJ+VnZPZGV43oB+r/PhtV8/XKcCOKFT0IErQI70vYU5
	 VJDCm27YwTPrA==
Date: Wed, 11 Dec 2024 22:41:29 +0100
From: Carlos Maiolino <cem@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <vtxk3tdzp6eim5bsmlio4rlahuq2lbrjrgawunhvc7ecqn7yfy@yjkxfdmdsft6>
References: <20241211090445.3ca8dfed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211090445.3ca8dfed@canb.auug.org.au>

On Wed, Dec 11, 2024 at 09:04:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/xfs/xfs_trans.c: In function '__xfs_trans_commit':
> fs/xfs/xfs_trans.c:869:40: error: macro "xfs_trans_apply_dquot_deltas" requires 2 arguments, but only 1 given
>   869 |         xfs_trans_apply_dquot_deltas(tp);
>       |                                        ^
> In file included from fs/xfs/xfs_trans.c:15:
> fs/xfs/xfs_quota.h:176:9: note: macro "xfs_trans_apply_dquot_deltas" defined here
>   176 | #define xfs_trans_apply_dquot_deltas(tp, a)
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   03d23e3ebeb7 ("xfs: don't lose solo dquot update transactions")
> 
> $ grep CONFIG_XFS_QUOTA .config
> # CONFIG_XFS_QUOTA is not set
> 
> I have used the xfs tree from next-20241210 for today.

I just pushed a few extra patches to xfs-linux/for-next, which includes the
failure to build without QUOTA config enabled.

I also did a build test on different configurations (and added a todo list to
improve build testing here), so, it should be ok for you to pull it now Stephen.

Let me know please if you find some other issue.

Have a nice day out there.

Carlos

