Return-Path: <linux-next+bounces-7454-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6AAFFBF4
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 10:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEF4F3A296C
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EB81A3179;
	Thu, 10 Jul 2025 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsf2d8om"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D942AE90;
	Thu, 10 Jul 2025 08:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135338; cv=none; b=RCxih0aQNweU9IVcCOfcl89lo7iIGflq2HW6SSc28x+CCEb73RpoVUERvtVmgbzQq8/a9/IEswu4fV5ou2Oqe9GVGdKiiRSnetMWEEgjAdaH5keG9+gPhvibG6WK7NXqKEczIlZvgKjMHAlmps9BD9Os84tNPzDkp7nvUo9qSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135338; c=relaxed/simple;
	bh=nB8XzzCcsITj37E0i5z/Jl8dTjvbTytz0yC7pWPqsVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHJiKOCjIyfpCXrX6xCZPclFJNKhJsWtuzG7T0qDLYtlm2eOb4m/Nic939cjz4ZI5O9yFE8lN2EQKZxQ7ZSPJ6r8p94Wvd3XlQwPQ5XBMBT4rDIQOo315OdFdSvkDGPezr4/loso/AMOmOJREdmez0hM5TD81snNWIxk9BrLNOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsf2d8om; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A89C4CEE3;
	Thu, 10 Jul 2025 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752135336;
	bh=nB8XzzCcsITj37E0i5z/Jl8dTjvbTytz0yC7pWPqsVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hsf2d8omnuWSm9CsU+AvT9aPqK4zqikyTa+hoPRyo7sg3bE5pk+x1slpg5jRhvI9R
	 SKIZgE09IUJrPq+udVndXvfH8b90oUMvAT93OFn2e0JF/U/S6NGgM/uIH08cAz+tRH
	 7vJiG5wzDTpTrkRna6729mHe6slIPE8ehnfbakrdfMNsUgLlSl7OpMr59BpaoS/RLc
	 1swnQLejOYelIpVlEBgu7o2waibieJsL4eLwnrI9GIIzX1G4rf1MGUhyQEY8rcFlEu
	 dYM7T+TNptr/OIzj3sU1Leljo5UYRMSIKN+0ntb26KgovZYQx+H4lg0skghnTXyGw7
	 QkB+oh/JG2uqQ==
Date: Thu, 10 Jul 2025 09:15:32 +0100
From: Lee Jones <lee@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20250710081532.GB10134@google.com>
References: <20250703142348.45bb8d28@canb.auug.org.au>
 <aGZkDynnq2Li4EdN@gallifrey>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGZkDynnq2Li4EdN@gallifrey>

On Thu, 03 Jul 2025, Dr. David Alan Gilbert wrote:

> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> > Hi all,
> > 
> > After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > drivers/media/radio/radio-wl1273.c:12:10: fatal error: linux/mfd/wl1273-core.h: No such file or directory
> >    12 | #include <linux/mfd/wl1273-core.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> > sound/soc/codecs/wl1273.c:10:10: fatal error: linux/mfd/wl1273-core.h: No such file or directory
> >    10 | #include <linux/mfd/wl1273-core.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   17f5c6fa85e5 ("mfd: wl1273-core: Remove the header")
> 
> OK, so I see Lee has picked up 3/4 and 4/4 in the
> series, but the one that removes the radio-wl1273.c is the
> first one in the series; see 
>   https://lore.kernel.org/all/20250625133258.78133-1-linux@treblig.org/

Okay, I have removed those 2 patches for now.

Let me know when the Media patch has been applied.

-- 
Lee Jones [李琼斯]

