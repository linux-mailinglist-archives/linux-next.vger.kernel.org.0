Return-Path: <linux-next+bounces-1419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99186D045
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 18:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1132F1F223EC
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 17:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6366CBED;
	Thu, 29 Feb 2024 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjZmI5ib"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E106CBE8;
	Thu, 29 Feb 2024 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709226810; cv=none; b=YfkltG60bw73jhkxK+wiJChswvMzHuKxwa+2kWmLlkQYvRzVQ3O5DGE1OWf+37oI+aJ86ebb3BqdpnF31JkbzKT72K/nQK5RJtfTM3Fa7JIDw0qw4Ik3OVqurxS017B4gSmzuyRIhI+/3zz6ALQi8i+PyEdyvYNBapCaOJzfzZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709226810; c=relaxed/simple;
	bh=2kq4Z9/onssYZXVjNKlfGgKvZyNQFKd2YaHR3Zxh2vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0vUVPfLVdsWP6y8b4qVv4VcCPv/NSwj3AQHqITlCMCdSeOgJa+BEmmNSBAynvPgxT0tmM8GhEm9cgzTdoiNInTWvydfj52TsEVty+HtAQSniY1BVn8XXsvkc7/BFQ/ZC8nqolBTiuLJjdgHTvJBij4ZXkZ9wbhx8sZwY8QNDtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjZmI5ib; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC86C433F1;
	Thu, 29 Feb 2024 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226809;
	bh=2kq4Z9/onssYZXVjNKlfGgKvZyNQFKd2YaHR3Zxh2vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZjZmI5ibYkdCDOqygq7BLfUBtrDw/xZNdkEoIJkm83cVkOUdGwE1hsZXYuHohViex
	 y7ksxXim6PlWxXXXfpiabJ4K9oKVPhptTTDXNuuNtAGMWekk6MSTdXtsoJLo4ajoXP
	 /vke0zm0CmQMlwCiKmtipKAwbKiRmCkm/QNN3WMFjzond4WnAUNJYMOFZzflCTGzmL
	 bAaTUGgCUzAGFkeyweh3ULE/KS8j+Iekix+/tSmdbI3LUIZBDcruXAyOD1J/zKSbGd
	 dEuipll8lawvQtSyF1wqBjxGch+1N4ODZRm+NtOnWTDC7ZEMEnCv5uXyCbfBytUJAc
	 2Ga3By+LDs8ag==
Date: Thu, 29 Feb 2024 09:13:28 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Chao Yu <chao@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the f2fs
 tree
Message-ID: <ZeC7OEA4Onoi-mED@google.com>
References: <20240229104140.2927da29@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229104140.2927da29@canb.auug.org.au>

On 02/29, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
> 
>   fs/f2fs/super.c
> 
> between commit:
> 
>   5fa6a97d2784 ("f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup")

fyi; I dropped the above commit in -dev.

> 
> from the f2fs tree and commit:
> 
>   512383ae4910 ("f2fs: port block device access to files")
> 
> from the vfs-brauner tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/f2fs/super.c
> index 09ffdd554f9c,09e82624eff5..000000000000
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@@ -4206,9 -4265,9 +4206,9 @@@ static int f2fs_scan_devices(struct f2f
>   			} else {
>   				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
>   				FDEV(i).end_blk = FDEV(i).start_blk +
>  -					(FDEV(i).total_segments <<
>  -					sbi->log_blocks_per_seg) - 1;
>  +						SEGS_TO_BLKS(sbi,
>  +						FDEV(i).total_segments) - 1;
> - 				FDEV(i).bdev_handle = bdev_open_by_path(
> + 				FDEV(i).bdev_file = bdev_file_open_by_path(
>   					FDEV(i).path, mode, sbi->sb, NULL);
>   			}
>   		}



