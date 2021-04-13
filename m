Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166CA35E287
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 17:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhDMPVI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 11:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229580AbhDMPVI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 11:21:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EF0A611CE;
        Tue, 13 Apr 2021 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618327248;
        bh=p7RmkSd/YcaE9xShOUQVPFRf7C98RAW1RMeav80HG/w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jzrec9I5m/SmWCWVUPqBvFSFxcC+AulSvd9xXmg3Qz2ndDXDGSGUTEND16LngCdWa
         pmqV5AoDS+tWkj1zyvNljxGjExbIvJ7Ia7tA3Ndfe3UvpI849Iuq/KwWKtdG9L8l/4
         d0DJLCsc1o3Zt32tvwY1n92YqttIXxjLlxNI/hxnkFoKTG0xbJc0zcZMgi8Ldp4KTI
         nXe6WTPWPh+ALXPwLzM1D337g/6pM3Kr9HugI5tjErwaldS2+ywotWamJ3R1ANSHkE
         pyac2niEGTiIPr1s2u6AlIoY89ApC+5W2OEIz8GSXMdZASGzP7p6vUniRdLaPGC4D1
         xCy9IaNz0EKDg==
Date:   Tue, 13 Apr 2021 08:20:48 -0700
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: linux-next: manual merge of the vfs tree with the xfs tree
Message-ID: <20210413152048.GM3957620@magnolia>
References: <20210412122211.713ca71d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412122211.713ca71d@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 12, 2021 at 12:22:11PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/xfs/xfs_ioctl.c
> 
> between commits:
> 
>   ceaf603c7024 ("xfs: move the di_projid field to struct xfs_inode")
>   031474c28a3a ("xfs: move the di_extsize field to struct xfs_inode")
>   b33ce57d3e61 ("xfs: move the di_cowextsize field to struct xfs_inode")
>   4800887b4574 ("xfs: cleanup xfs_fill_fsxattr")
>   ee7b83fd365e ("xfs: use a union for i_cowextsize and i_flushiter")
>   db07349da2f5 ("xfs: move the di_flags field to struct xfs_inode")
>   3e09ab8fdc4d ("xfs: move the di_flags2 field to struct xfs_inode")
> 
> from the xfs tree and commit:
> 
>   280cad4ac884 ("xfs: convert to fileattr")
> 
> from the vfs tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This looks correct to me; thanks for pointing out the merge conflict! :)

--D

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/xfs/xfs_ioctl.c
> index 708b77341a70,bbda105a2ce5..000000000000
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@@ -1056,76 -1057,16 +1057,18 @@@ xfs_ioc_ag_geometry
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
>  +
>  +	fa->fsx_extsize = XFS_FSB_TO_B(mp, ip->i_extsize);
>  +	if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
>  +		fa->fsx_cowextsize = XFS_FSB_TO_B(mp, ip->i_cowextsize);
>  +	fa->fsx_projid = ip->i_projid;
>   	if (ifp && (ifp->if_flags & XFS_IFEXTENTS))
>   		fa->fsx_nextents = xfs_iext_count(ifp);
>   	else
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


