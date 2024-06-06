Return-Path: <linux-next+bounces-2487-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6068FE5BA
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 13:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D9F21F26FE5
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 11:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E094178396;
	Thu,  6 Jun 2024 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="pYQz6zxc"
X-Original-To: linux-next@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE739FEF;
	Thu,  6 Jun 2024 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717674383; cv=none; b=kc/O/FuXLfSegGgStnyVTwGbzm5IsdN4V7iUC9ijSTPT3ksWHlXjb3S4m5bcHvGqo77n0bxVtTREbr2KJhu2uuKG/OlogfHXcge0SLYCnPI/62s15NpAYht5CJXxkhlK7QdNCqxO2sOZmzF+SGpjZJg27E5q+gJ6mH2dhyXsG4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717674383; c=relaxed/simple;
	bh=bawd7RoudWzE2MLiDRDMbDUVmw5SvItRGm9RIcJfnSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=an51hKZVdrOzWG4UCTM57Jp6zUI25vJwWvwNixN6V8JC9wCp8QwDmWCxD+u6R0D9oKFnT4A9W16PV8AGIHd8NTHGZqzBFZrk/7efuUj3K5opr3tyy3PETi11fX/1LcOOEZkQDY+LlPPX/6/gBXYOzd7qcKgmScDqQliUWvSG1ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=pYQz6zxc; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6DDC988395;
	Thu,  6 Jun 2024 13:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1717674056;
	bh=Nyy8WYwlJkr9UvhAPlerxpBTyEbPyphWULV8TmMUzaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pYQz6zxcgac01LlqCNOMbPaufE8YwphfPIR5SkZzMpMmELev1dXCLCBoucvlsUSfF
	 l/3YBGPPFvkadQEpBoVp3atPRsuLp1pzdgwEerFOH6ZvJwNBBUMpMkZy1IRrL97yfy
	 mMIXt91y17oBYF/bpPOFwzNaVwYEe/hq4kNSidvDd/Oq96x0O5P6jbSxf0Sg4kIWqt
	 kgS92C72WlfKuwjHeO54oguTFMkG+3NWwxpia00M0JWCnOGYbC7S+0nmHeV5qHuCDF
	 zzFFARA3mnX1+oOwTXQ9d2cisWz8drewWujYIJb9Ah5EOQM9WWm7JbxYTQpvktbuDR
	 Rh7DZDG57eoxg==
Message-ID: <5770f01f-2341-4fed-81da-3803f3c54f03@denx.de>
Date: Thu, 6 Jun 2024 13:14:37 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the stm32 tree
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240606091217.19a08b65@canb.auug.org.au>
 <a827536d-004f-4a5d-8995-321ba9926349@denx.de>
 <361a9191-c320-411e-a628-ff41298391a9@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <361a9191-c320-411e-a628-ff41298391a9@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/6/24 8:54 AM, Alexandre TORGUE wrote:
> Hi

Hello everyone,

> On 6/6/24 01:29, Marek Vasut wrote:
>> On 6/6/24 1:12 AM, Stephen Rothwell wrote:
>>> Hi all,
>>
>> Hello everyone,
>>
>>> After merging the stm32 tree, today's linux-next build (arm
>>> multi_v7_defconfig) failed like this:
>>>
>>> make[4]: *** No rule to make target 
>>> 'arch/arm/boot/dts/st/stm32mp135f-dhsom-dhsbc.dtb', needed by 
>>> 'arch/arm/boot/dts/st/dtbs-list'.  Stop.
>>>
>>> Caused by commit
>>>
>>>    12ff8e167641 ("ARM: dts: stm32: Add support for STM32MP13xx DHCOR 
>>> SoM and DHSBC board")
>>>
>>> I have used the stm32 tree from next-20240605 for today.
>>
>> Fixed in
>>
>> [PATCH] ARM: dts: stm32: Fix STM32MP13xx DHCOR DHSBC Makefile entry
>>
>> sent to linux-arm-kernel .
>>
>> Thanks for the report, sorry for the breakage.
> 
> 
> My fault, I tested to build the board using
> "make  st/stm32mp135f-dhcor-dhsbc.dtb"

That's what I also use most of the time, and OE does its own DT builds.
The LKP bot did find it today.

> Fixed in stm32-next by applying Marek patch. I'll maybe squash it with 
> initial patch for my PR.

Thanks !

