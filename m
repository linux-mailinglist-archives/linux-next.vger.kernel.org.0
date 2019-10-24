Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 951A0E3D00
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2019 22:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbfJXUP4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Oct 2019 16:15:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47111 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfJXUP4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Oct 2019 16:15:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46zdm96Vy5z9sPh;
        Fri, 25 Oct 2019 07:15:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571948154;
        bh=aRC2jJ14Z0q9E7pKfWMvfD3N+zOtp79wdq4A6A5XKos=;
        h=Date:From:To:Cc:Subject:From;
        b=jVAPqZMozD8BS8U3ERcOg9AkUVSSOahUQD5+FGKr7JgIRatDf5WSY1Y3kTDpcr7xK
         wQYhWcVO2y/9f8wZ3LAp25DLLR6lHawoEJhb2um9N2fIA1lBOJQWJdnJzptjX0LM8N
         msQO85qC/wT/Kq+v/WM0vYbc1zb4Dv4XawDd+aFRJi8Qq9gOtoWNMM9wka7tX7uqfM
         j7XppVD+mjZvWo1tKV8URcTNwdAsGn8ZaO33NsGJRMkRf5eviPbUdXt22fhoez+48x
         5EzkMy/VJsFj7Fuu01q8T3qupzc3L2RAjfq/3mCwkozI2IK+sAUsmKiX3YzCFBH4UD
         5I4VnOX4TMgbg==
Date:   Fri, 25 Oct 2019 07:15:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the pinctrl-intel
 tree
Message-ID: <20191025071552.609fcead@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aN6f/U.FYgxGtQ3qURU+tVG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aN6f/U.FYgxGtQ3qURU+tVG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  ec7ec598997d ("pinctrl: cherryview: Fix irq_valid_mask calculation")
  2fe72dbce079 ("pinctrl: cherryview: restore Strago DMI workaround for all=
 versions")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/aN6f/U.FYgxGtQ3qURU+tVG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yBngACgkQAVBC80lX
0GyKDwf9GJkvaojkToysQkr5sJnIZrO8mWWZ7r470nakFbn9fcv93aBR7RXrNIpR
byiMsl3BA/yvsXXm4aBtlolMp7BZ+o07BIiAw5dmQK5Xaqd4FOtp5v0Cw58vJV11
VpSaE0JrtuvPtDV2GFxW+nNHUbGRkHXWFmhjNgxaEzYjdb4F8IiRR+z+1+fUdnAD
VCSIUzYVL8XSr2gwt8ixe5WS0qcWcQsUAZ8R8rROxqRsBo8/9i5o6obdukCVImPz
I1gGCr3K/G2am3YPeHd7p5U33GMNxs4KWWKEwSFKfqzRNIYpCAPpbnzvV2lmDyBC
NtgzHDHqE20fJ4AS3M8umxSUhHuJWg==
=Crt7
-----END PGP SIGNATURE-----

--Sig_/aN6f/U.FYgxGtQ3qURU+tVG--
