Return-Path: <linux-next+bounces-2717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2091CC05
	for <lists+linux-next@lfdr.de>; Sat, 29 Jun 2024 12:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADC8FB21E32
	for <lists+linux-next@lfdr.de>; Sat, 29 Jun 2024 10:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007DC4502C;
	Sat, 29 Jun 2024 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcsEX+Dk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBD4502B;
	Sat, 29 Jun 2024 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719655531; cv=none; b=cus218G7TVsMAzSArWMcHJVvfPLQxaFc3scIIXyVEN3f2WaLnBdclODApblrMPzqOSQFDfxl8CErXoM4aCXJR7t5kJEZ1Za0L2/H2CvPc1B+KaoOrBFpk5WgkCLtfMxEkPme1YqS2sWsmmwkHk+htCLuf18zBrObt6CHEt3103A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719655531; c=relaxed/simple;
	bh=QMUBxcf51e7Dv4UynDAQchO/XHNYIZCbexn9EQecgaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uz73VgcqS33arUnQ8jQzHQX8BiCudsPhikhZCliz35pzXzvwSwuoCkUYVLqp0yeDZ5LkwIYb6nU1fqwUI4g3JX4BtBfNd3ZLT98L2X1US814np/RWFoDcvznbGNj7ovmLmWaoHvjWMz4Qfvv+JIPnuuqMHpNsTtACb5EVIKUn8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcsEX+Dk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF285C2BBFC;
	Sat, 29 Jun 2024 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719655530;
	bh=QMUBxcf51e7Dv4UynDAQchO/XHNYIZCbexn9EQecgaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcsEX+Dk2Mv30hpq9QhHi2Qt2WBHVFQ5k3kWEMLx0F2c8eu4U1OYGcLe+2qmlExJ0
	 MHgLZFH71v10cJ7Gvfg8HXKhn40zG46BIhLOk1dEcZQvnW3MVDFgJnWIYvqrWvWDBj
	 0HqceMfRYaMAtsHe64G3kTr3k2TQW9Gu5zESNf42hbEcLmA7elzDcveZSoFoJBwQvb
	 bk00raipN+W4q6HGzeSS5MylY1jHFNQxE+dt1lC36dFv0Pbmvi1MapV+BBegfa841U
	 GDFMPmd4Xm7kRpIroHum/nTQsC8ky3jUcyTEHU7+RoZy6slPoGtoLHwWYn9omOxeSV
	 nrK6SHmat7GHQ==
Date: Sat, 29 Jun 2024 12:05:24 +0200
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: John Garry <john.g.garry@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Prasad Singamsetty <prasad.singamsetty@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with the vfs-brauner
 tree
Message-ID: <20240629-gelohnt-widmung-b53f957cd69f@brauner>
References: <Zn76C70F9QB_Z0bw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zn76C70F9QB_Z0bw@sirena.org.uk>

On Fri, Jun 28, 2024 at 06:59:39PM GMT, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   fs/stat.c
> 
> between commit:
> 
>   0ef625bba6fb2 ("vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)")
> 
> from the vfs-brauner tree and commit:
> 
>   0f9ca80fa4f96 ("fs: Add initial atomic write support info to statx")
>   9abcfbd235f59 ("block: Add atomic write support for statx")
> 
> from the block tree.

Jens,

Can you give me the fs bits and I'll put them in a shared branch we can
both pull in?

> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc fs/stat.c
> index 6f65b3456cadb,bd0698dfd7b36..0000000000000
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@@ -214,43 -245,6 +245,45 @@@ int getname_statx_lookup_flags(int flag
>   	return lookup_flags;
>   }
>   
>  +static int vfs_statx_path(struct path *path, int flags, struct kstat *stat,
>  +			  u32 request_mask)
>  +{
>  +	int error = vfs_getattr(path, stat, request_mask, flags);
> ++	struct inode *backing_inode;
>  +
>  +	if (request_mask & STATX_MNT_ID_UNIQUE) {
>  +		stat->mnt_id = real_mount(path->mnt)->mnt_id_unique;
>  +		stat->result_mask |= STATX_MNT_ID_UNIQUE;
>  +	} else {
>  +		stat->mnt_id = real_mount(path->mnt)->mnt_id;
>  +		stat->result_mask |= STATX_MNT_ID;
>  +	}
>  +
>  +	if (path_mounted(path))
>  +		stat->attributes |= STATX_ATTR_MOUNT_ROOT;
>  +	stat->attributes_mask |= STATX_ATTR_MOUNT_ROOT;
>  +
> - 	/* Handle STATX_DIOALIGN for block devices. */
> - 	if (request_mask & STATX_DIOALIGN) {
> - 		struct inode *inode = d_backing_inode(path->dentry);
> - 
> - 		if (S_ISBLK(inode->i_mode))
> - 			bdev_statx_dioalign(inode, stat);
> - 	}
> ++	/*
> ++	 * If this is a block device inode, override the filesystem
> ++	 * attributes with the block device specific parameters that need to be
> ++	 * obtained from the bdev backing inode.
> ++	 */
> ++	backing_inode = d_backing_inode(path->dentry);
> ++	if (S_ISBLK(backing_inode->i_mode))
> ++		bdev_statx(backing_inode, stat, request_mask);
>  +
>  +	return error;
>  +}
>  +
>  +static int vfs_statx_fd(int fd, int flags, struct kstat *stat,
>  +			  u32 request_mask)
>  +{
>  +	CLASS(fd_raw, f)(fd);
>  +	if (!f.file)
>  +		return -EBADF;
>  +	return vfs_statx_path(&f.file->f_path, flags, stat, request_mask);
>  +}
>  +
>   /**
>    * vfs_statx - Get basic and extra attributes by filename
>    * @dfd: A file descriptor representing the base dir for a relative filename



