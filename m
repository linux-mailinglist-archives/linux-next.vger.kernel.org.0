Return-Path: <linux-next+bounces-7438-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F29AFF0B3
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 20:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB625580786
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 18:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD8F6BFCE;
	Wed,  9 Jul 2025 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9uOhpdW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B479CF;
	Wed,  9 Jul 2025 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752084996; cv=none; b=EnWNrZk40Qxmlo+tuCfS5OF7gt0cZGWkbDrmXMA9ODJSXp8gDtjA8zdVgcVi/Gp8XoqIObR2AngfMz9m7nK3MqkUhRM2ozyPKNVGTif2ySc4YeWvfohEbD/aYvtzRNzS+uNkDq57vO/e0TN7d8rlgNY41S9eHBI7ed7ZELw0ios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752084996; c=relaxed/simple;
	bh=0iHY9sqA2qRSH+kBXaBssmwLuomOoFqDfka44SKj5Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5Wdxx1Ay4WRJJJb47huxg5XBXUUUk24c8sDQtyiOFW+mV8aYFKGJdJTCPEUAxPobLXDmjAAnBbM9xduHAEHe3mss9slo1KhS0xi5uTl7qz2vXYrdJ5tQasTZlFA65NFI028TK69CrtlT22btPF3gSvv8zvsCTFKcXuJ8epORHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9uOhpdW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41F8C4CEEF;
	Wed,  9 Jul 2025 18:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752084995;
	bh=0iHY9sqA2qRSH+kBXaBssmwLuomOoFqDfka44SKj5Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9uOhpdW24XnOHxR7/euz9c1VHd/33fjO1xT0y5mXeRtPvgl0gJrQFraDKuLDOkYP
	 510zmuYLjzfsLAnOx3L6EQ/qbcaBLsskmXlrvr1CVIQ9GAFB+MIcRjFcbL85J2GBXa
	 xWhayk35KEZOT9g5xoDgQhAX8UnxMGqYAgIW2Bqyzs+Iowj/l0nSXlYQUjykwLoKIn
	 YzkQa8nFqSHhuejNjL2f+2EJkNJZwcflYrkeEsIDifP0/qUOu48Grz1LsHYCTsrCGg
	 9rPCKHA7VdjDWMXpPqgch20uL+FmK6ZEFloWxmamodjfyHMHL9YZosejAGK8W8KKuJ
	 3xrgBqar9WfrQ==
Date: Wed, 9 Jul 2025 21:16:31 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20250709181631.GI592765@unreal>
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

I assume that this will fix the issue:

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 29e8594a725a..cb8936e4ffab 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -157,7 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	struct page *page = phys_to_page(phys);
-	size_t offset = offset_in_page(page);
+	size_t offset = offset_in_page(phys);
 	bool is_pfn_valid = true;
 	dma_addr_t addr;
 



> 
> -- 
> Cheers,
> Stephen Rothwell



