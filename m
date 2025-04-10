Return-Path: <linux-next+bounces-6201-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF61A84E3A
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 22:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 599493BCE2E
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 20:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7474A28CF63;
	Thu, 10 Apr 2025 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eNrqHXbQ"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367B228F935;
	Thu, 10 Apr 2025 20:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316965; cv=none; b=Y+meNFDMY9c9gKpJQICXPdg3Xxd6NzmFPqlfr3Dn20JWjszMNDKH4IcI8dQibU9rdD2dsOJmEVNTK4iit+SURr1+aJQnmHATsqlSAj01pIMkuYmsaSZwHbDMlwR/kmhqX3HlzxL9frc3+50SKz88MwNpuAFNlqehy5+uXethpso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316965; c=relaxed/simple;
	bh=bAPpSmXmep09QFx7T7SmLGDGLykTds7V22GP0yiKg9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPyygOGTBXsxy/tCMdBlDfqYXqkwWfgRgvxz9VigqksvWfZM6GypwYzHLbYaviYpS3wOzX0ilhSXDVlOwcF/do+uf4gBPUuuSKA5iJrGJ7eTIr2pVXhKaLuBkvpbbBrZ+5TfAjIuYCL9AVcgfyTfDXdLewjdEZtKVyTDhERfVgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eNrqHXbQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nPskVwgV7dIOuOWR2CRzYXy3W//a83XC7JObcBuOeQs=; b=eNrqHXbQHa4jzONqzh9REJsMAN
	uihg7oE8Geel9srCIiStUM4xZh+HbzFMwqBZlSbkib8SFlOh0OE3a3PEvIkz6D8oXGTX9VLWwijIY
	RHwGHIR5/v+pKah4uh84DjpYphlpEle8zPgASS7klEl6MZ+jg2lpzEH2Qd6zun6K7wSuy1xmJqnuC
	jAIUj88uIHMs37nlfYDpz9toHWe5nei++kG9WdwQVIAUq3ugZRussdKsjeMLpUjhXnvp+vdcZqoCJ
	28r9pnsVDx++Ekv64Ltk7osrX/2dnNNk8zlfzP8Phf1GFN3Z7pD6KP08hsIqCp68XD2yqnjWVmli7
	qxGfnkbg==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2yWU-00000008s10-1aqg;
	Thu, 10 Apr 2025 20:29:19 +0000
Message-ID: <5cf231e1-0bba-4595-9441-46acc5255512@infradead.org>
Date: Thu, 10 Apr 2025 13:29:14 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 10 (backlight: ktd2801)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Duje_Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>
References: <20250410151146.6a05dd21@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250410151146.6a05dd21@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/9/25 10:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250409:
> 

on x86_64, when CONFIG_GPIOLIB is not set:

WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
  Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
  Selected by [m]:
  - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]


-- 
~Randy


