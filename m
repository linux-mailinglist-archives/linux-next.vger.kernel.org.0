Return-Path: <linux-next+bounces-7925-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF2B23F3A
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 06:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F9C188F966
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 04:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4E91EDA0E;
	Wed, 13 Aug 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1ZYzsHXe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88872635;
	Wed, 13 Aug 2025 03:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755057588; cv=none; b=QVtl7t8jDBTQvd5nBLsBgQEQVPCdoS8FdgVnnB9Pc6Lkp/+NChF11ytZbrBoQpj8UmzGsInWutLnZRc+HISQe8w9nvKOjuEgO5iL2XqarqdU4vCPwlUh1duKZk7fJwBwysFK1hVXDsUl0Tb83/UiU0AdFpUtX0BFp2O8OVoyVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755057588; c=relaxed/simple;
	bh=cKL8BAtdMqV5kt+LIJadzP5n5LeED7bbZLiniWO6akw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CI0e/hT0ZjZahx823OPcyGao5yp0QPJX8ToAq+xyFLLxuT+phosQtO/TG1K3DeG5mgYuiy71K7HuXc3dbrjZb88yhTM/tbTO1EQy5HgD+gdwSwYvGwIowxjFgohkWYPjusGKsOCYzGaq+8e7+h9uIjS38WvKlSqar396nWQFHDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1ZYzsHXe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C47C4CEEB;
	Wed, 13 Aug 2025 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755057587;
	bh=cKL8BAtdMqV5kt+LIJadzP5n5LeED7bbZLiniWO6akw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1ZYzsHXeOtmXkgg3TckMkh5Oj7HFP2eA4jUZOmIGKPQjblUcDC+qteMFKIoMrXqA5
	 gmN8CMY+nUYbT0P9+vNSRffkY30ftCh+QcjSMttpZCp268b3Dt7PjhpkLkAaMpRUkF
	 FQM+bc1aquIJzawJRf3tP9LN9NB3vTzT4cfhQX2Y=
Date: Tue, 12 Aug 2025 20:59:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Vitaly Wool <vitaly.wool@konsulko.se>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Message-Id: <20250812205946.2db0d8645f3c2ed6c8828ae2@linux-foundation.org>
In-Reply-To: <20250813111151.6a261ca1@canb.auug.org.au>
References: <20250813111151.6a261ca1@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Aug 2025 11:11:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm-unstable tree got a conflict in:
> 
>   rust/kernel/alloc/allocator.rs
> 
> between commit:
> 
>   fde578c86281 ("rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()")
> 
> from the drm-misc-fixes tree and commit:
> 
>   cda097b07bce ("rust: support large alignments in allocations")
> 
> from the mm-unstable tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks.

Well that's messy.

Is it intended that the containing series ("Alloc and drm::Device
fixes") be merged into 6.17-rcX?



