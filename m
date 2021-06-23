Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3AD3B23AF
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 00:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWWyj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 18:54:39 -0400
Received: from ozlabs.org ([203.11.71.1]:39155 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhFWWyi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 18:54:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G9JS275Mlz9sV8;
        Thu, 24 Jun 2021 08:52:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624488739;
        bh=YTxTWDCl2htmPYBGAxRL4VBMNSZIIyBLcPcKhmWTcqc=;
        h=Date:From:To:Cc:Subject:From;
        b=PpYLNDvgMef/Yr1a1iDvJ4EFcE/ouqbf0f2E5833dEceKM49DTuw45LlvYlVvq79I
         nrAFYJ5BJ1DjENTMjPJzRp6RbCkj5+XxOH2VqMJCb9X3aNZNWD+0uUBq9NvOv0uFP0
         ou+Sh90E/oxzN8+4p6jAN5poV2PlNxL3ydlLERQ01OEjcuKdAWetUQOfN0gRHqfUzL
         RFOFTdmPR1j6tWDtjAoNPHetWTUq87AawIDoXkoC/qpPlNpbKMq5vnvjn4Xdol3A25
         E/365bGl5nGzQXtTzbhcL3SGduoWbVYt1gAF40OyNTRlMNzvdb3/Y/CgGALPiW8zmi
         +HyHU8CUg9HXQ==
Date:   Thu, 24 Jun 2021 08:52:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the leds tree
Message-ID: <20210624085218.54e081f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t.8s7cFA3GOYFvZ7sBh+mjU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t.8s7cFA3GOYFvZ7sBh+mjU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ea2866ca791c ("leds: ktd2692: Fix an error handling path")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/t.8s7cFA3GOYFvZ7sBh+mjU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDTuyIACgkQAVBC80lX
0GwNHwf7BtGCrfSlo6Gj6GGzFuhlp72wlovEwsPSfqauqoOzduQ6QOMvGYq7NpRs
D7OjmhKIiW0I1TDDgkYIkrBP/LJ5AU5lVAtGZ3zGg7tdrEnWT6EBEXHf+ibZ9J4B
NW4y/yn7TWeGs0TB6U5NFe5Gnh0RornIzFAXbrCe8OOKU3HOXEp6wWVHyzfDVGCt
UNtIw2OH+1bEQdHAYPUi+KkwYLGyMZ3a+WJyfT6k9IeBY5s8wPl9AYMi3lm58jwK
JYfdPU87pvb5xEWm2aY2ef52KBlLKr+pV+jao5qZEUv8uvnnfeE+UJkGU8gGnFol
HSnA+XGGmheajFA6/Cp4HR8wKCzmXA==
=wz4U
-----END PGP SIGNATURE-----

--Sig_/t.8s7cFA3GOYFvZ7sBh+mjU--
