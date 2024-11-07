Return-Path: <linux-next+bounces-4680-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643B9C095C
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23DBDB24DCC
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C755921500B;
	Thu,  7 Nov 2024 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="pRnilHBQ"
X-Original-To: linux-next@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE43A212181;
	Thu,  7 Nov 2024 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991183; cv=none; b=ZByB5AN3e4bcT6VreLajuQkxdjKmYAFSPB7FMNWQ0R27rgF38gWmdVFh79cQCDl06w0G55hNVWcCEbwVRBIDwcHYYc5yxei3QZOZfE5CIW+LwIqNVuGNuIirQ+4cBWiKQT3ADlzRPsCuHjjXnU3O00MSt3+Sh4EVUl8ZjzcTyCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991183; c=relaxed/simple;
	bh=83E/dXa4P42+y0SvJfMAESOqUaAmNkaaZIy+HaJhrhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvG4E4rFa8nR+GhmM5nApkufMwaVTjUe2zfk9ZuwPIZe0a3PJJYUo7jIkrldPtxTTT5BakTsRyrrCZH9xLOU4HXSfA7RAUMmhj/BuJ0xawI5dxMZrJoyWRou00cpTCNk0pKDDXs/m0s3eOSkm8MM/QlrGtStwxY1vy5H1PlLjXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=pRnilHBQ; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 8049640A06; Thu,  7 Nov 2024 15:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 8049640A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730989537;
	bh=83E/dXa4P42+y0SvJfMAESOqUaAmNkaaZIy+HaJhrhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRnilHBQt0iyzl64H6q58P2ph6P40VDVnyMBQJBtX47Z2nV6CGcnhWEbd2QJobjL5
	 yi3UDdQHKDRgP0/rm/f/eTcOmQFV9d+YPTqt6fLzlFzs+/HPUfb4NhbFKsw2O0sLt1
	 eRU7QH7//ZBfWPgJd87ndB83anmTaGYqppefbnTk=
Date: Thu, 7 Nov 2024 15:25:37 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Wim Van Sebroeck <wim@iguana.be>,
	Byoungtae Cho <bt.cho@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sunyeal Hong <sunyeal.hong@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>
Subject: Re: linux-next: manual merge of the watchdog tree with the
 samsung-krzk tree
Message-ID: <20241107142537.GA5765@www.linux-watchdog.org>
References: <20241107165933.3e8b5af5@canb.auug.org.au>
 <a0e3d45f-d982-4961-9945-3c81c0380806@kernel.org>
 <20241107103708.GB4818@www.linux-watchdog.org>
 <e56525c4-0e71-4c5d-9af2-b697e6b86d61@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e56525c4-0e71-4c5d-9af2-b697e6b86d61@roeck-us.net>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Guenter,

> On 11/7/24 02:37, Wim Van Sebroeck wrote:
> >Hi Krzysztof,
> >
> >>On 07/11/2024 06:59, Stephen Rothwell wrote:
> >>>Hi all,
> >>>
> >>>Today's linux-next merge of the watchdog tree got a conflict in:
> >>>
> >>>   arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> >>>
> >>>between commit:
> >>>
> >>>   ef1c2a54cbc7 ("arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes")
> >>>
> >>>from the samsung-krzk tree and commit:
> >>>
> >>>   3595a523d043 ("arm64: dts: exynosautov920: add watchdog DT node")
> >>
> >>The main problem is above patch should have never been taken to watchdog
> >>tree. I never agreed on that. I never acked it. It is against SoC
> >>policies which are always requesting entire DTS to go through SoC tree.
> >>
> >>Please drop the patch from watchdog. Or revert it.
> >>
> >>Best regards,
> >>Krzysztof
> >>
> >
> >See my other e-mail. Since the 3 patches were about adding a new watchdog driver, I indeed took them in.
> >This was reverted and I can only presume that you will take the 3 patches and do the necessary via the SoC tree.
> >
> 
> I think the idea was that the watchdog tree would take the driver and
> its devicetree property description, and the SoC tree would take the
> actual devicetree changes. At least that is what I do in hwmon.

That's how it is now.

Kind regards,
Wim.


