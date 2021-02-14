Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245F031B370
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 00:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhBNXin (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 18:38:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:37776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229881AbhBNXin (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 18:38:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AB1F64DEA;
        Sun, 14 Feb 2021 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613345882;
        bh=1mL3FqIW/Z1riGHUFrBcsw/2g74ZNcTC1MqizKwV19w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WjiMcPyCy45EoxTMt1Ljqlw7WOkm8rKVrzJVhNGDlOL4IaJVeE2Nsf88qw/SGnN1c
         v8/IK8PmVhcj984yYj7dxjy05U/yJKVpSLh3Vf3hsgCyDsJNey3DwcsA4okE0xA731
         6Dc+Em0hPRnfEYOkmBU8sDlUzbifSKnzE8DAr8m8IRx36v9YhqJIMQurII6EHxa5br
         o+dlxGosGEqktna/DQR6VknJCiOIr/y+jqN5w07JcKS6ROJEZW/GgfNibOKvUv2jW6
         BkBNQmT1mkvEZ2J30wv8tDzYLPz4hxDSUJG7qMct85rU5eS68XKT+7LnZjMrkFEy1l
         2wNtU29qrsNYA==
Date:   Sun, 14 Feb 2021 15:38:01 -0800
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the xfs tree with the pidfd tree
Message-ID: <20210214233801.GP7193@magnolia>
References: <20210208103348.1a0beef9@canb.auug.org.au>
 <20210215094131.7b47c1c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215094131.7b47c1c5@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 15, 2021 at 09:41:31AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 8 Feb 2021 10:33:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the xfs tree got a conflict in:
> > 
> >   fs/xfs/xfs_ioctl.c
> > 
> > between commit:
> > 
> >   f736d93d76d3 ("xfs: support idmapped mounts")
> > 
> > from the pidfd tree and commit:
> > 
> >   7317a03df703 ("xfs: refactor inode ownership change transaction/inode/quota allocation idiom")
> > 
> > from the xfs tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.

Oops, sorry, this email fell off my radar.  Your fixup looks good to me;
thanks for the reminder.

--D

> > 
> > diff --cc fs/xfs/xfs_ioctl.c
> > index 3d4c7ca080fb,248083ea0276..000000000000
> > --- a/fs/xfs/xfs_ioctl.c
> > +++ b/fs/xfs/xfs_ioctl.c
> > @@@ -1280,9 -1275,9 +1280,10 @@@ xfs_ioctl_setattr_prepare_dax
> >    */
> >   static struct xfs_trans *
> >   xfs_ioctl_setattr_get_trans(
> > - 	struct file		*file)
> >  -	struct xfs_inode	*ip,
> > ++	struct file		*file,
> > + 	struct xfs_dquot	*pdqp)
> >   {
> >  +	struct xfs_inode	*ip = XFS_I(file_inode(file));
> >   	struct xfs_mount	*mp = ip->i_mount;
> >   	struct xfs_trans	*tp;
> >   	int			error = -EROFS;
> > @@@ -1470,9 -1461,9 +1469,9 @@@ xfs_ioctl_setattr
> >   
> >   	xfs_ioctl_setattr_prepare_dax(ip, fa);
> >   
> > - 	tp = xfs_ioctl_setattr_get_trans(file);
> >  -	tp = xfs_ioctl_setattr_get_trans(ip, pdqp);
> > ++	tp = xfs_ioctl_setattr_get_trans(file, pdqp);
> >   	if (IS_ERR(tp)) {
> > - 		code = PTR_ERR(tp);
> > + 		error = PTR_ERR(tp);
> >   		goto error_free_dquots;
> >   	}
> >   
> > @@@ -1615,7 -1599,7 +1606,7 @@@ xfs_ioc_setxflags
> >   
> >   	xfs_ioctl_setattr_prepare_dax(ip, &fa);
> >   
> > - 	tp = xfs_ioctl_setattr_get_trans(filp);
> >  -	tp = xfs_ioctl_setattr_get_trans(ip, NULL);
> > ++	tp = xfs_ioctl_setattr_get_trans(filp, NULL);
> >   	if (IS_ERR(tp)) {
> >   		error = PTR_ERR(tp);
> >   		goto out_drop_write;
> 
> With the merge window about to open, this is a reminder that this
> conflict still exists.
> 
> -- 
> Cheers,
> Stephen Rothwell


