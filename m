Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 828BAC1989
	for <lists+linux-next@lfdr.de>; Sun, 29 Sep 2019 23:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfI2VJg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Sep 2019 17:09:36 -0400
Received: from ozlabs.org ([203.11.71.1]:59095 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbfI2VJg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Sep 2019 17:09:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hJ7d713Bz9sPJ;
        Mon, 30 Sep 2019 07:09:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569791374;
        bh=tWRZCat4/UwzEcEmfVXIX8jvNO/PY9P9Fu2GO8vElTQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Kt5kkCBETAamvN5idSPVP6RG/gZoRDMJJ+81Z9Wp2sWVRL3EYPV1WG053aWnnIYNf
         bibkZPKLMvYx6ga2DoK+5cEAmJlMOHURHPeQAmu9rnDi/vfFQS/gCTCm1Gw1okvlE5
         xIXOGYfhO+7qtV+gtg5/UmJ9gpMs6siOwLIigYKDQCaa/5EAaru3FxsNSAleOKcbQU
         8y9kWU8e8aBWpKZJR3/BkrM/yp9l5Sq1WPc5Iy32K7dE0yYxLRuPIgLnP1pOBL3KQX
         /Of7Oemo6E5ADh4G6vdGeLAEAQkwmDI/BgtIuV/kKAwF4VlElRCBbVh6arhHiuEi2w
         LjJw3Qnyuv7IA==
Date:   Mon, 30 Sep 2019 07:09:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux-kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: no release today
Message-ID: <20190930070928.1f5f2487@canb.auug.org.au>
In-Reply-To: <20190916013727.GT4352@sirena.co.uk>
References: <20190905160237.2e972a89@canb.auug.org.au>
        <20190916013727.GT4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m2U0PcRWVFkf9o_o9Ais1r_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m2U0PcRWVFkf9o_o9Ais1r_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, 16 Sep 2019 02:37:27 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 05, 2019 at 04:02:37PM +1000, Stephen Rothwell wrote:
>=20
> > As I said yesterday, there will be no release today, or any day until
> > September 30. =20
>=20
> I'm going to try to provide some builds for this week (16th-20th).
> There may also be a build for the 15th depending on how much rebuilding
> the rest of the trees is needed for the build I've got ongoing.

I just want to say a big thank you for taking this on again.

--=20
Cheers,
Stephen Rothwell

--Sig_/m2U0PcRWVFkf9o_o9Ais1r_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2RHYgACgkQAVBC80lX
0GwzGgf+OOBYfalIIufa3ZPLkqScuoNWtvYRckc/zB+S/Jc5766yF92cpjaJM7Cu
i9EHU4nYv/U0dTlcf0QexnumpZ/pn2NiQtiCstHTmfnAcy1+Exmtz6TvOtEedQGV
CQ+nFJKVkI+Q/gxnGFavjiSPDYzNDL4B5esy5yU9EjjkSpTVveLXJj2N3uUB0lZr
0IElqxzHNVTGaAiVL2F/2dXkicE3fiitHdr590rERwpYXFeQwIVEXt5+yDbukBnc
QL8rXSBDeO89MH3btOkiJU+fBjnKsMPnfaSn2O6UigoB7ts3IUNoxFelU2txL9nk
R9jBPScl9LXtsURWyULXQHdUxv8vrw==
=gM9o
-----END PGP SIGNATURE-----

--Sig_/m2U0PcRWVFkf9o_o9Ais1r_--
