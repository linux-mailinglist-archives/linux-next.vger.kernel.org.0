Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495E8DFBB4
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 04:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbfJVCiY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 22:38:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46905 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727264AbfJVCiY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 22:38:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xyNs4NxYz9sCJ;
        Tue, 22 Oct 2019 13:38:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571711901;
        bh=RV1ThQjgXC5OTGsFhFYAu0o68+z25LzOZvrAHaPt3xI=;
        h=Date:From:To:Cc:Subject:From;
        b=A+YMMe3fS5PomerG4OeOLpgenxuyhfgB1ZYuqRRR3akuDO/mUq3HfoLUQaS/LZryd
         zLYCXQLJHUJbk4J35xC+ZSCnZkLG5/Q7dnMU2RJj4cHlGe88mSQFnMUZYCY+UmEYQd
         BZWAc2lWs9uQfYdNgKENNOhK3ensxsBFlKHxh6ncMtvZS70Vdw9S2eXLHq0cE0HMTi
         gCo7+Ry3VRde8W+Ur7zjZ5qwXE0xnDjrznkKSjfO8iVPWBzKri4j+4FGLAQqgNJ4K7
         34vsWw5h7c7n2mL4onffrd3N2hUdz9bI8BPqu23y00HhGvU8ibKeqP45b3TbyPC88d
         qAZkM9tHSsIKg==
Date:   Tue, 22 Oct 2019 13:38:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomas Winkler <tomas.winkler@intel.com>
Subject: linux-next: manual merge of the char-misc tree with the keys tree
Message-ID: <20191022133804.32ef6f86@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6DIKUfhdMdCsRa+0GGnSc+8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6DIKUfhdMdCsRa+0GGnSc+8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got conflicts in:

  samples/Kconfig
  samples/Makefile

between commit:

  0b9c31597d81 ("Add sample notification program")

from the keys tree and commit:

  6859eba4f6fb ("samples: mei: use hostprogs kbuild constructs")

from the char-misc tree.

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
index d0761f29ccb0,b663d9d24114..000000000000
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@@ -169,11 -169,11 +169,17 @@@ config SAMPLE_VF
  	  as mount API and statx().  Note that this is restricted to the x86
  	  arch whilst it accesses system calls that aren't yet in all arches.
 =20
 +config SAMPLE_WATCH_QUEUE
 +	bool "Build example /dev/watch_queue notification consumer"
 +	depends on HEADERS_INSTALL
 +	help
 +	  Build example userspace program to use the new mount_notify(),
 +	  sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
 +
+ config SAMPLE_INTEL_MEI
+ 	bool "Build example program working with intel mei driver"
+ 	depends on INTEL_MEI
+ 	help
+ 	  Build a sample program to work with mei device.
+=20
 -
  endif # SAMPLES
diff --cc samples/Makefile
index a61a39047d02,d6062ab25347..000000000000
--- a/samples/Makefile
+++ b/samples/Makefile
@@@ -20,4 -20,4 +20,5 @@@ obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+=3D tr
  obj-$(CONFIG_VIDEO_PCI_SKELETON)	+=3D v4l/
  obj-y					+=3D vfio-mdev/
  subdir-$(CONFIG_SAMPLE_VFS)		+=3D vfs
 +subdir-$(CONFIG_SAMPLE_WATCH_QUEUE)	+=3D watch_queue
+ obj-$(CONFIG_SAMPLE_INTEL_MEI)		+=3D mei/

--Sig_/6DIKUfhdMdCsRa+0GGnSc+8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2ua4wACgkQAVBC80lX
0GyCUwf8DS1aF9gPvocYL0Lk/irlQZF4tPvAis4Wbzez8Z9CkaJAEKRZFF8sWWiU
0Rb98MLmdJFsWZAshrO67iTyIgbQZhG/3rQk4ajgTJ+AS8rJ/occ41whq8Np5SS+
rczippp/aoFnMn+mRYwCZxfqwolEUVwBuiXgMHhIhjtKgOJGnP4N5DDvETYPZgya
OB/js3lf87ddsNMOcYmX7+/OchWT0JxbII/VoKbd6fymC/fZbyolTQgBOmyMT+Lv
OelqnCXy9gXprRCQ7C1s2tKjbSAgeJkpg7Jwd49QvlQyYpP8gbFIvBJtL7WBBoDO
jUEFstUrOtMkeRzV7FYilANwV7sQMg==
=CmWA
-----END PGP SIGNATURE-----

--Sig_/6DIKUfhdMdCsRa+0GGnSc+8--
