Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0AB2CC888
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 22:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgLBU74 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 15:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgLBU7z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 15:59:55 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51765C0613D6;
        Wed,  2 Dec 2020 12:59:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmWYF1Wd8z9sT5;
        Thu,  3 Dec 2020 07:59:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606942753;
        bh=xyCfUDDpG5o9AnIu8sKo445PfWngxdTS6OFx++8xEVU=;
        h=Date:From:To:Cc:Subject:From;
        b=RQ05OpUF2Th5NrmYMaEiLWibz5FybRgTWOIXzWVscoyraaPtoJN0aYKdSbKOVmzYT
         rAyCN7IwTSwS+TuHpYUEazlQAAY6cPw3HVyUOY+VOwGj3W7X0iEq+dBk+u/9pUkzSG
         wnVClt3NMC8envR5gDRRupN9jATyIL/cZkrArGHiwHc5FrE4x32T3UlDXG8unuGz0T
         cLlXjbXSdZBUtLczvxUvtWi7yWxqmb3NosQMOLEU9vR0d4/HAOC+eVzLBrGuD8jaKY
         cqPO09rg12GW+vyoNMFE3zcv9ZS0mdy4sM1o5LeYia3sF0X2th6/pMn9dwTMQQHxSK
         oVTz8UUnMHD3A==
Date:   Thu, 3 Dec 2020 07:59:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pidfd tree
Message-ID: <20201203075911.7ac53b76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/me8aMNfQdY0d3tE.7rzTq=h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/me8aMNfQdY0d3tE.7rzTq=h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  440ec82ebed2 ("selftests: openat2: add RESOLVE_ conflict test")
  295983402a1a ("openat2: reject RESOLVE_BENEATH|RESOLVE_IN_ROOT")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/me8aMNfQdY0d3tE.7rzTq=h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/IAB8ACgkQAVBC80lX
0GzD2Qf9HgVfstPUS7SA6GG1/cXqe269rUdHzZeyL7jlLvzJ8s0jDnVcXRYAKjpp
5Su7yL1O3rCMSvcoRNc8OjV4iDTjdt9h936rMvcwx0ed5d4sejXXFbfHyT2h3be9
N5WNzh08dusj472Xn5syI4ddBg1qOh8yck4ppjzItCU4zehIOnvPxJ1NxjTcjBS4
smACt2FIqLbfKe1zU1Ts1DRaAKe1aVW/fzVD1o67gZ8aGrMH4AyZE5TT8Nlq3DSX
AWrtGtk+7IegLTGq1F8Zf+ftMfH3YC0RHkngdo8Kw+HLiQbhpQ0aQFAsR+w2bu5Y
EsXWmmoENNl7tpTm/uqOw2jcFiBMCw==
=2w+Q
-----END PGP SIGNATURE-----

--Sig_/me8aMNfQdY0d3tE.7rzTq=h--
