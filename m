Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2313D421CD6
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 05:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhJEDV1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 23:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhJEDV1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 23:21:27 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FFFBC061745;
        Mon,  4 Oct 2021 20:19:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNjVt6x3dz4xbQ;
        Tue,  5 Oct 2021 14:19:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633403975;
        bh=Sl4KVVedaj6+zi9r5eFLA+cnzxdpSY28JEgvOWdgT68=;
        h=Date:From:To:Cc:Subject:From;
        b=PUAIHa2DFPRWJbbtNfTILQrSL3HLm7UdZDNIKVq+II1/Qdl/inBqiEp1E05cQOxlH
         lS9ktUhP13P9QKF39ea5ZbonOdQj5Lo3lheFFSeaIH6wFJ7njlLhJbLtiNhSqxEMk3
         Y2YeUqDsEVvu7dveTra88n53zAg74NPlklm61mQD1tGPWIsX2DhfwobSpLVT2LTaGh
         MO9XOQHwLeWk1dXOtFX+XMxZ+6atNPnWamyy01F3YT7Ms4sdIJPv2mj7ztKipO6TVf
         vYU9Ngv5bi9mPXhU0ZJM/JzDoW33+cEjK1+g880PnYg2O+hVK+kNy+stfRtH0lOOux
         lQvI3p6orxMvw==
Date:   Tue, 5 Oct 2021 14:19:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Subject: linux-next: manual merge of the audit tree with the selinux tree
Message-ID: <20211005141934.705eaa1c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vj0EJ54.9EchM1kEmZ4Bncj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Vj0EJ54.9EchM1kEmZ4Bncj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the audit tree got a conflict in:

  include/uapi/linux/audit.h

between commit:

  5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_u=
ring")

from the selinux tree and commit:

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
index ecf1edd2affa,afa2472ad5d6..000000000000
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@@ -118,7 -118,7 +118,8 @@@
  #define AUDIT_TIME_ADJNTPVAL	1333	/* NTP value adjustment */
  #define AUDIT_BPF		1334	/* BPF subsystem */
  #define AUDIT_EVENT_LISTENER	1335	/* Task joined multicast read socket */
 +#define AUDIT_URINGOP		1336	/* io_uring operation */
+ #define AUDIT_OPENAT2		1337	/* Record showing openat2 how args */
 =20
  #define AUDIT_AVC		1400	/* SE Linux avc denial or grant */
  #define AUDIT_SELINUX_ERR	1401	/* Internal SE Linux Errors */

--Sig_/Vj0EJ54.9EchM1kEmZ4Bncj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbxEYACgkQAVBC80lX
0Gy8/wf+OKBGrUvS1u2z5THjgqE3U7yqnurg9zP8AwuZriPKjHdCn9qBQE5BSUTs
b/9Z039Sfv9Y66hNxs3MxyoYrvLi942pWxiwkhXEdzfqK62kjlD/sFrT4nvKHLHT
K0YxybxKzfkEgNgFcoPeRNthiwHwR5+75rMipi0GYqsKNCGMmjRQIp83qYUN1Ya6
FzmUvLYekoYkAs0amztfBoFaOgophH6N7nOsHEu9gfP2V/jkPceVEj3Vq5CuG3yH
cO4GFwdQhSJZM8/vs0xejR76SZD3UqyX5FYz4i4eGa+JyMEqd9GCTAGG/wRm/Obd
ygM65jJty2q7Uf/6gO0xd96IAYfs7Q==
=6mqi
-----END PGP SIGNATURE-----

--Sig_/Vj0EJ54.9EchM1kEmZ4Bncj--
