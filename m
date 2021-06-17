Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24FB3ABF06
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 00:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhFQWjo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 18:39:44 -0400
Received: from ozlabs.org ([203.11.71.1]:52055 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232661AbhFQWjo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 18:39:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5cPm331wz9sRf;
        Fri, 18 Jun 2021 08:37:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623969453;
        bh=M5UB9WRJ6An9Z6EqUYEWOhrgrmtFtXMCXaZLA/HVdK8=;
        h=Date:From:To:Cc:Subject:From;
        b=CY52DDXIZwgnqK5VyplUJG+HH9GTu1tgH92SuVVm2sVEYC9yCxft4RBDf0+IdLBK1
         btiFdFseyKI+2j9FqcjQIrUaDLSdVq4QcKjGVzdoI47odv8Xlbc+JQq0N3q1LXuD+N
         WVDGo25SxZ45tfpE7OIF2XWBbeOsErRls0fComHIVKizFLxHi0eDbdAVfX2IM2572Z
         xMqw5gc8qKP5wZxx1Ks1yZrTrau/rq+pYjzeaN9MGwlM73vsXd6aayidRzdipgleNF
         mDUQ49KoH8DmZxHNphhup17oCNi/XXTGWKicN0qTOnCl5ink4muRgThRQqsrfINIaZ
         yOQG6o76Uq2EA==
Date:   Fri, 18 Jun 2021 08:37:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the drivers-x86
 tree
Message-ID: <20210618083731.2481f7b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GD18h2yq8Mf_15FBd=KSs4/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GD18h2yq8Mf_15FBd=KSs4/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  de5db8ebe7de ("tools/power/x86/intel-speed-select: v1.10 release")
  f45d05b29cca ("tools/power/x86/intel-speed-select: Fix uncore memory freq=
uency display")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/GD18h2yq8Mf_15FBd=KSs4/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDLzqsACgkQAVBC80lX
0GwTiwf/ThW36llcpem4mhBg4QdM6hoktM3PLQaQbNtd7GQPlaD8/XdEMtzEq9OX
b0dgGGrSIAsucnpOSu9bV16MBYWGfV2zaLHBNhq/qDZ1B706ICi29S1o2QwO/lde
xpVfvNo8RgGorgjaAlTtPtBPSLxRF11MRsdR5X4pCcRrJJSm/9UwOaTO3DdD0kHB
RjR9dhBHHJKCkfiaOaPEzS0EPe1O1DNbtigsfnESDkzSk5/0qgbB3pD3Ehj5kz+T
lHmN82ODtb1URTqv+U9CA2tGH508Uj10lZb5RZzWC5eTflKxfkABiCu/2QGq0wAR
vx54fmEYfAmiusl6JtjrfmqNIHewbw==
=JlnV
-----END PGP SIGNATURE-----

--Sig_/GD18h2yq8Mf_15FBd=KSs4/--
