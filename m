Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31BF1EC76C
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 04:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgFCCiG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 22:38:06 -0400
Received: from ozlabs.org ([203.11.71.1]:58067 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725810AbgFCCiG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 22:38:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cCkh3Jskz9sSc;
        Wed,  3 Jun 2020 12:38:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591151884;
        bh=wCuhGAt2S6T9b9OYrbE0Pz9RT0PDc0H9lp7Q4wq5NWQ=;
        h=Date:From:To:Cc:Subject:From;
        b=R5925KjMRIkbWX4k/PCW/2DO2Rrcmq0jIAeA2VrJpEm8cGXSiFDyBxlj/uNzorm9J
         OjsSSDP4XXsbM9XSwuDOFKRQv6l1V0J8oMDzZEnIQAvgYRmP7VYWzSnf0zHQlwAdIK
         X2vBRbepvfVSyzxrd481hYtqfSovDS+KwmmZJaqje+1ewlEO3zE7H920xakeakDTOl
         Oo/Ghr6O9YYAMkRHWbN0kkJ2FrsNV8wdRFVGvI6rPAkXmKeBUQeeEc7PdTRGAqgaL9
         HQ6YcRA2B0hbHSlJRjB5NbbmnXHL78kj139tKXDMOPyoDfZeJLYvy/QGQ6gIib5Dkm
         IZ7eZBdrsEtgw==
Date:   Wed, 3 Jun 2020 12:38:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the v4l-dvb-next tree with the v4l-dvb
 tree
Message-ID: <20200603123803.7e97d3e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u55De0lN8oZiulhevwYInOI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u55De0lN8oZiulhevwYInOI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb-next tree got a conflict in:

  drivers/staging/media/atomisp/pci/sh_css.c

between commit:

  27333dadef57 ("media: atomisp: adjust some code at sh_css that could be b=
roken")

from the v4l-dvb tree and commits:

  815618c139d7 ("media: atomisp: fix pipeline initialization code")
  be1fdab273a9 ("media: atomisp: change the detection of ISP2401 at runtime=
")

from the v4l-dvb-next tree.

I fixed it up (I used the version from the latter tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

Can you please make sure that the v4l-dvb tree and v4l-dvb-next tree
are ins sync?  They share some patches that are not the same commits.

--=20
Cheers,
Stephen Rothwell

--Sig_/u55De0lN8oZiulhevwYInOI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XDQsACgkQAVBC80lX
0Gxb6gf+Mhj6yyioEm2vSvjQqRcg85Qfguuo6BmG1cJMZt3eAyZQbMgmpKzJ0VVh
2gHqOY+4EAVAyY/iqS5SLo4i9yMv8Vzm/+ObpA65v3KS/L4q4OHO6q5NWMPCAGxq
428WaxjSJODPH8z6NAVH8y/5z5IlwM1uWiExXG12BzyYtqb3/ugxgFSzjwmcxDP0
0cElCc7Xo4191HVEfX7DzLXb67kkHbkNmkMjRhDN/5jrIoAWa33IAYkmf6DdgVCU
kYkS+G6AnYJLRxlL2XxzsGrvJg4p10FM9YIpP1VVoX860PTVSS0jpKfRBDcF/ebe
myDAsOqgUaEtdzRTxgGYZgB5Wfh39A==
=+n+p
-----END PGP SIGNATURE-----

--Sig_/u55De0lN8oZiulhevwYInOI--
