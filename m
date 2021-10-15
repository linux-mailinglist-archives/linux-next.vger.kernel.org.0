Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD3542E75C
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 05:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbhJODqV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 23:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbhJODqV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 23:46:21 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6ADC061570;
        Thu, 14 Oct 2021 20:44:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVsZj4NRgz4xbL;
        Fri, 15 Oct 2021 14:44:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634269454;
        bh=JW3mGfxs84ntC5QRt+wpfNk2oMV9TW6J3iuObh/Xo5M=;
        h=Date:From:To:Cc:Subject:From;
        b=uCaKacdxR4jHBQD4s/nB2evC/uQcSlER3ylv4WUWZeZT7FkfvXBodUGsLZgWpSuai
         NGQyUu7Vc7dutpgh3sY212yHoCtf13jHqUpH3suho3GfFPiL4/SGk8VmqyshRliomf
         2Lir3rVap0HkOttR3x/yoEJZQi6OQCnVt4DYUL1gxS8SUVMFDhJ49S6BKfILyW+xUc
         x1zfj4wQM2K3Iv8PFG2B1ekeLyz+AMNQ0vf6Gy1wHBI+jODj1acUn6vQkbgf4cpGl0
         oQfjPyZROhG5ygk7bmo+10sH5lAC02n6G++mjrxOlrbrLSbPI8NU60B5YcZzW7G7/O
         aL3OLj/X/uy/g==
Date:   Fri, 15 Oct 2021 14:44:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael =?UTF-8?B?V2Vpw58=?= <michael.weiss@aisec.fraunhofer.de>,
        Richard Guy Briggs <rgb@redhat.com>
Subject: linux-next: manual merge of the audit tree with the device-mapper,
 selinux trees
Message-ID: <20211015144412.08edc8d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W4og8RLKmW4yN1e9X+KDfd.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W4og8RLKmW4yN1e9X+KDfd.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the audit tree got a conflict in:

  include/uapi/linux/audit.h

between commits:

  c1d7fa96e74b ("dm: introduce audit event module for device mapper")
  5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_u=
ring")

from the device-mapper, selinux trees and commit:

  571e5c0efcb2 ("audit: add OPENAT2 record to list "how" info")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/audit.h
index bf3214530439,afa2472ad5d6..000000000000
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@@ -118,9 -118,7 +118,10 @@@
  #define AUDIT_TIME_ADJNTPVAL	1333	/* NTP value adjustment */
  #define AUDIT_BPF		1334	/* BPF subsystem */
  #define AUDIT_EVENT_LISTENER	1335	/* Task joined multicast read socket */
 -#define AUDIT_OPENAT2		1337	/* Record showing openat2 how args */
 +#define AUDIT_DM_CTRL		1336	/* Device Mapper target control */
 +#define AUDIT_DM_EVENT		1337	/* Device Mapper events */
 +#define AUDIT_URINGOP		1338	/* io_uring operation */
++#define AUDIT_OPENAT2		1339	/* Record showing openat2 how args */
 =20
  #define AUDIT_AVC		1400	/* SE Linux avc denial or grant */
  #define AUDIT_SELINUX_ERR	1401	/* Internal SE Linux Errors */

--Sig_/W4og8RLKmW4yN1e9X+KDfd.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFo+QwACgkQAVBC80lX
0GxoEwf9E6HIUTV0LgaDi4V56PTwvpsBgLvRQeSIFWyteaCyW0KlZZFiOjN26FGW
LgFTWPsHEXDcGt05NnZtuLNyvt+asbNZsetG+SDTO/XCpJU8uyeykXKJjJ4C4raO
aAsJTDUSC5dFVJODwCQs31hmp+EsVSNsQ+cUFbQ/EZE0TgZZiqWOZNeBFrnMutgi
+H7Rxz98qO0wZ6sMDQHKLCJ8itDdqiFFfPiDdg2eX/YRYSScRMlz2Pz740Uq/qkg
Uz0h/7pSIJHaTLXxPrSSPMKzkF0tK31R64nOw2/gEut8iNmpC116d/WrFHVFVeCT
SVeasFDEhjb1dHgp5C/RD4LV4R6SAQ==
=iwkl
-----END PGP SIGNATURE-----

--Sig_/W4og8RLKmW4yN1e9X+KDfd.--
