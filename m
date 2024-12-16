Return-Path: <linux-next+bounces-4963-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48A29F2981
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 06:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B0B164C55
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 05:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CB51BC064;
	Mon, 16 Dec 2024 05:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o6PuSGoQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1482153573;
	Mon, 16 Dec 2024 05:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734326719; cv=none; b=shf4jkMInfJfv9wURnzSJFm37cJdhiX5lw49hyjrB5mkfOeZ3w5RmdnRwHr/5WYz64lrQK6eoKCCI8h3FZkW2sQlv+gHzjsGkFYHLxYsgiKMYXGtnV+I6g6Fy79fiQ4G0k0Elsw2jMXO6cTzJViQtofSuj34ZuuACrgs7FiAhWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734326719; c=relaxed/simple;
	bh=sBXURjaXgJAFhUjlzdz2CCQIngbs7L9OSeXDID3SZn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X/BifknXm66qSvgzEaPs0tMg75hsilUXdtKnCalKIvpLH7Zg4P2TCjKVki7NR5h7vNxZPhy5VCOvnrTr84wwkOMVpsVUNqC33IQE2cta6UdgTGNQR4RDiNmR4seAVDYr/FyzXZdW3qjsuQceE6qA+t12ZjBiK/8rn0CG6sJjlFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o6PuSGoQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734326708;
	bh=8/GswG6ob9Bc3tz7SQEhZ+6A5uI5NrFI8UWlnvlWeSs=;
	h=Date:From:To:Cc:Subject:From;
	b=o6PuSGoQGDzV+JXcjEED0WrFIK1oULfsEN3m/FhJOuVJoX1AIrvtLxA0IAbYMjXZX
	 cdKhmvbkSo4nyFpWZ25Ian4woYFO0l6lQGEYrW241OWj0kkMAG+z7ql2vU0d9J//ly
	 2huApPFEK7uKmMj4kn/RPJgYtKFAvCc8yeVITKvPPcilHBjabAlHfDe46l5Lx7U4WD
	 opP5OaZvPyptJ39Lkt6ggELVybhIEj/11i1HAU8AW9dyrguCitZqkzLafTbfa+gUrg
	 /vegt7bDf9eGAGT8Hdjaq0EQtZSs95z0fs6BbOH6OP2/xtRdkOAdR0lwUIssQJ+SE0
	 Sv8VirGIyNhJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBT0g62Tkz4wcj;
	Mon, 16 Dec 2024 16:25:07 +1100 (AEDT)
Date: Mon, 16 Dec 2024 16:25:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20241216162512.064724b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/akRmKP7MqoKo2U_k9Cg.5ih";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/akRmKP7MqoKo2U_k9Cg.5ih
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0308]: mismatched types
   --> drivers/gpu/drm/drm_panic_qr.rs:961:60
    |
961 |         let url_cstr: &CStr =3D unsafe { CStr::from_char_ptr(url) };
    |                                        ------------------- ^^^ expect=
ed `*const u8`, found `*const i8`
    |                                        |
    |                                        arguments to this function are=
 incorrect
    |
    =3D note: expected raw pointer `*const u8`
               found raw pointer `*const i8`
note: associated function defined here
   --> rust/kernel/str.rs:187:19
    |
187 |     pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -=
> &'a Self {
    |                   ^^^^^^^^^^^^^

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.

Caused by commit

  e721cd7570b2 ("rust: map `long` to `isize` and `char` to `u8`")

I have used the rust tree from next-20241213 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/akRmKP7MqoKo2U_k9Cg.5ih
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfubgACgkQAVBC80lX
0Gz5WAf+PRmZsfi/2rEmLF+vrNrCyWyvL4gs7SEM1BgzcoJrqAdNGeJNPJNpQqcm
5HG5XDIVmuHSyXc+J+Z4c0XaDKUfVLInTZbV4pYt0cRugJijbAriCmdjYwG76qW3
fdqw/jvOLCvLvos+sfXloPkBkBPZYkJBZcjuDgBmzusVi1vQ1/wFYCuLKec81OpB
tEgdSjinG6uvirqPXATcelCQCFkoP5sUrYGGwjNue7bu71moZO5Qs8e3IRiagWpe
CwJt8vaDiS9SQgIau38wKKRu8NeBcrj5JMr1gCO6qpNwlTEcKe2sAYjOR+oIN53H
c1XcYLOf8I9eQ+5PE0fsPSPSIypHmg==
=tbSa
-----END PGP SIGNATURE-----

--Sig_/akRmKP7MqoKo2U_k9Cg.5ih--

