Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4821C8132
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 06:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgEGEz7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 00:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725763AbgEGEz7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 00:55:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1490DC061A0F;
        Wed,  6 May 2020 21:55:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Hh4B5zw4z9sRY;
        Thu,  7 May 2020 14:55:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588827356;
        bh=AU2PEgfN5HkCY/lykPvJpAGTGV/oowF0bQCK/YlxYRY=;
        h=Date:From:To:Cc:Subject:From;
        b=mqCj3qeGt8sjSGsMSZMhp875k/myFaBwas7miKkV70A8ch4BCy7Ezu8vo1krLhSAW
         psDKViQNVrxJYAj98XDmFBL4+l9zKunLV2HiW5Oi8r/H6VFsy4gSyELJhErufWq25i
         BrKqLRKHw1F+SVWliPBfps7FOmqUWvHXFXjKa5q3kNznIKR1MVJi7AzUrvuuZs2DYE
         oqb/HNFUOzjUksR6lm7V8xgHFvswH6hS141WCLwlyQA/gHG54KxWcFv3K8HQEJKIW9
         shQl/HIq48ThpM0chplCN2b8Vy8tVDDtrOhXkvFQHkPExJYcInwQSbRlFrM995fUxW
         ADb02oGOd7RVg==
Date:   Thu, 7 May 2020 14:55:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Sarthak Kukreti <sarthakkukreti@chromium.org>
Subject: linux-next: manual merge of the chrome-platform tree with the
 pstore tree
Message-ID: <20200507145547.7c514106@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/438muPcTwi24xAvTu+a_DYj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/438muPcTwi24xAvTu+a_DYj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the chrome-platform tree got a conflict in:

  drivers/platform/chrome/chromeos_pstore.c

between commit:

  7bddec15c574 ("pstore/ram: Introduce max_reason and convert dump_oops")

from the pstore tree and commit:

  1c7c51347f2e ("platform/chrome: chromeos_pstore: set user space log size")

from the chrome-platform tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/chrome/chromeos_pstore.c
index fa51153688b4,82dea8cb5da1..000000000000
--- a/drivers/platform/chrome/chromeos_pstore.c
+++ b/drivers/platform/chrome/chromeos_pstore.c
@@@ -57,7 -57,8 +57,8 @@@ static struct ramoops_platform_data chr
  	.record_size	=3D 0x40000,
  	.console_size	=3D 0x20000,
  	.ftrace_size	=3D 0x20000,
+ 	.pmsg_size	=3D 0x20000,
 -	.dump_oops	=3D 1,
 +	.max_reason	=3D KMSG_DUMP_OOPS,
  };
 =20
  static struct platform_device chromeos_ramoops =3D {

--Sig_/438muPcTwi24xAvTu+a_DYj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zlNMACgkQAVBC80lX
0GxnOgf/eG7ZXxtuY6ayV1S7/ldiT3uY/VwLGFqxsErvpTQ8DdzL0U5+2abZ1ePM
77tw/drUO2ZBoMfVBdEpfbfv4LwGJbi+7H6qBKm4o4anapnsF5/ZivHesf86E8kf
u23VyKH/kcGBasYVvP7kK7zY6oPiHU7HZo9LmGDmWCEze1JTjjYQo0tTg01zs1M0
Q1YmScIRCcqPe2d2qhBpBgn5gBEQwuU5he/2kCT9cs9LVYWd4XH9LBTrXYMsGXaP
+KlVOOg6aD7yBwht0GaPjsvjbxDvX5BPCI6dQSwYxclrqUy2am3Ggg5e/ym65vGn
CCF6bZPd7LlU073jtKSWlZUdI8mFIg==
=J1nG
-----END PGP SIGNATURE-----

--Sig_/438muPcTwi24xAvTu+a_DYj--
