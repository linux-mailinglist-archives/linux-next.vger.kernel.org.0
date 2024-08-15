Return-Path: <linux-next+bounces-3323-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 610129526BB
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 02:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C181C22290
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 00:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317B21878;
	Thu, 15 Aug 2024 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nN15ev8X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C3184D;
	Thu, 15 Aug 2024 00:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723681044; cv=none; b=ElKha5G2ncQujxdFlt+1yL8i2cbJr7VFcQpQnC+ImWhJgmo2BzBQ0ZVYFjuHReKVo9DeunF1tjTuO+aS3GEQStqzfA+PGeCSW5+G6EMSojPHiw915VTJ/kQe4+A35TVNFDuSJU0dLd3KsMWft3el1O+6kOOa79khJad8EZwMqbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723681044; c=relaxed/simple;
	bh=mwBXqhs89z/Uf7IpyWhPrkxXbeQNsoYqx0CL0MEPLQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GYJOYGJOT8LOBdeLNdxoWrJB8+QkaaGEdLYryqc+m9yFYL8DkyeuDZ+2mmJjN+8DNyy+3PF9lXndOcTfues7B8bBjxixgVtHnCfnA+MheUcVUBFKcSmbW+6u2d9GH5A4oqaLHEdDVSv144loR7R2JuOG06qtIMo1/eUeUWBrH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nN15ev8X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723681040;
	bh=/+xIJvbbYJK1RJYjNKcz7gy0pdnxBapAqsZTok4wFjk=;
	h=Date:From:To:Cc:Subject:From;
	b=nN15ev8X+n5B5Rqo+Phbu69W6G34v3WnWN18GA1FZl5xggTe5IlrH0kXsgqwHx3bA
	 6ur85TfsxBQCfNbYCWIsoVJau4TXoQCOR3fasQn+bNaSVui4jTGOhzVC6d0q8HFaX1
	 EY/glpeMYyZvdBxPbmBspcYSdDwuJ4MxW3tpbKioHvZtvNa48qQA/tW32Hpfn5K3ye
	 vjGqKSy3nbMt3rGFBq6Ir4SLSc/l8FRYLK0Gqrpt0nVlP9Ixo0iz+ITu3Uepe4QNu5
	 4D0irr2qC1u8nPacmGaxSuLECCqLo352d4V0OW/TLHvHd37bz2UxuxobBPVT+EGsR2
	 OVXXp8Ew8QQ8w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wkm0B6s6Xz4w2Q;
	Thu, 15 Aug 2024 10:17:14 +1000 (AEST)
Date: Thu, 15 Aug 2024 10:17:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: linux-next: manual merge of the risc-v tree with the mm-hotfixes
 tree
Message-ID: <20240815101714.4422f93c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aHR2UvVDHdyR/FMpivz6eVb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aHR2UvVDHdyR/FMpivz6eVb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  kernel/crash_reserve.c

between commit:

  ce24afb8be8f ("crash: fix riscv64 crash memory reserve dead loop")

from the mm-hotfixes tree and commit:

  e2acf68fb1c5 ("crash: Fix riscv64 crash memory reserve dead loop")

from the risc-v tree.

I fixed it up (I used the former one as it seems to be a more recent
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/aHR2UvVDHdyR/FMpivz6eVb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma9SQoACgkQAVBC80lX
0Gx8QQf+K0r2T4FjpxW+GktFI6ZwMNw482z6yIVi4WRYFyZpqlYFKduOy/+AO0so
Nx0qGSjo0Qbd+Ex417HurDSwhHAC70Xejlv8T4D8TEX80U2obV/JjWpZ4RaS3bMS
8nzwnboAJPslyKlmjEuZN+xhpGDG2CaagnQd6aswhclSKNCPRsRiynH6osyjoszc
TJLM/oyHOpNn9k4QF+W7ppvKvC0hyE/0l312IvyOJde+C9hHuVHfpDeMioA3rEx8
WpgV9sViRzNrQMlNqiSiBQZv8FXStbeK4TieqXq36cxH6yh4irFi8EHhMJg+GDLy
rjUJSDfzr5ck0gFRkEMvg2WaS27GWw==
=GEnH
-----END PGP SIGNATURE-----

--Sig_/aHR2UvVDHdyR/FMpivz6eVb--

