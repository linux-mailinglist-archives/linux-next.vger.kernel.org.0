Return-Path: <linux-next+bounces-6822-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE6ABA4F1
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 23:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C57A2360C
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 21:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B205022D7B3;
	Fri, 16 May 2025 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jm+CxyrE"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F81581F0;
	Fri, 16 May 2025 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747429448; cv=none; b=KBpdU5q9HGi8GsCdM0j5yfXTyQhdO1TAlTB2ghBfJ9upRm3fvOmw+BDaw9x1tTqqn0LDq2S5zRu7BCMQQLv9tBtVFWMpy4tOrXvkodX8e2GRgZuaKqFk4+cROKz3xh9yT4gMHCZp9FYn6qfce705QVtrV1kNGgL3sPoX0dmeqpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747429448; c=relaxed/simple;
	bh=pfFugCWEaP3NhgchmOd8zrRq3qvntaZY1NCJWh7lx1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFi3UCF89UKithmfpe8qANOu+zMe4Dzr8SH4fkLu1ioDJtDRYy7PNBU/ADPWx51/uWHus3vfhLgMkjITDcfpBlOx43/oKCz+wzrOosVzrs+tuyHnTDIfpLpOTyjN4T+9RedYxDGQX8EWe6SVr+P9TOasSB+ghzeCWhpSIwmARyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jm+CxyrE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WiO93ROMEx5JisucJLumxe2j6tGvTF9kF/SEZl7Lxmg=; b=jm+CxyrEYXpoQxpAxxryFfK/e2
	7Jd9K/24Wrcj4QIZxpTQULmxVy5RC9oUfL4uu5bBnJz8C7S570Ag9tBK3EqNl0XCFXvCk7a/9rJH5
	/SQGqptqbKZU6/VWhGfN3nrCr4kdTn+gFdxRAo4rVNvxAUrr4KZ7iX4oC4+ji50k7QLutgzTEJEqK
	y8GNhf2qXVjsjJxGIvcP5nSQHifvaXZYDLrjm6aE07FgSRtPQfuKAatAc7XHYy3Dj3PSiQvk4jJ6r
	c16Ht2ukUlWNES/GYJtu4+bk3Y+JwiOfOXYzwEg3yoQBb6POa4dcDoDia5HmrU16/zIWESNvFhuYH
	CXfhS6IA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uG2D0-00000000762-0cSG;
	Fri, 16 May 2025 21:03:58 +0000
Message-ID: <872eba5d-cd00-4597-abaa-8cd632a4b630@infradead.org>
Date: Fri, 16 May 2025 14:03:07 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 16
 [drivers/platform/x86/amd/hsmp/hsmp_acpi.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>
References: <20250516202417.31b13d13@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250516202417.31b13d13@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/16/25 3:24 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250515:
> 

on x86_64:

ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/hsmp_acpi.ko] undefined!

CONFIG_HWMON=m

CONFIG_AMD_HSMP=y

#
# AMD HSMP Driver
#
CONFIG_AMD_HSMP_ACPI=m
CONFIG_AMD_HSMP_PLAT=y
# end of AMD HSMP Driver



-- 
~Randy


