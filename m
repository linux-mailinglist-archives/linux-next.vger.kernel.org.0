Return-Path: <linux-next+bounces-3290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1494E5D3
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 06:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EDD31C214B1
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 04:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652BE1494BA;
	Mon, 12 Aug 2024 04:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Q/DyDpUB"
X-Original-To: linux-next@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8AF1494C2;
	Mon, 12 Aug 2024 04:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437628; cv=none; b=f7gVqDVolVui2r9UqfdLIWYDB/gMquRqdaalEftIwAANQHJJJKjrJtytY5bP6+VYTIiOU+kMMhyl8P6RHXTyo/KwJ4AuD4nnDrmS0G2Jw6NzjFy2jqUXKx7Oa7SEpFqoV8sJoSYbIGX/RI3btmi1ufjdOCfR/dAHnWXH6Qi9IZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437628; c=relaxed/simple;
	bh=ZVS7/Sig/Z8QibmeD2JxJ4QIyQHtPx4bK1Xsf4GgV4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxgU9WGnKcJfhxBRh97FLeQSQmG4MIAQsWnuoNbp3s0fKp7LYsW8fKmvRLYeYUSIvWoBF9OfGdDuulUFN4LaYP9zVyF9BWmOrfruFsCAa5pxBFlZQKoW77SR3rJBQtKl6g/eGVd+voW4WJlpoAtpunHnwO5hABaXvwLqXamYY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Q/DyDpUB; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1127)
	id BDE2120B7165; Sun, 11 Aug 2024 21:40:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BDE2120B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1723437626;
	bh=wrO4Voywpll3U0JpKOWNr8bhQxc3/WvErevZo90Vifc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/DyDpUB7Eg5ssQ0V+7+0h1ae3TVGZSsUWRQEDKfT9l9qzVaTiqLU/A28g9B/nSSW
	 CnrgM37eQ6jc1qsycMCkbFm2JNpOA/40bhB0QsJ9nfoxWaYi1jbkvPabt7X792QQuO
	 uLIxs6LFN2IEeWwb126QrpmfnKiFqwaB7iZ5OTXw=
Date: Sun, 11 Aug 2024 21:40:26 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Message-ID: <20240812044026.GA9092@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20240812133000.59660575@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812133000.59660575@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Mon, Aug 12, 2024 at 01:30:00PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (x86_64 allnoconfig
> and various other configs) produced this warning:
> 
> mm/vmstat.c:34:12: warning: 'vmstat_late_init_done' defined but not used [-Wunused-variable]
>    34 | static int vmstat_late_init_done;
>       |            ^~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   ef534a0d5198 ("mm/vmstat: defer the refresh_zone_stat_thresholds after all CPUs bringup")
> 
> from the mm-unstable branch of the mm tree.
> -- 
> Cheers,
> Stephen Rothwell

I will send the V2 for it.

- Saurabh

