Return-Path: <linux-next+bounces-9348-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE660CA5CE4
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 02:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45FD3308EAEC
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 01:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C66F215055;
	Fri,  5 Dec 2025 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cr7pfQf/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040C1E376C;
	Fri,  5 Dec 2025 01:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764897064; cv=none; b=hk0I9Ip/TUhqWInHXlmmfnU2NZeOKRvd9xRzwmlk4NmLydmeEqY7mVUnznmc14BISZSCMDrTMe2iCQP8MzsuUu8AblpHFshSb0lhbK9M1hN7q1U1mD4dAaGxx/LOYe32cuGdxDMSngeTbwqdUTDgmctvpS4K1Ylqd8vdz8TLwrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764897064; c=relaxed/simple;
	bh=siLgYtqFTu9b2GrAa8lNATsh0OuHc4I1OTUAU1y4mCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlvilpzRW4VtXsvx+YmYcCBodGgLKHU8VKAmSp3j6VapUVdeMteDan29G9InameEps6RpmVBsMkD4wagKGavLqRhRrlLxDGLNn2w/xyHeTqEwIPaJNZiawuSy8nPxSk+KgAQdi0GnD/q7Z7pqfPZVWZIF65UQVzU4a40yzOhr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cr7pfQf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FBEC113D0;
	Fri,  5 Dec 2025 01:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764897063;
	bh=siLgYtqFTu9b2GrAa8lNATsh0OuHc4I1OTUAU1y4mCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cr7pfQf/0a+cb0S6L06Dm8j8g/McfjaF3UrT3YK90CC46OyYE09mlOfSpXKdQqj8R
	 TSqZqje5GUQR4ppPnKYow+ob2qjjAAQtp+Z4ETf9RPXr8lO7UjTj8nbegmYzrdG6JF
	 FluJmveGMfboc0Oyn3bDNQsfs4eLF/cRKNttv+Ntg5AowqOlH169ROFIuQA+poA06t
	 9Yia6U+ftPqHPDTuhp97nvhAj7GCYSuMnnoIREKhWG4nQ3ofQzSSp/KestYPlgEd/j
	 BIJTUvlnBIXN92UNmeJHq80LCRNYI1hLjlC0iXJs63nFpyZlhWb1+iGlc+HiyPyS3H
	 c52d349aqTFkA==
Date: Thu, 4 Dec 2025 20:11:02 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Trond Myklebust <trondmy@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the nfs tree with Linus' tree
Message-ID: <aTIxJixIhp7SuL2b@kernel.org>
References: <20251205111942.4150b06f@canb.auug.org.au>
 <cb86e6fdf9b689026b3e7aee5a3d04a90446fa5b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb86e6fdf9b689026b3e7aee5a3d04a90446fa5b.camel@gmail.com>

On Thu, Dec 04, 2025 at 07:34:30PM -0500, Trond Myklebust wrote:
> On Fri, 2025-12-05 at 11:19 +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the nfs tree got a conflict in:
> > 
> >   fs/nfs/localio.c
> > 
> > between commits:
> > 
> >   94afb627dfc2 ("nfs: use credential guards in
> > nfs_local_call_read()")
> >   bff3c841f7bd ("nfs: use credential guards in
> > nfs_local_call_write()")
> >   1d18101a644e ("Merge tag 'kernel-6.19-rc1.cred' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs")
> > 
> > from Linus' tree and commit:
> > 
> >   30a4385509b4 ("nfs/localio: fix regression due to out-of-order
> > __put_cred")
> > 
> > from the nfs tree.
> > 
> > I fixed it up (I just dropped the nfs tree commit) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is
> > concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also
> > want
> > to consider cooperating with the maintainer of the conflicting tree
> > to
> > minimise any particularly complex conflicts.
> 
> I'm worried that resolving this is not going to be trivial...
> 
> The nfs tree commit is a fix for a regression that appeared in 6.18,
> and the problem with just dropping it in favour of the scoped cred
> version in Christian's tree is that that appears to propagate the
> regression.
> 
> Mike, am I wrong?

You're correct. But I just sent how I think we need to handle this.

Thanks,
Mike

