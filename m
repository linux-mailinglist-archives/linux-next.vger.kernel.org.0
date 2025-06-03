Return-Path: <linux-next+bounces-7029-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F8ACCBA0
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 19:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0FF188D798
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 17:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4745F1EEA40;
	Tue,  3 Jun 2025 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B8Zh99fy"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7448A1EB19B;
	Tue,  3 Jun 2025 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970096; cv=none; b=b1az/HNtrk3HkUVCvvOw7JS+VD5QIGWTaJIMhrVDaxxUdDBew7QEYyLOzBFDPaNys9pdBqK2Qs+nemMcZxfzlVrAyA9GqmBMRAmgVdeu7keLeQIJYA+V5WqTYOj56dZJ6RhyYPwYdFY3YKBiXvohPqXmP8KAvR8qaBArfLh5yh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970096; c=relaxed/simple;
	bh=uADljAkag5A/wUwzuLQfrWItCpAJhoo2ZNeXm65C2EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6s6cWR7pIY5mrwUFq8q2aJhwdK9cml53RhHLZxbCLyAiBGV+OVauCI4YPYmgyBpxG3yrp+vnl8IVGDENVfu2405GTqqoBgz+rsfQvezGzy6nlhUM4vI5lPgqZmm/xymCYVz4zPbZ8WBMQLXRJ2Q2c79kiZ0uxVO4s0nnGKu53M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B8Zh99fy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=jRmtHCHNHy0cBv+HZ4lLuGxsRZMXehNvwlee8bc/A9I=; b=B8Zh99fyCCnST1qmgA0r3cMgqR
	5vzBykTOxodgPoRHuiSlZ5KO4xjduHhGHjOfGBH2vpOvZif6ynwsKEZ/bx4E44hMIIwy9NxZuLYT0
	EhKrjn/ZvEMnzu3q3TkI3y5Adn+0s5/THs3boQLt1HhIsJyghwsCki39AskwfPvks/vMKkXACbb6Q
	Q9gerowvP1T1y78N1AufuXQmL7jU509vpL7yX4CgdWQle1zbiWbeDRX/CLPzcX8/56kOZ+uEAyzhn
	gZvPEAnt0vyFI6evmmEHoxOuGTPv7iiBC6a/E0jdI6CnJJeC1kCHnx78RB0wkR2gWJGWlEtTme3G6
	HclIbTww==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV0z-00000002Fek-3BEh;
	Tue, 03 Jun 2025 17:01:29 +0000
Message-ID: <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
Date: Tue, 3 Jun 2025 10:01:26 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>, florian.fainelli@broadcom.com,
 linux-clk@vger.kernel.org
References: <20250603170058.5e1e1058@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250603170058.5e1e1058@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/25 12:00 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material destined for v6.17 to you rlinux-next
> included branches until after v6.16-rc1 has been released.
> 
> Changes since 20250530:
> 

on i386:

ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'

caused by
	/* must sleep 10 pll vco cycles */
	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);


-- 
~Randy


