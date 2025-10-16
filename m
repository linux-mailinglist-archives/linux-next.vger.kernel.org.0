Return-Path: <linux-next+bounces-8604-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D8BE1631
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 05:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BD1A4E3EBE
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 03:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BC03B7A8;
	Thu, 16 Oct 2025 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dl4ikj7Q"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4896B79EA;
	Thu, 16 Oct 2025 03:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760586459; cv=none; b=D8MG9palBer94DgIm+24FBtNIk8ndy/PVN6hjxzldfTJYuMsIAm7VdJQvmREw+Kb6X87xf9YRENyXz+x/T9F4d4W/5ccp7dBbHKwIqtZfM6VCP4yzWJWORR+lZgh3wFUG8iitsy6DDc5s1Qlcf7MlUZFGoy1lQJXQAZi51BOM7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760586459; c=relaxed/simple;
	bh=fDVMB66xBJBVR45tXuzzDYoE49mTuxeqU5TwkZr13JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzJ0vf2t51tNslo0B7+mhdVXLcKNLkv1i2aPQ+YasoPi45+0XIZE0gCm+Fb/Ot1jfR5ZR/f7N5+HD+zLsB6tLPpVAqCPd7wFXYvVXlYlvZ8y7pTh9ZfswRLls1VLI6JGPoHb9hv6LH1U/ExP6dITBoqal5BTCQeHnhj8PfdE8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Dl4ikj7Q; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=VYnOzVAo189qACLxZPi2fkIHZ9ILF4coMgi0fOVPQqA=; b=Dl4ikj7Q+qUO9+evLrU25F4nYq
	zbPGlpmXxYEIzp+siu+wnA3OAUQwuQrhCg4uqOjfDrXUqI4BVyFT04YUEHlIGvC/eQECNOgeJOPss
	qO5aJt/wmEn4PqO61XnsVVyLdu36FHQXgsqEHdUfCbR+b5KEKgZVmAe5VXsTuwPoySMZ4m/w64jIC
	9KqSxZEkk7aA9Le5pPzKJF259/yJfZhVoDNQ6z+vVkc/IlRaHAOErOXc80YV1LTmfwV2VBEGFxBJH
	Je2shJLuPDBmqWOVPtFQd1Ib3j4w49+alBu84t4HfrOkut5b676BcYf6wxqAEiCgaEjQKUhjgGrDC
	u6xXcEmw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Exj-00000003NpN-3BbF;
	Thu, 16 Oct 2025 03:47:35 +0000
Message-ID: <73bf512e-fe5f-420c-8d47-eccfa079af99@infradead.org>
Date: Wed, 15 Oct 2025 20:47:35 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `devm_backlight_device_register' in vmlinux...
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <176045034384.1788.868853922191153052@15dd6324cc71>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <176045034384.1788.868853922191153052@15dd6324cc71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Guido,

Looks like this driver needs

+	depends on BACKLIGHT_CLASS_DEVICE

to fix the build.

@Gus- please read comments near bottom/end.


On 10/14/25 6:59 AM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  13863a59e410cab46d26751941980dc8f088b9b3
> - tags: next-20251014
> 
> 
> Log excerpt:
> =====================================================
>   LD      .tmp_vmlinux1
> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
> aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight':
> /tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343: undefined reference to `devm_backlight_device_register'
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm64-16k_pages-68ee4f14a6dc7c71db9fda21/.config
> - dashboard: https://d.kernelci.org/build/maestro:68ee4f14a6dc7c71db9fda21
> 
> ## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm64-64k_pages-68ee4f17a6dc7c71db9fda24/.config
> - dashboard: https://d.kernelci.org/build/maestro:68ee4f17a6dc7c71db9fda24
> 
> ## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm64-mainline-big_endian-68ee4f32a6dc7c71db9fda39/.config
> - dashboard: https://d.kernelci.org/build/maestro:68ee4f32a6dc7c71db9fda39
> 
> ## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm64-randomize-68ee4f1fa6dc7c71db9fda2a/.config
> - dashboard: https://d.kernelci.org/build/maestro:68ee4f1fa6dc7c71db9fda2a
> 
> ## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm64-chromebook-kcidebug-68ee4f2ba6dc7c71db9fda33/.config
> - dashboard: https://d.kernelci.org/build/maestro:68ee4f2ba6dc7c71db9fda33
> 
> ## defconfig+arm64-chromebook+kselftest on (arm64):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm64-kselftest-16k_pages-68ee4f23a6dc7c71db9fda2d/.config
> - dashboard: https://d.kernelci.org/build/maestro:68ee4f23a6dc7c71db9fda2d
> 
> ## defconfig+arm64-chromebook+preempt_rt on (arm64):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm64-preempt_rt_chromebook-68ee4f3aa6dc7c71db9fda3f/.config
> - dashboard: https://d.kernelci.org/build/maestro:68ee4f3aa6dc7c71db9fda3f
> 
> 
> #kernelci issue maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

Gus, the CI reporter needs to learn how to do a few things because developers
(other than me ?) don't scrounge mailing lists to look for problems.

a. find the commit that caused the problem (or the email series)

b. send the report (Cc:) to whoever wrote the patch and to the
appropriate mailing list.

I expect that b. is easier than a., so do it first.

And I'm sure that I have missed a thing or two that could be
added as well.

Thanks.

-- 
~Randy


