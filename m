Return-Path: <linux-next+bounces-6350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F4A97CC9
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 04:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 116441B6235A
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 02:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A47125D558;
	Wed, 23 Apr 2025 02:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zg5BiUc0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D62701B0;
	Wed, 23 Apr 2025 02:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745375103; cv=none; b=Dj8d4KQ5w5AImumZYN6T7ybxuOXMwp/9ZajNCwKubG+KocN1G4+Sa6Psm5JWPZOBvlijMRj//DlYJz533O6ex4rWK/27/ldQC5kCnZZSXD3YNXb7L9RTmMuBCmX0S9Dl3LuEX/WY5XmNr2GryLxGWC1QAt06bO1Gj6NyiL0Is1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745375103; c=relaxed/simple;
	bh=AilAM9Ytp0iA5/r8FspfeC7RTf3NdBHqULiO9UUQk68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3jisuAMLla299HAyENthKsVxsi20rTtxsTRMBA3I4jZCp2HD2pCEzXBb2Y7FTs4l6v5TcE2dlrzUgxGLzORt5JScvhocNwU7qpv7SFPmp3lYAiRbJgLswUKtepu6tryckPNHxW48SdM0czb1cO5WCXoYZ/uAGHPFGlEtpieWTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zg5BiUc0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF16C4CEE9;
	Wed, 23 Apr 2025 02:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745375102;
	bh=AilAM9Ytp0iA5/r8FspfeC7RTf3NdBHqULiO9UUQk68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zg5BiUc0qdAF1LAdAOGpgOktGNJlQ2RBKat4+8dB+FZRtWcUWTTJ7iTNC+6Q0pcfo
	 XxZGN9gZcL6qr1Jev+f+JF+1onYodHvk7XGYH0lXxZgVm67q11sgGc3wdQo4ZpxgC1
	 KJm7CBjxAyEaYyJKjJr1napCL4dpwNwKkOk6m9J9uijSQXQEKCnWdzGtIdhBAFN3nf
	 4ED8qdXxU4dh4cZ8ztnA6A6JUC+yRQwd448R1yxw1Ng59A7C13A17cYipJs8tpC7jo
	 OZFpfO50DA7PbhnZ9386r5JzMeyCSdTZru/CxGbM8QMJdsYiqzYOe819LW+06Xt2H2
	 30/wzJNdqfSVg==
Date: Tue, 22 Apr 2025 19:24:59 -0700
From: Kees Cook <kees@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Apr 22 (drivers/eisa/)
Message-ID: <202504221922.E262C1AC8E@keescook>
References: <20250422210315.067239d3@canb.auug.org.au>
 <4a8ba1d0-d2d9-41f8-abf1-d45ec8996d10@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8ba1d0-d2d9-41f8-abf1-d45ec8996d10@infradead.org>

On Tue, Apr 22, 2025 at 03:28:27PM -0700, Randy Dunlap wrote:
> 
> 
> On 4/22/25 4:03 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next release this coming Friday.
> > 
> > Changes since 20250417:
> > 
> 
> on i386:
> 
> ld: vmlinux.a: member drivers/eisa/devlist.h in archive is not an object
> 
> on any .config file with CONFIG_EISA=y

This is surely dd09eb0e2cc4 ("EISA: Increase length of device names")
(and I assume why I'm on CC)

I'll need to study how to use "if_changed" without adding to the obj
list. I'll work on it...

-- 
Kees Cook

