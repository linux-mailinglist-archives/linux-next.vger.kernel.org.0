Return-Path: <linux-next+bounces-7254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E63AE969E
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 09:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D46170A7B
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 07:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B482E237717;
	Thu, 26 Jun 2025 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AnwVaLiI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C08219E0;
	Thu, 26 Jun 2025 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921810; cv=none; b=YiT4gr2iyzGBVPaRVwLMPGERT83EbddLJLX20p7lKZOaso3gx6sYiKpW9312iXeMfX5n1lQOTHazpr+eM/KGLrnrviulh5zuHJo+6H3bCdV8qMut8ljrrEET+C3+jiHhy7EZaSWGmAVuMo4Zh/0l7MC/yIW09iaTT3g7iCMsUSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921810; c=relaxed/simple;
	bh=HRQJ2iC0NVg4c6iolgj0wTA2RLfQLz0qwgS9uCgVNgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rPsSSWvDyLDZ6wW/q90dG20b7NkiEib+bB3CiLpOCdcmM8VGnUVp8ghsb5rqg6BheY2N+lVKPsMEXt8Z7RJ1qumYvckYxOiU8nvqY4whrnC9cqPBW1bktbzKI4pmA3TLnk6vsjpTBd+13ql7GeBqcmddLQbxCiix61SyrdVLE40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AnwVaLiI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750921805;
	bh=fZjZ3OPE3+nwxXu19BJGW/xdwFHGOH2Xa86ZkVIual8=;
	h=Date:From:To:Cc:Subject:From;
	b=AnwVaLiIxQQEdsdzHCN7iPYtJobTU/lmM8Xu3Do6FFfN+iuZhrG1ZopfAjnNiTxCz
	 UkUJZFxtzyVYjXKsOfBKONRSHYpY6D67Lp+3D5OzRFUynZkRqi0qYYprRNS4bmSb6J
	 JMMeYhBRJpYD8k0aPNW12/PLEjMXedFjAAwx4fz078loLw2pXCTq0DJwQRLNvJpNKm
	 h6EWw2j+HdZUX5lYMhcyDeKtd6iGKWa4XwuKx70ybqQpxuijtZHuqJ4eGKgY+/JB4K
	 vhcihpudKZTBNiZo3SY9IwdpVN4Cfz+xq6Y6NIU1RSEkI+IdgoZ6J2fi6ikJILhoR0
	 nLhbX2WsbPAqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bSVF93KJhz4wbn;
	Thu, 26 Jun 2025 17:10:05 +1000 (AEST)
Date: Thu, 26 Jun 2025 17:10:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kvm-x86 tree
Message-ID: <20250626171004.7a1a024b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cNp+.wCzKT+A/.FPCTS1DnH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cNp+.wCzKT+A/.FPCTS1DnH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-x86 tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/virt/kvm/x86/intel-tdx.rst:232: WARNING: Title underline too =
short.

KVM_TDX_TERMINATE_VM
------------------- [docutils]

Introduced by commit

  111a7311a016 ("KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM")

--=20
Cheers,
Stephen Rothwell

--Sig_/cNp+.wCzKT+A/.FPCTS1DnH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhc8kwACgkQAVBC80lX
0GyOXQgAmhhn9UfGyJtrOBeV8c9i0vMEVPcH/KZjkoLmPXBZUuP0+OR968Yz5EcC
Fcvy5ZZF5/1u8rziEtjA5iud6bct4CvkyvW6SYOB2TZzP5Zug8k79I+mCZntwn0p
BFEA++mILFr6+p/nZSrugv3MdDotBnIdxbFeYfC4fVec74PYzL+uOIk9Pg01/G0y
bjicB5n1X5RzU+iqCbnCZY3hMYmAtzacDq0csILtLCmRwylyHT95AEoVggao8wSp
AypSBZP4/U8DzfZ6GOqDSMJKMD9t2Y2fraUjrI3wkiX2ywXSJdOFbKzleLqIdZaA
4SYZTsOLnFD7CjJ8VA01dU52ZswLFg==
=+OAx
-----END PGP SIGNATURE-----

--Sig_/cNp+.wCzKT+A/.FPCTS1DnH--

