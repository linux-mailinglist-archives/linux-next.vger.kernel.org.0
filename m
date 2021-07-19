Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45AF3CCDCE
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 08:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhGSGUD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 02:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhGSGUD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2021 02:20:03 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA07CC061762;
        Sun, 18 Jul 2021 23:17:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GSs7X37Zgz9sCD;
        Mon, 19 Jul 2021 16:16:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626675420;
        bh=pkk8P46Jrx5QnMnt5CGxX/9lY0lMs7VkihO+vVhu5fg=;
        h=Date:From:To:Cc:Subject:From;
        b=UwiVGxIJO2vOWh9mn7wt9s01pcc1uW2z+U4CiX0C3o0PV2HLenpZ/zwhEUdfQhAqx
         j09Hd6NiZnq03+fkLfjU20BUq7RM+A8+0P2aeWyVqdH5YhYYiycfsiGaQVO1OaRp85
         IUckxEbEx90AfIOxHSuNUTbfWUwaOEiVygEoGZouHwg+qyfpQAC4atWnrJpAR+5lrH
         P38ocGC66VgONt4lUCPuT71tLW0rnlJKrhrDRGcnmknlxgas2l0FLFzr5kYQx5OPWa
         fHe50PWiQW58/t8jsma8nPGTSxiDnxc1O+Nab0dJjYAnoHS2q0QKK3jbr0QBDSM3+o
         +5wsecJl/LP5Q==
Date:   Mon, 19 Jul 2021 16:16:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>, Gary Guo <gary@garyguo.net>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>
Subject: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20210719161653.56db337b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wNUyXrESa4LjzFaSe6hGzsZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wNUyXrESa4LjzFaSe6hGzsZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  Makefile

between commit:

  d952cfaf0cff ("kbuild: do not suppress Kconfig prompts for silent build")

from Linus' tree and commit:

  dc08d49444e9 ("Kbuild: add Rust support")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Makefile
index 45a3215179b4,c814b209b6c9..000000000000
--- a/Makefile
+++ b/Makefile
@@@ -731,12 -763,11 +778,12 @@@ $(KCONFIG_CONFIG)
  # This exploits the 'multi-target pattern rule' trick.
  # The syncconfig should be executed only once to make all the targets.
  # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
 -quiet_cmd_syncconfig =3D SYNC    $@
 -      cmd_syncconfig =3D $(MAKE) -f $(srctree)/Makefile syncconfig
 -
 +#
 +# Do not use $(call cmd,...) here. That would suppress prompts from syncc=
onfig,
 +# so you cannot notice that Kconfig is waiting for the user input.
- %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONF=
IG_CONFIG)
+ %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/genera=
ted/rustc_cfg: $(KCONFIG_CONFIG)
 -	+$(call cmd,syncconfig)
 +	$(Q)$(kecho) "  SYNC    $@"
 +	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
  else # !may-sync-config
  # External modules and some install targets need include/generated/autoco=
nf.h
  # and include/config/auto.conf but do not care if they are up-to-date.
@@@ -1214,9 -1327,12 +1308,12 @@@ archprepare: outputmakefile archheader
  prepare0: archprepare
  	$(Q)$(MAKE) $(build)=3Dscripts/mod
  	$(Q)$(MAKE) $(build)=3D.
+ ifdef CONFIG_RUST
+ 	$(Q)$(MAKE) $(build)=3Drust
+ endif
 =20
  # All the preparing..
 -prepare: prepare0 prepare-objtool prepare-resolve_btfids
 +prepare: prepare0
 =20
  PHONY +=3D remove-stale-files
  remove-stale-files:

--Sig_/wNUyXrESa4LjzFaSe6hGzsZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD1GNUACgkQAVBC80lX
0GwhQQgAnfIGpLWlXw2rGKOvJVfspGtIFHHFypEl/OwsQRlIMZoxKoNVVvKwkfGX
/3+arIrIyevQuk7PF7Eyl5iDAOCZjC92hIz8aA5BQS4TJQXZ5mdYiNqTjHh8ZHhD
UCMCZThfVnOwRANIMIFgvtlnQ0O0ZfS2Wqufe8lDVbhOWRPqTTFSRCJNH599LdJ/
3i2kLpOLm0Fsxg9/r20EGcH0EZ+EO5PkRIsaZQA5p7/qXEXlW34QdM5sMpU5ERgc
5auZi8LZxQsOnTTD0tS4kaFzbaOZgHhM+IKh9SVp0nLhtZZGZf1ShBkemxprgC3o
q+jMi+/+equxbPj2hMbEtXWBFTVOLQ==
=AOy2
-----END PGP SIGNATURE-----

--Sig_/wNUyXrESa4LjzFaSe6hGzsZ--
