Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451553056BC
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 10:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhA0JV0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 04:21:26 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55274 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235165AbhA0JSn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 04:18:43 -0500
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1l4gxS-0003dS-Hj; Wed, 27 Jan 2021 09:17:50 +0000
Date:   Wed, 27 Jan 2021 10:17:48 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christian Brauner <christian@brauner.io>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the xfs tree
Message-ID: <20210127091748.p75yt7sflqjypbxp@wittgenstein>
References: <20210125171414.41ed957a@canb.auug.org.au>
 <20210127112441.1d07c1d4@canb.auug.org.au>
 <20210127031115.GA7695@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210127031115.GA7695@magnolia>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 26, 2021 at 07:11:15PM -0800, Darrick J. Wong wrote:
> On Wed, Jan 27, 2021 at 11:24:41AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Mon, 25 Jan 2021 17:14:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the pidfd tree got a conflict in:
> > > 
> > >   fs/xfs/xfs_inode.c
> > > 
> > > between commit:
> > > 
> > >   01ea173e103e ("xfs: fix up non-directory creation in SGID directories")
> > > 
> > > from the xfs tree and commit:
> > > 
> > >   f736d93d76d3 ("xfs: support idmapped mounts")
> > > 
> > > from the pidfd tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > diff --cc fs/xfs/xfs_inode.c
> > > index e2a1db4cee43,95b7f2ba4e06..000000000000
> > > --- a/fs/xfs/xfs_inode.c
> > > +++ b/fs/xfs/xfs_inode.c
> > > @@@ -809,13 -810,13 +810,13 @@@ xfs_init_new_inode
> > >   	inode->i_rdev = rdev;
> > >   	ip->i_d.di_projid = prid;
> > >   
> > >  -	if (pip && XFS_INHERIT_GID(pip)) {
> > >  -		inode->i_gid = VFS_I(pip)->i_gid;
> > >  -		if ((VFS_I(pip)->i_mode & S_ISGID) && S_ISDIR(mode))
> > >  -			inode->i_mode |= S_ISGID;
> > >  +	if (dir && !(dir->i_mode & S_ISGID) &&
> > >  +	    (mp->m_flags & XFS_MOUNT_GRPID)) {
> > >  +		inode->i_uid = current_fsuid();
> > 
> > Looking a bit harder, I replaced the above line with
> > 		inode->i_uid = fsuid_into_mnt(mnt_userns);
> 
> I think that looks good, though Mr. Brauner is probably better equipped
> to tell if that change is correct.

This is on top of the setgid fixup. Yes, this looks good! :)

I think what I'll do is to simply build -next for every release up until
the merge window and run the xfstests I added on the kernel. That should
reveal regressions very quickly.

> 
> (He says watching kernel.org mail take nearly a day to come through...)

Yeah, it had crazy delays (> 1 day). I chased down a few missing mails
from yesterday. Jon took that opportunity to make vger behave a little
better I believe, so delivery should be faster today, hopefully.

Christian
