Return-Path: <linux-next+bounces-6812-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC0AB990F
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 11:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FAEF1BC0ED4
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A983230BE9;
	Fri, 16 May 2025 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e3VJLERi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F83E163;
	Fri, 16 May 2025 09:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388564; cv=none; b=ScPgjDGeA8he1LSROwuAPNy7U4v2v+pK4o3ftXWBkuEhWMjz4QqoXe514vHftydOLQvmy54epBIiRq5fbwyA/zoME5qTM6ajY0iQY7FeWgpXuYGn+1Xza9RTbSOM6t18rPepAV904wh9mGlLrkOQslAsEi7A9sBCVY7O9gJl+Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388564; c=relaxed/simple;
	bh=tEeJwceqPhH6rQO5BP/XnO6dPNDzjv4Fb3mwdlwvWhw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ez8N8I/nv2aC2c9NrCI9O2PWRRXaV40Rq758YOOXhdkxegqwPMfFAaSPegP+sMEDwgG/CAvD+5LUUSLvkk9Dbkz7NzM99KWHsZWjCR2wXB0kMijH6fcxFFhKFTIEIasH6TaQTmdFNg2Kz2ZZHrKG5CuAxt2XHrTKPx1dnIozGrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e3VJLERi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747388558;
	bh=3bsTN6s/atC4Hle8m6wzHP/e3ZR4IYSXzgWgQ96g304=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e3VJLERiklN4QZz634EkcUMUXwZ9IWLIVS2uSWqvVMDTw7dCkE/Q69+hnEa+QiBHl
	 tRI/tqEglBL3wDjIanrEbkhiLyEvKNjqDuBTlqiHiwX3nckb87vsTMxDdGRy9OZclO
	 F+0MD+/QpVYYp1z3dEc45L3RGpCChn7NqkLUvNl23kudTZ0e/yvYQ+JXNFzy9dKY4j
	 BMXmRraly0DlUt0xlfJlcQ5KICEIjfW2RsGhDN2HOx/GUD4rxI4BWECMhP97Xn7psQ
	 VZv4vrq1irt6S5WZVw4NK3Pu6/5FXF6d17Uq9iqtzhU2xuysUjcrKlSsgTdgtZbNtX
	 hL2SSGs1FENDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzMZ62BzTz4wcQ;
	Fri, 16 May 2025 19:42:38 +1000 (AEST)
Date: Fri, 16 May 2025 19:42:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the gpio-intel tree
Message-ID: <20250516194237.03371ba7@canb.auug.org.au>
In-Reply-To: <aCcHKK8FflYRhx2m@smile.fi.intel.com>
References: <20250516193436.09bdf8cc@canb.auug.org.au>
	<aCcHKK8FflYRhx2m@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p.qQOCKF0gbsxCDO+Q54S/_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p.qQOCKF0gbsxCDO+Q54S/_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, 16 May 2025 12:36:40 +0300 Andy Shevchenko <andriy.shevchenko@linux=
.intel.com> wrote:
>
> On Fri, May 16, 2025 at 07:34:36PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the gpio-intel tree, today's linux-next build (htmldocs)
> > failed like this:
> >=20
> > Error: Cannot open file /home/sfr/next/next/drivers/gpio/gpiolib-acpi.c
> >=20
> > Caused by commit
> >=20
> >   babb541af627 ("gpiolib: acpi: Move quirks to a separate file")
> >=20
> > I have to run
> >=20
> > make KERNELDOC=3D$(pwd)/scripts/kernel-doc.pl htmldocs
> >=20
> > as the newer Python version dies without a useful error :-( =20
>=20
> Thanks for the report! And can you share the output of the above?

make[1]: Entering directory '/home/sfr/next/htmldocs'
  PARSE   include/uapi/linux/dvb/ca.h
  PARSE   include/uapi/linux/dvb/dmx.h
  PARSE   include/uapi/linux/dvb/frontend.h
  PARSE   include/uapi/linux/dvb/net.h
  PARSE   include/uapi/linux/videodev2.h
  PARSE   include/uapi/linux/media.h
  PARSE   include/uapi/linux/cec.h
  PARSE   include/uapi/linux/lirc.h
Using alabaster theme
Using Python kernel-doc
/home/sfr/next/next/Documentation/bpf/bpf_iterators.rst:55: WARNING: Bullet=
 list ends without a blank line; unexpected unindent. [docutils]
WARNING: /home/sfr/next/next/kernel/futex/futex.h:207 struct member 'drop_h=
b_ref' not described in 'futex_q'
WARNING: /home/sfr/next/next/kernel/futex/waitwake.c:593 function parameter=
 'task' not described in 'futex_wait_setup'
/home/sfr/next/next/Documentation/virt/kvm/x86/intel-tdx.rst:255: WARNING: =
Footnote [1] is not referenced. [ref.footnote]

Sphinx error:
Sphinx is unable to load the master document (/home/sfr/next/next/Documenta=
tion/index.rst). The master document must be within the source directory or=
 a subdirectory of it.
make[3]: *** [/home/sfr/next/next/Documentation/Makefile:123: htmldocs] Err=
or 2
make[2]: *** [/home/sfr/next/next/Makefile:1803: htmldocs] Error 2
make[1]: *** [/home/sfr/next/next/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/home/sfr/next/htmldocs'
make: *** [Makefile:248: __sub-make] Error 2

This is already being discussed in another thread.

https://lore.kernel.org/all/20250508184839.656af8f6@canb.auug.org.au/
--=20
Cheers,
Stephen Rothwell

--Sig_/p.qQOCKF0gbsxCDO+Q54S/_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgnCI0ACgkQAVBC80lX
0Gx72wf/RrklaMn23aAl9HeCpmOol+FdmXKa12a8f+XXuDQKN1U6jbm3LvMFYDO+
8XSdfwaSL9f9cXpt0UGyWG39XdRfgrdAf9o1co+2IePoVq+wtyTzrSqZfBS4Gi4h
df5wShHH9MpbPdVwuKI8noEIQia/L5PP5LBNv5axB8gX7+64ZgiuzdqD0Q3DF88H
lbduuiNPRNoZ2dfreGWW+bGMQ0byiw/ybyxxHNpzBPNYzXek3cTI1fg4Pz9yQuf/
gUyMZ18wPzkIUwuYlExLIHUMj8jrCgYyoHk1KAXJ0Pv+XiTRBtnI4AVOhhrwIxs5
Nz7nbNo7Fh5ZIMSKxnb9QYf2HJ1rFA==
=7H6Y
-----END PGP SIGNATURE-----

--Sig_/p.qQOCKF0gbsxCDO+Q54S/_--

