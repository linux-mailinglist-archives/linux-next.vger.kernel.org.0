Return-Path: <linux-next+bounces-8545-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92968BB5074
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 21:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D318420652
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 19:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C98E255F3F;
	Thu,  2 Oct 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="QZCDDL7D"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE02874FE
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434131; cv=none; b=ajLb8ycGcKy7/zLs+qSbXhfcQkRDkAkmk2OviyLprsPyoAXz9w2gBJCUB7Bl/QHzYrZn2WiqgBdLKREkDDU+qjiTIANu/UFyUoQCks4LSaAgLElzN3aHfMpnsWwCFYAkKZKYa6/B+0gRMLFDIb0SnjjxzaCXx1tWbHc3LMcD/Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434131; c=relaxed/simple;
	bh=iu1hCsRw6g2gPVkh6JEJookkTUm0WQRv3DzenOcgZHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoJkOPSacyC/s/NepQCkgtb8oWJ9WrLK7sZmtf9XWgr7SRF2r33P4BTqa1YylCLKBlGlrtYLoLYG2cFXDAzCtjrnkBQTpwceYDEdfG05rw+tlUELRngrqxQsgCWZ0Tcz8yEyJB3d9ngGIeZBTIm8HHZ6vnrn/QKWfmBb4lqdk44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=QZCDDL7D; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759434120; x=1760038920; i=deller@gmx.de;
	bh=1198fds/KfzBQO7ziv+0O4F1NH1OxVW3gDuceEkSVLU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QZCDDL7DmbkqvQ9B2hg9wqkcjCxKZtZDSoZXNke2qPBN4SfZTEbw99ISN0Vawl+v
	 60WlyXtcCSV8wWBGmK4aSJTbb/DzZ1aqe48zS7u/P25ouLFufk3FcwDYZfqtNByFg
	 uz4nj1GiEUDmMqz4OTrcgZ4iORHAi4S537ySy/2n0X4ikTxBaiSyDUnFsXkurxeIM
	 7JnKd6bZpXhbx9jpT1nupmqm0KXI+itPgSKyu+5VVlOs8xDFy+Cn8CftCSSLejhgB
	 deH7u6rW4sDf19CryP8Zd9TOG4DEaRHX3PyFWEXy4Kmreibsd2GZyNE7Q6csnjUTK
	 U6BwjQj6prfkPjn8ZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.64]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel81-1uUEt83gjF-00qX9w; Thu, 02
 Oct 2025 21:42:00 +0200
Message-ID: <a8e320dd-37de-4738-bd6b-74a6884dec74@gmx.de>
Date: Thu, 2 Oct 2025 21:41:58 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the hyperv tree with the fbdev tree
To: Mark Brown <broonie@kernel.org>, Wei Liu <wei.liu@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mukesh Rathor <mrathor@linux.microsoft.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>
References: <aN6k79cY8mKSrKQq@sirena.org.uk>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <aN6k79cY8mKSrKQq@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qgXjtOP0HwdQXmwPNHFMW2FQVkr8B/J2F6rJtWAupaE0qsxWQ6K
 cwRdbaNc2wq3uLHzy4MF+tTaS038rgkA8UIHZp3pBvDoH8W+pugepJCLWjlqFeT9Pb4vtJq
 ZE1UIxY43oAnoE6TefMr6MyrXT6bKijWbGg8wICVR5LmBVaGWHqrpwJr2hWreHNGPIQ8oyx
 OvLtOC/4peDp1XqBRlfTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oiZ1KLYPAN8=;lIS2gd/7oJLrqxuG8lJdUBvL2I3
 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

On 10/2/25 18:14, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the hyperv tree got a conflict in:
>=20
>    drivers/video/fbdev/Kconfig
>=20
> between commit:
>=20
>    9e84636785c5e ("fbdev: hyperv_fb: Deprecate this in favor of Hyper-V =
DRM driver")
>=20
> from the fbdev tree and commit:
>=20
>    94b04355e6397 ("Drivers: hv: Add CONFIG_HYPERV_VMBUS option")
>=20
> from the hyperv tree.


Wei, I have those two patches in my tree:
     MAINTAINERS: Mark hyperv_fb driver obsolete
     fbdev: hyperv_fb: Deprecate this in favor of Hyper-V DRM driver

Please let me know if I should drop those.
I'm fine if you carry both (or any) in your tree.

Helge



> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/video/fbdev/Kconfig
> index a7500251f41ac,72c63eaeb983a..0000000000000
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@@ -1771,8 -1773,8 +1771,8 @@@ config FB_BROADSHEE
>    	  a bridge adapter.
>   =20
>    config FB_HYPERV
>   -	tristate "Microsoft Hyper-V Synthetic Video support"
>   +	tristate "Microsoft Hyper-V Synthetic Video support (DEPRECATED)"
> - 	depends on FB && HYPERV
> + 	depends on FB && HYPERV_VMBUS
>    	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
>    	select FB_IOMEM_HELPERS_DEFERRED
>    	help


