Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3EE3434E7
	for <lists+linux-next@lfdr.de>; Sun, 21 Mar 2021 21:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhCUUvi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 16:51:38 -0400
Received: from ozlabs.org ([203.11.71.1]:51381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230021AbhCUUvO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Mar 2021 16:51:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3VCd4Vyfz9sS8;
        Mon, 22 Mar 2021 07:51:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616359870;
        bh=6OyEPoHHt9lxqHMckID3RzP0+i3SPtvDftoxrfTrNs0=;
        h=Date:From:To:Cc:Subject:From;
        b=Qk2J+Xg/YRTlpXX+q1h6qF1qKvTq7OdSvr/mmWttaLXSc3d7ZOAZbhR+DF0h1mBs/
         eqOBKK/Lil7EQgeZlbb+8+ebOe2n6yAqWBrvFHI8eqtrg5oqTe1J6SNx/DxVMcLjBO
         wAE5XWSTeUMkG+ji12goj1rDdclMIgifS1oSahCA1G4cP/jxsmbfmUNM3sZgw8NtOB
         dDU6+tTg7ezpvE/Ci0UY+NE4uTEqw6hwkDb7DfzOaqkNOsPmwcqfdtlRZd/00H4lpI
         avAy598qRX/nxDTi12y2reZxtODXIZEPYVk5HMbiPXSW/uaKmT0gY0lLZKjLmdWTG1
         kQg7G2e2gD/LQ==
Date:   Mon, 22 Mar 2021 07:51:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Pawel Laszczak <pawell@cadence.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the usb-chipidea-fixes
 tree
Message-ID: <20210322075108.3967d5d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IqeoT5Gr+By3chUz4Hj9JLD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IqeoT5Gr+By3chUz4Hj9JLD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  67a788c7c3e7 ("usb: cdnsp: Fixes issue with dequeuing requests after disa=
bling endpoint")

Fixes tag

  Fixes: commit 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence U=
SBSSP DRD Driver")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/IqeoT5Gr+By3chUz4Hj9JLD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBXsbwACgkQAVBC80lX
0GwvOgf9GsaCPZY742aMqi3wgmMMGUH/6uX32IuP9M/rF76BJozImLW0+O6YRDkn
vw2FhZofhm3ciwja/oJMcG6KC9Ez26IjvbQOgZCD4GxyixbL84bZtrKmVNyHIkZd
DJnlzP4kFBb/pD5Fj9WND1foOiy06rjydMOv3oVY1Er2Jjs4JU1VfhtZfDYqviFA
O2oZAVz8aNvPw1zs1qctOctItIuP3KbdVDo/w3SkZYr8z7NzLDVwdiYxfJj8V8J/
eaaYqFnLjXuNTDlsjcbPaF1R/huaKGbbY4tPNasmGyklhjnXGRnwt+bWPJZnGf+w
dOUkouQ3WpvXtIry6/2E/IogqIDpPg==
=EUp5
-----END PGP SIGNATURE-----

--Sig_/IqeoT5Gr+By3chUz4Hj9JLD--
