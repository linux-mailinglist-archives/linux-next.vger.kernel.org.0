Return-Path: <linux-next+bounces-5644-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599FA4F4F5
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 03:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C13B03A5C9A
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 02:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6D0153800;
	Wed,  5 Mar 2025 02:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="evi437uv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43245C18;
	Wed,  5 Mar 2025 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143410; cv=none; b=n7I9QRlt29Rc57tmKNiH5mXQW+Y52+nIEREsNswQw78lavvtqPXZcawpYsR2ENI1FwtM0L3wqHG/QS0sIaVZG16Soq2VzIMPwE5kiretqnc7cUoyZPlSK3vRYJf8n9eVBMZWiExSlmpFgCJkhxk112pIGxhO2byFLrlFNrFQLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143410; c=relaxed/simple;
	bh=3RZh0YahMaV2gQPrxPPLPZ2E6i12ZNF5B8CuM7QvO7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JS8JTs0cLBKSD/QtMAPGfSglqf1vbVl2CVzYu8g3p6xu41AZ9wsPF8vXg+c2beMtgUpqCyCXhR5x7morXLoKxjYz1i1eckNOfwk+l/kgLnao2mAGhhTeXs7W6bZgGmjNXVueIbQiADtRa384LAPHKljj3ACpPdmOxBgQ4DjzgYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=evi437uv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741143400;
	bh=hQpxNfG2yaxsI2Pnco2+l+30uLMkjDdXfqKEb2AWhQg=;
	h=Date:From:To:Cc:Subject:From;
	b=evi437uvl/wPyJKt/iI0k2i/S+NS2rDM1b2ZwTtpxjob/pWW/cmD6dflnXGJpKClD
	 oMw0PX0srJo+aQyLrxl1df72Uyrp8wMIAV/gGb+RPXGLutkunKTfMjBNrNkemmsZjD
	 IkEeu4NmbTwI1qFw/x3qnWSdvdTiiLCCzhe5yzCi2SJjVLPraJeKt41KI6dNPz4YqI
	 J9BkGNH0xW9iVa1DSJtox/Su9q+9uK5R4hoJfWYrnww55oQZjAPIGZfSRFMMyzVSIk
	 v9T+jCZSiOQ9W6KrU35fGmgHnrRLfPYqJef5gxE7RcTkuhJVe2iqQvhg7CgogP7Bqc
	 NyfnZcswjLtvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6xyv3PGCz4wd0;
	Wed,  5 Mar 2025 13:56:39 +1100 (AEDT)
Date: Wed, 5 Mar 2025 13:56:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the ieee1394 tree
Message-ID: <20250305135637.51f92f44@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P2fME=KrEK8cftRDe6oIh55";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P2fME=KrEK8cftRDe6oIh55
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the jc_docs tree as a different commit
(but the same patch):

  1c745720bec2 ("drivers: firewire: firewire-cdev.h: fix identation on a ke=
rnel-doc markup")

This is commit

  62d6d20257a9 ("drivers: firewire: firewire-cdev.h: fix identation on a ke=
rnel-doc markup")

in the jc_docs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/P2fME=KrEK8cftRDe6oIh55
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfHvWUACgkQAVBC80lX
0GzyGgf8DzoFfhUs9D3sON3cwv6FNhsIivnMM4x90YEG4J/h18pBOwGYOhbnL3ak
q6HYVfuuiyyUICxY1v7XThpq/2J/BD3T3vhfod+7o41HuZA5rUZfSXCpyRPmvFal
KxvCxtivrJPl36PGg5gd6APP5jY/YyXGFMDTVJDuvUADwZv2zmqOnSD8PsIV3J6y
ixFkdySlzbSAQ5Wdo3dUmMzhuwd1eg+ILjQ/Hgmk1xXf9sZCONxYfC9YvRr1pjt1
r8bZIysqyq41y20Z+HT1dNkENoBUMkOFMmFR15oxBN9b41pNXTNbHStRabFQC5qm
7MVw+yx7Zg6duenVkHYDYBIHJdfxFg==
=bNKk
-----END PGP SIGNATURE-----

--Sig_/P2fME=KrEK8cftRDe6oIh55--

