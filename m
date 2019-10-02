Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94248C9422
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2019 00:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfJBWLF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Oct 2019 18:11:05 -0400
Received: from ozlabs.org ([203.11.71.1]:50715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbfJBWLF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Oct 2019 18:11:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46k9MB5tYcz9sN1;
        Thu,  3 Oct 2019 08:11:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570054263;
        bh=RsivGogRl6D2le2py64jRkkGF+iW43j3KmN09zfUH8w=;
        h=Date:From:To:Cc:Subject:From;
        b=fmlvcA0a9DOMmSwUNwVR7qeupb3/s70dstTOqD6u6cka604g52vwoA5ANrI8s4RMx
         oP8VOBD69PHiw+5mz07yVpbPcx9yUK16L6N0zv6CITrqvQ2vi3Rr56WRUgYdhjaCSc
         BJHSoarms7+u7OKdWfVtUPn4noDgflg6PF4JffRGXMftuDVf07YoVJtdjIM+pX10tu
         ajchj7Xp7sqeMr3bKjTLQl9X5+hh/N6yd8WIXH49r/2sPlgtRy30/7UEfF/eSjlzuN
         kYnXZFNtfGnOfF3EDrKvbBuua54/qjdGnaVwr4OUst7oFdPaQP8HsmdphajfwlOv0x
         p0LyP7tfdkmCA==
Date:   Thu, 3 Oct 2019 08:11:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shirish S <shirish.s@amd.com>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20191003081101.517d34a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PvDnJoh5jpWLDBi3by=8IEp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PvDnJoh5jpWLDBi3by=8IEp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8c9f69bc5cc4 ("drm/amdgpu: fix build error without CONFIG_HSA_AMD")

Fixes tag

  Fixes: 1abb680ad371 ("drm/amdgpu: disable gfxoff while use no H/W schedul=
ing policy")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: aa978594cf7f ("drm/amdgpu: disable gfxoff while use no H/W schedulin=
g policy")

--=20
Cheers,
Stephen Rothwell

--Sig_/PvDnJoh5jpWLDBi3by=8IEp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2VIHUACgkQAVBC80lX
0Gx3FAgApiqg0xU2IYzAmaFX4Da4hXmByeS4Yzl+Ffps8Z+hH1rBXp6ORT2B6p4K
YBoCEonw7J9+Q2sdZifMse+Fq/SZxWNVFls9uwoa8M14VXCUnJV7giN5lL5RnNez
lrNinzwlihLb+vZff1NhQ9b9xTWlUkXy+91lAuXZ4TK55+yHOxykedRawuHUX7HN
dSNQp/2Etk1wcnlVC6hPqAgMIBx77f/swg3aAYJU8v05vPIZ/7uaXe6+5bQmM61L
Lqxy59EjAFwJvV9kkIY+STYZv2BDfPnAhjSEBYOY2PPtPk9k2gs0cKHUPsgNPnR+
6Nq8Qu8UN70TtBI3Nen8cFSOMgfO3w==
=mEh+
-----END PGP SIGNATURE-----

--Sig_/PvDnJoh5jpWLDBi3by=8IEp--
