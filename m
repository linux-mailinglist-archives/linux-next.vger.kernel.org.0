Return-Path: <linux-next+bounces-7561-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40CB06B2C
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 03:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2973A1A65AAA
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 01:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEAF199935;
	Wed, 16 Jul 2025 01:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TVuCMCjR"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C647E60DCF;
	Wed, 16 Jul 2025 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752629526; cv=none; b=ck0bZ85ED9tnFwpuADNR/iXJ0BlE1vjbTgO3N+M7WNeIv8+sG76EPNBxwVYXgLY2MRE1NHAuxDuDiXyO2kLtiozclJR3GxZd8jkvte3gC+AIy012zHg4yPAkDnk1LZS2zgXiLnpckoyM8vO8yaxgk+kDtg1oJ4Znd+9ADQt1+ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752629526; c=relaxed/simple;
	bh=DtkaSWh/V2WSvJw2yY8ziRveuGLLjzaJsHT1iDfMJ4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ksmjj5efqHlSmjLy+owbVrbYToB7Jf72sHSlvQvbOBjS59ntdTj0oHcDbt2Z1+Sy9iOYptWjpf004meBXSPSwDXo+rjGk5TskTnByeuXOi7vDoYenVZzbWWPESjwnQzpOiDXhEXi/Ydj0nlVHflnK8ZqAISlQQPdTqNK73kUq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TVuCMCjR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TDFua8pqQK/GY6N6TkhZB75i9+h4C3DT06uWm+96xF0=; b=TVuCMCjRkZhsfOAHB+LWnB5C+F
	ikM2XqvXmPoFfpYzpeyN5qwBjex1ugXxBSEbqJJU0nhS2L0nlJqd8l90tMVCK/7yn4X2N9FqO/OQd
	VUafGc4h22Pbm5zFbGL0q2UaWsGUFToW7VhyRzCENt67lwh9M/Ch07ls5bHibJi5SNFFey19g6Qp/
	DpACtze4Tw0jX24yJwrgJjN/dP0gE5ZbyK1SLjK3H8BZDrO4LHQDcUrTAtYOzK/sfx++4LsdOxiZ/
	tv7wGtXrWER1cUQzLv0RRQ8byDEv+BfjNjomrO9OZTpKnuC2zo0n3ILzMDgfYAH7G1BVcVHMQonqt
	776haGVw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubr06-00000006Y7q-3RTx;
	Wed, 16 Jul 2025 01:32:02 +0000
Message-ID: <b2c54a12-480c-448a-8b90-333cb03d9c14@infradead.org>
Date: Tue, 15 Jul 2025 18:32:02 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 15 (drivers/cdx/cdx.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>
References: <20250715204504.36f41a8e@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250715204504.36f41a8e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/15/25 3:45 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250714:
> 

on x86_64, when
CONFIG_COMPILE_TEST=y
# CONFIG_PCI_MSI is not set
CONFIG_CDX_BUS=y
# CONFIG_CDX_CONTROLLER is not set
# CONFIG_GENERIC_MSI_IRQ is not set

ld: drivers/cdx/cdx.o: in function `cdx_probe':
/home/rdunlap/lnx/next/linux-next-20250715/X64/../drivers/cdx/cdx.c:314:(.text+0xc8b): undefined reference to `msi_setup_device_data'


-- 
~Randy


