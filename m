Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E09EC92834
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 17:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfHSPTO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 11:19:14 -0400
Received: from ozlabs.org ([203.11.71.1]:45629 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbfHSPTO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Aug 2019 11:19:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46ByJJ07Lkz9s3Z;
        Tue, 20 Aug 2019 01:19:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566227952;
        bh=gZRPvYk6/+PH4lSNVrIkjUsx6B/zzBYR8nVFXvbgVnM=;
        h=Date:From:To:Cc:Subject:From;
        b=WKJvdwdt1+t+93ILwpCl4IHLv3HcKS8d6IlPZhBzRuAJIwP62IC+/qbPMGJY6gBdG
         56KyCu4G4HhH3LuDipRzSDO+XQiSMBND2eBGbY1DPyDEhQm7I3kBLdyRxR1kvomJoJ
         BkIceWAQ63IgxZ2G5F6Z0B9tkfAdnyjC6gHGbZYvp5OVfectraaCcEWrF39LukY5IH
         q3Uv4upTeKFpHWwbtv8xCo8j2b/Ebsxs7i7nYoRZTDz0uX5G9UlgMDbOKMq6dlo93t
         gqxDl47jy3j8KcBLiGMt0fE63sJTSCI5r8jF6HPJwhBVnr+ynwM875bMt0uUozFacF
         XkMDCyiXGjxTw==
Date:   Tue, 20 Aug 2019 01:19:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20190820011904.34962638@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xe.yqShaGofgxeZwot/nvDM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Xe.yqShaGofgxeZwot/nvDM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b72fb1dcd2ea ("HID: wacom: Correct distance scale for 2nd-gen Intuos devi=
ces")

Fixes tag

  Fixes: eda01dab53 ("HID: wacom: Add four new Intuos devices")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Xe.yqShaGofgxeZwot/nvDM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1avegACgkQAVBC80lX
0GwA2Af5AR8vl8u+dMWzknnIEJkncLBRxv0t6A9aj2nA2kY0Aqfw0QLMAh9PM7A3
aGOYM76HeE/FFd/FkazBY8NOKJJiy5L32L46wTtixnlWxzJzXDdGAouHmgwQTRzv
UDJY27anQzePuXw7As+g/IPXcUoC9La6PXuPeEXl51eEV4WFMAagPdpAP7AqqyRN
+97acK8UfPvBzwkq4DxSSfVbx2lZNx2fAFX+Dd5FdEkfN2Fna2EPQGfruUwkWYqZ
crwR5wksCVpPOj5iIvjI3Tv53eMch3a2eaYRVEOW+56sR2fT0or5EIXGQVQDnUKU
yklh9+QOsnyB52PohyHXHgv9G+b73w==
=ld8H
-----END PGP SIGNATURE-----

--Sig_/Xe.yqShaGofgxeZwot/nvDM--
