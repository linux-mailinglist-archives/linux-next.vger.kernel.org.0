Return-Path: <linux-next+bounces-6593-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECA3AAF5FB
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 10:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E18E3AAAD4
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 08:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877FA21FF47;
	Thu,  8 May 2025 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J0q7mrTt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B534121E0A8;
	Thu,  8 May 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694125; cv=none; b=egbzj+GhWSvfbk5Ka6S5yz4+8zPISgKS2xg7A3SJjm3jP7JtAOX6VYBsxWq3pSo1B22DFnmLFV1b6ixu9SFY9aBMgrDMZ60hGGw/OCxkY5jGaJvXTCrjwq3Hlvgbp5QHMvARltmTOO5RJICNRGLKixAN/bbfmrYUWKfq80WgFg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694125; c=relaxed/simple;
	bh=mNdg4312pZlS17BJvWLbZ/F0D4ryjw/eaLuJ8yYH4x0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RDphDjb0CxErZRLAL0nCv7xv9XAtl3L16/oWehNIGGJTWo0y+zb5xKvyLsMHbhpDKzs/fDawN+AhAWcvB+OKz+Lk3olT1nR27vNc5M5VI7sO1daDdRq3LCXxcx1lERSnLBpeaRd5g+B0/OixyF0aFXVpcj5nyoRe2Cbah0CIug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J0q7mrTt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746694121;
	bh=TpFxIdd/Kbq0P+5+2Yj1o4onzJVZA1DsE34XUYtIVcQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J0q7mrTtWb9yB9INxFayIvYj1uEjaYMXtj9Mhz/qolWdJdwtH9VVh/ZDiX8VwzzwT
	 S4wXFlF1XtEnLzl9HzuT75baUpdWq3yvzhV1PF56GTLIKx94pQVis4QYoN1syY5Ybw
	 1ASdLX2RZesPzpqEJ3rjZUqDOfYjNILTJSeJy+ng+oG1FDTJePpFFbAj0hJFmspLwV
	 G1zfgJVIqetrRrt/7jJoHsyvleUUfsMQmzPPEzeS9clKzPYYK2xIss4E6zDKHU7nYS
	 TVizlTohtjs3s2x1OnRMtx7tEZ0pDX5evQcFXajJi8nPY4JwutWsvBUvXNpJi2J8WY
	 ScU9b+pavemwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtQlX5yLfz4x8P;
	Thu,  8 May 2025 18:48:40 +1000 (AEST)
Date: Thu, 8 May 2025 18:48:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <20250508184839.656af8f6@canb.auug.org.au>
In-Reply-To: <20250508182504.418552ef@canb.auug.org.au>
References: <20250508182504.418552ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vq.R5Crb2ylyqXwa1YE4ZFN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vq.R5Crb2ylyqXwa1YE4ZFN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 May 2025 18:25:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> In my after merge build tests, today's linux-next build (htmldocs)
> failed like this:
>=20
> make[1]: Entering directory '/home/sfr/next/htmldocs'
>   PARSE   include/uapi/linux/dvb/ca.h
>   PARSE   include/uapi/linux/dvb/dmx.h
>   PARSE   include/uapi/linux/dvb/frontend.h
>   PARSE   include/uapi/linux/dvb/net.h
>   PARSE   include/uapi/linux/videodev2.h
>   PARSE   include/uapi/linux/media.h
>   PARSE   include/uapi/linux/cec.h
>   PARSE   include/uapi/linux/lirc.h
> Using alabaster theme
> Using Python kernel-doc
> /home/sfr/next/next/Documentation/virt/kvm/x86/intel-tdx.rst:255: WARNING=
: Footnote [1] is not referenced. [ref.footnote]
>=20
> Sphinx error:
> Sphinx is unable to load the master document (/home/sfr/next/next/Documen=
tation/index.rst). The master document must be within the source directory =
or a subdirectory of it.
> make[3]: *** [/home/sfr/next/next/Documentation/Makefile:123: htmldocs] E=
rror 2
> make[2]: *** [/home/sfr/next/next/Makefile:1804: htmldocs] Error 2
> make[1]: *** [/home/sfr/next/next/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/sfr/next/htmldocs'
> make: *** [Makefile:248: __sub-make] Error 2
>=20
> I have no idea what caued this :-(

$ ls -l $HOME/next/next/Documentation/index.rst=20
-rw-r--r-- 1 sfr users 3274 May  8 10:55 /home/sfr/next/next/Documentation/=
index.rst

The commands I use are:

cd $HOME/next/next
make O=3D"$HOME/next/htmldocs" htmldocs

--=20
Cheers,
Stephen Rothwell

--Sig_/vq.R5Crb2ylyqXwa1YE4ZFN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcb+cACgkQAVBC80lX
0Gysdgf/QBuUELzPj6X7oDxh7leZXNiGprZB50HXo64h16czxxz9p/Z7SDUQWpNi
0NKkY++hBnWr7asroM9FLThHZScPIqJpg7yflISSUiGfUgIoIpbsMx9onXMNJCjs
ygowMkZVSphLqHwwRiexxGwDFg7W6DEQxr4wiXQKWcux/YUfFimN6Em69lacG35v
ziXS7QYqxrhQBAzWIHd4zYtwbQeY96tLxDElzLaDpMLsOShXsRs7l9kHrvVYpD3/
Q016MGMTVxtOpccluv9OmOSqOZNE8CPuxmCQ/nz0BvZKIs2Qtybc5hNDbR/pd6GE
m6z49mGs881sOdXJMX5BzJIClhj/IQ==
=c5Te
-----END PGP SIGNATURE-----

--Sig_/vq.R5Crb2ylyqXwa1YE4ZFN--

