Return-Path: <linux-next+bounces-7058-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B8ACDC66
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 13:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82FFD18954FC
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C3025179A;
	Wed,  4 Jun 2025 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XjMjnOOc"
X-Original-To: linux-next@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF528E61C
	for <linux-next@vger.kernel.org>; Wed,  4 Jun 2025 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036092; cv=none; b=tMv6OL8ou3FLju94f2Ah+CKznnyz3xI1DC1IwWALNJtpkMGKRJg3axE7qlwkH6SJXl/AG0ICPNXJWox/3OO+s25DnWOHZLDArOgpbS2Ug4dVO3W6MiJv/dto9a3Vo0b6N3kZtJDP+ZbvU4m24/yiwD3U4p2Onr1yxcukwKjeVzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036092; c=relaxed/simple;
	bh=xqm5cHFk20wFqyERODHx0A5Yo7HzFZcrbSgFQoBjAkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1cppLAchjhsNwEmJHdR394dPXXHaKCc4fRvO6Jae0IgWsQcF1cb5TDMlGRPsniHgpbrcuQ1JJmtobM9csZVdDzHZlEk5f7nj6Qf+hxg6lcaBcEml59WBkPXdO2nPjRpTpCFIFiPFPO3d4Ak6D7z85PJMSxQxE5MHsxpqzLNQxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XjMjnOOc; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 4 Jun 2025 07:21:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749036073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6tNxQUm7SiMLlUyYYyUWjpyr8owNk6jHSf4TF5Pg7E=;
	b=XjMjnOOc0hWHjQJHHVVufwJrf8aH7eM5YKXzzrR3q4EoLO9Kc6vjJh3r1iDoK0rRqiBa51
	w+rF5p+hTTVqnXv37+TVNjU17atj6QugExvDXYQEQyr9S6UvHWObqv78OXx/MuG64gMP5s
	QyQIC9nczpm+ovVfYO62LaiYxfsuFg0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-bcachefs@vger.kernel.org
Subject: Re: linux-next: Tree for Jun 4 (fs/bcachefs/dirent.o)
Message-ID: <mhmmdwdgody7hmoltfdgyfhnmk5vyydgopzmru3wjmbnyydhkl@di4wpd3e3pvx>
References: <20250604140235.2f14220f@canb.auug.org.au>
 <c15ba8f1-4bf4-4b14-ba79-440a3b17a021@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c15ba8f1-4bf4-4b14-ba79-440a3b17a021@infradead.org>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 03, 2025 at 11:45:14PM -0700, Randy Dunlap wrote:
> 
> 
> On 6/3/25 9:02 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any material destined for v6.17 to you rlinux-next
> > included branches until after v6.16-rc1 has been released.
> > 
> > Changes since 20250603:
> > 
> > The bacahefs tree lost its build failure.
> > 
> 
> I am seeing on x86_64 when
> # CONFIG_UNICODE is not set:
> 
> ld: fs/bcachefs/dirent.o: in function `bch2_dirent_init_name':
> dirent.c:(.text+0x13bb): undefined reference to `utf8_casefold'

thanks

