Return-Path: <linux-next+bounces-7640-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BAB0B495
	for <lists+linux-next@lfdr.de>; Sun, 20 Jul 2025 11:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CA6B1888106
	for <lists+linux-next@lfdr.de>; Sun, 20 Jul 2025 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5497F1DE4FC;
	Sun, 20 Jul 2025 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwzLkmbe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01F1DF75A;
	Sun, 20 Jul 2025 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753003718; cv=none; b=u5bAiayzfjwnQXXcrTcncSCOqDqMPhBWHGeQ5eDhBb2gxOjx46drc4x70xhL4jKERKQck9Gai0ngDABNh/j8Rt2Kh4IN+PSm7EQYep/7aPypG/+eGiCice2V+rRYqjw6vY8sfN5LWTroCzVCwh13682B5yruPXSmB5BB9WiHR/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753003718; c=relaxed/simple;
	bh=43/f9tHKV2tfMWuip8e9IItSWCsQdglVdIkNNpVnpNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnTouRMIJpruXYkq/B/8LSVyOjEgG66AWXv5mve98sWe25yegutGsHGBk/jhHcuXJddYgCNQ2m1yzJCyorcdqZ85XByQMppZVr6obuf8u/mzTzi8FD3/in2HgfZChu7vUGg8qaAxMvLQBpoyktO46v17j+cQhntrut1NYMGY/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwzLkmbe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B5BC4CEE7;
	Sun, 20 Jul 2025 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753003715;
	bh=43/f9tHKV2tfMWuip8e9IItSWCsQdglVdIkNNpVnpNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwzLkmbexsVCoI9CFT8e+uNzGK0J6ZM6Mks75ienAfeFHaCzf6nbh6VNzh9DPu8sS
	 kCFjPNDfvXHU0pWSaecvEdDGyI0F54sMG9hffhqZW8QLM1G/bxiJEJcdtwvaDubCTm
	 hiOcokwFVJmA3727A2tak/BXsZXqJT2Zk9+D2ldPERTy5TH+DB0dtRXQhBTBEts/yl
	 9dHjhpl9r+Ju9+zEDPdnqQsdFp33eteIcDO+vIVd4z5c7Sgwu6BVUuD7DZKm/Ynd53
	 I7x9RFinQ3D1Xnacq7XYHyzlYH7lxe4MKKhMfi3Ls+DMdA2yMqWrM0wiKhuVRcJAoZ
	 PH1GGDUdB6ISw==
Date: Sun, 20 Jul 2025 12:28:31 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Wang <jasowang@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vhost tree with the dma-mapping
 tree
Message-ID: <20250720092831.GG402218@unreal>
References: <20250718181226.6343c557@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718181226.6343c557@canb.auug.org.au>

On Fri, Jul 18, 2025 at 06:12:26PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vhost tree got a conflict in:
> 
>   drivers/virtio/virtio_ring.c
> 
> between commit:
> 
>   b420b31f009f ("kmsan: convert kmsan_handle_dma to use physical addresses")
> 
> from the dma-mapping tree and commit:
> 
>   d1814d4fca2c ("virtio: rename dma helpers")
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
> diff --cc drivers/virtio/virtio_ring.c
> index a8421dc802d6,3f86e74dd79f..000000000000
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@@ -3143,17 -3240,17 +3240,17 @@@ EXPORT_SYMBOL_GPL(virtqueue_unmap_page_
>    * The caller calls this to do dma mapping in advance. The DMA address can be
>    * passed to this _vq when it is in pre-mapped mode.
>    *
> -  * return DMA address. Caller should check that by virtqueue_dma_mapping_error().
> +  * return mapped address. Caller should check that by virtqueue_mapping_error().
>    */
> - dma_addr_t virtqueue_dma_map_single_attrs(struct virtqueue *_vq, void *ptr,
> - 					  size_t size,
> - 					  enum dma_data_direction dir,
> - 					  unsigned long attrs)
> + dma_addr_t virtqueue_map_single_attrs(const struct virtqueue *_vq, void *ptr,
> + 				      size_t size,
> + 				      enum dma_data_direction dir,
> + 				      unsigned long attrs)
>   {
> - 	struct vring_virtqueue *vq = to_vvq(_vq);
> + 	const struct vring_virtqueue *vq = to_vvq(_vq);
>   
> - 	if (!vq->use_dma_api) {
> + 	if (!vq->use_map_api) {
>  -		kmsan_handle_dma(virt_to_page(ptr), offset_in_page(ptr), size, dir);
>  +		kmsan_handle_dma(virt_to_phys(ptr), size, dir);

Thanks, it looks correct to me.

>   		return (dma_addr_t)virt_to_phys(ptr);
>   	}
>   



