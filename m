Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D84F2D3F52
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 10:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgLIJ6j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 04:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728613AbgLIJ6j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 04:58:39 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98F4C0613CF;
        Wed,  9 Dec 2020 01:57:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrXXz6c7gz9sW9;
        Wed,  9 Dec 2020 20:57:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607507876;
        bh=7bTqQY2Bw5OuvnieZpKVgk+ANaIaWZn/UZwAIeXDG5Q=;
        h=Date:From:To:Cc:Subject:From;
        b=d1fCGf0fma3oehetnw6MKc+c0xe8pL8r+iEDWB7VdPCsXjZH4q6+7YjkGImgyv7Zl
         eFw97nr5uWDfcl4i2x5wmTrEj3LQnzfagsuDEDGya7+1aCDTS/2BG5yPbg+LTi3u42
         Gp0z2zjbsmE9IZKB2TzrnNxwY4VBWSy98yajLQwBYHv8qgQM2rgxLMRDaNpwvOnhKI
         xHZYTRU/N42NBSmYoLJsfVhBIfGDn+fE0xvmQKw6nhhItywDZylIVf/9yVb8B40a/s
         hIJV4guLGubPf4kllb5N1QYMMP/smApjSPwB448BYa79wvru5Yj/8jgI3jE7nNlVxj
         dfF0JqDjwRYIg==
Date:   Wed, 9 Dec 2020 20:57:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <20201209205754.41ac2424@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GBWtwE=0wr3p2aPCNnpjwYP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GBWtwE=0wr3p2aPCNnpjwYP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (htmldocs) failed
like this:

Sphinx parallel build error:
docutils.utils.SystemMessage: /home/sfr/next/next/Documentation/ABI/testing=
/sysfs-platform_profile.rst:1: (SEVERE/4) Missing matching underline for se=
ction title overline.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Platform Profile Selection (e.g. :ref:`\/sys\/firmware\/acpi\/platform_pro=
file <abi_sys_firmware_acpi_platform_profile>`)

Caused by commit

  ff950bebd0e0 ("Documentation: Add documentation for new platform_profile =
sysfs attribute")

--=20
Cheers,
Stephen Rothwell

--Sig_/GBWtwE=0wr3p2aPCNnpjwYP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Qn6IACgkQAVBC80lX
0Gx7iwf+IMrk4Pl2JS1ix6OdcSuPL46e8qgaoz3l4wkIB9oD3hhpZ5hIdjV0m4U3
++t3dsjMWpWTjGkIr9Y1lpWPYC1MoDxjk0HkATiOQMcR591jsqNJ4y3vz7eNaKoI
NYd1aIpPfzTEAEswp6sEfO6NepxMlyvwGaEe2or//J8wKU3V8AJYLbn6M/wlpvA5
4OFoC6HZvtm+oDlGTeplu+E4ggSdrNQVEDDOkWk5nYyyxg7k3P+ckKC9yIuFnlrD
ZqD6CcZ4wIhA9jRQCHujfXDw5tCCRNigKvUPwAoSRTVxYsmiSw2S+lPyAjb/TEDC
vLgQn0aN2OOvNMzyZBdtJiFunH7/tw==
=06jS
-----END PGP SIGNATURE-----

--Sig_/GBWtwE=0wr3p2aPCNnpjwYP--
