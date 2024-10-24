Return-Path: <linux-next+bounces-4403-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460C9AD90F
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 03:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2421F225C9
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 01:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3492848C;
	Thu, 24 Oct 2024 01:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fGATxNfq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2072D46B8;
	Thu, 24 Oct 2024 01:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729731617; cv=none; b=ltNwbb/1bjnwOURukkLwBxy7f89/7qYG6uh4Bdtf0InK4WwvJKtQOUVw80CS82ePT6UbkIk8YFjst15BKdpZv3ixkeaw7+nNSmrZEAL0xK/h1TKkl54zTIB7bwVM4A1wr8bvveveybRaCmObl0QazqxI1pB2RE+B+sS5yY5yUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729731617; c=relaxed/simple;
	bh=pJEhqat4uhZwUywU2BDoJdUtwSbtryLXFHlSkR2Bcos=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GcP/jLzSIssFqza1asjtGD8y+7H7395E57OqZObTp4VeTHZmb1ow9/6JgI+rS9av5n/U8bU9Nl7qe7PUjCCAsBGI8AlhDtnungGgf0RnlYmGFWIUObH/qV9SUGxawWuKu9B1x8WyFaA6Tor0slGoZJ2N1fKGaAjRd1Q4fgAONTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fGATxNfq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729731610;
	bh=OV09Vabrlupv12Sz58y9rAPYoJeh++U0XC5FnA9eg6U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fGATxNfqnZG36+wGkik8lfAiHOpoRbjosCBuGUXOElKdDVD/eAH2YyZlsRSf9NSij
	 t+hskadheUA64MOVEXt2IU/HK3utKPsIlWBQizXsHcjOw+mAfTiSqGjRQ44KNbVyW8
	 r6Cgnd72mdZoxc/PaILCStN8ssORJw+nbb8lkWwR8DMTs/GGb9+J2Vlm/IU9eN/wFF
	 vu52i6GjLU5bEGBdzn6MgCf6lcoc8w/QCrIDwb7XKOjqEfaeuFggveffN/NBRiVcWC
	 xMGa7t/CZbpWHa5IkdUkyXxm/whOOkGQpvTWdoKEKYo5gObP95+64BOsRdDvbgXCb/
	 jSOBYeM1AGz8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYndQ42vbz4w2R;
	Thu, 24 Oct 2024 12:00:10 +1100 (AEDT)
Date: Thu, 24 Oct 2024 12:00:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Qu Wenruo <wqu@suse.com>, David Sterba <dsterba@suse.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20241024120010.6da373b5@canb.auug.org.au>
In-Reply-To: <20241024004729.GF31418@suse.cz>
References: <20241024085701.64263a3b@canb.auug.org.au>
	<95af7735-cb97-491c-be22-8e9759f4720f@suse.com>
	<20241024004729.GF31418@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jSmwR2DS4vAxxkiPYT8csRE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jSmwR2DS4vAxxkiPYT8csRE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 24 Oct 2024 02:47:29 +0200 David Sterba <dsterba@suse.cz> wrote:
>
> I probably missed the v2 and picked the patch with warning that I did
> not consider too serious but it seems linux-next builds with -Werrror.
> Meanwhile I've updated the for-next snapshot branch and dropped the
> patch.

All all{mod,yes}config builds enable -Werror theses days (I think).  We
really don't want to introduce any warnings to the builds.

--=20
Cheers,
Stephen Rothwell

--Sig_/jSmwR2DS4vAxxkiPYT8csRE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZnBoACgkQAVBC80lX
0GwvjAf/SlwqZmwXoP8wfmpHtTIt3+UtZmMAEixnXncPZwytleQrKrwm7FSWmxw7
zBj0VNz3Xw6G0mPlC3cWPhZdoCWtSkG246DcMhn3BjyybOHD5VUaQ9hLik/HoLco
bKbUA/f61QsHWrgWfMkHTs1E86vpIhwE+zhUTclHBOIQus783cxuYNHUDKIfaZhD
W/hqjOjauKQcstyuQKXBQa6JCZsTND/KAHWZYFiq8NkMSd0NT1FumajpLX/jvv9U
o72aJXZ7P29Oa6u6BH4V9xJwX89PiJqbvyztpfCjpxOAyjfg5KGaTJtvhFZKwKI2
Aoyu5TYp5LCv0YMA36Ln0kxO9nGd6Q==
=9GoB
-----END PGP SIGNATURE-----

--Sig_/jSmwR2DS4vAxxkiPYT8csRE--

