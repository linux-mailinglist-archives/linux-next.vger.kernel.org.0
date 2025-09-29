Return-Path: <linux-next+bounces-8523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C836BAAACB
	for <lists+linux-next@lfdr.de>; Tue, 30 Sep 2025 00:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38C0616B76A
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 22:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E0924A067;
	Mon, 29 Sep 2025 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NPS9oPnA"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA3222565;
	Mon, 29 Sep 2025 21:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759183197; cv=none; b=eQpbgUQuhwLeJhL3jYmVJf8zHcjzMkehKUUiFECg3U1/5ZkblZGhO9rtrT2MSH7kuMWPOge6lQzeMgsU/ADPskSYtJKh63xUOY1Ds4Lxu3L4DImLwvItJ2VMpbYssO2DF0oWKKS/R6LQMpyR97lLUSQcBtJNRXJl0DCbpmoMHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759183197; c=relaxed/simple;
	bh=+/4HGRwnNVE1ZRu+p40s44Xu6d7hAsh47MEU1fT3Oe8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KRdojPiUbJ35q/kMxPjOro5s8eGAG5+pXx/Zcuxhy3liioB+JGCw3xV0R2W7lnovjtBmwY7TClII4I0VGxIk3Lt9D5xKpAXH5corK625YGSEAuHt04rQ0OR4ER0J3mweNEa3D5DbXtZdq51kVK6J5fI7uzhOy/ARdHfnigZ41R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NPS9oPnA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=M7Jt5u72EOJEG1SQfBKH5N+IchcUPRfewAtEpIZMEBU=; b=NPS9oPnAmdIad/triTi6Nta35I
	09ULMRtKioPAwg7JMkSWRVnQ3HxepfVK9Z5+81MDlWfm2TAYczUnkncI53Fv8MhnSZxalxpo4XfKJ
	jcK+odXMeU4rpuQclXqHhLDJKWZW6D3SmofEmDvy98fi+PWpofDbgs/Gse6X/jCxglTBfIs31HQJe
	oqISDCUf4JsPs0cJIeU/NPxJTprFkzG1EKxRqXjTPT84E1Xuwx65K9t1jiYNHESfTYVqN/8ayjQqu
	SeM4LCQugcST5o7XJHncM7e9b8o3x5okSAtI6Un4iClsCEjSsJtYkUMBlOZUU09G39SELf2kOeZYC
	gzN1hDrw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3LuT-00000003WyR-0TMA;
	Mon, 29 Sep 2025 21:59:53 +0000
Message-ID: <ad97d7c2-8f99-42b0-b6e9-4685bcd62eb1@infradead.org>
Date: Mon, 29 Sep 2025 14:59:52 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
From: Randy Dunlap <rdunlap@infradead.org>
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
 <bccbcccb-a3db-4b34-962c-14e79cc8bece@infradead.org>
Content-Language: en-US
In-Reply-To: <bccbcccb-a3db-4b34-962c-14e79cc8bece@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/29/25 8:34 AM, Randy Dunlap wrote:
> Hi,
> 
> On 9/29/25 4:40 AM, Gustavo Padovan wrote:
>> Hi Randy,
>>
>>
>> ---- On Mon, 29 Sep 2025 01:15:24 -0300 Denys Fedoryshchenko <denys.f@collabora.com> wrote ---
>>
>>  > Hi Randy, 
>>  >  
>>  > On Sun, 2025-09-28 at 18:13 -0700, Randy Dunlap wrote: 
>>  > > Hi, 
>>  > > 
>>  > > On 9/26/25 9:59 AM, KernelCI bot wrote: 
>>  > > > 
>>  > > > 
>>  > > > 
>>  > > > 
>>  > > > Hello, 
>>  > > > 
>>  > > > New build issue found on next/master: 
>>  > > > 
>>  > > > --- 
>>  > > >  undefined reference to `pm_hibernation_mode_is_suspend' in 
>>  > > > vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) 
>>  > > > [logspec:kbuild,kbuild.compiler.linker_error] 
>>  > > > --- 
>>  > > > 
>>  > > > - dashboard: 
>>  > > > https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893 
>>  > > > - giturl: 
>>  > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>>  > > > - commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f 
>>  > > > - tags: next-20250926 
>>  > > > 
>>  > > > 
>>  > > > Log excerpt: 
>>  > > > ===================================================== 
>>  > > >   LD      .tmp_vmlinux1 
>>  > > > ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function 
>>  > > > `amdgpu_pmops_thaw': 
>>  > > > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: 
>>  > > > undefined reference to `pm_hibernation_mode_is_suspend' 
>>  > > > 
>>  > > > ===================================================== 
>>  > > > 
>>  > > > 
>>  > > > # Builds where the incident occurred: 
>>  > > > 
>>  > > > ## cros://chromeos-6.6/x86_64/chromeos-amd- 
>>  > > > stoneyridge.flavour.config+lab-setup+x86- 
>>  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
>>  > > > (x86_64): 
>>  > > > - compiler: gcc-12 
>>  > > > - dashboard: 
>>  > > > https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b 
>>  > > > 
>>  > > > ## cros://chromeos-6.6/x86_64/chromeos-intel- 
>>  > > > pineview.flavour.config+lab-setup+x86- 
>>  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
>>  > > > (x86_64): 
>>  > > > - compiler: gcc-12 
>>  > > > - dashboard: 
>>  > > > https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e 
>>  > > > 
>>  > > 
>>  > > Is there a URL for the .config file that causes the 
>>  > > build error? 
>>  > Yes, 
>>  > https://files.kernelci.org/kbuild-gcc-12-x86-chromeos-intel-68d6bd59aabea828fddae00e/.config 
>>  
>> Out of curiosity,  have you tried to find the config in our Dashboard? We added basic information in
>> the email report and then the Dashboard link take you to our comprehensive report.
>>
> 
> I did look at the Dashboard first but it seems that I overlooked the config file info.
> 

Oh, I see. There is no kernel config file entry on the first dashboard link.
That's the only place that I looked.

>>
>> Any feedback here?
> I would rather not use the Dashboard until I need to dig deeper into the problem. IOW, I prefer to have the config file URL
> in the email report.
> 
> Thanks.

-- 
~Randy


