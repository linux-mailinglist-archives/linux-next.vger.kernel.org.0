Return-Path: <linux-next+bounces-9165-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB174C7EC06
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 02:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A882F3A421A
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 01:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1955522ACEF;
	Mon, 24 Nov 2025 01:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Pj7V1kOe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD5635;
	Mon, 24 Nov 2025 01:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948393; cv=none; b=FZN51NdlO2BrEcBOskYEaFK4w5RD/9apNjVc1yE+rcu68B17AI0K37Nub+LnJVHBCO2pvWIC+KYh7EqJxnG+lZ0NlefQSQDFJJA+qmflfrKhSG3lxWMzxnhimKAVewoLlFllGh5dVpkiSxGumPljRvbWiDHlqi7hmxXF8uzf1kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948393; c=relaxed/simple;
	bh=Ih5Zkj2novpG/Ty6mOJqC6LzjjhUfa/K0N+iwJYSFP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lv69XZWfJfDW/aD/Pk8/iadbWwpoBe11uCXhzULDXdnAMwXnGL+bixT/V6N17+BANVv00KCsGGwRxQRB8FL4TOOLgk/2eGcN9Kr/ejDuiA0FJQEbDC+FQiYLWmGPWpoe0o6jzz6TRAJywHqnRJNWsRY1dyU5OO1pSkMHku2bU0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Pj7V1kOe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763948386;
	bh=wIW+IQjtFe7L6Zp/owCHUw4bNIiDdBBG7Xr75YHXhUo=;
	h=Date:From:To:Cc:Subject:From;
	b=Pj7V1kOeof2g44gbhqlORBkyEnFa+vkOoKtoc7VvD4GvdbAnQXnozaMlpy4T/qqK9
	 o2L1TqOu6Ry03RreTLHCFmE5jcq++/joX0Ka68fy8OSqYlI6q+IAzrjpZ7hagMkkKq
	 Br51d44nBwPoGRhjvhg3rrioYRZB7ZUswDd1LvKPR543O5tn5qvCLdqKJ9eJESlCU1
	 NyjKhdoE/fjuRHfA/AcVp735C40UMn6Zm/hsFqqsNKHlHnrvIuS7WSy9YCAw5HTHYK
	 ejq4xdepaUA2PDnzjISOWIrYss13oymn26c4I7ymdZZFh/+92+48MLYy3mpZW3n/fd
	 +x3Sa863qy4DA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF7mK5Zdkz4w8x;
	Mon, 24 Nov 2025 12:39:45 +1100 (AEDT)
Date: Mon, 24 Nov 2025 12:39:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Samuel Wu <wusamuel@google.com>
Subject: linux-next: manual merge of the pm tree with Linus' tree
Message-ID: <20251124123944.68ab5dda@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nHdkDu6OAO/XBonTszQRR68";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nHdkDu6OAO/XBonTszQRR68
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  kernel/power/hibernate.c

between commit:

  a3f8f8662771 ("power: always freeze efivarfs")

from Linus' tree and commit:

  8e2d57e6539b ("PM: sleep: Call pm_sleep_fs_sync() instead of ksys_sync_he=
lper()")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/power/hibernate.c
index 26e45f86b955,7fed1cd36e4d..000000000000
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@@ -820,8 -820,12 +820,11 @@@ int hibernate(void
  	if (error)
  		goto Restore;
 =20
- 	ksys_sync_helper();
+ 	error =3D pm_sleep_fs_sync();
+ 	if (error)
+ 		goto Notify;
+=20
 -	if (filesystem_freeze_enabled)
 -		filesystems_freeze();
 +	filesystems_freeze(filesystem_freeze_enabled);
 =20
  	error =3D freeze_processes();
  	if (error)

--Sig_/nHdkDu6OAO/XBonTszQRR68
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjt2AACgkQAVBC80lX
0GwSzAgAiec7Bsi0QKP752g7MtB/CiBFoQlXOGMCGWR/HbKS+IDgFsL5f0wWpx/2
Q/6FNGWT7PqwwW0qltW8Y2atJT8ujSjHqnp5+FM7CVMdCStwJRiPjRcacTecl3Qm
k+tC0oyUUtsi82HP1+X0jWsR6Vo0l6wzN4IR/n+cXMLkm0nCMpp48EsPj1Ef8Qyq
iXvW8msBzOsmEv3rRNk/LK/R59+9ygY2UBFzkT4d8xpVeXdvOr0Gd2wrkONcTklC
EOpZWt94GH8Zp52bCkuGElvr94nPMMc0EuBHoO0CuMO/+RXiFJuIf8+h+Kd25vlA
/236CtyUheLEKAeUWArRn5KZaRvxfQ==
=00GT
-----END PGP SIGNATURE-----

--Sig_/nHdkDu6OAO/XBonTszQRR68--

