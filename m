Return-Path: <linux-next+bounces-7047-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4497ACD4FD
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 03:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE71164EF6
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 01:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F0381E;
	Wed,  4 Jun 2025 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="teO0dTWJ"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD04A0C;
	Wed,  4 Jun 2025 01:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749001048; cv=none; b=reitKML7UxO2hp1EES0ZzFnF3CdAisu2MZR0J2dHtlzNAYYhCpBTzOXOJRhmvVYX4gg2QXxcG9kUiRXLT1iacu8skJUVpUYF21JTssgHTLEn9GToslgxZB24fj0NtOLee7Sjurlx9wDBam3Quwlvzz7a4W+QEfd4LcoONFMdPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749001048; c=relaxed/simple;
	bh=x5KxS27R9XsTsQUUfvEX2NPaFhZKTe3XV35m7YrHPis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epY92YFbFl0Qc7etZO3HngVk49WLi/fQe/8UjIYYMzLoWTBulmdquCK4jPzqg07iRAuyXDBo8qTsYmrBEsvHckwLMIES3fk8WhJWqefRRt0L6iLOnKH+5dB1zCP0p2qXxOVEaDk7QJjHnravpaDl8TSWswh6RwLpGyudJCSWKy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=teO0dTWJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8eGfPRGUF5ViYyjyoG8MNXtb1Vj2lTG+nu4pyJ+aQGA=; b=teO0dTWJiPErdIOAzSiHkP81RP
	88OY2P5Xxc5l3HZSeqViqjz35+rjXvZZ5yev3x5o3cGdSIp2Ce5/FcYsEpKEFSp8i/Wsd/pHwXtWp
	M7Bb+WEoodPxFavZfpDn7Tk/NiapAH2xKaELS3iJB8dsMJSwf4tO8RsivGIAypwtBYULUeFVywtvn
	AxfOl2Z43duD+dqdNUCZ7Nzn11144FmcwF5snJ0JYJYv3s1clLPBoy6LziWCih5WJjlUxy+GyeUCE
	y1/oshOxyOsRb5Hl0CvJTDEzSNpXshNKfIi3LpmwhIzdVaR9Q5HLwEStIXe7GRaKo1tRJLH/GgBNP
	2IpzYUJw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMd4F-00000002d0p-2AqZ;
	Wed, 04 Jun 2025 01:37:23 +0000
Message-ID: <7b6b212d-5df1-42ea-bb38-d5e56d7de8ee@infradead.org>
Date: Tue, 3 Jun 2025 18:37:20 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250526180350.06b825de@canb.auug.org.au>
 <20250604090219.29f09a62@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250604090219.29f09a62@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/3/25 4:02 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 26 May 2025 18:03:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the kbuild tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis start-string without end-string. [docutils]
>>
>> Introduced by commit
>>
>>   707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper")
> 
> I am still seeing this warning.

Fix here:

https://lore.kernel.org/all/20250526211039.163449-1-khaledelnaggarlinux@gmail.com/

-- 
~Randy


