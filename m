Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39F43F584E
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 08:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhHXGf1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 02:35:27 -0400
Received: from ozlabs.org ([203.11.71.1]:47469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231473AbhHXGfV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 02:35:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtzqJ3rt0z9sW5;
        Tue, 24 Aug 2021 16:34:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629786877;
        bh=pwe4jd3RfqQMBUiQ7+nux4c2/Z+gqVc2xDkoD6Dvg2A=;
        h=Date:From:To:Cc:Subject:From;
        b=lTMewDa5Jg5V//ZegDTjABBZXNzIWF4UoO06d+2Nt52DsUGdYy2hh938G4lXV2QMA
         0TK4CdlapZXBX2XmuP8NXrLcpjn05pGIF7UzrD3J02plitkejcOD2ulbaJMOipS6Wb
         CQ38u3KS2r+paHqdGEZtWp5KAYJYDY4mVXo2kzqhA31HQTFCYGKpRJOTceQYRJ6D0V
         IMY3/nIkk05VwZ84cE09brzci9vK7NwOQwfAXjAiLmn1j3YpBaW4VZn2WFG493uBE7
         9YH6qnJDGHCxtM0xeGU1idR/kycQlTYz+jCk769EixXvUczhArTh/VfJoj6I3ECF9E
         JqO82LbI4BcFw==
Date:   Tue, 24 Aug 2021 16:34:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the scsi-mkp tree
Message-ID: <20210824163435.429d389a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WtUB3Jo08f_MjDfHQWPd4S/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WtUB3Jo08f_MjDfHQWPd4S/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2b7661aa3f28 ("scsi: ufs: ufs-exynos: Fix static checker warning")

Fixes tag

  Fixes: 55f4b1f73631: "scsi: ufs: ufs-exynos: Add UFS host support for Exy=
nos SoCs"

has these problem(s):

  - missing space between the SHA1 and the subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/WtUB3Jo08f_MjDfHQWPd4S/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkkvsACgkQAVBC80lX
0GxyHwf/TZMnhxKzmEZxfZMPUHSY4xDRcAOUybjUzzpzLsv6Tq5lSOjWIUzeipVY
et8dv4+JfArsTiRQ+E0E1njErmQEuxavDQzHDUnbK5OBHZnGMXHCaL/6frMZVpWO
KqU29wdcvP6KDsB2t/Ev/hl8//MEsvOatm8tTjb8wKADQoftbadxzfGniSqJMOZn
IGMtkkTh+NStEGwG6u8AcZb4hpHSPt4NhAw/PgnxHXq2LRheZJtJ+f3iF+A6yBRe
ta5mzPCeETkecdNLTlfCd83N3yvf5sPI2xvXEONmhfpAaw29YpEPZFmbgv5ASnOD
uOQLRXprqhFhQ48F+9WZoDQwbdWqrw==
=u+3u
-----END PGP SIGNATURE-----

--Sig_/WtUB3Jo08f_MjDfHQWPd4S/--
