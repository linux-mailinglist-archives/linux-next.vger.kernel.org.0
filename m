Return-Path: <linux-next+bounces-6578-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E641AAE690
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 18:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B71CB261B0
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 16:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796F7215197;
	Wed,  7 May 2025 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eIwKjo5G"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2681FCF7C;
	Wed,  7 May 2025 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634867; cv=none; b=sAtnozywmExrmw1O1qExwt6Hzt1FjKX45tMNPRr0Us0nw6UwnhN167H3RubC5TfXBAKu9Nc4zhjp8IeHALJvNYQ3wzj/Ben1uUkvbX9HRgl4r8VRtpPJODHOWPIqaOSyRasbUMuFU/4LaXMMdwasygKcRjxn1Tzt+kKhPOLy9Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634867; c=relaxed/simple;
	bh=qZCTSwmWV0V1I5MtIov4eaLV/mjCgSyDYedtA///JuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9Xg2wyGROYXUb5NTSI38nZV9/IBHnlDOru+gyeLFEmufwwd4WKXcj5cfCJFSN3is3fj8Y1Hp8syHcrfAOnChepGizjKy1l3BB6PyeQtfsrNTi+8U+J43cEXHgCJ2wE7a5/vTbBMFEfVN8f8of4R4U7eII1F3BrIJlRgnpKZf9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eIwKjo5G; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LmwDEjP4iySK9aNmh12Bk+wLOIYL55EEhI1jVVnNXfg=; b=eIwKjo5GJ3reo9si4mjPY15B/c
	2pVLeuYzqEF4Q9i+HSPaEM8F/ec1K3vkNCLClx/IAPk5RCj6RBL9St6V8C81p4p9KldiqwJTeyh0O
	qmrzT9j7wPmd0EqD648Fukcb5T89jpj/AxXp/UvWmg9sx3WwYfCx9a5CoBm7282TYa5IaHs+TqlpR
	bcuwTKVvINErv5pLI6j4RGPhr+p9rpiLdIrftjEh5u3+Mj/XlnFDT7zmjALPQtHC+kroE21zWTinC
	SA1S1+nkSvWnKqU8DoogSLI+vgCj1KQfJtU92wfUmnNOfJeLTQ3bGAx6QME2ecQz5XNmZSTEzFc4m
	VsSzmkQQ==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uChW0-0000000FsXX-25Ie;
	Wed, 07 May 2025 16:21:00 +0000
Message-ID: <dd75d8e7-5d28-4d4f-890e-a61afec75858@infradead.org>
Date: Wed, 7 May 2025 09:20:57 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 7 (drivers/pinctrl/: PINCTRL_AT91)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250507172858.5b7d087c@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250507172858.5b7d087c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/25 12:28 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250506:
> 

on x86_64:
# CONFIG_OF is not set
CONFIG_COMPILE_TEST=y

WARNING: unmet direct dependencies detected for OF_GPIO
  Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - PINCTRL_AT91 [=y] && PINCTRL [=y] && (OF [=n] && ARCH_AT91 || COMPILE_TEST [=y])

-- 
~Randy


