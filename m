Return-Path: <linux-next+bounces-4901-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927CE9E8843
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 23:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 868E0163C0D
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 22:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC0674040;
	Sun,  8 Dec 2024 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="he1+1lIw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6733F28691;
	Sun,  8 Dec 2024 22:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733697952; cv=none; b=KbEwMNmeRlPh4P8euT1zk/z1z4mp2WWzzWXIqUf+2JWrBBQe25bhBEV6RWvmXucu/pVU0UMWgODR1Iwe+WLVyLbxSYMJRntc/nr8ZBjNJ1CgtLLJIv5faWjL8N5B0FS5ktmxN3VPEBC/kOOLPdhnQjD5WCpmCkoB0XmqS64NO20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733697952; c=relaxed/simple;
	bh=/BhxffA6tvHD3nkiwpEpbGuQ13IJzIzOTU87F9V6aP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gnrZjOLjeSd5FaT+CXl4pWQF04K+EFoTrI12uUXFq/QFPTfM8Ac9x2A8+GakeJwngn79koKr6jExzkH6v7A8vQWeipJlVu/kaVjgzeugwTmi7TxYYsHuS55o+qRMPMEG4OQEZlI6cgtf1nPKZ4yuZjgfKHcu9mnmFOVtoi5PjSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=he1+1lIw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733697939;
	bh=zk63qEbQVhPu6bJ0/veud/5I82SeARWDUAnGP3VjwGg=;
	h=Date:From:To:Cc:Subject:From;
	b=he1+1lIwqQxQmxnaCw0u0u+lY0FsyMcBN6jlSwKCRhGSChpsvUPTofqeCuRMDGeAY
	 47kc546hw00Jr7+f5M49MztrMVRza7Ar+R1RAUHTJ2pADER4iof+mrAVl8z2B71GeR
	 AfAJN7wUCUc2WYmEnLYI8SExIDFCxgtXtDuzgNkGDkxzNmjxfs4VCGuHorZH0N2BSQ
	 9u2EN8lTNBJmGztUIEXuaLVtAM3zFry0LCiOxVyJeYmylgeaK8hGVO+46HbYGJA6GQ
	 EBqL/yVFBsNsdFs7fa/T9xT+QYHPXe+Tv7ZNskxn+Bq66f5sErdpM48vscXNCuDDmo
	 Hko0lrvHZQlPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y60Sz2sTxz4w2R;
	Mon,  9 Dec 2024 09:45:39 +1100 (AEDT)
Date: Mon, 9 Dec 2024 09:45:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs tree
Message-ID: <20241209094542.3897f8cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gLkieVWtdd.YAyBA7+ds4/O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gLkieVWtdd.YAyBA7+ds4/O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the btrfs-fixes tree as a different commit
(but the same patch):

  e9627e09313a ("btrfs: handle bio_split() error")

This is commit

  c7c97ceff98c ("btrfs: handle bio_split() errors")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gLkieVWtdd.YAyBA7+ds4/O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWIZYACgkQAVBC80lX
0Gz8zQf+JLpBH4Qfzr3IOswhQ/J9gpmtR9s0BAQI/Vb7JolHY589gDgNd2BdKubJ
KAQH3UHtx/OczoPRIwkIWIWg5h5xqQoP58TknEc2+fE2snH55hBr//IbaHl7ySXD
kYIQ5kt0NR54z3OmgA5KB/SJYoh5AE0nWR+O+v8ZPZhoF4NftOYFBvkcJguw3G8K
xFKdWD8o5KiFVom//WNwpv65zuB3jxPD4R4kOuMFHk1feAJe+Ft1dckOdR/adKTk
ALBYDIMF0yimLyEicxYR9xIH4iyletV348/mv7Lpf5vic8BsZufclDZxH9pLNsud
8xwkE32Jc6bO/8UUuseY0KIBUxnTtQ==
=QqTg
-----END PGP SIGNATURE-----

--Sig_/gLkieVWtdd.YAyBA7+ds4/O--

