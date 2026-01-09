Return-Path: <linux-next+bounces-9601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D43D0C0A4
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 20:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E54C308D074
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 19:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013AF2E8897;
	Fri,  9 Jan 2026 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="m8H23oAl"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B942E7F3A;
	Fri,  9 Jan 2026 19:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767986265; cv=none; b=DYHQB/3DOK6SObJuK2bYn7Xgu2nwXKjghCJQ+7G3zsSD7qpcuDbnRGlvgMqVOihDz8QTYutJ3f2pl1aSVRJ5sGiW6uGxc3b3wtmXUcMbSH567lfhO599lSKknl+XnXIgMUz9cKJy4rR5qPO1fzkgrWCxyfNzWWVh26nYVVs1YRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767986265; c=relaxed/simple;
	bh=tAKq9eI7hYxj/pYw6kl8BMu4lzCdZbyyGSySvlBgApk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LwY6qjHatOe5FTn5cvMOcAzeZ/+WIBRp6GzREpIK5BNxDFLhZMBP8l/5oHyl7dD0cQF2zZQZGlBwvezLPan/u0XkKwr3TjV8gFHrytO1xZ3hojaSTzepZTsVE4qM52JCVNpinKVj3pGzf7r+jn9urMtkxZB8nKK1U/vDrvzmkmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=m8H23oAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3C2C4CEF1;
	Fri,  9 Jan 2026 19:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767986265;
	bh=tAKq9eI7hYxj/pYw6kl8BMu4lzCdZbyyGSySvlBgApk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m8H23oAl6m11Kkqw+vsYYgJ7TuajTMYZus0O+B/qoM9JoRrVNdRniwl+dieNMAl7J
	 vodO+I/48P29VYKczwCQVTUunn0Vagrz6WRVCAreTJ4gaC3jwuubVIocLmrxd214pg
	 S/PEgCsZJLXLXQELnSXzyzCJ2CBG0dTag70o+Gx4=
Date: Fri, 9 Jan 2026 11:17:44 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-Id: <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
In-Reply-To: <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
	<20260107144753.7071f5f2@canb.auug.org.au>
	<20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
	<20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Jan 2026 18:29:55 +0100 Borislav Petkov <bp@alien8.de> wrote:

> Well, what can I say: I have been trying for a long time to get akpm to *stop*
> taking patches touching arch/x86/ because this causes issues but nope, that
> still goes on.
> 
> The issue now is cross-tree build failure which ends up in linux-next and gets
> detected there. Had this patch above been in tip, none of that would've
> happened.
> 
> So, Andrew, once again: please stop taking patches touching arch/x86!

This is utterly impractical without support from the x86 maintainers.

I upstream a *lot* of patchsets which alter x86.

I looked once.  5% of those patches had an Acked-by or Reviewed-by from
an x86 maintainer.

I cc you guys until I'm blue in the face and it's always crickets.  I
simply cannot permit MM or kexec progress to be blocked by the
unresponsiveness of the x86 team.  It's very regrettable but it's
almost always the case that I just have to proceed without your
assistance.


This particular patchset is a kexec thing so I added it for testing
because I look after kexec.  I'll drop it and shall trust you to handle
Coiby's contribution in an appropriate fashion.

