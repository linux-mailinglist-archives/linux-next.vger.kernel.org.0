Return-Path: <linux-next+bounces-7723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4845B125F3
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 23:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4483188B7A6
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 21:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC1522D9F3;
	Fri, 25 Jul 2025 21:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UJCLSweH"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A392A19F420;
	Fri, 25 Jul 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753477453; cv=none; b=ETMNuVkbip7hspLKBR6NV8AEARH/FLzrHFirFR2bQT2Z4yuqZAfo5EW9VMCnu39QH0rAS3eAZP7p3N3ezD0fSSHwKc9RShEbf2I50P7t216BR3MZypYbyZux4iWGeE0oeDaSpko8YgPwQcdq4ihLpt3IUzpVJ3UJcR1SagXYIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753477453; c=relaxed/simple;
	bh=ae71SSY4k8u7fVSaq1e7V57M9dJggxOfsvFSJNAagDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4daJocpdN7V6Y7t/ZkAA6gPLYub40AlpBqIxBGLrUPfex85SuBmHx+/mtuJ+OCrD6J8Xa2CLNgkiu9PibPwA3JLhhD9ICoDzmv3fDlxy/tGdxmVq7nsbxxDE5A7ojhwLJf7zSILGGAXuuGfYBcrl7C52SSdYq+q+eti5rodhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UJCLSweH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+bXE8AhHOGf+7yevTX3HLs/Rx4czmj8r+67n/jWJR3k=; b=UJCLSweHd2bF9hdZ3DkkV+4A9e
	IoTWfF6WTz/n/vO8mmTSQz683r2RhFD61j6yfbaQTV3t9CswgXrMOfrf+6kYpNqbWBGYXz/G1QGMW
	m23LT2/KUFSkFx3Y81ana2i5uNBrrtW4p+7qj1nWVLJDgGXXJL/bUXIRlWnOzV28lsHsoMRzaktQM
	pLB3utNL4Tt7iqJn/l5LPX3wN2PFdAzT+Y/MPCYyCsf6aPTXxbdlvn1di4okUd6tgZL6A9BVMv+k3
	6G59dGwmVq5HrmWqmqUmphNQnw2OTnYNFtjjrfCQErHy3aO3qv4MM/YrLvVyPXGqqEMrQzd+FArt2
	+Y93C9hA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufPaL-0000000AhWd-1LW0;
	Fri, 25 Jul 2025 21:04:09 +0000
Message-ID: <679b2dc9-337f-4b48-8830-add309e2d3e5@infradead.org>
Date: Fri, 25 Jul 2025 14:04:08 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 25 (drivers/net/dsa/b53/b53_common.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
References: <20250725124835.53f998d0@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250725124835.53f998d0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/24/25 7:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250724:
> 

on ARCH=um SUBARCH=x86_64, when
# CONFIG_GPIOLIB is not set

../drivers/net/dsa/b53/b53_common.c: In function ‘b53_switch_reset_gpio’:
../drivers/net/dsa/b53/b53_common.c:952:9: error: implicit declaration of function ‘gpio_set_value’; did you mean ‘pte_set_val’? [-Wimplicit-function-declaration]
  952 |         gpio_set_value(gpio, 0);
      |         ^~~~~~~~~~~~~~
      |         pte_set_val
../drivers/net/dsa/b53/b53_common.c: In function ‘b53_switch_init’:
../drivers/net/dsa/b53/b53_common.c:3012:23: error: implicit declaration of function ‘devm_gpio_request_one’ [-Wimplicit-function-declaration]
 3012 |                 ret = devm_gpio_request_one(dev->dev, dev->reset_gpio,
      |                       ^~~~~~~~~~~~~~~~~~~~~
../drivers/net/dsa/b53/b53_common.c:3013:45: error: ‘GPIOF_OUT_INIT_HIGH’ undeclared (first use in this function)
 3013 |                                             GPIOF_OUT_INIT_HIGH, "robo_reset");
      |                                             ^~~~~~~~~~~~~~~~~~~
../drivers/net/dsa/b53/b53_common.c:3013:45: note: each undeclared identifier is reported only once for each function it appears in


Probably just needs "depends on GPIOLIB" or "select GPIOLIB"...

-- 
~Randy


