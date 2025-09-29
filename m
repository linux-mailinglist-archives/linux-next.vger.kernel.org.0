Return-Path: <linux-next+bounces-8522-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD703BA9CFD
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 17:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E20997A1442
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 15:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD9214A6A;
	Mon, 29 Sep 2025 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2CXu8lLo"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF303043C6;
	Mon, 29 Sep 2025 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759160047; cv=none; b=VhVh5J3g1fnNi/N+dWPu1DzKqoO45RVPIwAeJTG2ivU3nhXl5b7Ot1RncXq4uIW1xBT1+cSb8SnRXJqauaqconDb39fTjB/mm0LF+76AGeZiayYUi0xJrknr+9pzNaFYpgZx+16zgFeLgnBRCveMjoSWFlw+xvyAh0LGIuuuPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759160047; c=relaxed/simple;
	bh=StnTyljv9j+5oxaxbAirEIYNB6Rjote6fW+a6G1rCl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4zxTlklR2zUp4PbJknzB7MfPQGxtfznasAQop0lZIGUjnn28vsopRKNQqtFO5eaqyf5DtiR/DeNrASwmL1V0t8/q7tMiHdmvYECl6uSPBgzCgNJEtT+yp4ZL8CPpy2Lu99RohSkR8dvFvPhNwE+bcbb3EAu8uxVxKDglW1ts5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2CXu8lLo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=kUvQZMIDHWUt4QGOFp00VG0DzmwrVUbXFedh5CxrfY8=; b=2CXu8lLo4qU7JHQ0vpz7nTutz9
	htdPSw5Ko0yFRzVeHqAOviM0V7+eoAlca22d9qb5kDSlnNku4cAAi4c62eAdipTskxomNGYCkebS3
	tiQNfq1JaapvbDmAPgze5rYXA4xqByABfHQHT4R/THDkLsy1EqNhYyM01omT5a7YG1d2bGVGgNrgk
	WMY/wM1e4VsHjbb9h5KM81vY9ahnyxB4Kbz6klSd7I2kFxZ93smSSprgJuwnqiQiax3g+JnzLpvzm
	JhCI9NlAy4P1XgPlceKxSnUIjvpEo/KCYatmRu3+e7vnpIpgGETC4YAFo2/sl40bVtXIiT3HQv5oG
	jRZRQkyg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ft5-00000002nZR-1pmZ;
	Mon, 29 Sep 2025 15:34:03 +0000
Message-ID: <bccbcccb-a3db-4b34-962c-14e79cc8bece@infradead.org>
Date: Mon, 29 Sep 2025 08:34:02 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
To: Gustavo Padovan <gus@collabora.com>,
 Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci <kernelci@lists.linux.dev>,
 kernelci-results <kernelci-results@groups.io>,
 regressions <regressions@lists.linux.dev>,
 linux-next <linux-next@vger.kernel.org>
References: <175890594349.36.5014274970333071394@1e895cdadf47>
 <bb21b532-b68f-4c02-a9bd-7e8aa3c07258@infradead.org>
 <b10bcf92dfd2fc13ed90b4da6e9ab8a3b61ce724.camel@collabora.com>
 <19995464e11.7f75fad1483203.4516273948739211660@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <19995464e11.7f75fad1483203.4516273948739211660@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/29/25 4:40 AM, Gustavo Padovan wrote:
> Hi Randy,
> 
> 
> ---- On Mon, 29 Sep 2025 01:15:24 -0300 Denys Fedoryshchenko <denys.f@collabora.com> wrote ---
> 
>  > Hi Randy, 
>  >  
>  > On Sun, 2025-09-28 at 18:13 -0700, Randy Dunlap wrote: 
>  > > Hi, 
>  > > 
>  > > On 9/26/25 9:59 AM, KernelCI bot wrote: 
>  > > > 
>  > > > 
>  > > > 
>  > > > 
>  > > > Hello, 
>  > > > 
>  > > > New build issue found on next/master: 
>  > > > 
>  > > > --- 
>  > > >  undefined reference to `pm_hibernation_mode_is_suspend' in 
>  > > > vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) 
>  > > > [logspec:kbuild,kbuild.compiler.linker_error] 
>  > > > --- 
>  > > > 
>  > > > - dashboard: 
>  > > > https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893 
>  > > > - giturl: 
>  > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>  > > > - commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f 
>  > > > - tags: next-20250926 
>  > > > 
>  > > > 
>  > > > Log excerpt: 
>  > > > ===================================================== 
>  > > >   LD      .tmp_vmlinux1 
>  > > > ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function 
>  > > > `amdgpu_pmops_thaw': 
>  > > > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: 
>  > > > undefined reference to `pm_hibernation_mode_is_suspend' 
>  > > > 
>  > > > ===================================================== 
>  > > > 
>  > > > 
>  > > > # Builds where the incident occurred: 
>  > > > 
>  > > > ## cros://chromeos-6.6/x86_64/chromeos-amd- 
>  > > > stoneyridge.flavour.config+lab-setup+x86- 
>  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
>  > > > (x86_64): 
>  > > > - compiler: gcc-12 
>  > > > - dashboard: 
>  > > > https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b 
>  > > > 
>  > > > ## cros://chromeos-6.6/x86_64/chromeos-intel- 
>  > > > pineview.flavour.config+lab-setup+x86- 
>  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
>  > > > (x86_64): 
>  > > > - compiler: gcc-12 
>  > > > - dashboard: 
>  > > > https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e 
>  > > > 
>  > > 
>  > > Is there a URL for the .config file that causes the 
>  > > build error? 
>  > Yes, 
>  > https://files.kernelci.org/kbuild-gcc-12-x86-chromeos-intel-68d6bd59aabea828fddae00e/.config 
>  
> Out of curiosity,  have you tried to find the config in our Dashboard? We added basic information in
> the email report and then the Dashboard link take you to our comprehensive report.
> 

I did look at the Dashboard first but it seems that I overlooked the config file info.

> 
> Any feedback here?
I would rather not use the Dashboard until I need to dig deeperinto the problem. IOW, I prefer to have the config file URL
in the email report.

Thanks.
-- 
~Randy


