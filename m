Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4CC1A8E27
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 00:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407798AbgDNWAs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 18:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407796AbgDNWAl (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 18:00:41 -0400
X-Greylist: delayed 69640 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Apr 2020 15:00:41 PDT
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C344C061A0C;
        Tue, 14 Apr 2020 15:00:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 491zvB3Rg7z9sSb;
        Wed, 15 Apr 2020 08:00:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586901638;
        bh=O2xyf63zz92Kh+ncbm4xkRJgMYx7t/5yuzF7FoRYTD0=;
        h=Date:From:To:Cc:Subject:From;
        b=pkmYyRQi7YuHfO7Xjd0wpfWZD1SdrXPgQMajJJoHDf0n6dNWF4knM4kxpSKOPAe5i
         TnH+mBAItTn+5MtGMV0UFuFfk6CL7f2s3cNyYbyNWb+4FTaDnJ3S3GwFS7xJ8dlkJD
         ma1SXk5GoTVtk4pFOi8MpK4RHIMV3m4/pAo3o32JlayNkrUkDMmXUuQq7s6NY4mRMQ
         Im9nwsVtHofn7+TFrkhPYNwcIWfqcUPbf2WhxCjl9zmXh73QdbFEP3lm+bw2zB8jBD
         KphrFFqLhMbUQ/TuueV8F5aTe+JCBVr/yyCnhxafsX0V25IWavtMe3RLbAx+QjXvAb
         wMIWvVwSpiLVg==
Date:   Wed, 15 Apr 2020 08:00:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20200415080037.770b1c24@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kQqA6SS=nI5oqmF2G6IcM=p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kQqA6SS=nI5oqmF2G6IcM=p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9de300abb71f ("soc/stm/stm32_sub_sai: Add missing '\n' in log messages")

Fixes tag

  Fixes: 3e086ed("ASoC: stm32: add SAI drivers")

has these problem(s):

  - missing space between the SHA1 and the subject
  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").
  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/kQqA6SS=nI5oqmF2G6IcM=p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6WMoUACgkQAVBC80lX
0GxQGggAlooVNoM5JAWYc4HR6X/fijtmZenNydilDIwlbOR79DS9ctv4r466VNxU
0nQk87+B1Rvx0wu06lMTwcmi90AjetfME0dr2B2WYsC7xynaU2AOIV7T6vrbwtD+
csvs14e/jMrJACPgfvKlW8SNPCatz6GPVR+ZZB7FOdM/TRRc8bwRrhG/9VDmNVNQ
sh/2LWeD6Zzp2DmBM1TC9UDaxMRjdd174RFStGqZLRgqB5vnicOTH0K/amyU5u2m
o0135ju5hFL+wIXjGt9I1QkejzT0YO5Vnai+UPikrg6OqhNeJR2VEv8OaNxYiGST
oJcCakeJOe2sxn7gBqg7J94ylDnRzQ==
=dClg
-----END PGP SIGNATURE-----

--Sig_/kQqA6SS=nI5oqmF2G6IcM=p--
