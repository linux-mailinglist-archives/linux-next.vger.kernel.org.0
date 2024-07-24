Return-Path: <linux-next+bounces-3117-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E8C93AC5D
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 07:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87ADD1F2383A
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 05:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B11C54670;
	Wed, 24 Jul 2024 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZCgouGs6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7AB53E23;
	Wed, 24 Jul 2024 05:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721800669; cv=none; b=r7sxBugSzp+1RUwhxLoM//t/MBNiXthx4yuRZTiACjkOuVuKlUn2aA+t9MVCmixTYHFkP/squJIjyyjkmmLn+jJrSRlILMXTjO6DccLod2TNNnBFuSuovRY9UWrRA2a+PgojAu20wMc6tYah19BvOWnPIbq/2s6cl+88lCBuYog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721800669; c=relaxed/simple;
	bh=icYbqzAh+qqL0F6QLJ1TYRdeqsy+pUQjVJeYvn12CS0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rLe1BiVedak/VTHv0L40pzK6nwBG8tUsORyusngQh92ZoMyYiW8zit3uQo8Vs5ikNFsRlBl1iFooj63czTFHCdLf+gtRCR8lXVZ43Zy3W+9FlepS/50KiztmH+Qtc4mjc8z/0pFgTDaJ+uySoJJjy+WN66IM6RKT6HuDBVV+5lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZCgouGs6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40568C32782;
	Wed, 24 Jul 2024 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721800668;
	bh=icYbqzAh+qqL0F6QLJ1TYRdeqsy+pUQjVJeYvn12CS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZCgouGs69EFtYdI1dJZKO0ST1iP1Sbm3aVDtljf6PgNVJqKgZE6QFvrLBff0qYlSm
	 aCq6TmoghMqOi4CH7krQETIN9q9MdY2Jm3ftpq5nYsb6UFWq+PjHtWWEkn0yQ2Zgy2
	 GjqDSucPxMxQh/typNQo+b5CemoKZepM3mLkOH4g=
Date: Tue, 23 Jul 2024 22:57:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20240723225732.1e050339cb366c998cfda374@linux-foundation.org>
In-Reply-To: <16389d71-4a1f-4049-8d81-5814d240c46d@lucifer.local>
References: <20240724084902.0843304d@canb.auug.org.au>
	<16389d71-4a1f-4049-8d81-5814d240c46d@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jul 2024 06:31:53 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> > Caused by commit
> >
> >   b102945dd5b2 ("mm: move internal core VMA manipulation functions to own file")
> >
> > from the mm-unstable branch of the mm tree.
> >
> > asm/page_types.h only exists for x86 ...
> >
> > I have dropped the mm tree until the end of the merge window.
> >
> 
> This seems a bit drastic. It's literally caused by 2 unncessary header includes
> which are already fixed.
> 
> We really want to get some time in -next for this ideally.

I'm busily merging 6.12 material while the 6.11 merge window is still
open.  That is Against The Rules, for good reasons - linux-next remains
the 6.11-rc1 candidate tree until the merge window ends.

So removing mm.git from -next is appropriate.  It'll be restored next week.

mm-unstable remains a suitable base for ongoing work.

