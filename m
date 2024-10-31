Return-Path: <linux-next+bounces-4548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD89B7318
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 04:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43F69B248B3
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 03:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BC413BACB;
	Thu, 31 Oct 2024 03:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QFH4x62Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93113C8FF;
	Thu, 31 Oct 2024 03:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730345745; cv=none; b=WCULO2OCFfmX18+TW4UoVDCFuxdc+ZfaQnIifBdGTNnD76771Tih0CWnU1/kRfLdV06woUDLq1ZNW5X0qQpO8AdEwZDE0HZPexrtwgsOklHYVczUenHA5h2WyKBH4eckAWH2iPbcWl1wrGtXFZsVEDe/JrSiYx+g/tLgO/rXa8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730345745; c=relaxed/simple;
	bh=26i46pRdPzompy+NrkcNeMv7dtfpjcrfXnWfv5yixR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pftefpvhpSICjyU/r1NAjph/oRae2BVhQYdi6RvNG4oxFCFzwagORhxgyxTs26ihTju/pozrRQ2wxsNqz2VwZDiLP4hamE06xch/jsmagPSgI3/KbUlWaFrkGxJq4Z8wnRfPnHKWQCysjzHVSiHX4T7wYExCW+FIbHBTLrtakvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QFH4x62Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730345737;
	bh=BDnVGbphNvmoHA9jNQU2vj5qIFGIsTc0ddmwPV6jeIQ=;
	h=Date:From:To:Cc:Subject:From;
	b=QFH4x62Q8VLMfohNB3QAGy+8ID7gIHYoJ2GsGK2wwvnrl28Seqi1/babe7BzQ7ml6
	 DAoNajC6iH3LO10sEO82ElV6QKiXG1i2qeSrUP4EhvriPDWe1VsEsvMOLED9wK62Qo
	 txq1Xpsr53cD4eHIg6b1Y378eZIsEDYF+nLv1s1gzh3Zhy9Q1uyaKxzN96r/gF+64+
	 HM5JDv3dlwyEwTHm131zoB9Oz6cqO2r30dJt3EXIqijwYNmXMl9CqNoq5l8J9JuJqa
	 /7LDG2RPq54HK4QNUeQhxQh/YqSgZcY6/6qvHTMvuw1lEpv7PYYNrgbppW550+zvB3
	 fFkFCovKdEJGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xf8lX52Qlz4xPQ;
	Thu, 31 Oct 2024 14:35:36 +1100 (AEDT)
Date: Thu, 31 Oct 2024 14:35:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20241031143519.73eca58b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/foNkk=YMbxreuP_=4Z4W8Jt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/foNkk=YMbxreuP_=4Z4W8Jt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/tools/sysreg

between commit:

  034993461890 ("arm64/sysreg: Update ID_AA64MMFR1_EL1 to DDI0601 2024-09")

from the arm64 tree and commit:

  9ae424d2a1ae ("arm64: Define ID_AA64MMFR1_EL1.HAFDBS advertising FEAT_HAF=
T")

from the kvm-arm tree.

I fixed it up (the former is a superset of the latter) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/foNkk=YMbxreuP_=4Z4W8Jt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmci+vcACgkQAVBC80lX
0GyBtwf/QzePuoFKop4OFs+6D8og5FLQ4p5lMWOYIFcg0dLtRYmpTJ4fzZNDpzBl
a7V1aL5j2qrpcvWaO3ZULcepMq2wGqJQU4IQD1nqjzbQW517+a0atePwDmzOu4tp
1XdnIQrA4CwBoDyLSIfTx4LtsHSI32wMDFZuMxfrsBwxkwt8JAGmo+/DWb1sZmm4
035KeFwZk8sWRChVMh1Ly6iMy6NTu6hus4OVQ1utKW/vj+ILl0eqTTbTsDhvvi99
1ekmjJt1D6CgcolHQcQ/zZDyK/4MyE+bprIbepcE7O8K6naXMtAeCjODn9c6OOG3
dPwCo+OBhrHVVXluiQEiV5JMJluG4w==
=YjvS
-----END PGP SIGNATURE-----

--Sig_/foNkk=YMbxreuP_=4Z4W8Jt--

