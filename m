Return-Path: <linux-next+bounces-7420-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B61AFDF73
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 07:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1B75841C3
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 05:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED21426AAB7;
	Wed,  9 Jul 2025 05:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="keR0H+5c"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7403326AAAA;
	Wed,  9 Jul 2025 05:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752039884; cv=none; b=nhxvdVQQ4nNZtJNREpdvVuTol0JWl+G1TZA+c3t+qHbZagFRujXpFTLG0y2eywpwuaEpmf2S+xew/0MmRM2psFEorPJpI8qSNfbZqawHpUC5vtH9rBaujKiSXPtvtxgMEoBac3J0h1W03F2w349w2vlO3ZurcQw6Vq7jeXaCUaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752039884; c=relaxed/simple;
	bh=4omRO7z9xWFJ75IPqg8p4AZa1FkpJl2QuqTNMWA/NZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSTx07McGWpCCF0zoSxhRpJALlLnQo/XnaCWCJ/vDQEFLOVxC+r5OebaCMXSgnvHIgkU1iGTt4gRx6rUroaZEQxzHXgHQ2wy0Ql4VfCeMCF/11FMoaHnXjM+3DKcFjGWxP9zpP56O0mHC9N+3ntQRK5y9n2Lun2S0f94ITojmD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=keR0H+5c; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=cIKsTqjXQuhd2J8ioLfsqPXzRMlWcw2M/HilT51p21s=; b=keR0H+5csSZTNATbEVkmBGfIYZ
	ebR0H6JAWRvsTmJjPEqJ1WCoYR+31v/Yjv3h0dkqTJNG69Hw7ZRP2gmicM5SyegrceWsQRgM5OCnU
	FZshn2n2Jiw93Dn5Gmwi9026erIUHMBN0IRK5Ee/hkW6jS8GmW1xZtL3Zj2zWx76YMGMzDDdst3QO
	grIts8NaLfCa5r0N03S4aJEbVEh8SqdEQ5wD0vCgWOwUrCGnxRMlrf6ux6Z1hTM41hi2epuTNMvLS
	dBUiApnxJJDmC01D2qefm/c4A5VUemnIVNvudpPQfO20cpED4IGcVNYxstSkekPCcSczAc/Aufyqj
	o2jo5KGg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNbj-00000002eto-1aJe;
	Wed, 09 Jul 2025 05:44:39 +0000
Message-ID: <1d383c61-6493-44a9-ab74-3459e7d37f06@infradead.org>
Date: Tue, 8 Jul 2025 22:44:35 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/doc: Fix grammar for "Task information"
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <20250704190724.1159416-3-andrealmeid@igalia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250704190724.1159416-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/4/25 12:07 PM, André Almeida wrote:
> Remove the repetitive wording at the end of "Task information" section.
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

