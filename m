Return-Path: <linux-next+bounces-7495-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1DB0265A
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 23:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32DEE1C47359
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 21:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB17E21A453;
	Fri, 11 Jul 2025 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mmgCobXk"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26931C84A1;
	Fri, 11 Jul 2025 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752269119; cv=none; b=MRO2p3TjhdziIoj6Bp5phjO1lf4aIrVNCBFhIcYmKDcsaHlssGFZ4gSY0UD7JdNJhDco/Zxvk8UO8wgDwriiF8h52fdSfWsO7/EP41mX2aPi9+7ACvIWqkgtz3YqNt8EmdX6VM+qDxOYNo/XDfLROJNgpyDRHzWnFXsaxuI5GM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752269119; c=relaxed/simple;
	bh=thzGURBJQWzPR/TzUtTzWgwVBKonSMTlH0OD9iatp/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PId9DDd5N2VDd8mOmlHMOah4s3hkoiAJe99nQ3ry0zGFlWKSYlMd3BObxCWZ+unphkxPKcsbyrvBIhVY5t7MgyxjXpVlM77Rby05u34u/MIRNa/PV/OKyB8MEIiUH3uj2utAPjprC9Qx0udLu4SsR3aUZ8zCA5ARchq/ugQLPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mmgCobXk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=/5TCvZxyJm0mNelQph6qDoiq19mUElNh/nhMyYL3NcM=; b=mmgCobXk62qXUedyHlRaKKHsfu
	dxY/en13Wrp40RNHd5mCdTFS8v83JPZ8xM4Z7d1lETzUCRN7x2Cee4HcM1q/0NckNDbXZHYUI68nh
	haeg6QB3v78EWxvRxwkH/KtqIKAHqKTKMsKhroLkCoYFVSwKUk/bgyk5kZePcxDKK/QtK9TpCv9M1
	trxBUa3nUZcENDLToL16P0p8SwUi20SzBjX7CFYKcXmlP0kP4zIvc7aAHjMge2QZEkvxw+jJmEa/Y
	SuFDt+KdplQB5ihBuuAd2d+Gm2yu6RF49KxjCOEACTihphZFINbm+f0pssmvK3CSbJLiYJczEVzxk
	jCkcj25w==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLF3-0000000ET0H-3jI1;
	Fri, 11 Jul 2025 21:25:14 +0000
Message-ID: <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
Date: Fri, 11 Jul 2025 14:25:10 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 11
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Samuel Zhang <guoqing.zhang@amd.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20250711191014.12a64210@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250711191014.12a64210@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250710:
> 

on x86_64, when
# CONFIG_SUSPEND is not set
# CONFIG_HIBERNATION is not set
# CONFIG_PM is not set

ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

caused by commit
530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hibernation")

Rafael, is a stub appropriate for this case?

-- 
~Randy


