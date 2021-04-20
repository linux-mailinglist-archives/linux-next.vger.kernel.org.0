Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBA9365D8B
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 18:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhDTQlW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 12:41:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232473AbhDTQlW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Apr 2021 12:41:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7827C6135F;
        Tue, 20 Apr 2021 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618936850;
        bh=nDOcbJtO+XiFZcwwX43zzmRayIqM63Gp5ogCddVXTS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I/5w5hOqfrPA5ZlwXkcOhgUFvGITpYbGRgQoEOyhivn+TUNWisoO99evstmtJokX+
         zB718a0T3xkwSL77zLD8pSNH9K3tgZrlAnp4Gq5GrnlHrlGj46wd/TD5+CvALqbrWS
         xY1ddZ7gHXVe4QUX2Le9BLtLBGTgikcOKLtoHhnEHx2GIfHfGlaOdM74Bx5tRjUuhG
         bE5agTB89UL1cbktImrEjwKi7ttK/b7P889R2N5a2PpwowvEAdJurx5Z0yxrwrGhMB
         qPiDDGUOYkeEoeJ/gdB7Bm7qtA/6tlks3NMwrAwjLdHofJbpt7dpRTNUjmCDfqfis/
         s6ngU5OfGdrFg==
Date:   Tue, 20 Apr 2021 09:40:49 -0700
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: linux-next: manual merge of the vfs tree with the xfs tree
Message-ID: <20210420164049.GF3122276@magnolia>
References: <20210419104948.7be23015@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419104948.7be23015@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 19, 2021 at 10:49:48AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/xfs/xfs_ioctl.c
> 
> between commit:
> 
>   b2197a36c0ef ("xfs: remove XFS_IFEXTENTS")
> 
> from the xfs tree and commit:
> 
>   9fefd5db08ce ("xfs: convert to fileattr")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This looks like a good resolution to the merge conflict, thank you!

--D

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/xfs/xfs_ioctl.c
> index bf490bfae6cb,bbda105a2ce5..000000000000
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@@ -1056,77 -1057,17 +1057,19 @@@ xfs_ioc_ag_geometry
>   static void
>   xfs_fill_fsxattr(
>   	struct xfs_inode	*ip,
> - 	bool			attr,
> - 	struct fsxattr		*fa)
> + 	int			whichfork,
> + 	struct fileattr		*fa)
>   {
>  +	struct xfs_mount	*mp = ip->i_mount;
> - 	struct xfs_ifork	*ifp = attr ? ip->i_afp : &ip->i_df;
> + 	struct xfs_ifork	*ifp = XFS_IFORK_PTR(ip, whichfork);
>   
> - 	simple_fill_fsxattr(fa, xfs_ip2xflags(ip));
> + 	fileattr_fill_xflags(fa, xfs_ip2xflags(ip));
>  -	fa->fsx_extsize = ip->i_d.di_extsize << ip->i_mount->m_sb.sb_blocklog;
>  -	fa->fsx_cowextsize = ip->i_d.di_cowextsize <<
>  -			ip->i_mount->m_sb.sb_blocklog;
>  -	fa->fsx_projid = ip->i_d.di_projid;
>  -	if (ifp && (ifp->if_flags & XFS_IFEXTENTS))
>  +
>  +	fa->fsx_extsize = XFS_FSB_TO_B(mp, ip->i_extsize);
>  +	if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
>  +		fa->fsx_cowextsize = XFS_FSB_TO_B(mp, ip->i_cowextsize);
>  +	fa->fsx_projid = ip->i_projid;
>  +	if (ifp && !xfs_need_iread_extents(ifp))
>   		fa->fsx_nextents = xfs_iext_count(ifp);
>   	else
>   		fa->fsx_nextents = xfs_ifork_nextents(ifp);
> @@@ -1212,10 -1167,10 +1169,10 @@@ static in
>   xfs_ioctl_setattr_xflags(
>   	struct xfs_trans	*tp,
>   	struct xfs_inode	*ip,
> - 	struct fsxattr		*fa)
> + 	struct fileattr		*fa)
>   {
>   	struct xfs_mount	*mp = ip->i_mount;
>  -	uint64_t		di_flags2;
>  +	uint64_t		i_flags2;
>   
>   	/* Can't change realtime flag if any extents are allocated. */
>   	if ((ip->i_df.if_nextents || ip->i_delayed_blks) &&
> @@@ -1348,8 -1289,11 +1291,11 @@@ xfs_ioctl_setattr_check_extsize
>   	xfs_extlen_t		size;
>   	xfs_fsblock_t		extsize_fsb;
>   
> + 	if (!fa->fsx_valid)
> + 		return 0;
> + 
>   	if (S_ISREG(VFS_I(ip)->i_mode) && ip->i_df.if_nextents &&
>  -	    ((ip->i_d.di_extsize << mp->m_sb.sb_blocklog) != fa->fsx_extsize))
>  +	    ((ip->i_extsize << mp->m_sb.sb_blocklog) != fa->fsx_extsize))
>   		return -EINVAL;
>   
>   	if (fa->fsx_extsize == 0)
> @@@ -1520,18 -1476,18 +1478,19 @@@ xfs_fileattr_set
>   	 * extent size hint should be set on the inode. If no extent size flags
>   	 * are set on the inode then unconditionally clear the extent size hint.
>   	 */
>  -	if (ip->i_d.di_flags & (XFS_DIFLAG_EXTSIZE | XFS_DIFLAG_EXTSZINHERIT))
>  -		ip->i_d.di_extsize = fa->fsx_extsize >> mp->m_sb.sb_blocklog;
>  -	else
>  -		ip->i_d.di_extsize = 0;
>  -	if (xfs_sb_version_has_v3inode(&mp->m_sb) &&
>  -	    (ip->i_d.di_flags2 & XFS_DIFLAG2_COWEXTSIZE))
>  -		ip->i_d.di_cowextsize = fa->fsx_cowextsize >>
>  -				mp->m_sb.sb_blocklog;
>  +	if (ip->i_diflags & (XFS_DIFLAG_EXTSIZE | XFS_DIFLAG_EXTSZINHERIT))
>  +		ip->i_extsize = XFS_B_TO_FSB(mp, fa->fsx_extsize);
>   	else
>  -		ip->i_d.di_cowextsize = 0;
>  +		ip->i_extsize = 0;
>  +
>  +	if (xfs_sb_version_has_v3inode(&mp->m_sb)) {
>  +		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
>  +			ip->i_cowextsize = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
>  +		else
>  +			ip->i_cowextsize = 0;
>  +	}
>   
> + skip_xattr:
>   	error = xfs_trans_commit(tp);
>   
>   	/*


