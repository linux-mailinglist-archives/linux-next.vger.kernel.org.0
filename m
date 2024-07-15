Return-Path: <linux-next+bounces-3006-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5E930DB9
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 07:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 744021C20F00
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 05:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3070F13A863;
	Mon, 15 Jul 2024 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DjNGVdrz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1F291E;
	Mon, 15 Jul 2024 05:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721022797; cv=none; b=mqBqXX3/HI49ifpovT1NnDfLF0hLGfTUNjINl7nwcUctGsBxTIlemUGzUpByelX6CDGg8a/xSM6ITth38FkmivfQtdnl/LIkjmcSUyMNls9GuUqPDJw0qw9PBKFTc/+VX+JWaszwMLSeKcgSqF2LTebSCMwPUo4HqWIRjLAYUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721022797; c=relaxed/simple;
	bh=ne+Pni6y3zzXx2qY0cDrLQdg2DmDiDbtZdXO1d/NXPw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aFJC5egQFBCTAJHspc6HWijtMS42CfEDhC/FBAAs5PY+3P0SVoxpHc60NxqqgvrYWwnG+cbYldPZoCfGrPXBUgc769e25sDOsAIsN7h/chtKLfFj/aIPQ9vNU7za+lSG/3oVG8NVPOjlRo6FvbYFV17VIgb3gyKdfKauhSUba8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DjNGVdrz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A42C4AF0A;
	Mon, 15 Jul 2024 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1721022796;
	bh=ne+Pni6y3zzXx2qY0cDrLQdg2DmDiDbtZdXO1d/NXPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DjNGVdrz0l7npZlt56eYFvC88DyfK3VMAbXziLizTKJVWZfr5kT+Jc4CVJTHVYBYe
	 oe9uNIvjMJgOluV/UtXvZ9feem77IRpGyJycjfsGjg+E0ArRn1l2Iovv3vBmp1FaVZ
	 X0lSFdj2Wyz6iHy+p4V/Ibzj800IlgHPf0sDIZz0=
Date: Sun, 14 Jul 2024 22:53:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Miaohe Lin
 <linmiaohe@huawei.com>
Subject: Re: linux-next: manual merge of the mm-stable tree with Linus' tree
Message-Id: <20240714225315.f56498a2d4e924fd07633c78@linux-foundation.org>
In-Reply-To: <20240715084239.685491ee@canb.auug.org.au>
References: <20240715084239.685491ee@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 08:42:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm-stable tree got a conflict in:
> 
>   mm/hugetlb.c
> 
> between commit:
> 
>   5596d9e8b553 ("mm/hugetlb: fix potential race in __update_and_free_hugetlb_folio()")
> 
> from Linus' tree and commit:
> 
>   a81fa1dc5db2 ("mm/hugetlb: fix potential race with try_memory_failure_hugetlb()")
> 
> from the mm-stable tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks.  This caused me grief.  

I removed a81fa1dc5db2 ("mm/hugetlb: fix potential race with
try_memory_failure_hugetlb()") from mm-stable and redid it against
mm-unstable.  It still has cc:stable so some merging work will be
needed when the stable tree maintainers get onto it.



