Return-Path: <linux-next+bounces-6470-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AAAA4E17
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 16:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C3E1C07B0D
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 14:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD26B25D8E7;
	Wed, 30 Apr 2025 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kSlL9UnE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7F625B1FA;
	Wed, 30 Apr 2025 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022153; cv=none; b=bANmVTYAuO8RnVXc/0P9ck0VBJur79hg8syCzxIkIsxB14Bvmgltqq8JtSXBZ/eGBv4O4815ixppaxXqDTo6U3AMvsMhBXgOamU4wupuEN8MrEODoFPWvfKERFc6U9yS7hLOi0ZAG16x2TPymuCmwmFPbmNjBJAaanKhjdPVx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022153; c=relaxed/simple;
	bh=qSvClyEYovJAb3lRfwo32bMDUBI2+an2AsNphJP59TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnrDnQA3mh4d0FfqXq8MKRRkol2DS08R8kLzwoAO4myBu2+aeWK0W5D+++9jbNwJjo9tzf7N73LwWtPmDNees8MzVikAdC6y6gDCpUrS1I9sgrdZXi4piAWYVUYGSKcgFGTSSnZyHPs7yTIP0mKfdJrE9JSkZLZbHrw/MeJVydQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kSlL9UnE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9461BC4CEE7;
	Wed, 30 Apr 2025 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746022153;
	bh=qSvClyEYovJAb3lRfwo32bMDUBI2+an2AsNphJP59TQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSlL9UnEuPGUwpf8KdEhoZaO01dnTbJApFDoWHhBh0iBjVJqkHqHBZFL2Z55Jbpu4
	 LGNEnI4Hnm7EdpCgcjhTp7UV05dENMZhsL+z3Mdu75RmFCGtijfZB2lfEvqb4FhfGo
	 ik0xTbqXEpUVxVFD3defXql4w734RNXzIAdk9VN4=
Date: Wed, 30 Apr 2025 16:09:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <2025043040-hypocrite-coveted-cf9e@gregkh>
References: <20250429155404.2b6fe5b1@canb.auug.org.au>
 <aBIUuIVJvdcUm9yz@quatroqueijos>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBIUuIVJvdcUm9yz@quatroqueijos>

On Wed, Apr 30, 2025 at 09:16:56AM -0300, Thadeu Lima de Souza Cascardo wrote:
> On Tue, Apr 29, 2025 at 03:54:04PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the char-misc tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
> > ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!
> > 
> > Caused by commit
> > 
> >   45f0de4f8dc3 ("char: misc: add test cases")
> > 
> > I have used the char-misc tree from next-20250428 for today.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> Hi, Greg.
> 
> I have a fix for this one. How stable is char-misc-next? Should I include a
> Fixes: line referring to this commit ID? Or is there a chance
> char-misc-next would be rebased or the commit dropped, making the ID
> invalid?

It does not get rebased, so send a fix, otherwise if you:

> Or would you rather that I submit a v5?

Do that then I need to do a revert, and then add you v5.  So a fix would
be simplest, thanks!

greg k-h

