Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C5130533D
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 07:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbhA0Gb6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 01:31:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:59076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233787AbhA0DMh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 22:12:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24CB220639;
        Wed, 27 Jan 2021 03:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611717076;
        bh=04pxKoswdp9eDCNzSWVd+jkXEOIvxj4syJjvxYEICZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ganhP9MpbbTL3psKQAMtwInaoysHgwc/+Ir47W+y+LgJLjEGbiOpUAU7dQoQnLqqV
         PCuG0bZOABdz1suOtV2xvnP0Bu78f/yaf8NACa18au+jNXHPcerrSDrQfP3LZ1dc7C
         9yP2RN67QouPQa4b/L2tJ1ajh3nDWfN7TiBeies3qeXVxIKdeop9BE3mi+3vqByb5Z
         JKxYSNJlRWjYslQ5PLHJzXdQYWkXYG5IWTIH8/XC+BfDKBdQOb6U0tCSYUrBjfXZAU
         nQB8zRC2bh0g1yFVpiJozsU9oGVdYUp/vxw5mOGRCPdgc4fYUUKGv2jSn4oEKDMeb3
         e6laIdrmOD6VQ==
Date:   Tue, 26 Jan 2021 19:11:15 -0800
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the xfs tree
Message-ID: <20210127031115.GA7695@magnolia>
References: <20210125171414.41ed957a@canb.auug.org.au>
 <20210127112441.1d07c1d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127112441.1d07c1d4@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 27, 2021 at 11:24:41AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 25 Jan 2021 17:14:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the pidfd tree got a conflict in:
> > 
> >   fs/xfs/xfs_inode.c
> > 
> > between commit:
> > 
> >   01ea173e103e ("xfs: fix up non-directory creation in SGID directories")
> > 
> > from the xfs tree and commit:
> > 
> >   f736d93d76d3 ("xfs: support idmapped mounts")
> > 
> > from the pidfd tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc fs/xfs/xfs_inode.c
> > index e2a1db4cee43,95b7f2ba4e06..000000000000
> > --- a/fs/xfs/xfs_inode.c
> > +++ b/fs/xfs/xfs_inode.c
> > @@@ -809,13 -810,13 +810,13 @@@ xfs_init_new_inode
> >   	inode->i_rdev = rdev;
> >   	ip->i_d.di_projid = prid;
> >   
> >  -	if (pip && XFS_INHERIT_GID(pip)) {
> >  -		inode->i_gid = VFS_I(pip)->i_gid;
> >  -		if ((VFS_I(pip)->i_mode & S_ISGID) && S_ISDIR(mode))
> >  -			inode->i_mode |= S_ISGID;
> >  +	if (dir && !(dir->i_mode & S_ISGID) &&
> >  +	    (mp->m_flags & XFS_MOUNT_GRPID)) {
> >  +		inode->i_uid = current_fsuid();
> 
> Looking a bit harder, I replaced the above line with
> 		inode->i_uid = fsuid_into_mnt(mnt_userns);

I think that looks good, though Mr. Brauner is probably better equipped
to tell if that change is correct.

(He says watching kernel.org mail take nearly a day to come through...)

--D

> 
> >  +		inode->i_gid = dir->i_gid;
> >  +		inode->i_mode = mode;
> >   	} else {
> > - 		inode_init_owner(inode, dir, mode);
> >  -		inode->i_gid = fsgid_into_mnt(mnt_userns);
> > ++		inode_init_owner(mnt_userns, inode, dir, mode);
> >   	}
> >   
> >   	/*
> 
> -- 
> Cheers,
> Stephen Rothwell


