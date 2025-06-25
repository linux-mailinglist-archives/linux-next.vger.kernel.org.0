Return-Path: <linux-next+bounces-7241-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2CAE742F
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 03:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4933B00C6
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 01:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A8B381C4;
	Wed, 25 Jun 2025 01:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gx10UoBj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565CD1805E;
	Wed, 25 Jun 2025 01:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814224; cv=none; b=r8YzAot56CSLwgxoCuaNXLMGbUqUT1aDJaxL1ofJazV0U05Ew9GZ2rtR02iXyBgJWI0pq4QZXkg6/HEIELxjBmSdVhs20wunbNhBZQp2bW9YfSQWJ0CbcCBxI6OjtgWCnHUQ5T+qbOGHW6srT6PCDdgvhi+Zptz5azLbXTn4Sbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814224; c=relaxed/simple;
	bh=5XUyihkrbOn6Ofo5+8+/PXUFLh8w4H2xDMzVhIlZItc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hLl+O4eIusK4MceithoiW3VhjOAPs0+ArBLF3AO/V7jetShi/uLrRJZ4OvaG5XycjJ9A98k9eUHV+FAJmLVlZPgikMh6f2h5M8zlAEnUNTn0SaW4HsQbW/e0o+u5QOLMzHBAYQKmLs4FDwNyhDlDB4phwb9kJjn61unZ7K2PHUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gx10UoBj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750814210;
	bh=q8tG0fJnUYEI2QIuf+b78tjrWWHHQ4It3k6SyeVQdgQ=;
	h=Date:From:To:Cc:Subject:From;
	b=gx10UoBjz5bH9VSVWwpzwtq67HKYS+fHJv+gqHBG5qHojIYCXUkCXlsQm2jPLIUom
	 SodmMB/0PWXsVJiRBi6rwT7DhqQzsrKuJ5SiFeWREDcIxgvKKj0qiohhKHkeTNoXUQ
	 /RW7c3U6rAZ27PR/sxnqH9qa9PLIFWpA9KGSHf2vt8gVN/QbLBud1e/55mRenaN9+8
	 QMd82x++17LB1fw5OxhXWl4pHIjwVXu9CPOeYb5GLhwbaDKOnxwGU2TVfykL0XEwGF
	 d4xPQFn+cUDzw/dhRn8lInvgB5VHNLhrQwy1hiIy1EPx0oG+fRKLKf+HYsK0C1iaxj
	 ZGrLKr4MCYR3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRkS20YJyz4wbR;
	Wed, 25 Jun 2025 11:16:49 +1000 (AEST)
Date: Wed, 25 Jun 2025 11:16:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250625111648.54026af1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/igzNDWfQ42yyE2E3gL/Wr=B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/igzNDWfQ42yyE2E3gL/Wr=B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  4500d2e8da07 ("Bluetooth: hci_core: Fix use-after-free in vhci_flush()")
  6c31dab4ff1e ("driver: bluetooth: hci_qca:fix unable to load the BT drive=
r")
  d5c2d5e0f1d3 ("Bluetooth: L2CAP: Fix L2CAP MTU negotiation")
  866fd57640ce ("Bluetooth: btintel_pcie: Fix potential race condition in f=
irmware download")

These are commits

  1d6123102e9f ("Bluetooth: hci_core: Fix use-after-free in vhci_flush()")
  db0ff7e15923 ("driver: bluetooth: hci_qca:fix unable to load the BT drive=
r")
  042bb9603c44 ("Bluetooth: L2CAP: Fix L2CAP MTU negotiation")
  89a33de31494 ("Bluetooth: btintel_pcie: Fix potential race condition in f=
irmware download")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/igzNDWfQ42yyE2E3gL/Wr=B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhbTgAACgkQAVBC80lX
0GyGGwf+NeHw3rO1+U3jZpuspVbql7TqyGYCsO+Z5ByFu2Rg2orbEgTGLXTIiNxw
GZ1EgAqE1pX/Ibfy1qR4zakNWgfZzGC+x5I4lp1/rlkuu0Y8v3t9dikj1BkUQ+qO
qHbsG75r8PBQjgZVp8I+Xtcuylo90MC4V9UAaLoPOZB/JQNEvW+3v/1SYCTVBdWs
pbeUhFOWk72C129SohaIkwHRZGdH2dWqqStmFKYU81HrLgn7SBFH43ZW0NybGhHp
edNACtgYCz4WgyjR5BZ3hy9rdpxXbNVhmCLMdcXUqof7hDwRBjIeBsBzU+gMlfwj
mF3ZBPAC5es6305HDioGyEt2u6qFJg==
=J3FK
-----END PGP SIGNATURE-----

--Sig_/igzNDWfQ42yyE2E3gL/Wr=B--

