Return-Path: <linux-next+bounces-5161-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCEA0AC05
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 22:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 178FD3A65DD
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 21:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C583F187553;
	Sun, 12 Jan 2025 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rPAa/62a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3608515575D;
	Sun, 12 Jan 2025 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736718916; cv=none; b=tgyCq/M8wDN/ghmZ/l6/tjTJ0TZmA0Sy7jV0oNq0bTM3dIOPZ+2qDwfAnOGnKT37BCZmICY+TIukOq0rTJ7EbqUa4TxrWndkLlKRxOecPkoEqaziPHnVCunp0Ky9YzQOBafQ5V54k9CqtFy1o8LbXiQYSdIFR5ehYwUPdXumwPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736718916; c=relaxed/simple;
	bh=FbD4U1Rn5e7gVj1AB+XR10yY5yC+ImQUvyoFCjFmFuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VHg7rKbJH7PW8zTUfzl+BeG6krwTJ9CmccvqGkAysC2VxjqCFgxpdRy+R80e+67PJox5LFo5li1JQtGaAarRsJMQMNEHVhXelH9KH/3fj3pfLsHwD012ADLZkFNMAG7MIcn73P7Nd9zYe4QA3LrErWGqodBpdH4qnW+yki1S7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rPAa/62a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736718901;
	bh=AgsQ+UvzEwcakIvUVJkPLP613bkVloGb80jQfXuzQAg=;
	h=Date:From:To:Cc:Subject:From;
	b=rPAa/62avVjcPpAl1CS71RwNuNDtCu0y43nSVo3Ntw1nCUw69uKPABv/ebHEh59/B
	 DsxXJEdqXuvchFOcix8aIMj7SomFZDZBAIcGwxJp/YsabHKiLT4RSLEM0WdeWG2fO2
	 bGQ5hPk+eSxj9P+p+4rNpapsLIyw1wH/zoit7zWVBUt/zzBxRRHC5ynAtzuAje5Ulr
	 GZPh23I44sUpjrUcUrVo8GTyUz1MapRf2B3eQAZn3apVzq3J+FIuqxYRtoLhvIqhmY
	 Sgt7Z4Lt3AS0q5P+fRtzbeg/dVZX5ETS8AdMbOWO2pZ0BErJX4Zh2nhUDDQUWokRhI
	 ehvDJasOHPPww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWThP4fwRz4x0t;
	Mon, 13 Jan 2025 08:55:01 +1100 (AEDT)
Date: Mon, 13 Jan 2025 08:55:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, David Howells
 <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20250113085507.3f2984fd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BKAEkW=xJO7EgrRNoe9_Lb7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BKAEkW=xJO7EgrRNoe9_Lb7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the afs tree as different commits
(but the same patches):

  30bca65bbbae ("afs: Make /afs/@cell and /afs/.@cell symlinks")
  3e914febd79a ("afs: Add rootcell checks")
  92f08e9d3cf0 ("afs: Make /afs/.<cell> as well as /afs/<cell> mountpoints")

These are commits

  3c9ca856fd12 ("afs: Make /afs/@cell and /afs/.@cell symlinks")
  bcc4d777ff8d ("afs: Add rootcell checks")
  31ad47d22fac ("afs: Make /afs/.<cell> as well as /afs/<cell> mountpoints")

in the afs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BKAEkW=xJO7EgrRNoe9_Lb7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEOjsACgkQAVBC80lX
0Gwelgf/ecgwwCRUwONB3+cEPaPDDeNCeWaZn3bbh4xf1kojajdRp5DKAebDpeB9
i2Ndb4bqA779Q3OoV77yQDRmtwxVFGHaYd72zoqpzZ/wzI2BakaMM5qXBZbbMsle
Y4r4w+7yR9qSgY456UshHwd/aPiL3k3a2Z4OBQpqQFIOkgfj2lT1DJL7gzHyjlOz
ntOcG931Dcaatf1FHFPP1Ycfu6eQD6fo/BtY3zHK40RIbF52so9VsGjeM9sqShFg
hyk8JfckEnrTZK2UHfprDPguUqJ/un4bBjMIXpXJrN/eLVRTKcuZoGeNGBrc1F0P
fM6h9V46/5XXsJFSgWb9kO2LXdvUKQ==
=zhrD
-----END PGP SIGNATURE-----

--Sig_/BKAEkW=xJO7EgrRNoe9_Lb7--

