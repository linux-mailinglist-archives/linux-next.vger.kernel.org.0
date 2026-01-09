Return-Path: <linux-next+bounces-9599-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B2D084A3
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 10:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9C92306A932
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 09:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ED83590B2;
	Fri,  9 Jan 2026 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esRe4ePG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76115358D38;
	Fri,  9 Jan 2026 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951711; cv=none; b=FoblKl26hAAUd5cPBL6FaQWHbCjkhmeh0OmW9PE+yH2fUTVUOoeoYg3b660nt8wJ6j2lKMwYdsW/0ih47A1KGBmJuGum+g0xqsutE427ySvEO7oH/6v8YLyhmQyl6jdbKuNTTiUJ8HyLvUBtgeQl0xUZLSwwM9sadG1Q6l00FZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951711; c=relaxed/simple;
	bh=JMTgpPulPuWllT0LglIi9jMV32hpUyW4AHc9RIfNBl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBhhYf4SfMJRoHHVR136Zw7HWdMUJ67BaiHY4Cb1EA7K5FEG3KEGIbwPj5ZWg0HBgTxtVI4J2avzGa9GB9gWL3mckD53HMpnITvy2jwUq3vYlI7hxerKdO1NZVLVv7gLcSqYBapNEzYnrsOGTHEZnEAVScmFx598DBFa63D9/kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esRe4ePG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D17C4CEF1;
	Fri,  9 Jan 2026 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951711;
	bh=JMTgpPulPuWllT0LglIi9jMV32hpUyW4AHc9RIfNBl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esRe4ePGKs6hu8NEwaeuBtyDKrW5w9U8n3wIV0aQQjWo3rOo19C+xoUXMdR5ahW59
	 A5fiZ7Y4yKuCo/6dU+aY3XiLH0A7ApNxOi/vh5DLUl7ARfk0hmeyl0bjA5KOK7uM5p
	 T0yXe7QhibLCi28PnVUJwNEQb21ffUc50d/ASznbQHgjrMigHuvIAaz//MtwvN0PEA
	 tkG8gfXXY945A8lWDarHoGXaYeFMcycEFFXlLOGQwqAROTvGiBcdzHwJ7MW0Zmg7EE
	 vw4J4f0P098z36yJwYG5syvkLOaKSv9sU8yE/4OSYnKp5bNUtJVVUD0tN01aCummE2
	 9i4lo+WjEhPQw==
Date: Fri, 9 Jan 2026 09:41:47 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20260109094147.GC1118061@google.com>
References: <20260109124558.25b0eebc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109124558.25b0eebc@canb.auug.org.au>

On Fri, 09 Jan 2026, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/leds/rgb/leds-lp5860-core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/rgb/leds-lp5860-core.o
> ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> 
> Caused by commit
> 
>   51f7560294c9 ("leds: Add support for TI LP5860 LED driver chip")
> 
> I have used the led-lj tree from next-20160108 for today.

Steffen,

Please provide a follow-up patch post-haste.

-- 
Lee Jones [李琼斯]

