Return-Path: <linux-next+bounces-8123-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69835B38887
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 19:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 829587B2F50
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 17:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88AD2D46D1;
	Wed, 27 Aug 2025 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7DTS/Wi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08F930CDA8;
	Wed, 27 Aug 2025 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315578; cv=none; b=uQ/pPfV0fWyDvORXQ9ufiQ5pghKhxhf8x3xLzviSrfuYgLflNtudGSb/pi34k3Kz7LGes52fbJviyi5tMdqXI5DkZuBgxfN5GPc8cxMTdJXv7pkz6GLxqKtb2UKH4wVAlkUrriPqznaIs8g6/K9/jlG77Hd+hDGxGI7lj/AI6dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315578; c=relaxed/simple;
	bh=n9DnZifmjjR/lsd2ag9tVatg0zcJwZgYkw52UdyN7PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkmV01Qrovs0jQrXkhuWvSaLEupRHhwqrS/zps4IS0FlcBSIUDJNzasCEXn5MARj6vrtHQMXj8EOQgXq5JL9w3YXlTFgmvRawvM2/BZ+oW3ZWsamhfy/WuJqzs7iZK4wY5ED3a2fX9TDebUaBxirE92kBNT/n7odRrvs2h9ucQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7DTS/Wi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD5DC4CEF0;
	Wed, 27 Aug 2025 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756315578;
	bh=n9DnZifmjjR/lsd2ag9tVatg0zcJwZgYkw52UdyN7PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7DTS/Wig2P7M2VUD1GR6NRpapIb2G8ux6Pk5r61b325I82VIZFPTqurlGx+Wf69k
	 nW5gh+4kYZYnyyC/CBysVmG+TWpN9Sd6Fx/O8vJ5H75bvIo3F6t4shVYY9+bmGobol
	 5P8/MnbdcoBChV/8ZHw+TPbByHyoGV0OqMbYTXJEk26Mk2jIvh0ijbSm92t9vjwBlJ
	 1uXeeyCVHcfM9eFe1DCAxiqU9t7/q/navGV1xD81g8+Tr16bSbmAZDIq6g4d5VmZ55
	 DELy2aQav2hbf0GfxD/zUHoHsqPvvmgcAuGTFo7MpNA9uvNQ2F+Q2Q1KIn6+VGR0Xm
	 IiB2uiokCkGRQ==
Date: Wed, 27 Aug 2025 10:26:16 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vhost tree
Message-ID: <aK8_uOoLxLOniEbR@google.com>
References: <20250827124654.78881028@canb.auug.org.au>
 <20250827062218-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827062218-mutt-send-email-mst@kernel.org>

Hello,

On Wed, Aug 27, 2025 at 06:23:52AM -0400, Michael S. Tsirkin wrote:
> On Wed, Aug 27, 2025 at 12:46:54PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commit is also in the perf-current tree as a different
> > commit (but the same patch):
> > 
> >   c67e16d30dca ("tools headers: Sync uapi/linux/vhost.h with the kernel source"
> > )
> > 
> > This is commit
> > 
> >   f79a62f4b3c7 ("tools headers: Sync uapi/linux/vhost.h with the kernel source")
> > 
> > in the perf-current tree.
> 
> 
> Hmm.  I could drop mine I guess, but it only really makes sense after:
> 
>     vhost: Fix ioctl # for VHOST_[GS]ET_FORK_FROM_OWNER
>     
> 
> which is not in the perf tree.

Yep, so I was waiting for you to send PR with the fix.
It seems you already removed the commit in your tree.
I'll send a PR for perf tools with this change.

Thanks,
Namhyung


