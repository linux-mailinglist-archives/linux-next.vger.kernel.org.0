Return-Path: <linux-next+bounces-3008-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3506930E66
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 09:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E36B31C21033
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 07:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E076C282FA;
	Mon, 15 Jul 2024 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hJbpwAS5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA84C9A;
	Mon, 15 Jul 2024 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721026852; cv=none; b=FPNr1vPbhQAn0L3PnoD1bzopzTsMD28bFH0AxRkWlZ58DIryxZrdQ/2P3F/ZirbwSt4puq1673mJIfK7Olz08dwvl6BgU8hN+ebbX9FiCTojycsf/KDg+2v2PiRR8+jo5fZf+nO3gM9g7thk4dcMxi8/9Pu/pyxu6o6QCBVv17Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721026852; c=relaxed/simple;
	bh=XtstTCMFqBcm4zC7Qw0KVNttl7vukKGUuSVNNtMkUjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXp8vb4OQTvZYXvxxUYFP9rQRzu0cNylffAMDPv4LGH0f70WVFccj96ccUD0F6vLsDzVzGS3/ZxJshnsO6TJ0eP7nZvYoo0SN0Fo+2anH4y0JQmwBngYB33w3wXuKyl0JT1qcE8RpICxNPBkAm8YI+Dpb1FPo2/9wLQDSz+BFr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hJbpwAS5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14ACC4AF0B;
	Mon, 15 Jul 2024 07:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721026852;
	bh=XtstTCMFqBcm4zC7Qw0KVNttl7vukKGUuSVNNtMkUjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJbpwAS5a4p3duz6g6+VW/Rd1ZDdB6GFpVqs9Pql4k6kPzNf9pVQ/auzf9D+0lyft
	 aSDt9h3y/x5yQfJrxFpl7EEFMYhT5JOTvpY5yD/TVK7e1mLNHqMdZqPhXCLrXBfUTo
	 eQFicsWOsxB9s/ZSOkkTLgJs4Z4uOxj3aTYXBcOs=
Date: Mon, 15 Jul 2024 09:00:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>,
	Shijith Thotton <sthotton@marvell.com>,
	Srujana Challa <schalla@marvell.com>,
	Vamsi Attunuru <vattunuru@marvell.com>
Subject: Re: linux-next: manual merge of the vhost tree with the char-misc
 tree
Message-ID: <2024071543-caloric-disbelief-0ca2@gregkh>
References: <20240715154045.0f319b32@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715154045.0f319b32@canb.auug.org.au>

On Mon, Jul 15, 2024 at 03:40:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vhost tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   5f67eef6dff3 ("misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative driver")
> 
> from the char-misc tree and commit:
> 
>   8b6c724cdab8 ("virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices")
> 
> from the vhost tree.
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
> diff --cc MAINTAINERS
> index eb7433a8ce3d,8eefd032c87e..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -13642,11 -13459,11 +13642,16 @@@ S:	Supporte
>   F:	Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
>   F:	drivers/mmc/host/sdhci-xenon*
>   
>  +MARVELL OCTEON CN10K DPI DRIVER
>  +M:	Vamsi Attunuru <vattunuru@marvell.com>
>  +S:	Supported
>  +F:	drivers/misc/mrvl_cn10k_dpi.c
>  +
> + MARVELL OCTEON ENDPOINT VIRTIO DATA PATH ACCELERATOR
> + R:	schalla@marvell.com
> + R:	vattunuru@marvell.com
> + F:	drivers/vdpa/octeon_ep/
> + 
>   MATROX FRAMEBUFFER DRIVER
>   L:	linux-fbdev@vger.kernel.org
>   S:	Orphan



Looks good, thanks!

greg k-h

