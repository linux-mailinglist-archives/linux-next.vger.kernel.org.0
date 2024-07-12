Return-Path: <linux-next+bounces-2976-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD692FB34
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 15:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C29EEB22A03
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 13:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8205616EBF7;
	Fri, 12 Jul 2024 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="TB5CLr4T"
X-Original-To: linux-next@vger.kernel.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1F21662EC;
	Fri, 12 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790484; cv=none; b=lrjv36tKJFdoJUjAhbss3v0c2XxMDkSbIjYFO4wBuBhBeXTBJ/6IL5xPQ97Sk/gabrQqPZs7vxj8Bej5Gi/7ijuYqOcOxcM3Ki+vFv0ocmuB98ODYLbFyHL2BEdY8mbZMFM9TKuP5TUMBsrkODTSsmdpKW99DmyP+qsvhwLb3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790484; c=relaxed/simple;
	bh=BKtYWDuEb0MSm5flvpwvbSNHeqNn4WVksGNcjFZdPKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbZ6akJQlTZCboxghDO192DOgoT/9+eZbECyg+Q9YuJ6I24ZKyqrZdnRzOB9+iAtV+WdNRdUEeuBPTuknVN9+/YjIsr9lZV24SXSND4EPSVURu63Bamk9erKrWGYgWgs0LRdDToc1g46FLhxDnkGZ3ZijL7SMCcDwVVAyBezxAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=TB5CLr4T; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 6.2.0)
 id b188ee1a26ad7b74; Fri, 12 Jul 2024 15:21:19 +0200
Received: from kreacher.localnet (unknown [195.136.19.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id DDED6A03394;
	Fri, 12 Jul 2024 15:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1720790479;
	bh=BKtYWDuEb0MSm5flvpwvbSNHeqNn4WVksGNcjFZdPKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TB5CLr4TQYE2lPGSvBM2ULQVNVKL51K7zJnZhwawpBtICucFKRT8mtoZ5dZvl09qs
	 KcofkbIB6KUbn01JkDin4qoYh5mu92kTZVQSBXvlI2oCMISMMvYK4K/Idy6BL+wAAJ
	 AySpdbfoEOjTLOLOq5kuF/HT7PvaERNoX7wZSy9WAdqmovNe3EDBL6mt4rZpiK1NJZ
	 AWNzqBdBujkHnu3srjjhMf9ASnjAfDeRpx6g7GeLFZMhQohCVO1jDnogaXqyTs2hbx
	 KRMkqV978w5QNry5lLNlF2gYkpZ58t9HKBk8sziDkj6jAhsvcleYiRpkg9+9ditFqK
	 zV1UktNSovCHQ==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Fri, 12 Jul 2024 15:21:18 +0200
Message-ID: <2748010.mvXUDI8C0e@rjwysocki.net>
In-Reply-To: <20240712114838.2af5b525@canb.auug.org.au>
References: <20240712114838.2af5b525@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 195.136.19.94
X-CLIENT-HOSTNAME: 195.136.19.94
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrfeeigdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpedvffeuiedtgfdvtddugeeujedtffetteegfeekffdvfedttddtuefhgeefvdejhfenucfkphepudelhedrudefiedrudelrdelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleehrddufeeirdduledrleegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-DCC--Metrics: v370.home.net.pl 1024; Body=3 Fuz1=3 Fuz2=3

Hi Stephen,

On Friday, July 12, 2024 3:48:38 AM CEST Stephen Rothwell wrote:
> 
> --Sig_/uDBst4ohDb48w0eZ67u3=2t
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi all,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/thermal/tegra/soctherm.c: In function 'tegra_thermctl_set_trip_temp=
> ':
> drivers/thermal/tegra/soctherm.c:592:13: error: unused variable 'ret' [-Wer=
> ror=3Dunused-variable]
>   592 |         int ret;
>       |             ^~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   b46696a4e8c4 ("thermal: trip: Pass trip pointer to .set_trip_temp() therm=
> al zone callback")
> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 12 Jul 2024 11:46:14 +1000
> Subject: [PATCH] fixup for "thermal: trip: Pass trip pointer to .set_trip_t=
> emp() thermal zone callback"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/thermal/tegra/soctherm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/socth=
> erm.c
> index 62983653ca19..d3dfc34c62c6 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -589,7 +589,6 @@ static int tegra_thermctl_set_trip_temp(struct thermal_=
> zone_device *tz,
>  	struct tegra_soctherm *ts =3D zone->ts;
>  	const struct tegra_tsensor_group *sg =3D zone->sg;
>  	struct device *dev =3D zone->dev;
> -	int ret;
> =20
>  	if (!tz)
>  		return -EINVAL;
> --=20
> 2.43.0
> 
> --=20

Sorry for adding a build issue and thanks for the patch!

This should be fixed in my linux-next branch now.

Thank you!




