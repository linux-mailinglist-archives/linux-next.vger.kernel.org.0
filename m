Return-Path: <linux-next+bounces-8803-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62BC2E62D
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 00:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0E93A95FB
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 23:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543082FDC27;
	Mon,  3 Nov 2025 23:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="l8xhgtgL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C91279DAE;
	Mon,  3 Nov 2025 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762211533; cv=none; b=EOcy9a6s9t8lnr8w0pVqej7f/NyepdyR2xOlllQKSlwcctNtWidD0vC3hWxgZsDsw58jcuFnAlHWuN/JNB5nnAS9OpQLwwU8PFVqFxT4ERt9/3rEXoAxa0aTr8eTOGjBLsHXQWLfOpWt20dU9ukR4O+Kf2S1NKC6yYjxt1pxYsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762211533; c=relaxed/simple;
	bh=rPPQ1+COE5EsbOp/m7/SyCPyrEzG+iuBBatmCgPvayQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKILSAbBIQojnlieDzwNsZYMEHbwNpbBq/EI3pKbuUvONzDGcdgVFF7ZN7uq5n3JcPSgl8kjn9fkCQWudgQnMZLmtf9zHMA3w6vGqGbtv1oecP3B4WjWQDUFR1MAN027uKyworsXJ+BifhXJGXZBMDkbLEgMT+J6R1tKdJg61kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=l8xhgtgL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762211521;
	bh=XNRomfW0zgB/0q6mq82N3Pb1lEyE73NfoDam92XZBJw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l8xhgtgLf/mSn/0cjZz9ESGrXdbbtl5Cgg7E5NZpDYcC47R+dg5klF57Au5twqOms
	 p4+PNg4G8R9r9bqOL0EQnGnggzSJkAwqrVKDVWDXnI3M7M7mHIOchoo8XljOcEzEWT
	 LNUwILCu0zL8/KedfOFiDmhmDq0ZiHii8HpBnUgu/RLXSHJ4mx9/PleOvG6FUikTKE
	 6ZlTMJuCr4Z5Q4Nusiljk+tSjfypxNPPJcUQYTGfug0VhSN5zcjSv7FPOarTVKAi0C
	 kLRDAD3K5m9XqiZ3siqZcbCU5SqCbwBgulljEUa30B2slCZXv9/uEBmhESwcW7/Jw9
	 xRE7v4STOjOOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0nR36VqKz4w2S;
	Tue, 04 Nov 2025 10:11:59 +1100 (AEDT)
Date: Tue, 4 Nov 2025 10:11:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20251104101158.1cc9abcd@canb.auug.org.au>
In-Reply-To: <b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
References: <20251103112418.031b3f8c@canb.auug.org.au>
	<b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YnC1+DebVg=JQxovUe.5+3v";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YnC1+DebVg=JQxovUe.5+3v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 03 Nov 2025 11:26:01 +0200 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
And now this:

drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_setup_vram':
drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:17: error: implicit declaration =
of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declarat=
ion]
   80 |                 drm_err(dev, "Failed to allocate mmio\n");
      |                 ^~~~~~~
      |                 pr_err
drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_vmbus_probe':
drivers/gpu/drm/hyperv/hyperv_drm_drv.c:140:17: error: implicit declaration=
 of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-decl=
aration]
  140 |                 drm_warn(dev, "Failed to update vram location.\n");
      |                 ^~~~~~~~
      |                 dev_warn
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_plane_atom=
ic_check':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:161:17: error: implicit declara=
tion of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-dec=
laration]
  161 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%=
d (pitch %d) greater than %ld\n",
      |                 ^~~~~~~
      |                 pr_err

I have used the drm-misc tree from next-20251031 again.
--=20
Cheers,
Stephen Rothwell

--Sig_/YnC1+DebVg=JQxovUe.5+3v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkJNr4ACgkQAVBC80lX
0Gz/wAf/Ytv/ek28tbaMISIf8+gVyIPkkFf2ciK+1tHr6rqODuafP+V+Uk+YNBkX
Of9YMBdt3J9PysNXw/nJGyve3WPWVEDBZ8gCy358m3EmCmURkKOrFkIdsOeiZlKJ
T5xf3/C3u+sUnDuumRUmI5sVf1rd4IuuG5Uyl7O0vpBaBqNaMEQJ9wwsAMmGvv1f
UWBuUq5L6HzxiA3URyjq2TCoXr99O/njQAkg0iJUpGOIrdfBpRhhTuU4bAfakKuR
+lD2Jc16LV4sG5MwSQAumnlQbNogDxPtNFEqoibYt0NYKx+xH3XZcI1RxtuYxzXD
mua3AxRBWVSjN827b7kthUOpxaGG6Q==
=Awl1
-----END PGP SIGNATURE-----

--Sig_/YnC1+DebVg=JQxovUe.5+3v--

