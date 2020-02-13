Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F22315CECB
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2020 00:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgBMXz3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 18:55:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59313 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727571AbgBMXz2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 Feb 2020 18:55:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48JYKn3XnWz9sP7;
        Fri, 14 Feb 2020 10:55:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581638126;
        bh=ceZrviBRKVvu16rikYXya7GUmEF2cpSJLZgrV4mGZ48=;
        h=Date:From:To:Cc:Subject:From;
        b=T2c6lkeiqF5WAjfkeAAD2z/zIlGnUth0EGniAKaxgD+ta/drcI2YVJ1HlqJAhlfsD
         Cy1JUFafJnf4UB93yDCES4t4XnxYZAbLiC1aspTMJVMY7zfCc0OEFJfx/LNTUbgqJI
         8c4BLlr+uYkkgXnqmjFbT5LDK5I1OYLI7/ZqBX8wCOY/9sSNxHj2qonUaAWLDhVDz9
         Vs9fS7OEv1aG5EbUfkIO1hRdjfLQQXUNtP7cyk6LRZVFOqMSaywcOFEkeP2w31xYOe
         BUM8jckrvd94vdupKZ6JHgDFhh1Da2bym/7JPe+LBfH1b5o2q81oKLNy3uxJHTyUHI
         OQ3P+Uftfg57A==
Date:   Fri, 14 Feb 2020 10:55:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: linux-next: manual merge of the staging tree with the
 char-misc.current tree
Message-ID: <20200214105519.70a7f6a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Smlk6vsDS=3NJbDff6Y_bIp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Smlk6vsDS=3NJbDff6Y_bIp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  MAINTAINERS

between commit:

  95ba79e89c10 ("MAINTAINERS: remove unnecessary ':' characters")

from the char-misc.current tree and commit:

  caa6772db4c1 ("Staging: remove wusbcore and UWB from the kernel tree.")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index a9a93de6223c,9a4c715d1e50..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -17118,12 -17089,7 +17113,7 @@@ S:	Maintaine
  F:	drivers/usb/common/ulpi.c
  F:	include/linux/ulpi/
 =20
- ULTRA-WIDEBAND (UWB) SUBSYSTEM
- L:	devel@driverdev.osuosl.org
- S:	Obsolete
- F:	drivers/staging/uwb/
-=20
 -UNICODE SUBSYSTEM:
 +UNICODE SUBSYSTEM
  M:	Gabriel Krisman Bertazi <krisman@collabora.com>
  L:	linux-fsdevel@vger.kernel.org
  S:	Supported

--Sig_/Smlk6vsDS=3NJbDff6Y_bIp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5F4ecACgkQAVBC80lX
0GwF0Af7BTU7MS3/iSpXfR9yrTShmRmfCQIzpFBUoa0L5RH3mNftnKSt8eAX6pPV
wiJUbjzrQCk/tNYUUPAXA9as7iMxfJkNvDZqXZJ7SSmlHqeiBPyBLQ6Lr4a0Oen0
y394k+owPGdyeFhUp2xDqc2l+7w9/sdzuwdHnrhg7I0Bi/Sntv7KucRxkhWuOL7E
RGwGvYof2TKYSYKbDE0ZBOjxOJQ7XCzt2wxBDwp6uxNwKIu7qZAI/i+CY6zyP8h4
eGBryc2Kc7prfDO0Mt24zzg7lhjV0Z65mwxIM5JAmRB9EvnCd2FDhgk02GmxJSsW
A9ejDaHFqngsLhYfxjQILhul0kGWGA==
=RN28
-----END PGP SIGNATURE-----

--Sig_/Smlk6vsDS=3NJbDff6Y_bIp--
