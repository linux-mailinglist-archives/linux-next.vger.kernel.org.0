Return-Path: <linux-next+bounces-5371-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D46B2A28747
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 11:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 452DD3A2527
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 10:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAEB227B98;
	Wed,  5 Feb 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKjLv2HM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32421C192;
	Wed,  5 Feb 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749781; cv=none; b=kRX0J/kjc8jY/754v6SGkI/TdPo7XR8GyGGrzhUUs/kJNJLGn5rEQQ9dCkaUeGTm+d14ujHAfDzo6OQA8/VqV/3rtTL1zKzsFjKnH8t4L3cmJHzsbptnCVlAzraXrOWlfoD80Zt5EKlcWTF9NTDqKduLzpkl2hB1T77mKkKwuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749781; c=relaxed/simple;
	bh=eEIXyeTqTciBT2AyEUTZ/fjpAhvMvA/BpJ5cjCaSlWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZMHcKA8yvofx3f3dYmV7vdkJnuOkG/8BUtdOo3C5CNA/nPmUUIFNpo44ZHaS3m7JehzSqzp9Ix7h3fUY/zOPiSyfOlIBHl1+gMUfvgCP87oM9b5TE8wOoLBha0eKOymDK8ZMYPdHwpMWiwnweQ0wbO9QGsNAmO2zl61ThQY1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKjLv2HM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D856C4CED1;
	Wed,  5 Feb 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738749780;
	bh=eEIXyeTqTciBT2AyEUTZ/fjpAhvMvA/BpJ5cjCaSlWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKjLv2HMDz9R+BWcXt4qxKdw53xV2avVQC59yLi1c8YDWn6AAdoP4QsnmmnTxOCpj
	 SA73vFXAmw8P8aIlStVwpkZn7zzQ746wFQvRHlSQxOu3NbIy5YRWig3pD/1bENc+yz
	 CmVSMutzkDjUwnAwKv2U3zbEPm7BnMhwxTdxo/hyzIxG1YXZWrZV7pxb8fiQJCpUCd
	 6TC9vKqi0P8cA2iiCqCgNjfRoYLO1sOnIcK6lOBiNVh21SdZwYhBFeIyyDgsHbzn8p
	 HDrfEQwcdIm6T5tLT0mn8gqLRpkAi3E0RRlh2I//FVOAvOtYJwk4+gXjVJYJY78pr6
	 LEIq9Cg3BZaYg==
Date: Wed, 5 Feb 2025 11:02:56 +0100
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with Linus' tree
Message-ID: <20250205-mundwinkel-lausbub-57cdb259c734@brauner>
References: <20250205093823.4567f09f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250205093823.4567f09f@canb.auug.org.au>

On Wed, Feb 05, 2025 at 09:38:23AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got conflicts in:
> 
>   fs/dcache.c
>   fs/erofs/zdata.c
>   fs/gfs2/quota.c
>   include/linux/lockref.h
> 
> between commits:
> 
>   4b193fa75eff ("lockref: remove lockref_put_not_zero")
>   6d2868d5b6fc ("lockref: use bool for false/true returns")
>   25d8060418b4 ("lockref: drop superfluous externs")
>   63440d1c6dd1 ("lockref: add a lockref_init helper")
>   8c32b87c4f88 ("dcache: use lockref_init for d_lockref")
>   6f86f1465b59 ("erofs: use lockref_init for pcl->lockref")
>   3e652eba244c ("gfs2: use lockref_init for qd_lockref")
> 
> from Linus' tree (plus further commits affecting these same files in other
> trees) and commits:
> 
>   74b5da771c89 ("lockref: remove lockref_put_not_zero")
>   57bd981b2db7 ("lockref: use bool for false/true returns")
>   80e2823cbe59 ("lockref: drop superfluous externs")
>   5f0c395edf59 ("lockref: add a lockref_init helper")
>   24706068b7b6 ("dcache: use lockref_init for d_lockref")
>   160a93170d53 ("erofs: use lockref_init for pcl->lockref")
>   0ef3858b15e3 ("gfs2: use lockref_init for qd_lockref")
> 
> from the vfs-brauner tree.
> 
> I fixed it up (these commits are just duplicates, so I used the former
> vresions of these files) and can carry the fix as necessary. This is now
> fixed as far as linux-next is concerned, but any non trivial conflicts
> should be mentioned to your upstream maintainer when your tree is
> submitted for merging.  You may also want to consider cooperating with
> the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> Please clean up the vfs-brauner tree.

Done and new tree pushed.

Thanks!
Christian

