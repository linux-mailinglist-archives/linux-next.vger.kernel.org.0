Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089DD45AF08
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 23:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbhKWW3i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 17:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbhKWW3i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 17:29:38 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91A3C061574;
        Tue, 23 Nov 2021 14:26:27 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzJdV3GGrz4x5W;
        Wed, 24 Nov 2021 09:26:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637706382;
        bh=NLtud4bQ4OJ5I2CGDzmmKGc5/3hdP+jEfvzgPFG+rYU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rJ67+GXP8bDDxso+N/mot5p6/5ydzy9mZAEKvKChitxIDHWG2cP48Rx69vGx/BoMo
         VPivUjwoTznT7k+KN7TNrSr/RYmrtc5fh390kW9au6qKwjg4+yZHadkLZWCGDVKyk8
         3SD6vPl88wyMPgMUXmoDk4h3HRy5P1LtUkHADEP1gnMxPx/eVTBOBym76JkCc2lSLH
         WddCymm4/5+Fzl9Fg0AY5Etu6pFzomPvFZJUYwnV6cKKF7HCIypd0yeCfXc6MIhOTG
         Ctce39iPRTlcmCYbmU9FeU2ouwqYvz/Fr29UvkxTOamhxzuT6tUudQ45U/7eGPQV/4
         ohCOvtn2cl9WA==
Date:   Wed, 24 Nov 2021 09:26:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20211124092613.4a7d370a@canb.auug.org.au>
In-Reply-To: <CAJuCfpF6gyCNzkaq5QnthhV886ueFhkAJv4sJ6rtW+8Z-t0qmA@mail.gmail.com>
References: <20211123162635.29c8bccb@canb.auug.org.au>
        <CAJuCfpEvDOsNGcN9cqStx3PpoG_pJgQevvc+V6gcRrCUBa0YWA@mail.gmail.com>
        <CAJuCfpF6gyCNzkaq5QnthhV886ueFhkAJv4sJ6rtW+8Z-t0qmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O1ezrAzG5gUCytSZG7Pqy0M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O1ezrAzG5gUCytSZG7Pqy0M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Suren,

On Tue, 23 Nov 2021 11:03:47 -0800 Suren Baghdasaryan <surenb@google.com> w=
rote:
>
> I just posted a fix for the warning at
> https://lore.kernel.org/linux-next/20211123185928.2513763-1-surenb@google=
.com/T/#u
> One thing I'm not sure is that I used SHA from linux-next in the Fixes: f=
ield:
>=20
> Fixes: 2df148be9486 ("mm: add a field to store names for private
> anonymous memory")
>=20
> Not sure if that's acceptable. Please let me know if you want me to
> repost the fix without that line.

It doesn't really matter as Andrew will most likely squash this fixup
into the original patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/O1ezrAzG5gUCytSZG7Pqy0M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGdaoUACgkQAVBC80lX
0GzYqwf+OVBP/8I3r/nDaW/b8Z+lcaMFZwqr4QTU9U5gsR9K4AYtgj3Mi3QTz7cp
1vIo5gFq+GTgFge0zJdh03F2fpdDFTuxXiZc5r6M47pBMveyjfhgE3FAcKGG5foh
8ljP5WbC2FpHkrxAiSKrW+pawhNutV90qz2u5YfZD/Jq9KD6iQSD4t4XdyfTakoy
TrNt4x8B5u2J9H9aw/qCTpv1iHaMWs9UklYvzsnjha7U02uhQ/KJzr59QMQXbC1w
OWNJtDGNCTCAdxEB5mqPMcyFHTONhG9ZcrA4/SXsqJR9i2QPQzXwlF9+0OPP6sIP
cSNgMFaT999untz4DVfZ7iwLH65UNA==
=ptuU
-----END PGP SIGNATURE-----

--Sig_/O1ezrAzG5gUCytSZG7Pqy0M--
