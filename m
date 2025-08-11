Return-Path: <linux-next+bounces-7900-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECADB217EC
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 00:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491CA462C60
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 22:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1202701C0;
	Mon, 11 Aug 2025 22:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XLjxoz/t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923321EF0A6;
	Mon, 11 Aug 2025 22:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950032; cv=none; b=gt+OHAYK1Nr270yFt12hxDQiKO9xjhd04M0bzeD3rvOPG5mdY6GcsGcpfAxczBOWswH5pnMMWPSZyJiJCI0T6wZ3eESKHKj09ce8lTn0li82RCWfEU7tVYpHoCb5pqlA/MbBFFWyqc/cfKKeSNk/uUsaAV84EaEcRK1r9jp2pgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950032; c=relaxed/simple;
	bh=ESKE5BUStaB+DcW0d1yjgYecjRKrfw/MLoffF5XodXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SdWgBfKaUlz1tQe3q2mXtJv+t+hGwN44yYSKwhqkcpOWFioYHVxSCuDkq/qhStrlBHBx40IRsFdjIVNBqD7BP+i3PPw0eDRFJ4r+NipmXotF7H09R8dW9C9/U02Q3MMZiZsF8dRf3643ZSHB/BIOFwA5rbEuoAEeSi5lmCyycL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XLjxoz/t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754950019;
	bh=ra04D2r7k/rTguiyLwrESSXAf44IcxnsSCYZZD8HQHw=;
	h=Date:From:To:Cc:Subject:From;
	b=XLjxoz/tKH3B2CSfGqNyq57idxlXf+OBdFKlxlnJainnHx9vYAVg4X2ghmFMzhSPo
	 k+3O2RUFdjvRhWDoU08AE+2xyk7aVWHxh9hXgZ30bpZHqzF0ca9/BpcSXwtJYmOBUd
	 JVqfw5b7v88sMmQP0eEuWzP/RYQNJR3TjNw7I6OIkWN7Z5Ire46HK6gxfdTVimLJ4S
	 uNPuutmsLlyoSPgQ4qGXgnZ/I0av+RprlHunABQYG9bI5ZgwgYHNf+rdERMYKKZtXP
	 GiODGUp0+pyGSOxynhZWuWpTuCSsaEXSl4eAb0um863px1iCP0mbhXqu0V6pSTVOo1
	 Jq4Wj2j3DYSEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c17yq450zz4x6n;
	Tue, 12 Aug 2025 08:06:59 +1000 (AEST)
Date: Tue, 12 Aug 2025 08:06:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-brauner-fixes tree
Message-ID: <20250812080645.4fa3afaf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kj51iUtt7A_IJDmPVzSIa4o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kj51iUtt7A_IJDmPVzSIa4o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  542ede096e48 ("fuse: keep inode->i_blkbits constant")

Fixes tag

  Fixes: ef7e7cbb32 ("fuse: use iomap for writeback")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/kj51iUtt7A_IJDmPVzSIa4o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaaXUACgkQAVBC80lX
0GzFdgf/YmmL9JmUXNjbmUPAe5Tm1bDqoHQAYJB1XRIZgfxPOFj0lksYBTNb1xkM
QRAxjTAnw1jn8p9RJLR1wHrOXsNTo5PL921C0v3jkcLVi9L795e0XNlR6xTkbtkb
+zO/N8sq5NIzuuXck3OMm2UmIKTUpKyQ5XaUUN5l1bpijMGs5iLElcCNw9TmDZoU
EaD9a4S0E3p0gQtRRteF6v9ln1j7Pi9nw17i8TfwHldkLai5GFTfwYr3ZC0aWIGk
Lx8L3NwG22YUA86Ca+gppa+/5rbjRsfYfHkVeFpmc2aYNxqqgcNgYgN8p+ugOSNm
q71uKnHROJww56krFrjWBfsBki55nQ==
=t07u
-----END PGP SIGNATURE-----

--Sig_/kj51iUtt7A_IJDmPVzSIa4o--

