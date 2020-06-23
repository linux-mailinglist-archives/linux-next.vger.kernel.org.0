Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A33A206778
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 00:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388376AbgFWWr2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 18:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388029AbgFWWrW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2020 18:47:22 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6AEC0617BA;
        Tue, 23 Jun 2020 15:31:36 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49s1GZ6tMcz9sSJ;
        Wed, 24 Jun 2020 08:31:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592951495;
        bh=/R9YlfsojdA+nZJbfZR9i9Sn9k6rGyYEMGin+U9bi4o=;
        h=Date:From:To:Cc:Subject:From;
        b=ki9HSLMepAGPmudDwr955gO/awj4HkD6pKyZXW8kHxZcY6RK4zCZuwZYLmSso0f6X
         NzctgY+CFFT1i2cC+UryVYQS2Hkb7gC/liDDKmfZJwNMx8xvm8s+YLHLtkpsXamiqF
         LWNYw2lS9aw/gC+/YHupKaIWRi4L8xGe2oa5ZlOrxhNoY+noqaHopdaBQ8MDticMxv
         X+EqTQL1A6FMHpEseatBEhOOPBalKGe/Qb2lGSR9VXW8miyFHQIQPtN/1+5XY4u7vK
         zRVSBqtyMLhE2G6eTaj8+5hYJZcTa2rcxEyVC8tr71WeeRVYFRFNuL2ThH3aRBJPRI
         M8pEIkqZ9uq+Q==
Date:   Wed, 24 Jun 2020 08:31:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the cifs tree
Message-ID: <20200624083133.466f1f19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QegfP0ojC2H66AsTbavcfx+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QegfP0ojC2H66AsTbavcfx+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  52e2b5b30cee ("cifs/smb3: Fix data inconsistent when punch hole")
  76f77967b39e ("cifs/smb3: Fix data inconsistent when zero file range")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/QegfP0ojC2H66AsTbavcfx+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ygsUACgkQAVBC80lX
0GxZUAf/cm3si5j2g7L7itcUjroqYTA4vz/l9uKvNtAL7HkbWuN0vPV2AJAk9CSa
+N75nejGCUuKV1an4GhAS6+GYCvZPU/FbVnPWubZoF+hTfS6VJTVq/ZSNTLUsfjT
3lYSgz08yPZSPPGjYsZLgbhO4dh1VUFIVzcbYbbwuy6RTLIucvrqiQKM4/NumNwF
fhtSjsy1H5e7fDUIv8hOqpeL0Fv6gJTE8SXsfThIT0q46DUqfz+MNC3mO+ZO8Vt6
aIZrLC/BcV55I9/VXJ9hFgovAj6bJqfpIalmCcUlOlYCBg5KUd3UDLmDFKFWS4Ws
XBq7dFnCuZ1lBWfAdUE1gJP12SoFkA==
=2qJU
-----END PGP SIGNATURE-----

--Sig_/QegfP0ojC2H66AsTbavcfx+--
