Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C77D1C316C
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 05:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgEDDRA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 23:17:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34239 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbgEDDRA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 May 2020 23:17:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fp1P2k33z9sSc;
        Mon,  4 May 2020 13:16:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588562218;
        bh=a+ttMQKbSioaW+iYDoWPPjbv3dl/UC1eoPEK4WRzOWE=;
        h=Date:From:To:Cc:Subject:From;
        b=jQB9jCv6WTuE+f+X6IWhaVSRCHd4Ov/d1TdjPBnKH4FZcDKjA+CK+aOramYk7E+io
         0zgIHCa1o/MTs3hSZiEv3IpYU0MUWbYeKffO8sJe8UVHNDwEImPcxppMcOA42TVNUW
         RKBqST+BiihpFeEQSq9CmlKAsfa7e4+04decfrwSZfCLBaJDeuB+NQGOf3b3DG9tcv
         3CJ5JX8yBrH/pTX47lUzN5jt6uMLibm5iNxQnOXAiVAXHpDLLQk44YYpQId65306rF
         lriSst+iUT6hfqiyLL3PeamX6fxlS4+YsvT64gGrLb4vo0xOzpDpLNeEpbZGQ+S5Wl
         i2b6+k8wIEr9A==
Date:   Mon, 4 May 2020 13:16:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the keys tree with the kbuild tree
Message-ID: <20200504131655.2820b437@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t/6ht2gRIBCIjel.xaXqDGC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t/6ht2gRIBCIjel.xaXqDGC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got conflicts in:

  samples/Kconfig
  samples/Makefile

between commit:

  3ba9c29d1877 ("samples: watchdog: use 'userprogs' syntax")

from the kbuild tree and commit:

  631ec151fd96 ("Add sample notification program")

from the keys tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/Kconfig
index 5005f74ac0eb,5c31971a5745..000000000000
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@@ -205,8 -190,11 +205,15 @@@ config SAMPLE_INTEL_ME
  	help
  	  Build a sample program to work with mei device.
 =20
 +config SAMPLE_WATCHDOG
 +	bool "watchdog sample"
 +	depends on CC_CAN_LINK
 +
+ config SAMPLE_WATCH_QUEUE
+ 	bool "Build example /dev/watch_queue notification consumer"
+ 	depends on HEADERS_INSTALL
+ 	help
+ 	  Build example userspace program to use the new mount_notify(),
+ 	  sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
+=20
  endif # SAMPLES
diff --cc samples/Makefile
index 29c66aadd954,8617edf7f19a..000000000000
--- a/samples/Makefile
+++ b/samples/Makefile
@@@ -26,4 -24,4 +26,5 @@@ obj-$(CONFIG_VIDEO_PCI_SKELETON)	+=3D v4l
  obj-y					+=3D vfio-mdev/
  subdir-$(CONFIG_SAMPLE_VFS)		+=3D vfs
  obj-$(CONFIG_SAMPLE_INTEL_MEI)		+=3D mei/
 +subdir-$(CONFIG_SAMPLE_WATCHDOG)	+=3D watchdog
+ subdir-$(CONFIG_SAMPLE_WATCH_QUEUE)	+=3D watch_queue

--Sig_/t/6ht2gRIBCIjel.xaXqDGC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6viScACgkQAVBC80lX
0GyXoAf/U2Jn2xuTuExUKtiDKn5WSLcDDfmgjaiDjEBfJxjwq7Jf+R6KUNl0p5Jx
jdMHSywosUPaw3qC5LWo+sxyQLGEgMn9ihvVW77N8qZ9jsz5b7M6Trdct7ff2Lh+
lsKrPi9dUT/lKNJon6A2gEn5FZ0/FBq7tUt58EH6hhcp7lgISvCkN41hgQVkjSBD
3kSbOdZKfgsJaiY9AKEPGsoFVXtkkN3kijrWghdURYZU7YMa1UNwWy8cQW+2ZGDb
0GbdjDxZ/xhUJqCz5c60HO9tA6F51/mWU3U0XLYbXAzODWmbfh0lJp9Opocj4KNf
CXU/PTZMzCsvgsirGlX43xSpyMacPw==
=KLMP
-----END PGP SIGNATURE-----

--Sig_/t/6ht2gRIBCIjel.xaXqDGC--
