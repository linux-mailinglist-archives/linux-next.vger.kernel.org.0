Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77890301F72
	for <lists+linux-next@lfdr.de>; Sun, 24 Jan 2021 23:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbhAXW4X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 17:56:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46895 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbhAXW4R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Jan 2021 17:56:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DP7d13dfKz9sS8;
        Mon, 25 Jan 2021 09:55:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611528934;
        bh=/NzEvyjtigECWZ2dvwFVQNAwqXCeHO1nSFdNbxltmTY=;
        h=Date:From:To:Cc:Subject:From;
        b=GGMvaF4kDSJ2CUFWc937aF30qz+F0kdZYVr7i2G2+5N/dbDkRhHT1XrzONUSwgRlX
         sapMnt4YenZB76B8alzeSEpFkj+TsqpABi02Xk1wyoAa5AvNxD5wA4HIh1CTIT6wAG
         IzrdGiAL63FESiUoqRxd+p4P47s0k/93Y11Kh0dPoT37wulEhBGWNZPK9DwPxPpnGa
         AHvjqNlqryQxkXnVWTFNd58xT0D9RsdsDoWHIreBWD4BF9jKuAFKoDiPjO5k1AwAHy
         aZa54O1Oeoz8HTVdjUjtuqP6xdOD09LI34GnuGI3FTVOXdqKrvBNaH2WMX4K9dq1zu
         YOU0fogfRhWRA==
Date:   Mon, 25 Jan 2021 09:55:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Brian Foster <bfoster@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20210125095532.64288d47@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8Q/zRPTTLO8vyMwY3iusJm8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8Q/zRPTTLO8vyMwY3iusJm8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/xfs/xfs_log.c: In function 'xfs_log_cover':
fs/xfs/xfs_log.c:1111:16: warning: unused variable 'log' [-Wunused-variable]
 1111 |  struct xlog  *log =3D mp->m_log;
      |                ^~~

Introduced by commit

  303591a0a947 ("xfs: cover the log during log quiesce")

--=20
Cheers,
Stephen Rothwell

--Sig_/8Q/zRPTTLO8vyMwY3iusJm8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAN+uQACgkQAVBC80lX
0Gycgwf/XH6jV1tvDRU/LUvL2RrVWltOTd97TlKsllXA1fR0lchA0Uya4GaqdTVT
vKGQjBjNl9I2PUUTFgJBCTXSfKb8DPjLYk6N9fpYY65IJIDaJdrrkxNC6zx/tVQ6
WsG8vaiWLcWVCw41p03/0hdk5Bv47skNeiuWL01Fa8dwAlW1w0ch4D/ZxhEmepFn
cd6gzLIOQWYSAoVvpwwRdn2VhHA50yKvcd97PAWSkswVJX7G14NoGEC2/0kJowfR
h0syd5ABohMci9M/eWMwpHSCbbMTzBm3hkuknGlsWJltgGDiKIc8/4Wh8hhhwthY
afB9FTHlxTwxyiiGwy4bOGMP1qPQJQ==
=E7Ks
-----END PGP SIGNATURE-----

--Sig_/8Q/zRPTTLO8vyMwY3iusJm8--
