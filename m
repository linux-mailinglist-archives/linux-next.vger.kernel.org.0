Return-Path: <linux-next+bounces-6959-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3400AC62C8
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 09:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6830A4A4F58
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 07:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B0F244694;
	Wed, 28 May 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Rm31BU1I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-m21470.qiye.163.com (mail-m21470.qiye.163.com [117.135.214.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0285210F4B;
	Wed, 28 May 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416647; cv=none; b=NdcVxSA8D/DaQL3QIvES0v7s/mNox7y7rbyoWmLg+04Hjz/FSge1IrZZuMMcu5yfuRGAfkGWx/U2CJQXJZuak+a9OZU8pGKY4P6stE+6eBP86lTnQ87hwWDk+wXAF+aVrrOJ1NgBaewOP5edeGQhDnafKq8WFjJdDiLjqt/2qVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416647; c=relaxed/simple;
	bh=IPvRjDM80lWDHGgo28IBzcYx0Ckk1dRIKONDiTK4iSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=si05lQ8/faEMk2lOcRoapXDjvy0c46NnfR/evPT4njeHhF3JaluW5Duh4zCw6JL4b+Q+9QDH2FomCkeLMHvMsqDoaFHH7NlrjIM4zIRwGLbR3FF6beqCEhwXS8hYLzmV2xbf3x0C+rER6TR/+A8cqILqvVZFXLNGSLrIrK3ZoLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Rm31BU1I; arc=none smtp.client-ip=117.135.214.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16ad4c5b7;
	Wed, 28 May 2025 15:17:14 +0800 (GMT+08:00)
Message-ID: <64499337-fc61-42b0-8c50-7749b2036c54@rock-chips.com>
Date: Wed, 28 May 2025 15:17:13 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250528134245.13dc84aa@canb.auug.org.au>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250528134245.13dc84aa@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0aGlZNGB1DHx1KQk8aSBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
X-HM-Tid: 0a9715c09ca103a3kunmf43b205c7c0117
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NUk6PTo5DzE3HElCMUgLPwko
	DBQaCxNVSlVKTE9DT0pNTUhOS0JPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ09JNwY+
DKIM-Signature:a=rsa-sha256;
	b=Rm31BU1IBANLdwjKdweGRV23FdVzgx6FBf6ic/48VtsB/DskqVdw9vmZGiAvRMfS/Abti7vA2c4j9h2XdHRm+C6GaBFYuXUiORvNf0iEJ1ivgG2mt02/J1EkmfnT3ZULWyshmZTIUJUt/cMbsbdqMtDY35AsR6IHgccScvRVwUc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=1y9XPtE/Gokh+W8CqyQCHL4aO+4NRxKNs2KqCpdAynE=;
	h=date:mime-version:subject:message-id:from;

Hi Stephen,

On 2025/5/28 11:42, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function 'analogix_dp_probe':
> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label 'err_disable_clk' used but not defined
>   1589 |                 goto err_disable_clk;
>        |                 ^~~~
> 
> Caused by commit
> 
>    6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to clk_disable_unprepare() during probing")
> 
> I have used the drm-misc tree from next-20250527 for today.
> 

Oh, I have found the same compile error after rebasing.

I have removed the 'err_disable_clk' flag and made it return 
ERR_PTR(ret) in:
https://lore.kernel.org/all/20250310104114.2608063-7-damon.ding@rock-chips.com/

Likely a small merge conflict bug. Will patch it later. ;-)

Best regards,
Damon


