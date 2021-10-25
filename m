Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14897438D55
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 03:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhJYB56 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 21:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJYB55 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 21:57:57 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F4EC061745;
        Sun, 24 Oct 2021 18:55:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hcyhk5Wppz4xYy;
        Mon, 25 Oct 2021 12:55:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635126935;
        bh=P0XjyRWWXAVb0oPOKlvBVANsP8TDCXeKludKZnXf0lM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Bq+iQwFjQMNG/HlLN7F/a0Aej4PqVg85vEv99/PsW58YKF3y457F3nWv4uWK6v1KC
         dJUL/TaMRU5kvqa1hBL+JXzznv0g8lHvXN7d0PFw1nPOAWyl1dz6w+wXmY8TgBFZZP
         lo9aKHnAyBow1PShsPc1rlIRPZfHwpF8i89T5UZDSGrYwqYglRpripGq0Bd/aNaRga
         fRy5Nm741LOuq9pntHsXkoOZDJXNh6SyVvdEyx9nngnQOpXiNjK4Cw0iHc1fWCp1/2
         QeZXhRNvTmFGk4vTuuResqz962jl+cbVFgaMJG8zWliIg2zNApxl6dfZob7PVCXfe1
         vDDs7r/Wju5BA==
Date:   Mon, 25 Oct 2021 12:55:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211025125534.4681416a@canb.auug.org.au>
In-Reply-To: <20211018193048.14517460@canb.auug.org.au>
References: <20211018193048.14517460@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PfL.q=7mAcyWsc9_=nliIj/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PfL.q=7mAcyWsc9_=nliIj/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Oct 2021 19:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the kspp-gustavo tree, today's linux-next build (sparc64
> defconfig) failed like this:
>=20
> sparc64-linux-gcc: error: unrecognized command line option '-Wcast-functi=
on-type'; did you mean '-Wbad-function-cast'?
>=20
> $ sparc64-linux-gcc --version
> sparc64-linux-gcc (Custom f51944395b6aa154) 7.3.1 20180130
>=20
> Caused by commit
>=20
>   21078041965e ("Makefile: Enable -Wcast-function-type")
>=20
> I have reverted that commit for today.

I am still reverting that commit ...

--=20
Cheers,
Stephen Rothwell

--Sig_/PfL.q=7mAcyWsc9_=nliIj/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2DpYACgkQAVBC80lX
0GyXEAf+MkFDGwEjyrGOJ4JhCeKwTHwNLzU6Wf9OnJ29J49dv+tNkS35kUUyM1Uv
NS20F4arh0KHQ8ARC5DyMNKzbA0fCYRiSc+SIhiBenk3ubZ2anF1OEk6eM0eY4QW
gVmUfUBGjRg67T/9WRM/TNzYIDVKR4iRWPSwLTkPd/XDFvrq4BLn1zqp2BdIWTSX
sOgTaiY5EXpH33dkCUwtE+6kl7nKTotWOY8eIcy9h3JNtRQif6amvHlZRZfoUXbd
e9TtPuXCNjr/iyfnivtFLlLKQj62XWkUDRsdGFECWDoE39DXxeAwXb2dSmCQG9C5
3MBiZmsaVQ7HFASS0YOP+aXLzpxEpQ==
=2bt8
-----END PGP SIGNATURE-----

--Sig_/PfL.q=7mAcyWsc9_=nliIj/--
