Return-Path: <linux-next+bounces-9253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 612AEC90623
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 01:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A71173504B2
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 00:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBC53D6F;
	Fri, 28 Nov 2025 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P16GJ87l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C93F3D76;
	Fri, 28 Nov 2025 00:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764288262; cv=none; b=EIkPlynHAenR4jm7wA6rmWs5iI64PBYhTMs2BkiYno4AsIMaMQyEx8tyFe2jCQwDvpkHELag9eAXz5ZACDtLTSeFjDMjI0AzHr5pk4YGXtABspnSMzacwyLk1q7pvAOR/Xd1G3q4C96iGRTjcY65HBuZ9VEP+Cj8oLix5D/Na2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764288262; c=relaxed/simple;
	bh=9RHdV9UK9g0pvmC+5ur+RW3931eGetPHEZKiDtrrsrc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=maLuMytakr5nC8mnvLz0ztIoDgdv7rGA9dzCLha8XO3LB0udtQC3PQQw1d9LRPQEwUdz1tuaYcQpVH/SBc79eKeDYtlX10XyFoA9ocQ77B7IERZI0grqmree0p8OR2ONiIFK6GEH2YfCWP9k58D0CmGQjOLeNO+5USFqQTaOy/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P16GJ87l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764288251;
	bh=VToi7SVOCmFsH1zkE5RNGHw0si8/hX65dsv2JHvPk6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P16GJ87lkKZoKep3evkKy6qKV/0u23YHInS3tJ0naMC/rV826wH5+tnRGRKOrzC8z
	 U8eBOmesebqfdRcAspmdTCjOO2Mx8TOrfBHjW3NkQw2ew+owF4rRBDkGnY+4ZLrYCa
	 QVsGJfH6We6W8g+gmY2iG8E3CnC53nALZnD2aEioN0tmcFsb3FaLr9CDIqMq3jncS4
	 SvJ5drPTetJZmhCCO2CiQAdj4mtqaikVUl5lleqv/Fq1377Sk8eP95mo70JZtPXaYo
	 Jv1nRM/1uTcJTYugJlqkosb+4FluOQEY7gpNIhBer2dp8AhuyKrLpJjC5Nl4rpFZXy
	 Jyqjffh1loXrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dHYSC1WZzz4wH8;
	Fri, 28 Nov 2025 11:04:11 +1100 (AEDT)
Date: Fri, 28 Nov 2025 11:04:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner  <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251128110410.0d89ae08@canb.auug.org.au>
In-Reply-To: <20251117131640.16a7a939@canb.auug.org.au>
References: <20251117084326.42c935b0@canb.auug.org.au>
	<612b7e64af3872fde837740404888a03a2c7b6a0.camel@kernel.org>
	<20251117131640.16a7a939@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fP2xkdmOP=8lQ7tj8TmqwUn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fP2xkdmOP=8lQ7tj8TmqwUn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Nov 2025 13:16:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Sun, 16 Nov 2025 17:23:15 -0500 Jeff Layton <jlayton@kernel.org> wrote:
> >
> > Thanks Stephen. This patch should fix it.
> >=20
> > Christian, you can either fold this into 1602bad16d7d, or I can send it
> > separately. Let me know which you prefer.
> >=20
> > Thanks,
> >=20
> > ----------------8<----------------------
> >=20
> > vfs: add needed headers for new struct delegation definition
> >=20
> > The definition of struct delegation uses stdint.h integer types. Add the
> > necessary headers to ensure that always works.
> >=20
> > Fixes: 1602bad16d7d ("vfs: expose delegation support to userland")
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  include/uapi/linux/fcntl.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> > index 008fac15e573..5e277fd955aa 100644
> > --- a/include/uapi/linux/fcntl.h
> > +++ b/include/uapi/linux/fcntl.h
> > @@ -4,6 +4,11 @@
> > =20
> >  #include <asm/fcntl.h>
> >  #include <linux/openat2.h>
> > +#ifdef __KERNEL__
> > +#include <linux/types.h>
> > +#else
> > +#include <stdint.h>
> > +#endif
> > =20
> >  #define F_SETLEASE	(F_LINUX_SPECIFIC_BASE + 0)
> >  #define F_GETLEASE	(F_LINUX_SPECIFIC_BASE + 1) =20
>=20
> I had to restart linux-next today, so I used the patch instead of
> the old version of the vfs-brauner tree.

I am still applying this merge fix patch ... please apply it.

--=20
Cheers,
Stephen Rothwell

--Sig_/fP2xkdmOP=8lQ7tj8TmqwUn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmko5voACgkQAVBC80lX
0GznmAf+IBfHXQ07rNPbdU2e8FH7bOG29nkvTYXejNf8hldGXxNTMspRX8Mjo9vn
ZA2+J5nBGLVHquLuZiw6ABlgv6Q5d8xWCtR2zpWgz0yWMDDS+bNiyIuSQbDwAnzh
Zc/IB3nxgeUpTGGKOrkqGS4WWlBmrEGQ55uoclwGqAogOFdEFiU/TSgImqaAF5Wu
v0WHcjVciahiOX4GVL2h0S3TPPnnUL/djdtO4AHK9l6yJMEDQEIYPyiVVjesvwN7
DC/9ELeVwxSvUED8mAwdLUABwV+xkusIgxzZeKVcDXKpp5e1GcZU/eypHL/WFK8N
1LyuXc4G7eAmeLcsX5uzwZFTQf99UQ==
=ZIGJ
-----END PGP SIGNATURE-----

--Sig_/fP2xkdmOP=8lQ7tj8TmqwUn--

