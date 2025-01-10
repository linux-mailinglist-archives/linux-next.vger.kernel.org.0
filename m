Return-Path: <linux-next+bounces-5125-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC21A08428
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 01:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AD223A5FA4
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 00:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0A91773A;
	Fri, 10 Jan 2025 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mfz15hCf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627FA6AA7;
	Fri, 10 Jan 2025 00:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736470117; cv=none; b=nMQpweMe6gI8QiRxKogPEoEJVUINzdCcbPQoZ9PgnXkmnCS6LfFAujAu4E/0HVbAKiqqTWVByQHQ6aQvpO2mmMsgDLMJm6YHhDMm0+YKvcE9SdNHdyWU5IE7xSv5HOOREDQqFDPYoHc6ilyqyuinZ+Zbsgg0PbmnyhjZvU8M6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736470117; c=relaxed/simple;
	bh=4zvoEziYVQiZkLG7oGO3NsPOe0LWI9jnKiIWDx6ClPw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CS6mAENm9jro4gBpIAK6DgtldOGlOIOeXtJHjfmsn/5kcbceDhh9CPKX4ShzFMoGgD/io/s7Hg9hdLoDHk1rdbM7Si7dFvYRrCMK8dBlS/E8ie76/wSsJREp03upuQCLc6eLLk+pVDnij8PFI0ookwUybpUWQ0YcxV5mhXweOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Mfz15hCf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A198DC4CED2;
	Fri, 10 Jan 2025 00:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736470116;
	bh=4zvoEziYVQiZkLG7oGO3NsPOe0LWI9jnKiIWDx6ClPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mfz15hCfKILl5Rn0ZsC6XoSJdtvL8SlSCQ52XWWkdCNX7VvKzJSNOC6gXKATC+S4R
	 0G2Yxwbv0YjEoSWTcIDq6qOuDFz88oeMArwmKyFPq/YbYa9qYm4LqdEsHG/LG5S/aS
	 9oh4V9NccDODBVAYnFoli5cm53v/Fh9qpvSPIfqs=
Date: Thu, 9 Jan 2025 16:48:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vhost tree
Message-Id: <20250109164836.9160eea397f1b3dcd64a9662@linux-foundation.org>
In-Reply-To: <20250109024408-mutt-send-email-mst@kernel.org>
References: <20250109144054.6bdf0189@canb.auug.org.au>
	<20250108212355.6e6fad4a57d23eeedecc6852@linux-foundation.org>
	<20250109024408-mutt-send-email-mst@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Jan 2025 02:45:41 -0500 "Michael S. Tsirkin" <mst@redhat.com> wrote:

> > >   9e85e500e8b3 ("s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_DEVICE_RAM)")
> > >   5605b723bbc2 ("virtio-mem: support CONFIG_PROC_VMCORE_DEVICE_RAM")
> > >   3a365d7b1a60 ("virtio-mem: remember usable region size")
> > >   e4c56e7d625f ("virtio-mem: mark device ready before registering callbacks in kdump mode")
> > >   342dc629fe62 ("fs/proc/vmcore: introduce PROC_VMCORE_DEVICE_RAM to detect device RAM ranges in 2nd kernel")
> > >   44df29fb6c95 ("fs/proc/vmcore: factor out freeing a list of vmcore ranges")
> > >   10a41d9df694 ("fs/proc/vmcore: factor out allocating a vmcore range and adding it to a list")
> > >   e8685745122c ("fs/proc/vmcore: move vmcore definitions out of kcore.h")
> > >   cfc7a194e459 ("fs/proc/vmcore: prefix all pr_* with "vmcore:"")
> > >   19b42b73afa4 ("fs/proc/vmcore: disallow vmcore modifications while the vmcore is open")
> > >   527d8662c520 ("fs/proc/vmcore: replace vmcoredd_mutex by vmcore_mutex")
> > >   9a775759ac92 ("fs/proc/vmcore: convert vmcore_cb_lock into vmcore_mutex")
> > > 
> > > in the mm-unstable branch of the mm tree.
> > 
> > Thanks, I dropped the mm.git copy.
> 
> I looked at a wrong tree and thought these were forgotten,
> so I put them in mine.
> Andrew, good thing I saw your mail before dropping mine ;)
> Can I get your ack on the mm things pls?

Please note that there are acks on the original thread from Heiko and,
umm, yourself.

There aren't actually any mm/ changes in this series.  But I normally
handle procfs, so

Acked-by: Andrew Morton <akpm@linux-foundation.org>




