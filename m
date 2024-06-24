Return-Path: <linux-next+bounces-2643-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77231914253
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 07:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A118D1C20E77
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 05:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7F018044;
	Mon, 24 Jun 2024 05:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNXL00pR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1331F4A3D;
	Mon, 24 Jun 2024 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719208545; cv=none; b=JazDbR1L3e8rSzJHcUb+2q0cjzoPCf68G1K0MBk3wBS5JaVdlr+4qM01UfBIm+GLrwE+J4ZgwBURt2hcpVOhYOJL1bvKqmsrNeV6xfhdMROP66QSaBfDdYSf6om5WlZUdePhhs+CZgOCOyZz2lXLRIjh8UeSXUWVJPd3cXHuYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719208545; c=relaxed/simple;
	bh=AetNSzrnaPlRh1G+Y/PBBp/nNyu54u1F1KslDVUUDfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m91Dg5pkmdxeYXV3iGdPAyKGWU1om4f6TlxXDyactF0beSncK7mtCujBmUuKdIM/rVgsrqHPcxOotFv3yyrsKOB6nZQmIqn9Uj1StE0tO+Hs4gNEVd9+1UJ5YoSAdoF+lFYUXRjAoANDViq9jav1Gnn8AVLDjLNGZPuKilyk6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNXL00pR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F28C2BBFC;
	Mon, 24 Jun 2024 05:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719208544;
	bh=AetNSzrnaPlRh1G+Y/PBBp/nNyu54u1F1KslDVUUDfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNXL00pRDZoCXzTURiJbF+uxuIBgU7t29Pw59iWxKLtkEbunQl5nlzN/I3Pbo1I8M
	 deadt7wDFm4t2v6/kainsUnljMwzRLo3WmDS8SzyOUIAXsIYGat1YmzgrQy0IiZrHF
	 TXOwHEvo/IZ09SUjbWXjE5tOl94QDZKcvVbaxnC/PEGWQ0PSr1mU/P/W0RRQstPfxm
	 60FWWvFKEeEhWjatD9fVSma5n/osyrs5JPRDqWKykeSy4/+f6sYxav/x2rFtqnfSHD
	 ai53Xr95CuhO+qJxmxSMaYiHJ/l19I1BPHQYKAadWYADmMrp0rfQm4d072kpiUCNJ2
	 JhZWsDeHztmSg==
Date: Mon, 24 Jun 2024 08:53:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "Gowans, James" <jgowans@amazon.com>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the memblock tree with the origin
 tree
Message-ID: <ZnkJ1zj0NTR3dYwo@kernel.org>
References: <ZnRQv-EVf2LQ1Cjv@sirena.org.uk>
 <eb58b1b2f84444acde3f9e25219fa40c73c499f8.camel@amazon.com>
 <db13f2b7-88da-42db-85ed-d78cdd5f6c62@sirena.org.uk>
 <e6f1bf73d13060635520c70df269c0b390352f37.camel@amazon.com>
 <44ce3730-8e4d-42f9-8b17-104805e46f93@sirena.org.uk>
 <9262bfba5d65c603dcad49a75e5a30564f75c3d4.camel@amazon.com>
 <cf013a59-a297-4685-94ac-87566023aa5d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf013a59-a297-4685-94ac-87566023aa5d@sirena.org.uk>

Hi,

On Fri, Jun 21, 2024 at 09:30:51PM +0100, Mark Brown wrote:
> On Fri, Jun 21, 2024 at 08:08:53PM +0000, Gowans, James wrote:
> > On Thu, 2024-06-20 at 19:00 +0100, Mark Brown wrote:
> 
> > > Yes, the merge in -next is wrong.
> 
> > What's the next step to fix the incorrect merge commit?
> > Looking at today's -next I see the same issue:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/mm/memblock.c?h=next-20240621&id=f689ee4c062317a0831fbffeeb30d7816608b2e7
> 
> It's remembered by rerere, hopefully I'll convince rerere to forget it
> on Monday.

Just in case this is the resolution for merge conflict

diff --cc mm/memblock.c
index e81fb68f7f88,692dc551c0fd..000000000000
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@@ -1441,6 -1446,20 +1439,17 @@@ phys_addr_t __init memblock_alloc_range
  	enum memblock_flags flags = choose_memblock_flags();
  	phys_addr_t found;
  
 -	if (WARN_ONCE(nid == MAX_NUMNODES, "Usage of MAX_NUMNODES is deprecated. Use NUMA_NO_NODE instead\n"))
 -		nid = NUMA_NO_NODE;
 -
+ 	/*
+ 	 * Detect any accidental use of these APIs after slab is ready, as at
+ 	 * this moment memblock may be deinitialized already and its
+ 	 * internal data may be destroyed (after execution of memblock_free_all)
+ 	 */
+ 	if (WARN_ON_ONCE(slab_is_available())) {
+ 		void *vaddr = kzalloc_node(size, GFP_NOWAIT, nid);
+ 
+ 		return vaddr ? virt_to_phys(vaddr) : 0;
+ 	}
+ 
  	if (!align) {
  		/* Can't use WARNs this early in boot on powerpc */
  		dump_stack();

-- 
Sincerely yours,
Mike.

