Return-Path: <linux-next+bounces-4563-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC6E9B853F
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 22:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30FBB281CEB
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 21:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2AD175D35;
	Thu, 31 Oct 2024 21:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LgLtC02I"
X-Original-To: linux-next@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D241CCEF9
	for <linux-next@vger.kernel.org>; Thu, 31 Oct 2024 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730409929; cv=none; b=E4cFiuY7vvtHo3xLzRVzvvR93ljx42eM4inqD1rkiymSTPzF55zswVO1LaEJb2T0RHHgpcxZJDDrN5Y0aFzQDPFOllyT7Lz0ERXz0dcsaQWzQfjTZViUaYAU7/WxttqFu30SSKyNuwLQn7jH3eY6yqV4F11LlW1FplAnKhns4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730409929; c=relaxed/simple;
	bh=Y0HRg+Ah0ZrJ8O+NoB0/ML/YfYSZOijTLEaTUdCFHSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpJSaKX/wDRFrXoi5xwCAHZCfFFB+TqJgGKDkyBr2Ht5GUpJD7FCRPNSHHlViJfrYe5y47e2yBEZDGBFl/uN+kEYheMu1Q/bUgf0eoS7HA5rQcYuWgciXWZih4ZdgUtz8rW2KBTIV7pM5v/3hTtkGKlgdXwPymdytD5hTjxu6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LgLtC02I; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 31 Oct 2024 21:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730409916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpwPAur6OOG903dB0I7FmHeas5Pcigjofj0YCcYcEOw=;
	b=LgLtC02IqhaAsW2k4Z/2N3nwAVVQ6XKY98n+2cSW+qCihnS8UbrPr3xK+O3mnsqejPeNnR
	YobFv7ffSlKOHgxQCngn0xTqugn/ziEIrW08jiH061uEA4TXAyo28dlJ3fEnE1B0Mt/oNW
	kjOJXhxHOhvit3DoMFNXvxO4iOJENbs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm-arm tree
Message-ID: <ZyP1uPx0sqbSyxMu@linux.dev>
References: <20241101081245.4f49baa9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101081245.4f49baa9@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Fri, Nov 01, 2024 at 08:12:45AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   e571ebcff926 ("KVM: arm64: Get rid of userspace_irqchip_in_use")
> 
> is missing a Signed-off-by from its committer.

Fixed, stupid mistake by ${COMMITTER}. Thanks for the report.

-- 
Thanks,
Oliver

