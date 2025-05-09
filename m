Return-Path: <linux-next+bounces-6630-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0646AB0A91
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5127C4E0A11
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 06:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA04C26A1DA;
	Fri,  9 May 2025 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oNWobCd1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDD269CF1;
	Fri,  9 May 2025 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772147; cv=none; b=cKKrIeYFJbiszP/o7EomoB9Ub20DEs6xwQeThtqAzLCePCfaFTQX7EchXoXHn9xxgqr0KoU56ApoakgVVPuK5RuQ+HcDSF8tdOLYaxcxqe6NmD5AP1oVKdzJoz+t30MxGdq8mSPdtaB3kQtkJXcR49rVEX5qDrfe9sn1rW4ZmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772147; c=relaxed/simple;
	bh=kywdu2FXas4L3YPLsGAb8UCDtG5332pxZOYw7Oll8z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E2HIc6IMtLvc15uUVGmMhPiPQzYHoW9EGXzDKmEQi5GIZIE4T90mK+76SSez/zsmx/BlGQsWjUtNCJLctZq3uv1MiA2cUuwRtOdF0NFdjP/ZOZN/gms3jrVvNDF1GUF1JIjCysQAXcrphYzQW+mifWkVLMpIPH0n7sozkK5BHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oNWobCd1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746772143;
	bh=K2UlQfpU195Tsm7cO9w1Iim7hnaVu9KQM1cXlkewGeI=;
	h=Date:From:To:Cc:Subject:From;
	b=oNWobCd1Uvv774IqCFxCExJjwSzyIY4vlQP3o8Bquv8wkszezzChiFugl8pF4QPCA
	 bsgyEozws8opPbhHvfbvba3c7pEi7E1iJSPyAvr0um5G83+1z860/n8+fbkX4bvSaJ
	 YsE8NXuIxsJLYSsOehYVQoqjX8d/DxI/ElIFk1vOFNfv/sYWJrZ9E85Iebc3Qb+FCm
	 k5lTNpal5ymrSEvZYlfgEIIeXEfT/nJ5i52OKkB8B1GA0SlQny91yxSk9gi1tXcmJb
	 10Ggn7JtzZNknOqvr0dHK7RJkodfG8SHQYBbf5E6fPUlfpE7lDnzrdcWanHwCv+Alq
	 w/8cz2pM38eIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ztzby0ypSz4wj2;
	Fri,  9 May 2025 16:29:02 +1000 (AEST)
Date: Fri, 9 May 2025 16:29:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>
Subject: linux-next: manual merge of the drivers-x86 tree with the tip tree
Message-ID: <20250509162901.79e269a5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=JRMuB4F/LvhXRL.6+_GiZb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=JRMuB4F/LvhXRL.6+_GiZb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/intel/speed_select_if/isst_if_common.c

between commit:

  6fa17efe4544 ("x86/msr: Rename 'wrmsrl_safe()' to 'wrmsrq_safe()'")

from the tip tree and commit:

  c935ddfe65da ("platform/x86: ISST: Do Not Restore SST MSRs on CPU Online =
Operation")

from the drivers-x86 tree.

I fixed it up (the latter removed the code that the former updated) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=JRMuB4F/LvhXRL.6+_GiZb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdoK0ACgkQAVBC80lX
0GzbtQf7BHMiEjcdOtdKOf2C/QXQOPujVIQZu7fUVrrlWBCH9776zASAXBdke8jB
XyCj6C4OgLIgedHvptKDjh9xuEmw2JEkcb8L234G+7oE7MOjK7mN51r8nVZR2x09
Y5s7s/uV2gmQAf5RFbMtNPbAonAjbeU60r+44fjwQzB/eVk0wlqOC0uUXwhrVLSr
nIrPEn1/TDsN8V6BoFRMny3zOOIKeut91bp2YwRiwqgJErKdURmKI3clgFfnxYMo
4chtNXPk7a3CfDjZl5siKx+/XliBkMqv76DE5v/9RNXEiyGZvJEcMmd4BwgZOfQD
Qfp+1AX65TWGFZZOjNdyJynwnyB2KA==
=aA/N
-----END PGP SIGNATURE-----

--Sig_/=JRMuB4F/LvhXRL.6+_GiZb--

