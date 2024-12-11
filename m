Return-Path: <linux-next+bounces-4941-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0079EC96B
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 10:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18D11889D17
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 09:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F241C1F22;
	Wed, 11 Dec 2024 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGdOXM0A"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6256236F89;
	Wed, 11 Dec 2024 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910291; cv=none; b=fsLM+ub5WwhhzAPuiOcZ++lRN6a3/RuTzeeQA5LkKsw8L0kL1Rw2UVrPXgKF8zJwOEXKp/DJamgenYrXSD9RuyKw84OrqyBpiHuX+xvlPfAZW8C2KMEDdvjPZC+w2tna1BC5QvnX4zhnF5M6iSMGGEKtHwXeFcr+yVn22hyJ2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910291; c=relaxed/simple;
	bh=Ex6cTuHsHnotpZ25WZxob618vffzdexeNfX47lRIkis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGyGyxkZ5HQ+wvycsLrRlBucQBK1eOcWxjNJUjKiAaIg+/l219RRfK7yoFaqqbATlPZtP9AbdHuZJ9FDPiXvTImmLWw4OJ1wSscc5GHq0JwX1AsJTiRBl3rvAmVMOuC2zkXPtIATVVvZzRxKG/A/U95cS44FKwgJFBjRyfxt6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGdOXM0A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF1DC4CED2;
	Wed, 11 Dec 2024 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733910291;
	bh=Ex6cTuHsHnotpZ25WZxob618vffzdexeNfX47lRIkis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGdOXM0AuHiboqGcIim8wXSC6HN1rCfj2FJXuQJ9UCeVT/GhyS0BRfY+8NHMuJ4r6
	 NUldL1CIa8tqCiJr1ahNEmMxh8s+6OQpI1AGnpMK4DSW/OL9FZOqo23RcAMvx9GYej
	 1wFBa+Xm3G/oI842EZ5rwlIqDWmWLtDtxuKNCEnvTZsNaPUl1TPYgoxA31+b3O9ksi
	 PUwEu+89h9imwMOxQVz7+/e4dGR0tdmcWlQVGJqE69dFtVLh2y4exSWBWq/RHVOhdm
	 uZHPqT64uwactE424SikMMu4Wv3rzraoDYKvmHnWCUXnDZpd3C37LZX8mRfbo1/r0V
	 kjS4lIk1Lys1w==
Date: Wed, 11 Dec 2024 10:44:46 +0100
From: Carlos Maiolino <cem@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <2ysi332hv6kqgoqk64zjrl7vbby24m2xbg6awbhkfvg7sq3sce@7xopdtzxd76d>
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
> 

Thanks Stephen. I'm testing the fix now, and I'll push an update today.

Carlos

> -- 
> Cheers,
> Stephen Rothwell



