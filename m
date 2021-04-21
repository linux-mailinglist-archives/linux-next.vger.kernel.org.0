Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E89B36652A
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235326AbhDUGIA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:08:00 -0400
Received: from ozlabs.org ([203.11.71.1]:44507 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232194AbhDUGIA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Apr 2021 02:08:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ97f13Zkz9t5m;
        Wed, 21 Apr 2021 16:07:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618985246;
        bh=e5dw5TlCXSFBTVzqeYivpahEnI476h2guzOPYxUKMm8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=egxmkRL7YOzjpJ181NjLwKsBEqsAkzaOWdavCSAAk2qvCmaLvoHj5CaYWcgeadDtN
         tPUQpBcK/249MLnrrpuQK11qDcrHw17c12zuDTj5H10ca/w+a9XR/bt/v9QuQNCTON
         /ZycLCsoCHdKFN0NDDmQ8qdzT/xbCB6Dh3woP5TngjaArEpY7GY6DL9QzOhNFRjtj1
         sRhRNjVrgx5jrr8wQeaEAaioYwbXahSXl3RZPKyQ1hoJ+HNpcoUm7rcsJQEGvkmDQ9
         BI2Nl4yTM6l53dD2Z+gxwxjtbXpOjemLSeXObfYjZRsMumsov/sAVYVF9vrfcDuNpG
         IjuNYDJQ4LSXg==
Date:   Wed, 21 Apr 2021 16:07:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <20210421160725.5623cbd8@canb.auug.org.au>
In-Reply-To: <20210310134916.367c96b5@canb.auug.org.au>
References: <20210310134916.367c96b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sWgxs+xUC3=BTieI3F6qtN=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sWgxs+xUC3=BTieI3F6qtN=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Mar 2021 13:49:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the usb tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> include/linux/usb/ch9.h:1: warning: no structured comments found
>=20
> Introduced by commit
>=20
>   855b35ea96c4 ("usb: common: move function's kerneldoc next to its defin=
ition")

I am still seeing thus warning (as of next-20210420).

--=20
Cheers,
Stephen Rothwell

--Sig_/sWgxs+xUC3=BTieI3F6qtN=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/wR0ACgkQAVBC80lX
0GyUmwgAjjjm5ZC+jfg/5tK/+dWpAPRQr5bOZBLTMkeAOP2S/HEDE5ipebCS6yYq
LfpmiRQcoAEKZ2pkPL6cjSeTnrHpMeLgNIYlAa9G4RljRwyCdwUPYwRSVXyFH75A
HQuZx3cE3t8mKNWyMNCj23qdLoapKSKpqBjff6Gkk03v0xzurPUJ8MCqAUMXCs45
uaAnwN3c6Q2+2gINSH++dwVki8HEOVJZb1elO4fgUTSkpdAdTJZyECDgp6fJEy/v
ykNmKC1qtySfgAC5HoR8nUu8qPn8PhuHCTdtVe8p1D/0cwVZCsICYR8kJBaOGhKj
PQI0ws5KgDUWcAWL6ecvP4ZJtdwQOg==
=c1OG
-----END PGP SIGNATURE-----

--Sig_/sWgxs+xUC3=BTieI3F6qtN=--
