Return-Path: <linux-next+bounces-6239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A02A89196
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 03:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0CB3B2123
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 01:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3580719F133;
	Tue, 15 Apr 2025 01:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mwtFSOt+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095474204E;
	Tue, 15 Apr 2025 01:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744681809; cv=none; b=tPcD0lsEqzZiXK1MbAsIAXU5uBNyZZRsjYjXBbu+J/ZjZdNRaj/kxz2BbfBu/XQCcfdjSnnpfvkHf5kElBQFU7vcTjwPOlCcLW9ZCsb0H8KxorKXVyOgV0vRaUHaD4UofwVJX4E7o++GLQ8H/TyxCv+sUowNoShRxs2+g2H7rJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744681809; c=relaxed/simple;
	bh=PCBf1sHz+qb02q833Znt/SYbg2/nGCK7pnysKuPNny0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ljdU1KkqLVrZB2o9PZSM3zethkdE6gFDW/LmowtfwdQ4M3cE/XBarD8FMQ8Zywd0NUBta05gvyzve7hAnvSU4w0SndUOCCmiYDrAZ8/TNTG+64A88nNoPjvW7jXSkSBTqKYLN8rfCN9VH1fXOSqOX4UnuwTFlxtTo5gWhpQ8ADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mwtFSOt+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744681801;
	bh=DO4rEzkkjgvlef90M/Hhs9kIdnWi1zT1HZG3OACfSGM=;
	h=Date:From:To:Cc:Subject:From;
	b=mwtFSOt+1ml5Gwaej42ipk7zdAk0Vo08H7G9XIXMBGG9v9EOQzm8gox01nuflgkqL
	 TO/yrPsJMazXUM23LBG2DUn/J97ufOpANStf9JKeruP9krUDHfYzWyVhrDX9QXJeUx
	 7Bjsbblm3I6VcztSOas0qjOcEa186UoG3wbprMLhXfIFPi92G2LZy01pdDgMnLRk9j
	 Z1S5IErhkWJIcu49PDh1f/1p/+NMyF35/DdMJq4a7aqyMhG2Fu1HL0kxuQPoXHOw6q
	 Moeq9vmuEF0Cde+wHwrJCouTACNk7de1O5dB4mYYYt+Cihuc4qTISH6u9CP6ljIZdj
	 GzYwGzUxyDEnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zc6Y5696Vz4xM7;
	Tue, 15 Apr 2025 11:50:01 +1000 (AEST)
Date: Tue, 15 Apr 2025 11:50:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the ipsec-next tree
Message-ID: <20250415115000.08d2d16a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nT4OyU7NxTV_yCc1TMY35J9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nT4OyU7NxTV_yCc1TMY35J9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the ipsec tree as different commits
(but the same patches):

  ee2fc517feba ("espintcp: remove encap socket caching to avoid reference l=
eak")
  4f1d804e288e ("espintcp: fix skb leaks")

These are commits

  028363685bd0 ("espintcp: remove encap socket caching to avoid reference l=
eak")
  63c1f19a3be3 ("espintcp: fix skb leaks")

in the ipsec tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nT4OyU7NxTV_yCc1TMY35J9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf9u0gACgkQAVBC80lX
0Gxn8gf/UFTV2evs7kTYyj/k063pAnA9VJ0cWuH7Ohv8gQ/53WmjY8fgJioj3Jan
+iRrhFIelz/u+6iix4iPbl9MuH1RWKrjUaCoD8nLl6Tu5P+EvhbJvTFFYxeUorWN
jG+KYND/05ixQdE1PY/RMnJoZYBJz9YL7v8J+nkPMODkgQHjrgmfiRNcAQ+KnaXV
RSlt33qE8iBA3AvQWF+8nwzai3e+hTsL+TG8aWZXHN1jB+ufDt89Qm3Z1IWBU5Ap
jx7FbKBqpRWo4dttLrV7GgpYzSPxvLzs6BL4FSScDZkW60SLtQoXKLhtFcyXL2je
iBO4IzpOmmo+WzyCqNP0krNeLRHB2A==
=9kIM
-----END PGP SIGNATURE-----

--Sig_/nT4OyU7NxTV_yCc1TMY35J9--

