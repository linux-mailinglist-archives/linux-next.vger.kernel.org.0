Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A023CDE085
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 22:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfJTUsG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Oct 2019 16:48:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60449 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbfJTUsF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Oct 2019 16:48:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xBg73nSkz9sP6;
        Mon, 21 Oct 2019 07:48:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571604483;
        bh=s8XV+vnfYhlu8LE2McxxMrvzRJVfDt0FJGFhECkLs04=;
        h=Date:From:To:Cc:Subject:From;
        b=fqSKegbnVBw5KFgVWCb21RN9hbe+bHzMvpbpcW7HqfFbtJOgjWdKgpNJnjlCWnX3C
         k81NX0H5E3z88Wmy2wbuEx1QE79svFRT/MdC8GDHMjfOkPYyn5LIAiDRJiaOudPDGl
         25g/iGoZaP8kILOvMbgDLJhOo+na4BthQbrAj0PoAvPp1sXvhpIOklXo1sADGzD1YG
         F4UO0tEZ4wJQokZyvk1d77318EAktOJOCOMGl2wiFh2Vip/ommO0y7g82eL4rG3tiR
         tr3TQ8q42bpefQoYU3PU71aDi3zuMbO3OLl67yK8ZR2gyiFiO6U8wPIJgm0VTjKsQm
         T7t/PZCGJPPBg==
Date:   Mon, 21 Oct 2019 07:48:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the coresight tree
Message-ID: <20191021074802.3404e7e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mF7A4S=VEP82na/Kspps.yt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mF7A4S=VEP82na/Kspps.yt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  38c2d9afa62b ("coresight: etm4x: Fix input validation for sysfs.")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/mF7A4S=VEP82na/Kspps.yt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2syAIACgkQAVBC80lX
0GxKegf9HKJpkMbw11vH8CgEBz0ubvO96TMMUY8ESpgRmPA/99qNshnpu9DcXaeD
1cd2YfjxeGB9J/VFEM5PzovtkppyS4KR3nvV1QiC28qFty2qTqR1YIX9e+FeaLnK
o/dAUwI3rjQfpZJ8WRkZjz0Z4HS/c8WEPIAHU0+Liyco7zVsJbXTVyt5cQHvy7Ev
ciX/hVrtR8gUDQlnrE14qpxqKtkGUOl9sRmBjTHRgjN36znEk+jmhlMnz/Q0V8NP
7IchxaBrZ6cQLLRiGnQIi6C+s1i52Ol22/zD/dHwnwcBhNbimFgdBWlA4rEl6elP
XEkolnMLFSp8fZyd4YEAq6b4iDQt+Q==
=k9UN
-----END PGP SIGNATURE-----

--Sig_/mF7A4S=VEP82na/Kspps.yt--
