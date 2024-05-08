Return-Path: <linux-next+bounces-2233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4868C071D
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 00:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1568B28428F
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 22:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C931332A7;
	Wed,  8 May 2024 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="SGXSUbsf"
X-Original-To: linux-next@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC3D530
	for <linux-next@vger.kernel.org>; Wed,  8 May 2024 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205907; cv=none; b=Fyy/JP90Laz/eRrbDe9xC1vKL/GfD6UKV1pBThSq9s87F98OTyuqa9W7nBaO966wE97GLcH5B1QmqgEAGjDycApGMM7+kRg/6prarN6QkmJoSE2pU/A4ZsSDPQOatp83aKoZ5ABRblTnIw039jQLwsBnLVHTvw1Nq+erN7aiAa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205907; c=relaxed/simple;
	bh=KABPgwE0pigLe/stqXFpNZgiPsJrHsm9MvrMXNC+AZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FziJd7m8dVDzUSF75Q0lYrPJjORuF21CZEoczQ9hZJrI7bXHJRlQ9Mvsxjk+GQXD0EUMtZizYbqBch7g5vz+DzHAJ4E3dUL+9XVgdj4VWM0sq3jmICYFFQuGu0gUa6/DHzhq8zk6chuDq+HPM/+PknThOWjMkCL0oWd1eLhwdn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=SGXSUbsf; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 448M4Yxu009182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 18:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1715205879; bh=5ypHmjNsTrYNX0vfbc84/6O6MkoCV0OFM+TJ+Bn/Er0=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=SGXSUbsfAWX9PZBN1Wmhw91h8AkspLeppUe2ntzmH7dlA4tjEx2P94eB0V3yxokdb
	 lOLNEjIX73PsnmkM+olEPKEVl88ESylJ07cbUQJClm/x6l7dQQCrZkNnvJgtHLiXpx
	 suKeE8ad4Z8+x9pzxdivKhGyI6ngbIPLvtNYTsX6uIOKSWQPTIyptkisjJJ/bUuwYa
	 iAZBexG8CiWuch6KyVa225eByWszagaohwByLaPi5xdmKQCJXVcRHi2aPnUkVS4pnc
	 8kWf5cWTx4mPdg5Z2FK8MbuKPMTrfecaXkRCpQ5IxIrj4UlZHNUtVByTm6hrT/OmsO
	 KW0LCCI6NPU0Q==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 80CF015C026D; Wed, 08 May 2024 18:04:34 -0400 (EDT)
Date: Wed, 8 May 2024 18:04:34 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ext4
 tree
Message-ID: <20240508220434.GA3620298@mit.edu>
References: <20240508103436.589bb440@canb.auug.org.au>
 <20240508064700.GB10736@lst.de>
 <20240508165953.67afc064@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508165953.67afc064@canb.auug.org.au>

On Wed, May 08, 2024 at 04:59:53PM +1000, Stephen Rothwell wrote:
> On Wed, 8 May 2024 08:47:00 +0200 Christoph Hellwig <hch@lst.de> wrote:
> > 
> > Ted, if you still can maybe just drop the ext4 patch for now?  I can
> > redo it for next merge window with the moved flag.
> 
> If the resolution I did is fine, I am sure Linus will cope (but worth
> mentioning it to him in the pull request).  Its a simple enough conflict.

I agree... but at the same time, the patch in question is a cleanup
and there's not a lot of downside in dropping this for a cycle.
Cristoph, is that right?  Will not taking this cleanup block anything
that you were hoping to land this cycle?

I'm fine either way with either asking Linus to fix up the merge, or
dropping it and picking it up later.  In fact, I'd be fine just simply
landing this post -rc1.

So what do people think?  Again, I don't have strong opinions one way
or another.

					- Ted

	



