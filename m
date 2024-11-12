Return-Path: <linux-next+bounces-4751-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1609C4BFB
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 02:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E519B28162
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 01:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F55F204F81;
	Tue, 12 Nov 2024 01:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p+v7Jfmu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E579204F79;
	Tue, 12 Nov 2024 01:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731375000; cv=none; b=tvWEN0VKoFhYIJJvYnLd3j/x9J81CxniGTXkA4nVrTN06OTu3D6pV1xKhTDwxJ9J//XWbOIxemT3ih8P2CTp9T0uNMZGm5QnzID8nWpflJGgKkETWNWxPu8BbTDPW4xvT+g53j1VCX1FPhw7sJj6N4kP4JP6OlSdeZlecZsbZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731375000; c=relaxed/simple;
	bh=4AtblFUI6+eGtMVE3ACZWziOgw0C2JSjPUfDWP5nHug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/5IQxhmg+G0k5upLO+x2CMTTQtdPupW8ql2I5k2uR2oXToY0FPE2Kh8iGg0P2zAJsWyE2IAkOMyYt7OyKrEJvbELLQd/A7AtW4tYJ8BDc34hrF2k2f3fw+WmNStaJVlNHw3xhiS7makrsKyPqsm/oPYdcGSm3gqhX1XkmaRM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p+v7Jfmu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731374985;
	bh=4AtblFUI6+eGtMVE3ACZWziOgw0C2JSjPUfDWP5nHug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p+v7JfmuqUr700nW1KIYxlCszY2UBBW3bC+LLgFzwyP8PoJQuXrESz9oesZqR5bvJ
	 qv3/52Kkk8MYzCNuyNSpjwMoguVyNjjJI9SYxHo9dFrbWB4zA/4kxyiUykbbT4gj88
	 OdWBR1GnRu+fuf9feyojenZ7K6Va20A5PI/+uV06YKi0zrYfH1CkLk7HkvKxvQc4dy
	 bXXc4CF/14aiAkwL9JitKAecgU4jXWzdj5lrLuFq/g9guNh61NvncFI/Hq0HCJz5w1
	 3EBBGZjhihGc6aqEfV1QjQVFxF6RIyVrjoPP22f4C4moH0bO00KpFob8Eqbd/k6MKU
	 yvhelq6eheYtQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XnTNn1tVvz4w2L;
	Tue, 12 Nov 2024 12:29:45 +1100 (AEDT)
Date: Tue, 12 Nov 2024 12:29:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20241112122945.06acc684@canb.auug.org.au>
In-Reply-To: <CANiq72mYq-53xB9WFTH3H78WLrQuJze-nEybjwyLqnrSbv8UqA@mail.gmail.com>
References: <20241111175842.550fc29d@canb.auug.org.au>
	<CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
	<CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
	<CANiq72mYq-53xB9WFTH3H78WLrQuJze-nEybjwyLqnrSbv8UqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZlUfw3G9lE3nHFGKlGDQuyG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZlUfw3G9lE3nHFGKlGDQuyG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, 12 Nov 2024 00:58:47 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> On Mon, Nov 11, 2024 at 9:28=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > remapping", i.e. taking the commit as-is without the next commit,
> > since we should be able to do most of the renames already. =20
>=20
> Stephen: I went with this, since unless I did something wrong, you
> should see those build failures are gone, i.e. your build resolutions
> were fine.
>=20
> The hashes didn't change, I just dropped the top two commits.
>=20
> You should be able to reuse the resolutions from yesterday.
>=20
> If needed, we may simplify further, but let's see if this way works.

Thanks, I will let you know.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZlUfw3G9lE3nHFGKlGDQuyG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcyr4kACgkQAVBC80lX
0GxGjQf/T65hyCeyKYp8f9hoVAIfxVQBolMC62BdWEK2MWMEJ1aNYBoS9fvFUcdX
vU00njz9fdJ2q+ePVzWVamEmoM6QJEPLvIIcuTvXJYnm0QEbT52bJPRv/W2X7gql
+OoRjwZ00MwZxjKcfaijgzOHx5xNRxNrUg27ZJtMASN9dg6LeGyD4I/CXs8mXgOS
vcs5Dh4MMdtkf79oIGGZvIbfIEtIJEswhP/tXDw/eUJBtzK1gXdX9FZEaP2fuHxT
RhscsDIgRrPdFnN+2CdOLdk6TXlIp9f1MsolhPTzzdrBfye92W9w+RMXG//C7ZoU
h9wtxJ1jfQblUjeqrrVIMdmS+1fIIA==
=2afS
-----END PGP SIGNATURE-----

--Sig_/ZlUfw3G9lE3nHFGKlGDQuyG--

