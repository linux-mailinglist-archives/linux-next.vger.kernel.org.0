Return-Path: <linux-next+bounces-7386-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 934DCAFBF32
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 02:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB9F54A6050
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 00:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA8A32C8B;
	Tue,  8 Jul 2025 00:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="A5eD3c93"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A50288A0;
	Tue,  8 Jul 2025 00:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934316; cv=none; b=A6iGyHiCSrxOYA0/13GgsCQdOxw8kKioEEd8XLq9Vc7tbYkdxaJR4PXysTDtyQ+Vty9jnp7UeTajsDvxvm2nVJZUYZyChnOvB1jsTryRaPXgycAgSLyVpeTrzFoZKP/p0FueZj3Nzc+4PjC3hXUGiLPErf/fbdZsvJbHZOTbilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934316; c=relaxed/simple;
	bh=fVPhfJhapqHfG/F4cZnKQ1B5MT2Jg25lMcyfhjkXmHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbFc4yp0Ym9rzi1gjw88h+0fLz+uJsnSTUfWLzKJFGZl4LK7CSZhedGNlowjByOg6xcNULuIyrJlg6/sgM35RFzBGBNF00srMKvuV1IF7NmdceesSWkOC36H/S+iwYb699nr597ECeFznkBbgIP1jzOemzVvskW0T6U3TN485MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=A5eD3c93; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tH50HIHpFY1eUhx7C9oew23YMRZ/kKvobodXFZfuxtA=; b=A5eD3c93QA8ixVdAwoMLmOZMIt
	oC9Gb09MvlU7JY6Cks8ua6mPlPT4zfYEQt42slEGaxkzr8P/rYxemiLPeFFY1smOE9mWdOyP6YYw7
	J6/lAR8WGrsL/kDzhe/O1ko0cDjM9nCdBjCtLc2k01HvnFJwFJndvIpQAQPQAd8EDykKmwUFtsawg
	3OUpuLSLlnoyVQWd+KHemMF5f+fRVtqHPLyB5kBeEHpRUqq/fxIXgeBbHwhwGyVMTvaZKa0ZHyWDe
	2lTR+IwSrklWAcLv+CYUtH9BCB14s+pHSkvm75TWA/LN5PpAMc5FVxU/9pBWPyVqRUcBmGRBPy8Hp
	BKHlmXQQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYw8z-000000051vx-2mT2;
	Tue, 08 Jul 2025 00:25:09 +0000
Date: Tue, 8 Jul 2025 01:25:09 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs tree with the vfs-brauner
 tree
Message-ID: <20250708002509.GR1880847@ZenIV>
References: <20250708093837.52e3a89d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708093837.52e3a89d@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Jul 08, 2025 at 09:38:37AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/fhandle.c
> 
> between commit:
> 
>   1c5484395f9f ("fhandle: reflow get_path_anchor()")
> 
> from the vfs-brauner tree and commit:
> 
>   8ae91ad6499b ("fold fs_struct->{lock,seq} into a seqlock")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Umm...  Let's do it that way - fs/fhandle.c chunk of that commit is
trivially split off and the rest should not conflict at all.

Christian, would you mind throwing this on top of your vfs.pidfs?  I'm dropping
that part from my #work.misc commit...

[PATCH] get_path_from_fd(): don't open-code get_fs_pwd()
    
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/fs/fhandle.c b/fs/fhandle.c
index b1363ead6c5e..7c236f64cdea 100644
--- a/fs/fhandle.c
+++ b/fs/fhandle.c
@@ -180,11 +180,7 @@ static int get_path_anchor(int fd, struct path *root)
 	}
 
 	if (fd == AT_FDCWD) {
-		struct fs_struct *fs = current->fs;
-		spin_lock(&fs->lock);
-		*root = fs->pwd;
-		path_get(root);
-		spin_unlock(&fs->lock);
+		get_fs_pwd(current->fs, root);
 		return 0;
 	}
 

