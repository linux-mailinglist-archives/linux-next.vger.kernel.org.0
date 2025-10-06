Return-Path: <linux-next+bounces-8569-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC94BBEC31
	for <lists+linux-next@lfdr.de>; Mon, 06 Oct 2025 19:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E36F61895A89
	for <lists+linux-next@lfdr.de>; Mon,  6 Oct 2025 17:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2556196C7C;
	Mon,  6 Oct 2025 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Mi/FXNGc"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C01E511;
	Mon,  6 Oct 2025 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759770098; cv=none; b=P1pZ3EPIPM9v0ID1gG6W6WHRO3MEvB40m/e1heOCWv52xgU9Et9ZmSd6OSOhmcwDunjWOX+v60qTv/XeT/mYN8vMvJX2ehNcIMnINWH8KWND78AkI9q9YmZ/dVH1ZGByoDi+tbJgD/brnwTscJr/o9fH75heTOkfSQu8rkag8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759770098; c=relaxed/simple;
	bh=mSGJpWVMwqmei3jnFIqacJ3yt0a9bNeXh43G34OLMZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6NZAbveUCwVBuh3NXyhzzDPlySV6kWbvl63kqDkxeQTKsfl7V+WZi6+HFAdycUCd+omCSjIEsCjf8MQrYdb9XDpCnFDDgEoiDecixeLJQ0WdfNxx2lvnZxJZkwZtAvtfzUt6HGCERdjze8qb+/u4qS/Tdv4pu5ZMbAZreSH1Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Mi/FXNGc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ibvsxNWOKhqN7prjOMCLqscrF1yMv6pMnUjk0+GRm7s=; b=Mi/FXNGclxvoNlyvHzqnjyHr4V
	3Eh3WQ9iCfh5Re4bdLClHAIi/ZW+GwFRP8t8HOzIdqchvOf5/jUsL0NQzqBNHOhXjm/f6K+eWrE1F
	zH/JhhjQqMJ0TsceYfxrWl8AWnOgrXB1WsCYOktDfTpBZZeXqwTFToswEw6r/tlK8Fs2lWjhveJEm
	3Qq2/5ZOyrYS83kd3ZJTTsrTAdXea9/xiB93aer9B6usILWh99XmDz4PYiG6PR6VczuuTQzHOJM0e
	PWSkr3I3XBOIA/z0Xa1HZvdzYXQNzvIvc6HFqJQSv/y+ND0KJmW7J06tVEH2OKbCuI7pD7Z2UDwvI
	hWWVljbg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oad-00000000Sq2-1CfD;
	Mon, 06 Oct 2025 17:01:35 +0000
Message-ID: <df364e20-9f6b-4e26-87cc-077732a9d5b4@infradead.org>
Date: Mon, 6 Oct 2025 10:01:34 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
To: Gustavo Padovan <gus@collabora.com>
Cc: Denys Fedoryshchenko <denys.f@collabora.com>,
 kernelci <kernelci@lists.linux.dev>,
 kernelci-results <kernelci-results@groups.io>,
 regressions <regressions@lists.linux.dev>,
 linux-next <linux-next@vger.kernel.org>
References: <175890594349.36.5014274970333071394@1e895cdadf47>
 <bb21b532-b68f-4c02-a9bd-7e8aa3c07258@infradead.org>
 <b10bcf92dfd2fc13ed90b4da6e9ab8a3b61ce724.camel@collabora.com>
 <19995464e11.7f75fad1483203.4516273948739211660@collabora.com>
 <bccbcccb-a3db-4b34-962c-14e79cc8bece@infradead.org>
 <199b978f4fb.49020b682270448.1218727940872425598@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <199b978f4fb.49020b682270448.1218727940872425598@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/6/25 5:22 AM, Gustavo Padovan wrote:
> 
> 
> ---- On Mon, 29 Sep 2025 12:34:02 -0300 Randy Dunlap <rdunlap@infradead.org> wrote ---
> 
>  > Hi, 
>  >  
>  > On 9/29/25 4:40 AM, Gustavo Padovan wrote: 
>  > > Hi Randy, 
>  > > 
>  > > 
>  > > ---- On Mon, 29 Sep 2025 01:15:24 -0300 Denys Fedoryshchenko <denys.f@collabora.com> wrote --- 
>  > > 
>  > >  > Hi Randy, 
>  > >  > 
>  > >  > On Sun, 2025-09-28 at 18:13 -0700, Randy Dunlap wrote: 
>  > >  > > Hi, 
>  > >  > > 
>  > >  > > On 9/26/25 9:59 AM, KernelCI bot wrote: 
>  > >  > > > 
>  > >  > > > 
>  > >  > > > 
>  > >  > > > 
>  > >  > > > Hello, 
>  > >  > > > 
>  > >  > > > New build issue found on next/master: 
>  > >  > > > 
>  > >  > > > --- 
>  > >  > > >  undefined reference to `pm_hibernation_mode_is_suspend' in 
>  > >  > > > vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) 
>  > >  > > > [logspec:kbuild,kbuild.compiler.linker_error] 
>  > >  > > > --- 
>  > >  > > > 
>  > >  > > > - dashboard: 
>  > >  > > > https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893 
>  > >  > > > - giturl: 
>  > >  > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>  > >  > > > - commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f 
>  > >  > > > - tags: next-20250926 
>  > >  > > > 
>  > >  > > > 
>  > >  > > > Log excerpt: 
>  > >  > > > ===================================================== 
>  > >  > > >   LD      .tmp_vmlinux1 
>  > >  > > > ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function 
>  > >  > > > `amdgpu_pmops_thaw': 
>  > >  > > > /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: 
>  > >  > > > undefined reference to `pm_hibernation_mode_is_suspend' 
>  > >  > > > 
>  > >  > > > ===================================================== 
>  > >  > > > 
>  > >  > > > 
>  > >  > > > # Builds where the incident occurred: 
>  > >  > > > 
>  > >  > > > ## cros://chromeos-6.6/x86_64/chromeos-amd- 
>  > >  > > > stoneyridge.flavour.config+lab-setup+x86- 
>  > >  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
>  > >  > > > (x86_64): 
>  > >  > > > - compiler: gcc-12 
>  > >  > > > - dashboard: 
>  > >  > > > https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b 
>  > >  > > > 
>  > >  > > > ## cros://chromeos-6.6/x86_64/chromeos-intel- 
>  > >  > > > pineview.flavour.config+lab-setup+x86- 
>  > >  > > > board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on 
>  > >  > > > (x86_64): 
>  > >  > > > - compiler: gcc-12 
>  > >  > > > - dashboard: 
>  > >  > > > https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e 
>  > >  > > > 
>  > >  > > 
>  > >  > > Is there a URL for the .config file that causes the 
>  > >  > > build error? 
>  > >  > Yes, 
>  > >  > https://files.kernelci.org/kbuild-gcc-12-x86-chromeos-intel-68d6bd59aabea828fddae00e/.config 
>  > > 
>  > > Out of curiosity,  have you tried to find the config in our Dashboard? We added basic information in 
>  > > the email report and then the Dashboard link take you to our comprehensive report. 
>  > > 
>  >  
>  > I did look at the Dashboard first but it seems that I overlooked the config file info. 
>  >  
>  > > 
>  > > Any feedback here? 
>  > I would rather not use the Dashboard until I need to dig deeperinto the problem. IOW, I prefer to have the config file URL 
>  > in the email report. 
> 
> Thanks for the feedback. We will work on it this week.
> 
> I created https://github.com/kernelci/dashboard/issues/1551 for following the progress.

Thanks. That proposal looks good.


