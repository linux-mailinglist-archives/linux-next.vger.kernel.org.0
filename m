Return-Path: <linux-next+bounces-5321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A3A1AF09
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 04:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06003A7400
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 03:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28A31D5CCC;
	Fri, 24 Jan 2025 03:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P8F8XS0O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A51EA65;
	Fri, 24 Jan 2025 03:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737689257; cv=none; b=aGnbN2iCRYmciYTsMZ4heMUTE14KyQPW/oOWrwlnnTdyrJH7AmNrtuS0qdGLHyeQS/dc2Hl7pO0QYKwT85TfYsLmMjElCIwCLmZq9tBk7WcvQWNzLHlRlG3Umo7y4v5ZY0auXIKhlyywBL1idORYSVj/kx5/SfOf8eAr4/XzGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737689257; c=relaxed/simple;
	bh=zYP8oiwtI2qlnMW8INLtFQ9tEg/Capc16JE5YLdq6P0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTd13xyuwrZbaageGUayIQgmBpLM5fWfyNM3NMfoTioDi/OXW1PFjw5QkhpjyfIANuLSdvgGlhWY2RoQjS2cMaGovJugDTRFyxXbTdZst36m4KoClf28kRTNuXOov58sM1DTFZqYVOON6ptEFYrxKWXEaOaPqzMqZDPyxWsxI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P8F8XS0O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737689235;
	bh=1v57yKQOF3EjSVnnADMZufyh9gBYF45J9zKItmGRCsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P8F8XS0OY7ku0uuZC3OIkROzZkhPbB6WuVrhMfFtu0nhq5yYvYeaj5YXoIiiFhB6O
	 YVbv6G9/ALFlA5Io5Wsb5xPvfx74VudEf3ubZ3CQRRM81nRC2qr03Gt4jcS3qR9QDb
	 HbDRYEc1asjW5MOB2wUFMZpk8a44mvZVQ6P3wwul2U1kW05h3EOlr7znvmJUaogxjM
	 1whXq/Fazoh2pJ6YJBr7ALfVY2AZPa68VqrmYKTgBpIxdJdJcBp6HMIodeHsZQ13En
	 y3eRuDSptMsYLKeuZIxmqqT/BhIJDd1rqWuJTuSgbuOXHHgcghqSe8TOeewTN0KBLC
	 D2bE47lK3KPiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YfNXg1b1Hz4wgp;
	Fri, 24 Jan 2025 14:27:15 +1100 (AEDT)
Date: Fri, 24 Jan 2025 14:27:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the afs tree
Message-ID: <20250124142722.7b8a4681@canb.auug.org.au>
In-Reply-To: <2190350.1737644541@warthog.procyon.org.uk>
References: <20250121091525.6ff05253@canb.auug.org.au>
	<2190350.1737644541@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U=d55Enu6Y=6.=dtNT10uwd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U=d55Enu6Y=6.=dtNT10uwd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 23 Jan 2025 15:02:21 +0000 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > The following commits are also in Linus Torvalds' tree as different
> > commits (but the same patches):
> >=20
> >   3c9ca856fd12 ("afs: Make /afs/@cell and /afs/.@cell symlinks")
> >   bcc4d777ff8d ("afs: Add rootcell checks")
> >   31ad47d22fac ("afs: Make /afs/.<cell> as well as /afs/<cell> mountpoi=
nts") =20
>=20
> Did you drop my afs-next branch from linux-next in favour of Christian's =
tree?

No, I didn't.  Do you want me to remove your tree from linux-next?  If
not, then just reset your afs-next branch to somewhere in Linus' tree,
or to the equivalent to the top of your branch in Christian's tree -
30bca65bbbae ("afs: Make /afs/@cell and /afs/.@cell symlinks") - which
has now been merged into Linus' tree).  (And then push it out :-))

--=20
Cheers,
Stephen Rothwell

--Sig_/U=d55Enu6Y=6.=dtNT10uwd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeTCJoACgkQAVBC80lX
0GxjzQf/WTeSvW2aMn2/mKh0HzB8l19JHWmh3C+6UgSmhASCaAR2pAM35cyzk4Bk
P1+xvmHf42PcmtUh9hja2DhSvkM80qSAevIkpGE56HWrkDyUd/XaYKwEz44/Re/r
Ycf1wc+3VASIv+dX/iXr9x/1AAoVbKUm8MxGMZMRHbF32NaxXPQ00DDzxKo3g9zE
XXDZBZechAEov4GG6Kono+/gryaV49lxDFe3sPFKyD4iYL16Cdb36mtr5eQuca4J
Z9+y0IV7d1iESm0Z3WMaNTVkX1T/LE9DqFjcFQ7FeZE69KLp0o5+KqB2iIJcpgyl
QLl5JjBqlw38gH6h8EEJDOppKRIz8Q==
=/99y
-----END PGP SIGNATURE-----

--Sig_/U=d55Enu6Y=6.=dtNT10uwd--

