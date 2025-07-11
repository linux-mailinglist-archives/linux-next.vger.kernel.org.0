Return-Path: <linux-next+bounces-7470-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5328FB01180
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 05:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BAD8641AA9
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 03:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F41E195808;
	Fri, 11 Jul 2025 03:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZsjurWvL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9618D;
	Fri, 11 Jul 2025 03:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752203283; cv=none; b=jYmCBx9tVwhE0OpGevv+YAGDno3dvCvKVX96MfFWXWj4YP0bsCz/2p+67tB2HZRwQ/Y8pU3MJemblww1+FXsWx3eg3++2yiOwxRnsGnyKf1ah1C6yGmuDCLZUy6WzBbbdg33i6PDepEqX5JWsVqM9MlpNnpJuvU6WKB4tOjn3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752203283; c=relaxed/simple;
	bh=CQMxU6opKrE0gtd03DqHhHVg+06IqQKCGWRruvwfvUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qPtMIh6vDjVe+MXYyVboXPHiCcWa+2oq2QFFZmQ9OoM2TpNuPbKOk4Q7irUMUkNyark5KR5ltNsSIT5xO1edzHMFMbvKeVYhv2kazFZCk+SY/lCfGkb2ewZrrDxSetBDXE00NF0yUL28+L8k0cgrq6eRggXBCq8rmcVOKcsMa5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZsjurWvL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752203197;
	bh=nzGCrWBxu7LxT1519Z6Jy+ivfVDpPMLSetGsisXUtks=;
	h=Date:From:To:Cc:Subject:From;
	b=ZsjurWvLDnDHx5kF87KfRDjTro+R8YJwVG90f8LNgjNaPlKVjA6ItnkR8iwAVCbvf
	 x0ttibTOB8RguC5hTKYREf/Kg8CHY5edE0IMkoCegDqCSHlF2vcsuOPb2WXEywqeFV
	 8ZTDblancK0HuFltFgLxm/+p8ChoG2GZLE6N/3yX8Vo0vnlJWt00MtiPp5CSK/IeLj
	 hfjAVKevYeEi+yYsdlOzEJZQPy5OJUoDiZAt+HO+iUcap3ZiMl3lozVINnsEwnvpln
	 0R6UFhCGft6nBIsekwENxHBXwPqonDGnRtIDJQOM12PkSNl70uLj0KNzWhcASUoaH4
	 I+wUZNX0gfNvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdc7J4wvFz4x5Z;
	Fri, 11 Jul 2025 13:06:35 +1000 (AEST)
Date: Fri, 11 Jul 2025 13:07:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, Wei
 Liu <wei.liu@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Naman Jain
 <namjain@linux.microsoft.com>, Shradha Gupta
 <shradhagupta@linux.microsoft.com>
Subject: linux-next: manual merge of the net-next tree with the hyperv-fixes
 tree
Message-ID: <20250711130752.23023d98@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cmJgXqToxFCkl8lTdAN_s/5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cmJgXqToxFCkl8lTdAN_s/5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/microsoft/mana/gdma_main.c

between commit:

  9669ddda18fb ("net: mana: Fix warnings for missing export.h header inclus=
ion")

from the hyperv-fixes tree and commit:

  755391121038 ("net: mana: Allocate MSI-X vectors dynamically")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/microsoft/mana/gdma_main.c
index 58f8ee710912,d6c0699bc8cf..000000000000
--- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
+++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
@@@ -6,9 -6,11 +6,12 @@@
  #include <linux/pci.h>
  #include <linux/utsname.h>
  #include <linux/version.h>
 +#include <linux/export.h>
+ #include <linux/msi.h>
+ #include <linux/irqdomain.h>
 =20
  #include <net/mana/mana.h>
+ #include <net/mana/hw_channel.h>
 =20
  struct dentry *mana_debugfs_root;
 =20

--Sig_/cmJgXqToxFCkl8lTdAN_s/5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwgAgACgkQAVBC80lX
0GwMiAf/YxRVNFfPCz0lEwBVyjZYcoHqxqx+GyWaksiD7zqZibC1siOS8pxe4eAJ
Q0+INLdK5QAgJWW/sFpBf7aPIDYccEcIl1Uh6CF1QKPFth4t0lE25S0DsNTp86w3
EB1wL6RP98z0MHKfnvPaqA5QI6A4VGk8X8hvr/kxJkrGuc5r621jNYlr3bd17Uhp
psbhIIXNoaQoDHmmWdltchphQeHRzV2475dL9RRrXkKJv4UVddiTJs8hML9JYQNe
+yrD/iZwte04PZW31XDttBufFfc+pQ/Tt8KrOceDmFNO0NVgf3njsYhp4tgaoeft
B4eYQ4mZ5r9U5ya4kmp/0WkSfW4isw==
=m7sS
-----END PGP SIGNATURE-----

--Sig_/cmJgXqToxFCkl8lTdAN_s/5--

