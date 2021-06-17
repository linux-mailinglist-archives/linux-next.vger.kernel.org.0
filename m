Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4953AB1A7
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 12:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhFQK4n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 06:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhFQK4m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 06:56:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B981EC061574;
        Thu, 17 Jun 2021 03:54:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5Jpb1QVRz9sSs;
        Thu, 17 Jun 2021 20:54:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623927271;
        bh=Memu9ddasEossfKXN/3GpaTOkIMeWuqLxYNr5NRNjqk=;
        h=Date:From:To:Cc:Subject:From;
        b=b/1uIh5wZRSg6e2WoKAEmN1RHzBiJxvCavh4loKE09OMDJKN83gn/A6V66cthRgLC
         Cc3FJ92UhjPtKyO/qHE1nrJdoCjuK8458jLh8EvF7GGi/nBks5Zdr4tUedZJ4QSA4u
         N2EKXw97ZZPUcQia7RF5U8sMeWq/Qcoz6M6OdsJLqlDDGsUcq8t3Tw+RzeZ6A9CTw1
         mgWteHm6ybRlv8F+idnddxTld8+LOjsOB7qbHfmDML/3aHtkRk122VSZx91VHIsfeD
         QS4dGxHiBPQDWLIIRVvge+VcN95UBYs2NHtxuceL2ol3U9GjqqHevut6kMSeqcLj0t
         QvrtqMuCFEOGg==
Date:   Thu, 17 Jun 2021 20:54:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb-next tree
Message-ID: <20210617205429.5af9d002@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Le69pU0=BugGAi=9y8ai2PS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Le69pU0=BugGAi=9y8ai2PS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c73c23f34716 ("media: venus: hfi_cmds: Fix packet size calculation")

Fixes tag

  Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array=
 with flexible-array member")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 51bb3989c2a1 ("media: venus: hfi_cmds.h: Replace one-element array w=
ith flexible-array member")

--=20
Cheers,
Stephen Rothwell

--Sig_/Le69pU0=BugGAi=9y8ai2PS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDLKeUACgkQAVBC80lX
0GxXIQf+IdK1omQSl5GAJHVMN2s/C1Mpo0YRJjFVIqUAnfds/sLT17H59nSBgIh8
7q3TrcgaX2f40bECSuF8Qda93RRPbQ+sa2X80b4qbRwIMy1XFchon9XPD+W9pz8f
k2+kPN+wiTiiZtTffgigHXN2fbDdRl2H2Pxc+BGCYg+G85vyKvsne7pO2cTKqtO+
p8yn+fGz17wjVGvMgiTCZd65H2lGNlikz3XvfQPWiJMHQlA2m1nzv0DzyI+TFWSI
h+MaOJbnN0LwIEpxJA2aJPKDjjORl/RV6xhsJctWpepjsrIEZxPhvEK42ou0+Eln
YJ5lIA/P8h3v/c182w+ESF3wxjcHwQ==
=ju0k
-----END PGP SIGNATURE-----

--Sig_/Le69pU0=BugGAi=9y8ai2PS--
