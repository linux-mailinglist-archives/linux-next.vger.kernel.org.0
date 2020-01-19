Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0FB141ACD
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 02:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgASBNw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Jan 2020 20:13:52 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgASBNw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 18 Jan 2020 20:13:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 480cJF4XMCz9sNF;
        Sun, 19 Jan 2020 12:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579396430;
        bh=LDAvg3g4XF4jb8yqToBBuvSRYfwbc6qcUob5orNpPOg=;
        h=Date:From:To:Cc:Subject:From;
        b=f2tyhy1mTu3jKfkMKxVdEDTOuX0Ol1v3IFkYq+s+y5AtGtlsbUxGgi4lFPGBlQV9a
         TaZ0jNauhHxaIJ1yD+0EveG6drf+78hvuLFudV/6Ak8bhUP6hnI+b34UnigcfM4Lqy
         NLovd0SdXv1jxFS3iIzGR33PQgzyno+hJNFAUSWZNs29h3UqV5lgud3v75XGg4cF2n
         EfOIGUnYA/HlwX7cLtt28qv/EHBU0pKyk4cEcA9D0vTKCY0NQnlfF3ifLr14OCtc4d
         b0SyO9BVGf6YkKhSRg2IRbwX7LlQ1BTO7FotZQvD5f1xBVu46i9inOf26xje9H9+nl
         2hzKyD9ZGsodQ==
Date:   Sun, 19 Jan 2020 12:13:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Message-ID: <20200119121348.1f0ba618@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hqZzsq4maTpjuBzys4DYYWP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hqZzsq4maTpjuBzys4DYYWP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a6947c9d86bc ("ASoC: SOF: Intel: hda: Fix SKL dai count")

Fixes tag

  Fixes: ac42b142cd76 ("ASoC: SOF: Intel: hda: Add iDisp4 DAI")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: dd96daca6c83 ("ASoC: SOF: Intel: Add APL/CNL HW DSP support")

--=20
Cheers,
Stephen Rothwell

--Sig_/hqZzsq4maTpjuBzys4DYYWP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4jrUwACgkQAVBC80lX
0GySjQf/SIm/0pvuydMvMrGT8dBW8AM5QzySzDqm/dzqCMIAkzG0xdxUhSX8KqTq
9L063pUnNPUWWqHfbhfSy7HeTC+NJRIfg1WTVBZEUP9/13m6S6l4RsMoICdyf311
KxOJx15jI2O5UJGyySvnDnaBogynwKEiRN6leE/kLjQ3CYmE2MfGAy6rexu6YZzW
vqu9sYNU4Fv++E2gixdZ/2bsK6Gp5kBwpNs5hYuzEJJiGgWPx+roqXXeeqt/gqq6
CuQgavxqKG6w7ADWGhrxewylImWcfZtgkMqkP8cwu1ZS7rowulkFhZlxOF6WkBFR
v58vTfW9S9k7Q0EDShHX+kcwFRBX6A==
=iDEB
-----END PGP SIGNATURE-----

--Sig_/hqZzsq4maTpjuBzys4DYYWP--
