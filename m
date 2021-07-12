Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584BE3C66DC
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 01:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhGLXVc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 19:21:32 -0400
Received: from ozlabs.org ([203.11.71.1]:57819 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230458AbhGLXVb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jul 2021 19:21:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GP07Q11LBz9sWd;
        Tue, 13 Jul 2021 09:18:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626131906;
        bh=r1OHkWV4zheiEUGH6zfhSkdiBAPokmU2n6vmXLRpy7I=;
        h=Date:From:To:Cc:Subject:From;
        b=Z2jTWAHnugmJwnK/XQ+fxeb4vL52TXnsC36T8wClBcWLP708yUBWbs/u32ziYWk7E
         8zxy4DOx7biFxQ6rZSh2VcQnBixH1BXpoS63/wZfl+aRRvtMGae62HCvKLyI0fWO6E
         UxMdvfgVbtlWGnggPnydItpaZ+IjEYKQ+geUNXRwol8Q6wGgTb05Z1i7dos5t+9/rN
         CMVtnwobTO9Yv2T9gH2gH7YDEm8K3Gzi+NFGYcI7VkKAkqi9+TCiDvPOZ5EK/N8y1P
         dbZE3PVtJs/iF5Z02d5llFxa6nSw8ad6cfKlJFjRcw3lf1zn63cO1wbBA5PvpIChid
         SfQ+faFOC7R3A==
Date:   Tue, 13 Jul 2021 09:18:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the workqueues tree
Message-ID: <20210713091825.7cfaf3fb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oXn_iJ.xCgNXgASxB7sqQgl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oXn_iJ.xCgNXgASxB7sqQgl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  65160ab66cb6 ("cgroup1: fix leaked context root causing sporadic NULL der=
ef in LTP")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/oXn_iJ.xCgNXgASxB7sqQgl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDszcEACgkQAVBC80lX
0Gz9rggAllIceh8eEhxtQdK3t+9TNHz92snWMEfzouZIS7aoAgHv9kWmRLmzTDtW
BZ/uAeGuyKuYbZVg1nt00BO5UBsxrXzlDQQAt0CyvV1ANE2DoQUqqgSNai59Sxzh
YYAeyRPU9zm5COt7J4mOZCwGJFno13xh5JOPQ1vZZ16LAUu9RMxgCsxwxnz/Vdov
+j3xDt1B3ylHbhQhAZrHOIlYyRuuNiDbMzn4loL//SaX1mkzgjkixIYRPTV+3KwM
71APDCu/29HArO1sAP6we6cm+T3w9nVOifp1hgOSIK4njnwE+ogDsILr9leVeBQ7
FAfR2ihVCbVYBTbQhV7JSC3a9JNWBQ==
=dHpz
-----END PGP SIGNATURE-----

--Sig_/oXn_iJ.xCgNXgASxB7sqQgl--
