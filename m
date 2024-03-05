Return-Path: <linux-next+bounces-1476-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C9871963
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 10:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 563E81C215DD
	for <lists+linux-next@lfdr.de>; Tue,  5 Mar 2024 09:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D68D4F88C;
	Tue,  5 Mar 2024 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vR9D8KrK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7C2745C;
	Tue,  5 Mar 2024 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630262; cv=none; b=L7guKfVvQ7Xp/Nus9a/QJTmfYJZftzPlFiYG591TtZGfZLWzeHg1HOoL9F6uDCIbXw/yGaEqDRvyoXYB+Yzv6PsS0jEPBYJgCQKcxXqPSWiXpEySsvvR24QdJ0VghL/p6832rdszzeoMOnra/oMrRqxIMd8bSNktr4G7PDAqSio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630262; c=relaxed/simple;
	bh=VcNVvi7+jfke7RLUtYSBHeLAo6DmYD9o7vDplxC8zW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4gDYjShqWdvXU39A4BFfHqJuS5JjxyzpIO5xrvxdl920NG4b/RQp5bDd9lYrUWYUUpv87KQ41ldRNdBCjYhmG7jikJ7Pjak+m50j0Ky9cR+Y9/cbAR6q3YU+B8C3LE5nB3BZLLyESNPkclud1L1ozNO+/tW+DGM6HzbJsfUfjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vR9D8KrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889F2C433C7;
	Tue,  5 Mar 2024 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709630261;
	bh=VcNVvi7+jfke7RLUtYSBHeLAo6DmYD9o7vDplxC8zW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vR9D8KrKBK1EcjUh6DbaHa9LOdjMGRGrFqXU8dXj7ECbLmgIywwfuTMDY2Zm2ql5J
	 OXAYQ8uIHVy2xUa1tIAlGVUoFvyMlSc0NuCsAcmrb8b/zeCko8tviTv929ClO40LBh
	 axelBqg305b3z8DO2RKsXiTTaI0bAtkXFaXPC8HJoDiayiJlZwSi4NqV2UPhoH1vKK
	 hN9zqWFr+2TMIl2jzz+rXwp63uk5Fr1Drq5h6aX3jOYJ3NQf9CRFv7rrYLSYlQwIN5
	 Biu1HA/9KRadi2y/QxgKocpTJxiZgUYO4TDR+dIGINj/H95HCqqbB3ibSE0iOUGHjg
	 V2lzRwIb/cH8w==
Date: Tue, 5 Mar 2024 09:17:37 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the backlight tree
Message-ID: <20240305091737.GB5206@google.com>
References: <20240226132828.7524baec@canb.auug.org.au>
 <20240305111634.57e84398@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305111634.57e84398@canb.auug.org.au>

On Tue, 05 Mar 2024, Stephen Rothwell wrote:

> Hi all,
> 
> On Mon, 26 Feb 2024 13:28:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the backlight tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/video/backlight/ktd2801-backlight.c:8:10: fatal error: linux/leds-expresswire.h: No such file or directory
> >     8 | #include <linux/leds-expresswire.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   48749e2f14e3 ("backlight: Add Kinetic KTD2801 backlight support")
> > 
> > I have used the backlight tree from next-20240223 for today.
> 
> I am still getting this failure.

I just pushed a bunch of patches.

Please let me know if this is still an issue tomorrow.

-- 
Lee Jones [李琼斯]

