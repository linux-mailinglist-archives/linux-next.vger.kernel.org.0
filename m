Return-Path: <linux-next+bounces-7437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4288AFF00C
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 19:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC4E5473F3
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 17:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F56822422B;
	Wed,  9 Jul 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKVs8qem"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160282E370B;
	Wed,  9 Jul 2025 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752082874; cv=none; b=nT/0abUglDP1D1bEWq531m/INpFlQQTIsCKSediaax91RrZYmEiD/kH07oxFVhOlaU9T2eLJ5sfmJKo1XyjEpRRO7E8TDtaSk2MfhD6vBBh8Ax7Js/kBzizOe36JaZiRtS020/LMENxpnGwDgvE29jCp0Y3WDjVFcFLBeq82Qg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752082874; c=relaxed/simple;
	bh=ERI9xBq39mzDkL3fuk11Ct3eUM0V2AyCkctUtBuVPRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvEuyJGi2hQ3GFMrY/tmVtMThRgrz11IEAPFX2ZlY6DUgcXQdA2+JZqF0BqBJxdhmfCz7z/xWfvJGqi/Lzexj6GUwYCAbHBuK1LC1pW2DLIbIe5vgENO5mU2l2vtK/OaOPWI1hK4A+VmX6vgpBpsu7gMj2nXsY1YA1MzFJutdec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKVs8qem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4011BC4CEEF;
	Wed,  9 Jul 2025 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752082873;
	bh=ERI9xBq39mzDkL3fuk11Ct3eUM0V2AyCkctUtBuVPRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKVs8qemZvPtHE7dY03bvqpAdgVHcG9aa99xujt1xnsyF6b63ZZEK5AY2IeqDdnb8
	 K2iaLtfA+qAJ8S8g+2m/Nm1h/vYz00ECHmI6KauteNgt4WMsyU8klEKicOpMrrMCXN
	 3RNtpAb8xOD77Ygl1GVPEG477M8FSps8AHmhYc5I6G97PFQKcl5yBIxMu6SY2vactS
	 QB8+9CcMApDGD5/6/tvlAwUemLYx9eqA1sZ9lJ/hPWDkz70tzGQlOVMX/dn4B/oNQY
	 LCj9BYHAARgU0OrAq2ArKjZzmbW/EWkU+C+p3BozAMHN3eEDn2iqsOTxxPWZW9InbR
	 NmP1iRXIuJDgA==
Date: Wed, 9 Jul 2025 20:41:08 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20250709174108.GH592765@unreal>
References: <20250709233953.7afb7a8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709233953.7afb7a8a@canb.auug.org.au>

On Wed, Jul 09, 2025 at 11:39:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dma-mapping tree, today's linux-next qemu boot test
> (powerpc pseries_le_defconfig) failed like this:
> 
> [    0.219439][    T1] ibmvscsi 71000003: SRP_VERSION: 16.a
> [    0.219472][    T1] ibmvscsi 71000003: Error -4 opening adapter
> [    0.219507][    T1] ibmvscsi 71000003: couldn't initialize crq. rc=-1
> [    0.221963][    T1] ibmvscsi 71000003: probe with driver ibmvscsi failed with error -1
> 
> The normal output is:
> 
> [    0.221208][    T1] ibmvscsi 71000003: SRP_VERSION: 16.a
> [    0.221272][    T1] ibmvscsi 71000003: Maximum ID: 64 Maximum LUN: 32 Maximum Channel: 3
> [    0.221310][    T1] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
> [    0.221653][    C0] ibmvscsi 71000003: partner initialization complete
> [    0.221696][    C0] ibmvscsi 71000003: host srp version: 16.a, host partition qemu (0), OS 2, max io 2097152
> [    0.221752][    C0] ibmvscsi 71000003: sent SRP login
> [    0.221778][    C0] ibmvscsi 71000003: SRP_LOGIN succeeded
> [    0.223269][    T1] scsi 0:0:2:0: CD-ROM            QEMU     QEMU CD-ROM      2.5+ PQ: 0 ANSI: 5
> [    0.239389][   T28] Freeing initrd memory: 1844K
> [    0.302192][    C0] sr 0:0:2:0: Power-on or device reset occurred
> [    0.302411][    T1] sr 0:0:2:0: [sr0] scsi3-mmc drive: 16x/50x cd/rw xa/form2 cdda tray
> [    0.302450][    T1] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    0.302800][    T1] sr 0:0:2:0: Attached scsi generic sg0 type 5
> 
> Bisectd to commit
> 
>   ec7352735abf ("dma-mapping: export new dma_*map_phys() interface")
> 
> And reverting that commit, and the following one, in today's linux-next
> release, fixes the problem.

Stephen,

Can you please provide the kernel command line to determine which DMA
path is taken?

Thanks

> 
> -- 
> Cheers,
> Stephen Rothwell



