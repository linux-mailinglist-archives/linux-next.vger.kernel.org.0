Return-Path: <linux-next+bounces-2474-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CC8FDA84
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 01:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16CE31C21739
	for <lists+linux-next@lfdr.de>; Wed,  5 Jun 2024 23:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D55C15FCEB;
	Wed,  5 Jun 2024 23:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="NySkj6oN"
X-Original-To: linux-next@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035F42AE7F;
	Wed,  5 Jun 2024 23:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717630198; cv=none; b=etlknHiNMTDDzXXnALGisjORDekn//G3rissl3r6bjF4GJUooq7ay3qH9AoRqsUwmvkDD13H3IcnkzvWl0VkHmh3DsL5TKbwTkySLE+68VHxgo3XSaPQhn/nbfAvon9VejrVNMCNwlk6kJb/paUa7IY2/t5dt4zbO3NO9bu7TjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717630198; c=relaxed/simple;
	bh=ko/EFLb+WSVhUj2QaZIFib7/CDXpHhLr75wqgYx0qlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aakqIDpiPNMeqPlrOySj0m2fEor1peBlfLBGUdT4SfuqgWizgTeqDa3q6K6Z+IcLBr3Od04QLPj+gLlcZDLCjASUCXEIZEkzpWWlRkwQUD7y25oZLmIxOjaJ+2AEcJE15JMroo0FyAu9OieJZDNb6pxXX6YzHy+gBm08uNyw3Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=NySkj6oN; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BA65088193;
	Thu,  6 Jun 2024 01:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1717630195;
	bh=9HgjuEct9BZQLLyCzG1ahHbDe5Cj1vYTuKi3aUr3jks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NySkj6oNihK5mP/V2+jVyPslsfoSHNe67uemZt2GZIBZQXwPj+3/ucN1xXp4r+ioT
	 1T0WvpMT4wVQJu6cv1E15+SAZpaY0meuGV+jtSWYhMJCLYIHHrlF42yas48UJYEVve
	 TUOUoqWMgXycWpOVZD+xVZBPgZiRGtMU0jl47vCCo8/8BMP10lMhjJoGvqzJodCuQ3
	 gJe371Nuwa9hHPA31xUbdeRyvdodog9wILBV97Y6uxoLJqWdrb86PcUe+/G14k7/W+
	 sre/NatOwRpWe0cPxg+WB78E7fuMG8Z7HX9mNZM/8yTNBoGS/kmlSRAE0qYHHQilYK
	 TWVK3g7Ia1U/g==
Message-ID: <a827536d-004f-4a5d-8995-321ba9926349@denx.de>
Date: Thu, 6 Jun 2024 01:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the stm32 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexandre Torgue <alexandre.torgue@st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240606091217.19a08b65@canb.auug.org.au>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240606091217.19a08b65@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/6/24 1:12 AM, Stephen Rothwell wrote:
> Hi all,

Hello everyone,

> After merging the stm32 tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> make[4]: *** No rule to make target 'arch/arm/boot/dts/st/stm32mp135f-dhsom-dhsbc.dtb', needed by 'arch/arm/boot/dts/st/dtbs-list'.  Stop.
> 
> Caused by commit
> 
>    12ff8e167641 ("ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC board")
> 
> I have used the stm32 tree from next-20240605 for today.

Fixed in

[PATCH] ARM: dts: stm32: Fix STM32MP13xx DHCOR DHSBC Makefile entry

sent to linux-arm-kernel .

Thanks for the report, sorry for the breakage.

