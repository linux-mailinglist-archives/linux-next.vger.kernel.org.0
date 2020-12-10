Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72CD2D6BFC
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 00:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388202AbgLJXg4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 18:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgLJXgd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 18:36:33 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBA7C0613CF;
        Thu, 10 Dec 2020 15:35:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CsVfD67Sbz9sW8;
        Fri, 11 Dec 2020 10:35:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607643349;
        bh=wcU5q7qkwrj0LZoJbiU9O0AvuwJYA0jd92X0Q83Ui0w=;
        h=Date:From:To:Cc:Subject:From;
        b=XflqUoG6Se6l8I2NpyU/d1Ard59knHmK8JTekOEuiJr9VtJCKj9SgXqy64qWu+vo0
         MSf3idFrsmXuaEGuaRzFSytJeY9e5apC1xGCxeGlM0w1EGlGG4lHM0yditSUbQb+2g
         i1o4S8EmaYfFelWxx9pgoaLZvtLZmyzW1Ld0HHlwS4ikI6T7vkbIgdA9Dcb7rnFWK+
         x0TeXJ/sABXEDwGQdjuAmwbJGjqpz/qXKigVQx3kIDDlC/Xhzsk7ifVxp8yHKDWJct
         EjzxvamTHQ8w+NbI4eriVVCVhFeON28AnPyuvvl/fb8I5aaTHWHD13VdVoHYzk54Bz
         ZAcihx1KKB8hg==
Date:   Fri, 11 Dec 2020 10:35:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard@nod.at>
Cc:     Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the uml tree
Message-ID: <20201211103544.190e1bd5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tBSr8f7PZbAcCuhHbDsAANc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tBSr8f7PZbAcCuhHbDsAANc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1aa1cfc19405 ("um: Remove use of asprinf in umid.c")

Fixes tag

  Fixes: 492edce1306f (um: remove uses of variable length arrays)

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant:

Fixes: 0d4e5ac7e780 ("um: remove uses of variable length arrays")

--=20
Cheers,
Stephen Rothwell

--Sig_/tBSr8f7PZbAcCuhHbDsAANc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/SsNAACgkQAVBC80lX
0GzbnAf1Gsjc10Hsg4MKtbmfjRnTZsF17XD/zYnRUGmahz25PigKlyWZw1ab3vTV
rBYtgumcTJuNKg0Zh2xA9X0ek1ZNQC9H2gXXRoB8E3SbfvGlQQCqOfmJqiY+ffua
GVZqB5KKZg3nHlzDNyfj0wH+I5l/2C9xcb6LGDgWjCRbvyodx6W5PqM27lP8jtZ1
FMhfSjibSJDO7IiyZmiIJiqZo4kqvUqqt9Wk8JZF2lJt88K1R8lAaLoV+c83E2rW
yI1gpuT1TS3cEh9jRDLnuip9aFWCZlkYQq7l4HWwJex6B0ABCOWcJT9FhfureZCY
i3kDkVeDlflHien475n3G3/so2IO
=L9Z3
-----END PGP SIGNATURE-----

--Sig_/tBSr8f7PZbAcCuhHbDsAANc--
