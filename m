Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9CF16F391
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 00:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbgBYXps (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 18:45:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51833 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726827AbgBYXps (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 18:45:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48RwY66pLTz9sPk;
        Wed, 26 Feb 2020 10:45:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582674347;
        bh=fKVIVyscS5daYgdSxfbEf05yg+Mb5e/kjWVc93gdnBI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qVegK2nrWk4WQWs5KnuQtEl3lx+Orp7y3jRl5kKB3pBq4kevJJ2uHrujbHRAPX+Z7
         8WXHyTqDLmcmGcTxj8v2aDZw84Euck+0Auu2snX3iHKrE/wAxIcxwX6KJ58rZiRD46
         1GTk6LjIspFVZ4qUjE5LLCUfbkknvMk4PqoKntb0Nx8UBsh94rWbb9q3AycmWTnh/K
         jXkm/EqvNAf7Z/WTmEbXLFOWaAksU2bFPcBG6Beel31V8u74d2TvRZHrSEqcK5QTIw
         63PnJd6eDkmK5POH2Lizqfscz6Ckc6PK+vue/fvc/ik+JUyeGMKXMRUZNuTOacgBkB
         vrFQ+DV7vnNlA==
Date:   Wed, 26 Feb 2020 10:45:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: error when fetching the kasan-bitops tree
Message-ID: <20200226104546.5260bdce@canb.auug.org.au>
In-Reply-To: <87o8tmz14c.fsf@mpe.ellerman.id.au>
References: <20200226080344.609a0bf8@canb.auug.org.au>
        <87o8tmz14c.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WP/sZYvK9C++J_JEmSPg6g1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WP/sZYvK9C++J_JEmSPg6g1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 26 Feb 2020 10:41:07 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >
> > Fetching the kasan-bitops tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git#topic/=
kasan-bitops)
> > produces this error:
> >
> > fatal: couldn't find remote ref refs/heads/topic/kasan-bitops
> >
> > Should I just remove it? =20
>=20
> Yes please.
>=20
> It was merged a while back. Sorry I forgot you had it in linux-next.

Consider it gone.

--=20
Cheers,
Stephen Rothwell

--Sig_/WP/sZYvK9C++J_JEmSPg6g1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5VsaoACgkQAVBC80lX
0GxfvggApSkMXwuIDuTXQ/FPkKZ21vvdT9NM61j7weK30XJXdNfVr+u4G05ofTNn
0J5ErE8DAZJAfi1dyZ9WVYDLmFA0XX7wOZ9h/GHi7prZmnP/wCxn3TOXZkoQyRtf
71Furt2IKrLBlj8Rl6KdmI6E8TC0zmwMnPDapxO7rj8CkMkg5I3edGU9s5GV3gv6
pHfgm4CGzrL8Cz5/0rdUm2Ln9Y6OxzNXeAseoQ/o+7dczmF+vaI/YdpddoeCypht
c+vcxWRdeDymt0AINbarKjP82QHYMoK6xEPLCB65AXKdmnxjU7dU+dIJuFVCLXVP
OMLWPiHJ9+12sa+ESea0Uu1U1CCxMg==
=QhQc
-----END PGP SIGNATURE-----

--Sig_/WP/sZYvK9C++J_JEmSPg6g1--
