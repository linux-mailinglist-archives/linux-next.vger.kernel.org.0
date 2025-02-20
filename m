Return-Path: <linux-next+bounces-5513-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595CA3D056
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 05:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03A7D177A50
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 04:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88581D5140;
	Thu, 20 Feb 2025 04:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fHN2jfFt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-m19731107.qiye.163.com (mail-m19731107.qiye.163.com [220.197.31.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44322AE74;
	Thu, 20 Feb 2025 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740024979; cv=none; b=PhaiOMhZjydhxtZBnuVSF27rg8omOoh9lwTpd1OiUzhiivxZnOaeQkkul0Kwe9Za8l1tFijIW4AgF7ZnqHTPhA01LXF5DwhOIcUSH9uzbOnHdVH/FVG9ofGS6TgiJXKR+hp89/zggWxTAdN3A3rVHAH0plWYAHU5YJ2TrEmvs9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740024979; c=relaxed/simple;
	bh=kTVEpN6+LFzOeLE8CLLajgv8R95++2NW96EUIp7cVGY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LDrFvmHFtoQGorlcg9pbsr0XroR99vPGxf2LoKMjr64I2LiAxCawthu3x6PETkmqezIPBdCOfVkPaf0BBQYwwzRV9Eakv1bUuuzy8w5Eq2ZonpjrhYIf/K8VTDDRZCMked7ZjA8aPhFFmbhLLfoYAAk5J1orvt/gyLOsSZ+/tH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fHN2jfFt; arc=none smtp.client-ip=220.197.31.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.45] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id b986b031;
	Thu, 20 Feb 2025 09:53:44 +0800 (GMT+08:00)
Message-ID: <4e07e570-25ef-4d03-b1b8-5acf8bc8bc8a@rock-chips.com>
Date: Thu, 20 Feb 2025 09:53:44 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Heiko Stuebner <heiko@sntech.de>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20250220113338.60ba2290@canb.auug.org.au>
Content-Language: en-GB
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20250220113338.60ba2290@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkkYSVYaGEgaSUNCTBkZH01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95210f95d809cckunmb986b031
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46Szo5ITIWCS0IEkoyLU4L
	AgkaCRFVSlVKTE9LS0pNT0lOSUJCVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpJTk43Bg++
DKIM-Signature:a=rsa-sha256;
	b=fHN2jfFtUOHW8HxjGan8tRKqKCIW1hgwEn91a/mKizUUx79Ikgh5RjdlmOWKu9nAeEG49sTX+keGPF/RM3hrWyKQ3aG7Wzw+BpzWWp7jaDuiUZW1fyvn9qS6p9GphAjhX0/SNqQvyoAj0tDKQvSTY0Nv9hmohFPfFLO45hRy/JY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=kz2RbdNXW8q9JlPloKdddNUyjkRikvpmhR8YLFqMJdQ=;
	h=date:mime-version:subject:message-id:from;

在 2025/2/20 8:33, Stephen Rothwell 写道:
> Hi all,
> 
> After merging the pmdomain tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_set_power_domain':
> pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smccc_1_1_get_conduit'
> 
> Caused by commit
> 
>    61eeb9678789 ("pmdomain: rockchip: Check if SMC could be handled by TA")
> 
> $ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config

It seems x86_64_defconfig did't enable  CONFIG_HAVE_ARM_SMCCC_DISCOVERY 
which apparently belongs to ARM stuff.

Selecting HAVE_ARM_SMCCC_DISCOVERY and ARM_PSCI_FW should pass the
x86_64 allmodconfig compile.

--- a/drivers/pmdomain/rockchip/Kconfig
+++ b/drivers/pmdomain/rockchip/Kconfig
@@ -5,6 +5,8 @@ config ROCKCHIP_PM_DOMAINS
         bool "Rockchip generic power domain"
         depends on PM
         select PM_GENERIC_DOMAINS
+       select ARM_PSCI_FW
+       select HAVE_ARM_SMCCC_DISCOVERY
         help
           Say y here to enable power domain support.
           In order to meet high performance and low power requirements, 
a power


> $
> 
> I have used the pmdomain tree from next-20250219 for today.
> 


