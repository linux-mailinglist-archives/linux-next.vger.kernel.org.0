Return-Path: <linux-next+bounces-5112-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E1A06D86
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 06:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BCFA7A3081
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F95E1FF5E3;
	Thu,  9 Jan 2025 05:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="i8zaivsC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29414EC77;
	Thu,  9 Jan 2025 05:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736400237; cv=none; b=UWurocRj35KGCgwChNyR20h+COyWOO02nCBUo4dE3LpEon6oOpotJK5dNjkzpdEGI4K23St+us4KwlZ18iWFOs3M72dyVUXWiZvXfjsIvnHsi0KSLg6Q3Gv05arlC2eUGJtpMDw/e8afnbVLHAFkWepuz8173fYip+KfXF8Hwj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736400237; c=relaxed/simple;
	bh=8wrakd3sqEblGwfzUzzp7lBt8+sWOzdnCPsTbziIn5U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WYU9cAKrBjuw28Xnuhykpi6kBQyy0KHF4KFnXMdMdyEDixPbz6ZD8VBCSF64+TSY5H3CUhc+248o6kGgl0EIDpolnAI4IOGghFUyETmQyq5al1P7GR0taZDq+0m9t6vZQzZjfGecDEOkkbVeYIEC/WKeJw2X/3D2XdG+yDxAq4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=i8zaivsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D23C4CED2;
	Thu,  9 Jan 2025 05:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736400236;
	bh=8wrakd3sqEblGwfzUzzp7lBt8+sWOzdnCPsTbziIn5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i8zaivsCXsC1XqmUbAZmAs+rIg0y7Q0SybXdeTQJgBmOOAAlkgks9sOMXiZWRuxt1
	 uMDDwPwWIxFodV+bR375x8P0ucnMsoiHX2avlYcbew/YuFql4hk2ClmlST+ry0jyid
	 DLbmVzleNImZsydJfyN5F4TUmhE3hsZp2zbe11Tg=
Date: Wed, 8 Jan 2025 21:23:55 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vhost tree
Message-Id: <20250108212355.6e6fad4a57d23eeedecc6852@linux-foundation.org>
In-Reply-To: <20250109144054.6bdf0189@canb.auug.org.au>
References: <20250109144054.6bdf0189@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Jan 2025 14:40:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in the mm tree as different commits
> (but the same patches):
> 
>   e981e8d8b23e ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_DEVICE_RAM)")
>   a4bba3b65c20 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
>   b9ad8a711a3c ("virtio-mem: remember usable region size")
>   a8328b40b3b0 ("virtio-mem: mark device ready before registering callbacks in kdump mode")
>   ef78030ec96f ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect device RAM ranges in 2nd kernel")
>   a127bc45d3de ("fs/proc/vmcore: factor out freeing a list of vmcore ranges")
>   98c5f8c3827a ("fs/proc/vmcore: factor out allocating a vmcore range and adding it to a list")
>   5488433f810c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
>   23365031b34f ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
>   006f0492f363 ("fs/proc/vmcore: disallow vmcore modifications while the vmcore is open")
>   26b866c242e5 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
>   5c04c6205add ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")
> 
> These are commits
> 
>   9e85e500e8b3 ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_DEVICE_RAM)")
>   5605b723bbc2 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
>   3a365d7b1a60 ("virtio-mem: remember usable region size")
>   e4c56e7d625f ("virtio-mem: mark device ready before registering callbacks in kdump mode")
>   342dc629fe62 ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect device RAM ranges in 2nd kernel")
>   44df29fb6c95 ("fs/proc/vmcore: factor out freeing a list of vmcore ranges")
>   10a41d9df694 ("fs/proc/vmcore: factor out allocating a vmcore range and adding it to a list")
>   e8685745122c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
>   cfc7a194e459 ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
>   19b42b73afa4 ("fs/proc/vmcore: disallow vmcore modifications while the vmcore is open")
>   527d8662c520 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
>   9a775759ac92 ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")
> 
> in the mm-unstable branch of the mm tree.

Thanks, I dropped the mm.git copy.

