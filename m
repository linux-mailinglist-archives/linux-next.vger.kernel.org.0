Return-Path: <linux-next+bounces-3489-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F649636B4
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 02:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB001C210D4
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 00:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F039F17FE;
	Thu, 29 Aug 2024 00:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AP2qp5FB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A876236B;
	Thu, 29 Aug 2024 00:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724890263; cv=none; b=LDuKbDsoSn7nAilxs/Lo8jOlEPZL69R5V4QAMeaTJ/x8q25ZwWcY6mBibauKyAWQfbRmGh/pEH+YCl11RXhH533iyDHJJT6oMRW1XvCD/Xy+T2xh22788XFjCvf6zomc+GZZ53lz2ru8rKon/KfciKQIZo44ZbHxPP4XGD3kEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724890263; c=relaxed/simple;
	bh=+rRS4QYWMsXHwEygl9hxX77ERdn3n5uZCodH7u3Oko4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMKFSD4bJwCodFWoVdRuGz2lImbibrGenQr7yLBwHi13Zu8rGtvbkugkkRxgzXw6/FBh+ZOOEs4kIIJdI4NX30YvbEo1fIl4p1xVlbDLvpHFEufREjV0VKypxqCuPQlQxydQc+hg+F2NSd4OaMRI8D80pGxRUMNHd82w+cIGvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AP2qp5FB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724890258;
	bh=DvmFRoOXMWLoClFIxHNRmceAHCrX9fNDpGyyVHhuQ3M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AP2qp5FBvgazIlZgaJg7TAsAuhI2EiReNwFyIMo9JVOP42GUNZLnnYauY/Jppu4de
	 m/aiP+8bk9zsUTmUMiryDiMWEtQm/MiCtGVtbjxtqTYlU/2FuIdJPH2Q71zeEPoF91
	 2Im3astdk3CMMCj9/M4nqnKp5huUGjUmFov/jifE60A8yllcHkAyq2cwhu/z+HP+lM
	 aM8+FLOVuJ15Sut8A3uHdGrWvZktJ8M0VETrnFDgqNbCn3FJJuVCQbXpYhp1rLrtKa
	 VndrzSKlyTz/h9CQmlsRyXhRVM9W+Ppcb/8scEKFeVItMa0cAd+C+okEgRsU20YW6+
	 +9Ymm2HcE9dMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvMBT0b2hz4wxH;
	Thu, 29 Aug 2024 10:10:57 +1000 (AEST)
Date: Thu, 29 Aug 2024 10:10:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jason Xing <kernelxing@tencent.com>,
 Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Xueming Feng <kuro@kuroa.me>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240829101056.47cd3b61@canb.auug.org.au>
In-Reply-To: <CAL+tcoC0Wh5uREYs48Oq7yyKjChbY895NTr8CuSf+2BVWToaTA@mail.gmail.com>
References: <20240828112207.5c199d41@canb.auug.org.au>
	<CAL+tcoC0Wh5uREYs48Oq7yyKjChbY895NTr8CuSf+2BVWToaTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JYbYle9A+259YtpIRA5X91V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JYbYle9A+259YtpIRA5X91V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Thu, 29 Aug 2024 08:04:16 +0800 Jason Xing <kerneljasonxing@gmail.com> w=
rote:
>
> On Wed, Aug 28, 2024 at 9:22=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > diff --cc net/ipv4/tcp.c
> > index 831a18dc7aa6,8514257f4ecd..000000000000
> > --- a/net/ipv4/tcp.c
> > +++ b/net/ipv4/tcp.c
> > @@@ -4653,10 -4649,12 +4656,10 @@@ int tcp_abort(struct sock *sk, int e=
rr
> >         local_bh_disable();
> >         bh_lock_sock(sk);
> >
> >  -      if (!sock_flag(sk, SOCK_DEAD)) {
> >  -              if (tcp_need_reset(sk->sk_state))
> >  -                      tcp_send_active_reset(sk, GFP_ATOMIC,
> >  -                                            SK_RST_REASON_TCP_STATE);
> >  -              tcp_done_with_error(sk, err);
> >  -      }
> >  +      if (tcp_need_reset(sk->sk_state))
> >  +              tcp_send_active_reset(sk, GFP_ATOMIC,
> > -                                     SK_RST_REASON_NOT_SPECIFIED);
> > ++                                    SK_RST_REASON_TCP_STATE); =20
>=20
> "++"?

This is a "combined diff" of the merge commit.  The "++" line does not
appear verbatim in either of the parent trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/JYbYle9A+259YtpIRA5X91V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbPvJAACgkQAVBC80lX
0Gy8vggAkPoAtlhRr80RmtBQpv6xWagfox7kRPLzQSj0dBYYQyJgaoTzq0tUywc4
qATCxckR7eNdCbW8vc5M1QIyngUukenyv8Jf0p+06fRVxDNX7DnH1TkMNDxHO8RE
VbQhxRla/2Ve3kOSn+Z1QcHrxYwWIXWATSExvHHtsonSXdo7wFbLe0rO6aBc5jqQ
Cvlz8l4xqAa7oY5LEmKT2dad1jAwsYfJoN+Wnm1IbN7fZgMgjXx0MauyBx+Jv0mY
Cs8AR4nL2YCEcKEWVpX8O8CRSH5YrXPWs8xkNZ7my68GwuPiX34piWEh4kw9WDkx
zlsW9PW76QFZ3RbD+It5I/C3oq8cig==
=8r1k
-----END PGP SIGNATURE-----

--Sig_/JYbYle9A+259YtpIRA5X91V--

