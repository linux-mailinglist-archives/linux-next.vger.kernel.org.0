Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0087318DE2B
	for <lists+linux-next@lfdr.de>; Sat, 21 Mar 2020 06:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgCUF1L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 21 Mar 2020 01:27:11 -0400
Received: from ozlabs.org ([203.11.71.1]:52161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727824AbgCUF1L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 21 Mar 2020 01:27:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48kpzw1sLCz9sPk;
        Sat, 21 Mar 2020 16:27:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584768428;
        bh=hHNEuJzh9NM48meETWpTGaHnolvm0twgaWNs7jLeWlw=;
        h=Date:From:To:Cc:Subject:From;
        b=q7S4KBFIBf1eqLOnVECR3QSUT/1AiDgZwqtgTGitrTkPA0iCJU6eCQb4gT/ttTvni
         ORyjKXE3TdaZCWh5rxWW2r3Djcw88HlephK1kiVSm2eLEOXsSzJwAE4iYYwos8yhlX
         wDzybdv35szZUC+rCxRFwcQQZHcSMH1C1dI5jG1/COrftbdzYOXVHgGswT6bJvotPW
         kCEzi+f0iH15RyjSLcYby59Kd0v6qsW9sSt3atxA7gmXIK3v7LJ266ux93kP/pI6ue
         ZPfq2BnOThgGcToPtXPucutyXspDEAL6ycXMD1RpRFZwb5h/Ja37zkOSuZk7140NUs
         Ij7l1gWrFiAfQ==
Date:   Sat, 21 Mar 2020 16:27:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: linux-next: Fixes tag needs some work in the gpio tree
Message-ID: <20200321162707.5f4b1951@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YB1V9IvcHFhSdJ1BhTZN/qa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YB1V9IvcHFhSdJ1BhTZN/qa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1b26f3ba6117 ("gpiolib: acpi: Add quirk to ignore EC wakeups on HP x2 10 =
CHT + AXP288 model")

Fixes tag

  Fixes: aa23ca3d98f7 ("gpiolib: acpi: Add honor_wakeup module-option + qui=
rk mech

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not truncate the commit subject in Fixes tags.

--=20
Cheers,
Stephen Rothwell

--Sig_/YB1V9IvcHFhSdJ1BhTZN/qa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl51pasACgkQAVBC80lX
0GyuSwf/WjQIl0GTUhN4jvNf7GdWjRAWv24qtlfZzuNiPl5ITeHCIafzSaWiCRuz
ehN9dCdnK6nzXOBepp9o0efuSEUlxgHt5aBpShjOKma/NqPkGdT2TCHxpuNyfxBF
JaPyzxlKOvGwQACt3/i/E3yc051qHvSzvs+Hsya7rWvX/t1LkoSD7byhTLX/+wHH
gzoB/Udh1W4ByMI6EsnQt8cTWQzb4oX22ErCr0nNssQWsdW1Y9rg2r8i1KHDxEvN
vIwmj+M4Hy8E9bouiJCA+bOx+aEVuraVbzZkGF+5DQzFwbBYxchHqa+PcCOzGI7v
dT0+oB2CJRhXnVrEfVhd0Tliitwm7A==
=Xiwa
-----END PGP SIGNATURE-----

--Sig_/YB1V9IvcHFhSdJ1BhTZN/qa--
