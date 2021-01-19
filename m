Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C453C2FB1F5
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 07:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730080AbhASGrq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 01:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbhASGqg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2021 01:46:36 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4C7C061573;
        Mon, 18 Jan 2021 22:45:56 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKfLS4mvLz9sCD;
        Tue, 19 Jan 2021 17:45:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611038752;
        bh=k5MNvFbW5tFWhSOuk5jXGRMMZ8moR8cDEkb8qC5L/hE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rVqII02LiXpvLab5MCUyHBE9NuCrBj14Cmpbt48YdRuQAyfNZ8LaWUgR8Enq6P98p
         uV1cEGXhNtP18LOlDwsuK6Bkm96aLX6IUnIkhEIGkLTSbSXotUh0iZjpEXNOH45fTm
         LDBieZD8Ha+EFXgnEVW7Xi0QmQ6SI/H/crspnZBSrXniUiDH8RdhI2wm7J8bcfHHN/
         l5SAwIxP1gvVLK4hEb3O7bHuQtm5W2UJwnbvIA7Oqvj+r24xf6hJouwjNurUe2HqXo
         nIgqfvjsmHJNCYfVKduRzCNYzhf6skAJW9pkj3sx1WXb8gDQRuxFZv/avZZgGNk1gp
         JsyqR0VIi5f3w==
Date:   Tue, 19 Jan 2021 17:45:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the jc_docs tree
Message-ID: <20210119174550.3f7e9a7b@canb.auug.org.au>
In-Reply-To: <20210119171303.6be1bb1f@canb.auug.org.au>
References: <20210119171303.6be1bb1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/064ryLahMhUD8b+4YoSXG4h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/064ryLahMhUD8b+4YoSXG4h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 Jan 2021 17:13:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the jc_docs tree, today's linux-next build (KCONFIG_NAME)

This was a "make htmldocs"

--=20
Cheers,
Stephen Rothwell

--Sig_/064ryLahMhUD8b+4YoSXG4h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAGgB4ACgkQAVBC80lX
0Gw0lQf+OXwtGtWtSYyYVGfjmt6WncWdjwVHKTEiu3O+Vh4q4bPQXAljYr0wUO9b
VnrMf5cUv/3UzMrgsP8cKIGIqf9AYshf8Sp8mzsFUr5nabHB0wb6Oc6xHz1YJ8+n
ChFQ2W4vT9kGP+/4WPigohXFYEGWe/HxRx5bnaJa5SXkm18VsMk7wIhOO6nRItdM
KkDTFidpkwNFXZqiLoGjXVGz0n0aJwtat5O2DGajDXa9AlF0aQ3++ZyljbgklvEI
EUNUy124XFBAZTpsxd6UbNqREFxYY0SNGUa7a2B4XC4WCvM6K7cRS9lDwOUMTDpW
1HWz7BdnEI27p0ImLLu+12fPC/IMYg==
=DMwZ
-----END PGP SIGNATURE-----

--Sig_/064ryLahMhUD8b+4YoSXG4h--
