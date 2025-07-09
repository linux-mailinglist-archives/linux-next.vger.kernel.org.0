Return-Path: <linux-next+bounces-7434-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788FAFE9E4
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 15:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9D53189B394
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 13:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E751B1C1F13;
	Wed,  9 Jul 2025 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tuGQbaTl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ickwGrTj"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6042E403;
	Wed,  9 Jul 2025 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067033; cv=none; b=urFi+PNB1EHVR6nw3MuJL9rUjANf6sDZ8VweFo5W2WNGD1Wtvo1MKVjCzc52Sozz1ID3EvT+5cznae+TuKW0D9yK1USAw5ua4zXvll4QnSBSjvsaznHeaTGTvT9tj0YpQoy30SyUchzuJ2HCRURsweXld1zqgwbCJMXeavqFGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067033; c=relaxed/simple;
	bh=cqp3V/Ws4qKI8htQbCguRDmUWAek7HxZy/ZUPe0PPD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bm4X+ovZwx2hXBK2HJOMR+SNuAmBeqjn/iR449UWRL6W2XQT3AKUFrQCqNReDvU17d6OFWttu1LpC7k5QXhWwhYNOrZ8uWq8NeGiIyY+s/lIFte6M/FlwbfftqqjSSjbT1nVdXITJ986lrnc5jYMxAevcAwF+qAS3VvPRoJqdWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tuGQbaTl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ickwGrTj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 9 Jul 2025 15:17:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752067024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lVj0aoraIhNJX8Js5FjD8e+Fq0wihE5N6dpcDSqe7Mg=;
	b=tuGQbaTlPXOqxn/uKiMCilgaK0+c9D7LreaZp6cR5aoisw3XVlWzo+8zfFOo3v3VMiiUms
	N4fc7k/4apepbLhZWMpAoXxThg6X2DD3CmZOif6uc7P+4aMvHdNxfbTYX8Py2LN0nvMALu
	ToXeL1IFKzAQNRESUz/XqPZHHPSuA/Is5nvIpnL96BA80ntOv1aPvlH1d6W68Yfaa9XSku
	YT9dBnM2EjykyfGtIsvkEsxGxL0tE2q1khB3psurTDWMxrNehqZhin/3DKxMhYeKBjtTLE
	OTEjPcNLgHun2/5pwlDAtDXZpmRg9/tCAOSnUg+MKaoyidVv/Dh9O6ej0q1ylQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752067024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lVj0aoraIhNJX8Js5FjD8e+Fq0wihE5N6dpcDSqe7Mg=;
	b=ickwGrTjwCZ5KMH5Fki0zkqvlI5vvAEn9PsyFysJp4cSd3X3130HGYPJbqOWOs1/TZ2560
	R1a1IDHyAbDnDIAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: CONFIG_DEVMEM=y breaks gettimeofday in next-20250708
Message-ID: <20250709150929-7198f921-5b85-461a-acc1-ccc04e9adbab@linutronix.de>
References: <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
 <20250709124216.3011-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709124216.3011-1-spasswolf@web.de>

Hi Bert,

On Wed, Jul 09, 2025 at 02:42:15PM +0200, Bert Karwatzki wrote:
> Recently I found that my RAM has an error (memtest86+ reproducibly reports
> a failing address) (this error may lead to random crashes every few days). 
> To further investigate the issue I tried using memtester which needs access 
> to /dev/mem and so I recompiled linux next-20250708 with CONFIG_DEMEM=y 
> and found a strange and unusual side effect:
> 
> a) the time displayed by xfce is stuck at 1.1.1970 01:00 (UTC + 1)
> b) most certificates in firefox-esr fail to work due to the date being 1.1.1970 
> (this includes www.google.de, www.duckduckgo.com, wikipedia and youtube and many more)
> c) some certificates in firefox-esr still work (kernel.org, xkcd.com, www.spiegel.de)
> d) the shell built-in time (and also /usr/bin/time) fail to work, e.g.
> $ time sleep 5
> real	0m0,000s
> user	0m0,000s
> sys	0m0,002s
> (even though it actually take 5 seconds for this)
> e) date still works correctly, e.g.
> $ date
> Mi 9. Jul 11:51:20 CEST 2025
> f) This example program 
> 
> #include <stdlib.h>
> #include <stdio.h>
> #include <sys/time.h>
> 
> int main()
> {
> 	int ret;
> 	struct timeval tv;
> 	struct timezone tz;
> 
> 	ret = gettimeofday(&tv, &tz);
> 	printf("gettimeofday returns ret = %d, tv.tv_sec = %lu tv.tv_usec = %lu\n", ret, tv.tv_sec, tv.tv_usec);
> 
> 	return 0;
> }
> 
> gives the following output on affected versions:
> 
> $
> gettimeofday returns ret = 0, tv.tv_sec = 0 tv.tv_usec = 0

Thanks for the report. Can you try the fix posted by Marek [0]?
It looks like the same issue where the vDSO fastpath is unavailable on your
hardware but I broke the check for it.
If it is the same issue it still leaves the question why the fastpath is
broken by CONFIG_DEVMEM. Can you describe your setup a bit?
Are there any entries in dmesg about the tsc or the clocksource subsystem?

> These errors do not occur when using v6.16-rc5 with CONFIG_DEVMEM=y, and are 100%
> reproducible so are not related to the RAM error. 
> 
> I bisected the issue in between
> v6.16-rc5 and next-20250708 and found commit fcc8e46f768f ("vdso/gettimeofday:
> Return bool from clock_gettime() helpers") as the first bad commit.

[0] https://lore.kernel.org/lkml/e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com/

