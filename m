Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC6741A64D
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 06:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhI1ELX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 00:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhI1ELX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 00:11:23 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B363C061575;
        Mon, 27 Sep 2021 21:09:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJQxp5N9mz4wgv;
        Tue, 28 Sep 2021 14:09:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632802178;
        bh=6XUV7oeQ6dC8q6l9NeZ1cQfD5EgmUMSzeTN93hqwTfs=;
        h=Date:From:To:Cc:Subject:From;
        b=XjtiIXNT/xiVGgxz1R7LV4un9CJN5iIsLl9ga2x5RAEtdNICLzJFwUT69Mqq89y1V
         5yzVA/vZdLAR5Kbj7Ggi2+BoK4/Mntvw70c37UsaVbgKmQB2lTQEiL7oOvdLZSZeV8
         b13PQ4vJMf/o+EGX5G87AyeUCf0F7ZQuIqr4RpEAq6VptzCfZPgtlpqL8B4/nroh5U
         ZyS13+NTJGeyy265l0rV4cJppXUwM46V6Mrv8MXIysoEz6akY/BPTCe6dANWGUejIC
         yqhyhm1Di3ex0SV8dY03hplKMV+cwpMLDxqKc9b/RY8fdlx9J8iYxAZmLevSQ6xGFS
         yeoeXZoc6Ni5Q==
Date:   Tue, 28 Sep 2021 14:09:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Fox Chen <foxhlchen@gmail.com>, Gary Guo <gary@garyguo.net>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Yuki Okushi <jtitor@2k36.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20210928140932.41432dff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m5/iE04EcbVWvy1hPRNWrGX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m5/iE04EcbVWvy1hPRNWrGX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

scripts/kconfig/confdata.c: In function 'rustc_cfg_print_symbol':
scripts/kconfig/confdata.c:669:9: warning: implicit declaration of function=
 'sym_escape_string_value'; did you mean 'sym_set_string_value'? [-Wimplici=
t-function-declaration]
  669 |   str =3D sym_escape_string_value(value);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
      |         sym_set_string_value
scripts/kconfig/confdata.c:669:7: warning: assignment to 'const char *' fro=
m 'int' makes pointer from integer without a cast [-Wint-conversion]
  669 |   str =3D sym_escape_string_value(value);
      |       ^
/usr/bin/ld: scripts/kconfig/confdata.o: in function `rustc_cfg_print_symbo=
l':
confdata.c:(.text+0x738): undefined reference to `sym_escape_string_value'

Caused by commit

  dc08d49444e9 ("Kbuild: add Rust support")

interacting with commit

  420a2bdbead2 ("kconfig: Refactor sym_escape_string_value")

from the kbuild tree.

I applied the following patch, but it doesn't seem quite right.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 28 Sep 2021 14:02:54 +1000
Subject: [PATCH] fixup for "kconfig: Refactor sym_escape_string_value"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index e1a739897d5a..096222531954 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -666,7 +666,7 @@ static void rustc_cfg_print_symbol(FILE *fp, struct sym=
bol *sym, const char *val
 	case S_HEX:
 	case S_BOOLEAN:
 	case S_TRISTATE:
-		str =3D sym_escape_string_value(value);
+		str =3D sym_escape_string(sym);
=20
 		/*
 		 * We don't care about disabled ones, i.e. no need for
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/m5/iE04EcbVWvy1hPRNWrGX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFSlXwACgkQAVBC80lX
0GzDoAf+M0dSYylTcb4wFL5UBiZb+os1YPSsS6cgd4vzPMF91EkgV/ctkwddW/PM
Kcte7yAY66s2qJ81Pm29oZITb1Y44Cae/D5z57yn2ynup9rZJo4SeoWdby+NVlvv
dJXUvYIwKjPooQ/6QqSw/X651oHcFyXPOFOzyEPoxunuzSQCycWW18K19X3bM/t2
LKyCConb9IjMXiF/3/1kJO8raTyhnxp8WIrNGkPf2d3RF7D8HJ0sZ17j1VH38W1N
crtAx4Yn25ypRjnP7VeLvjfTG7n7OlIbrjMijpajAKIFaxEqaWsxDapcTB2SL7IP
wv/ZF3EHR+acKNQfh3rsk05YauO0GA==
=i9Zx
-----END PGP SIGNATURE-----

--Sig_/m5/iE04EcbVWvy1hPRNWrGX--
