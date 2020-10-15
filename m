Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3643B28EB72
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 05:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgJODVj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 23:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgJODVj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 23:21:39 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20004C061755;
        Wed, 14 Oct 2020 20:21:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBZM02HP7z9sT6;
        Thu, 15 Oct 2020 14:21:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602732096;
        bh=/OMQe24iAQN//EyN6R9KvD5E0PFWKFXZ9VWhvWYr+MI=;
        h=Date:From:To:Cc:Subject:From;
        b=JzWfvXIzrtBw2v+YhPI6lD6wRL0C+PxzxEyTMhM+ms6dqyKrsSxBl7/QITmPeHUB4
         L10fEuBMzJ3QR6toIacG17aLDuxLf1jtzd2K8Ss/sh6E+8pWJ4cAKseCfEY16HYdPV
         b701c0YWrDBPIMLaNHzxfaNaN+qwBuaDyROub+3K2fbQWIzMcK/jE2NdHi6hD0RQeo
         VCiIsl04LYX5steyZDG045EO1ERBruXRlKCXe9APDEoeqcIBEdQoM3b2xNoDmeDhW2
         ajPtFEc7j4NMuSvU7+J4L8iN0zXzYLCToZz682MAuKgRt0zoyxoQ5C/04fklgsro2T
         QGrHwt3vaK5Jg==
Date:   Thu, 15 Oct 2020 14:21:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Borislav Petkov <bp@suse.de>,
        Kyung Min Park <kyung.min.park@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Message-ID: <20201015142130.20634f21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qx7D5BZw4X3OyzfQsqXmZpv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Qx7D5BZw4X3OyzfQsqXmZpv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/x86/index.rst

between commit:

  ea4e3bef4c94 ("Documentation/x86: Add documentation for /proc/cpuinfo fea=
ture flags")

from Linus' tree and commit:

  441848282c59 ("dt: Remove booting-without-of.rst")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/x86/index.rst
index 740ee7f87898,1faf44f551bd..000000000000
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@@ -9,7 -9,7 +9,8 @@@ x86-specific Documentatio
     :numbered:
 =20
     boot
+    booting-dt
 +   cpuinfo
     topology
     exception-tables
     kernel-stacks

--Sig_/Qx7D5BZw4X3OyzfQsqXmZpv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HwDoACgkQAVBC80lX
0Gzn0wf+KShSjUabi1T9awpFGTJRVYJQktPEFhgzLgiU5+dHA3y9TcBDQft8Ll6M
ggWccY74zmdCpvzsDfMW7DZuN8GGqf2Kw2PnyyymdH3Z87jD2Y5IIKRonNV1oSKb
xHV+uWyFVKlggLWroPyutYvBs7mzlMgVzX6e4q8CMTDLGb8saHL40qBJmv64a9oJ
b+5nYCrW7fluQSfBg30vGLlYl3H/Dc17fmjiB9UMimutcR8z8WQKSrK72twS8Ig4
QvWxxxqhmacawfcqTKtOb6RVkJ8NwWQJZMqyQ9U9aAeA1KXpeSdeOUbQotCrhK0k
Xf0hTvRq/mqhpl6Q+ojt8Ne0Jwzrpg==
=TuZZ
-----END PGP SIGNATURE-----

--Sig_/Qx7D5BZw4X3OyzfQsqXmZpv--
