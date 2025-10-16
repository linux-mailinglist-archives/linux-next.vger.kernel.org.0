Return-Path: <linux-next+bounces-8606-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B141BE2B4A
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 12:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB821587E1F
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 10:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8F031D73F;
	Thu, 16 Oct 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b="JOCdKZjM"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B713195F0;
	Thu, 16 Oct 2025 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608800; cv=pass; b=OJXMMNCZd1wekmcMVqoTs9/5TFj9rhaPr73fshUYZRKtcJ87E86g9ln89va5yQsxjxUS2WWNMn9cI337XfpTd2JL5tHb4Lq3/S/8J7Hr6DSZH3qT0FFxLYEQ68jL1QBm/MpVgmbbkdKk4l5X5+0khRIdKzuGYNm+jTdjzA03OOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608800; c=relaxed/simple;
	bh=UaBllWeys3yP01+T9Ndcfu+M6xTIM+j/0LMxc+1LY5s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ZABVOEI8dM3ZhuHChzbHEbABJWr4ozZucifVcc6Vu3rpGZ4T0JjR9eEcWmuvx2pzpi/X1itLQ/ihu/TcrLM9ouqBqc1KRH94gWy1CeS5isUiGWWFqLWxmF1BwFrLMP0TZrqF2U5X8YCN4DfX4Aek2RigIzLej3Eji3UNXCQqOFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=gus@collabora.com header.b=JOCdKZjM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1760608768; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UPQ+aBY94US7ij1tO9uyyLy+BbQVyKqTekj1jpsjWfL1A25b2i9Dzlis52ArtMqcmYs3EmEypYleJkX3AiMnKRmwQrde0TYuqI5haONAm1ww2sC+pXN4N5GSmwyRz33A/GrdHtxXjhwTMFDQlIg71VXHTkhvVlCJ9FoXqjVW/tA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760608768; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CVJ7y67b8YKm3o8RTHQrQS1h70ifhx7DfX3PMdznC1M=; 
	b=JZkla3npPJIjv6/21LNKCPZ/SK0vahuWZ71eWmhgz3Hbb5C1NvN89sPjaQrixJ2caU5o9+XfroTldT0mI0CmL57VRQTHmV5EEo1X36Rhocp2xWrspnmKgeQQZLct3LeRNv0y5sRsQi+egwHtPQAxkgZxgUkNqmEgKTihSKiTZFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=gus@collabora.com;
	dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760608768;
	s=zohomail; d=collabora.com; i=gus@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CVJ7y67b8YKm3o8RTHQrQS1h70ifhx7DfX3PMdznC1M=;
	b=JOCdKZjMjN79GRhasfc7d4Hr17q8Zu10Yas+F2oSIiIvC131SZx2nE3poO8VSmt1
	ebUi69gktLf6u8iMEaSmCY3QHTNPf4gUy6/BSX1PDvC0jNnjv+tOfanJN7iTZLTRQwv
	5NiOhr80cQCQdzGpOKqOquWsNJ2LF+rolZlvDZQU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1760608767219157.4044678793631; Thu, 16 Oct 2025 02:59:27 -0700 (PDT)
Date: Thu, 16 Oct 2025 06:59:27 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: "kernelci" <kernelci@lists.linux.dev>,
	"kernelci-results" <kernelci-results@groups.io>,
	=?UTF-8?Q?=22Guido_G=C3=BCnther=22?= <agx@sigxcpu.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"dri-devel" <dri-devel@lists.freedesktop.org>,
	"phone-devel" <phone-devel@vger.kernel.org>,
	"regressions" <regressions@lists.linux.dev>,
	"linux-next" <linux-next@vger.kernel.org>
Message-ID: <199ec75cce1.3f69ac7c921986.1695662047481478034@collabora.com>
In-Reply-To: <73bf512e-fe5f-420c-8d47-eccfa079af99@infradead.org>
References: <176045034384.1788.868853922191153052@15dd6324cc71> <73bf512e-fe5f-420c-8d47-eccfa079af99@infradead.org>
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `devm_backlight_device_register' in vmlinux...
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Randy,


---- On Thu, 16 Oct 2025 00:47:35 -0300 Randy Dunlap <rdunlap@infradead.org> wrote ---

 > Guido, 
 >  
 > Looks like this driver needs 
 >  
 > +    depends on BACKLIGHT_CLASS_DEVICE 
 >  
 > to fix the build. 
 >  
 > @Gus- please read comments near bottom/end. 
 >  
 >  
 > On 10/14/25 6:59 AM, KernelCI bot wrote: 
 > > 
 > > 
 > > 
 > > 
 > > Hello, 
 > > 
 > > New build issue found on next/master: 
 > > 
 > > --- 
 > >  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error] 
 > > --- 
 > > 
 > > - dashboard: https://d.kernelci.org/i/maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 
 > > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
 > > - commit HEAD:  13863a59e410cab46d26751941980dc8f088b9b3 
 > > - tags: next-20251014 
 > > 
 > > 
 > > Log excerpt: 
 > > ===================================================== 
 > >   LD      .tmp_vmlinux1 
 > > aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected! 
 > > aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected! 
 > > aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight': 
 > > /tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343: undefined reference to `devm_backlight_device_register' 
 > > 
 > > ===================================================== 
 > > 
 > > 
 > > # Builds where the incident occurred: 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-16k_pages-68ee4f14a6dc7c71db9fda21/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f14a6dc7c71db9fda21 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-64k_pages-68ee4f17a6dc7c71db9fda24/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f17a6dc7c71db9fda24 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-mainline-big_endian-68ee4f32a6dc7c71db9fda39/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f32a6dc7c71db9fda39 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-randomize-68ee4f1fa6dc7c71db9fda2a/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f1fa6dc7c71db9fda2a 
 > > 
 > > ## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-chromebook-kcidebug-68ee4f2ba6dc7c71db9fda33/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f2ba6dc7c71db9fda33 
 > > 
 > > ## defconfig+arm64-chromebook+kselftest on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-kselftest-16k_pages-68ee4f23a6dc7c71db9fda2d/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f23a6dc7c71db9fda2d 
 > > 
 > > ## defconfig+arm64-chromebook+preempt_rt on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-preempt_rt_chromebook-68ee4f3aa6dc7c71db9fda3f/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f3aa6dc7c71db9fda3f 
 > > 
 > > 
 > > #kernelci issue maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 
 > > 
 > > Reported-by: kernelci.org bot <bot@kernelci.org> 
 > > 
 > > -- 
 > > This is an experimental report format. Please send feedback in! 
 > > Talk to us at kernelci@lists.linux.dev 
 > > 
 > > Made with love by the KernelCI team - https://kernelci.org 
 > > 
 >  
 > Gus, the CI reporter needs to learn how to do a few things because developers 
 > (other than me ?) don't scrounge mailing lists to look for problems. 

Absolutely. Our goal is to automate as many steps as possible!
 
 > a. find the commit that caused the problem (or the email series) 
 >  
 > b. send the report (Cc:) to whoever wrote the patch and to the 
 > appropriate mailing list. 
 >  
 > I expect that b. is easier than a., so do it first. 

b. is easier that a. yes, but I don't think we can do it first because we
need to figure the patch first. Essentially, you are asking us for
build bisections. Something that is already on our roadmap, but
we didn't had the time to tackle yet, but should come to it in the
coming months.

 >  
 > And I'm sure that I have missed a thing or two that could be 
 > added as well. 

Please keep the feedback coming!

Best,

- Gus


