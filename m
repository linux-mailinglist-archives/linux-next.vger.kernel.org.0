Return-Path: <linux-next+bounces-6695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B8AAB33DC
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 11:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FAC4188D293
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 09:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEDC25B680;
	Mon, 12 May 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sWXf4GsG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF59D25B669;
	Mon, 12 May 2025 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042815; cv=none; b=PpQyguij67XAUa7/wzVjj3vIZUvpd+myglD0PyA+ttOBFRI8Zn0+PujsiBLlsYmuVcVEEukqDqJ0eEt1LoLKo9IuCp7ucAxHRGbqOHNCpwp/rpQxOcKgLvdDMOHAjuF0CJ44K/k+aNztF5qCL1yHKq3u9dUGPvqJGh7QmQ1RlCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042815; c=relaxed/simple;
	bh=iIHf/Ip4F9B0ByfdX3mApcBxIp6w7x727g6UmnSPAik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SmKdshuYAWOfslHTWglmOp5DORHnLlNyZHBkRacAvBP0Pif7XUMl7ptsPAqVmtdkNKQd3WD1ziOIrLNwHgBIlqZLxjIsXqicQ+xGHHLHAa+DA9jlAyhNbBC3UZelGvvu/KGFppFs4xCeTayzV+QMlr8g0Chuj9jDUsQmklH5oic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sWXf4GsG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747042809;
	bh=pfHe8Q+o64Ex/RBn0WtBU883NQ4o8Ldu9qKCx3KCc5E=;
	h=Date:From:To:Cc:Subject:From;
	b=sWXf4GsGodSRf4b3cHSbiyjCv+Hl5Kd9kfiFkwZo63UQgIfz/zlqeuVYhI3DXYgNm
	 TG+HTTTg6HlTy419u7P1fqhJF3QIovMBmjA5agp/okApfZJuJDzaFT2XG/ql9OaeFB
	 Ah3NrO5sNVjATU9yTlOTvH18WfdJ/BzGHyCJqMDg2Qax0GFR0CUM13plkDzbfg7pB1
	 V6k66416PPuTefsFWlxhnyw9jiYiGvlRdrOS2Pa5ZzB5c9UOhlxS+zaqFsVy8bQOJN
	 NEYzDLlwu51XPPNJScMkgGvwJa6K9amYsCODg2dZXCrjhjRBfUvgdVb2Lx538uyKV6
	 ltOJKzjifwDog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwvj55m8tz4wnp;
	Mon, 12 May 2025 19:40:09 +1000 (AEST)
Date: Mon, 12 May 2025 19:40:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20250512194008.3bf1bd47@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/of3sVe_FlIeceRug=bezX6A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/of3sVe_FlIeceRug=bezX6A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree and the other rust trees, today's linux-next
build (x86_64 allmodconfig) failed like this:

error[E0599]: no method named `cast_mut` found for raw pointer `*mut auxili=
ary_device` in the current scope
   --> rust/kernel/auxiliary.rs:239:83
    |
239 |         let adev =3D unsafe { container_of!(dev, bindings::auxiliary_=
device, dev) }.cast_mut();
    |                                                                      =
             ^^^^^^^^
    |
help: there is a method `as_mut` with a similar name
    |
239 |         let adev =3D unsafe { container_of!(dev, bindings::auxiliary_=
device, dev) }.as_mut();
    |                                                                      =
             ~~~~~~

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0599`.

Not sure what caused this and that file has not changed from
next-20250509, so I have used the rust tree from next-20250509 for today.
Clearly I need help with the merge resolution here.



--=20
Cheers,
Stephen Rothwell

--Sig_/of3sVe_FlIeceRug=bezX6A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghwfkACgkQAVBC80lX
0GwwBggAmcVkKyyZ2/0tsu3YzOd5Dy/hueYP4Hxia8+fbHLKiVz4L4qIUji97RvU
g48Om4ifo7MScfxWVHRlpIoFHxRJ357FN6X4Ku97DgFA12QvDppyojTvCcnrZ/rE
Zqux9QFLnn9c7r98q0eWu+J9YOqxAkNWxQp0FICgU7ROSxTgyd2ID9TGL57LwZIb
NdJV+LD7UDhfFpvar1JGDMRly5ogHbePdnhxJITFzHpvJDT/eKgxNhsYdqf/lZ6M
AaEjnB1fhQ5AVWPg7VF96wUzsovjxd8k9a6t6Ab96L5bV2qmi6U1Imm3Q++5akwE
al4MEbx2tv3JdkZEyWeYS8llmKTztg==
=59T4
-----END PGP SIGNATURE-----

--Sig_/of3sVe_FlIeceRug=bezX6A--

