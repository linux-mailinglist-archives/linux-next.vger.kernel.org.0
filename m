Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23833AE109
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 00:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFTW6E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Jun 2021 18:58:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229875AbhFTW6E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Jun 2021 18:58:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7SgT68t9z9sRN;
        Mon, 21 Jun 2021 08:55:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624229749;
        bh=kuZ7JguMSNRvdRa59Mbz0GxNvMF0WJ1DhhX31Za9FeQ=;
        h=Date:From:To:Cc:Subject:From;
        b=XDVdel5kdsPFjT0KENldTMYorylI4V/pt2IokuZp6Ple66xPY/EWD7TiH2JMqB0e8
         c9DzsNADGoQl1YAeWI/umdq33yofzINxcIx2MqEGXgEZkOXCZM2u/zBB1jr8WDva2x
         AN/kuisWREd/IUBbxztIqusNGVO50KGa333sa8dZA4MyNEq3ESIoP6LK//oXH00jAb
         wAIaD63cWk8icqjYQLcbF+IGdtxTkhHb5i5z5SAECikkBFYGJSCtCIoJMPKreXrZp1
         NTvTHU+ImATn5NLKD0bak3IOfAWbjEwrjUvIgsRr9DDXx4rgWRdUEurc76+/KfJ8xx
         bx7itt6rODo5A==
Date:   Mon, 21 Jun 2021 08:55:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hyperv tree
Message-ID: <20210621085548.35b6f88c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lOgRmqrroS_XfMSGB0A10y7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lOgRmqrroS_XfMSGB0A10y7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  13d5ac4c5a3d ("PCI: hv: Add check for hyperv_initialized in init_hv_pci_d=
rv()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/lOgRmqrroS_XfMSGB0A10y7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDPx3QACgkQAVBC80lX
0GyGzQf/Vt3MWG2sZFmO/gjuxdzi+f0zy3hYkXeuuWbnN1Q3dAsZ9uyU8LyKxgnZ
C0DoF1Sw5VZXuq40fzPsmTjk33OzRYfEjq1tGeh7tMWOeHSZ4ZiQ3qNlGJUjQHAr
HUVyeG0vvH2PTnGE6KYL6cDSumGAIoD46ZQIlIMOFh62LbFOgljWF9y6U0iw0bQC
gsD/2YmFKSXe+oAsC/Nr4Av4ONfs4R75YNBuCD9DC8lHqv8uuNPiTaAzGDr9m7SZ
m9HEvvfGtkxSGYZmkdbWZDCioE3t6zIJUNGNNy2vA51hgHFxTIw+63dpOPerT9WL
HJGiRGRkYx3vsKzts3RKaBad0nY//g==
=bWjy
-----END PGP SIGNATURE-----

--Sig_/lOgRmqrroS_XfMSGB0A10y7--
