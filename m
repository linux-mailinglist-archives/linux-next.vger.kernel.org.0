Return-Path: <linux-next+bounces-96-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D337FAF12
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 01:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD9A281422
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 00:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75A21852;
	Tue, 28 Nov 2023 00:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ye4hHiBK"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4151219D;
	Mon, 27 Nov 2023 16:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gsZcbpBf1LxKDmbG111ig7y/VqZMhO1at8ppX4vhYp0=; b=ye4hHiBKr0Q2dsA13Sfm4eG3LZ
	x/IaPYOIdYXNsPUGzks+EwfbsDtmIOGczEgW1goFR8WWF0FV6s2U3MOFQnbScU4gdBDQ3kxrrPdIA
	kv2O4JNnkJ3CcKBiFOWz9+Pv0kZ7bAjohku3tRZcuuIS+mZeJAU4VzTabM07Cp99w6XbCfE1vg7FZ
	z7nqAZ4e4So1LFZF+T66uFYxVjngqZL7x4ixt76UIt5/8MUCKx95COOYfMG0os/bAb/S9Q7DsVla9
	IScANFtueMFiw4GRYX2u8QINXBuibtZZ2JJqyznEhO3t8bxzK1v5MQV+O3gYyG5D/mcOuyNHwRbxo
	p+1bpO/g==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r7m0r-003kap-0K;
	Tue, 28 Nov 2023 00:31:41 +0000
Message-ID: <8b44e417-e9dc-4d6f-b0ae-f9834d0624ac@infradead.org>
Date: Mon, 27 Nov 2023 16:31:39 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 27 (drivers/memory/tegra/tegra186.c)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ashish Mhetre <amhetre@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231127150547.461d8bac@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231127150547.461d8bac@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/23 20:05, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20231124:
> 

on ARCH=arm64:
when CONFIG_IOMMU_API is not set:

../drivers/memory/tegra/tegra186.c: In function 'tegra186_mc_resume':
../drivers/memory/tegra/tegra186.c:149:17: error: implicit declaration of function 'tegra186_mc_client_sid_override' [-Werror=implicit-function-declaration]
  149 |                 tegra186_mc_client_sid_override(mc, client, client->sid);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- 
~Randy

