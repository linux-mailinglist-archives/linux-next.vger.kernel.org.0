Return-Path: <linux-next+bounces-1739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1488CDA0
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 20:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48365322B2B
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 19:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E86F13D26E;
	Tue, 26 Mar 2024 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Z90uYUSz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4544513D265;
	Tue, 26 Mar 2024 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711482985; cv=none; b=PGnm1p1Cm0PWde67gR3DqwjQVqd2chYRHo6jgIFdi+OT92Zvgc6OpHvVSoQbieXhZnlhm2b4DDhJ1E9m/xQEGM5R8Xe6bNBpowrSfnGdIpeFyBhLycGkoagYmtXeRFc7zQERhb27Mvyl+a2wYfT+Du+odUzxMtgK0Yl0+vNpBA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711482985; c=relaxed/simple;
	bh=x4np21dJ2uZ9vYBCKDq3W9rjAOMd4x0jIzHTs6BvC5k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pDARxrkmK3tHaZjp85LAJkWY+2yTEKAzPzhsAvuQyveapFuvynHPOWOgPHyZjrOMPsNmDNLKasJBByFeunXcPb+g4/SSTr6JUs1/EGmN3QLRfhCZQHO90DZWVrHuV/BVF+a3MukheMm8HjkrG/OPsJmfVkyatwTfekNzKoLB4bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Z90uYUSz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75610C433F1;
	Tue, 26 Mar 2024 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711482984;
	bh=x4np21dJ2uZ9vYBCKDq3W9rjAOMd4x0jIzHTs6BvC5k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z90uYUSzH0W43TFs7w0PYTRMKh3kcbMy5/DQqV/i3rUAt2Lta9+TeWmnD9R5e06bq
	 AZicyFf+T1IdalCf93SV0KeE5wAwVisxNS4ImEA3n4khQ4yxLQf0P8qUoIiaUpazv1
	 d7Wa7tD0Y5EbgTWL2VCjbmr8L25VCZrXLJ3l4hoA=
Date: Tue, 26 Mar 2024 12:56:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Feng Tang <feng.tang@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, "V, Narasimhan" <Narasimhan.V@amd.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Aithal, Srikanth"
 <Srikanth.Aithal@amd.com>, Dawei Li <dawei.li@shingroup.cn>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Yury Norov <yury.norov@gmail.com>, lkml
 <linux-kernel@vger.kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Boot failure with kernel BUG at mm/usercopy.c on next-20240325
Message-Id: <20240326125623.266550b81bb36aafc9a2c613@linux-foundation.org>
In-Reply-To: <ZgIzMqiZzqUmqEOZ@feng-clx.sh.intel.com>
References: <DM4PR12MB5086E76CF24A39017DA8567189362@DM4PR12MB5086.namprd12.prod.outlook.com>
	<20240325125017.GBZgFzCXVxeF50uGVE@fat_crate.local>
	<20240325113433.e04c2b508ac325630cd113c8@linux-foundation.org>
	<20240325203714.GJZgHgem2TR1aVAVlU@fat_crate.local>
	<ZgIzMqiZzqUmqEOZ@feng-clx.sh.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Mar 2024 10:30:10 +0800 Feng Tang <feng.tang@intel.com> wrote:

> Add Vlastimil for slab related topic.
> 
> On Tue, Mar 26, 2024 at 04:37:14AM +0800, Borislav Petkov wrote:
> > On Mon, Mar 25, 2024 at 11:34:33AM -0700, Andrew Morton wrote:
> > > Thanks, I'll just drop the patch.  It didn't receive a very favorable
> > > review reception anyway.
> > 
> > See here:
> > 
> > https://lore.kernel.org/all/DM4PR12MB5086B9BDBF32D53DF226CBF489362@DM4PR12MB5086.namprd12.prod.outlook.com/
> > 
> > folks still need to learn email. :-)
> > 
> > Anyway, apparently there's some fix there.
> 
> The original commit 328c801335d5 ("cpumask: create dedicated kmem
> cache for cpumask var") has some benefit, that there are CPU numbers
> which are not power of 8, like 144, 288 etc where it will save
> some memory. 
> 
> And 'slabtop' on a qemu-VM with 16 cpus shows it is surprisingly
> non-trivial and has the third largest number of objects: 
> 
> 22350   22350 100%    0.13K    745       30      2980K kernfs_node_cache
>  11172  10693   0%    0.19K    266       42      2128K dentry
>  10240   8222   0%    0.01K     20      512        80K cpumask
> 
> Andrew, if it is worth merging, you can folder my fix into the patch. 

I'll await a resend, please.

