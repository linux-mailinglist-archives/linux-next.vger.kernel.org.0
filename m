Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49AD2162FD
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 02:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgGGA2A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 20:28:00 -0400
Received: from ozlabs.org ([203.11.71.1]:42165 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbgGGA2A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 20:28:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B13Dr6P5cz9s1x;
        Tue,  7 Jul 2020 10:27:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594081678;
        bh=cQkuvuDXVTNikfR9rypMMuYWn/Qt9xkPY1Y3fHHP+sk=;
        h=Date:From:To:Cc:Subject:From;
        b=TWVNHL3O2g8vW9CwWCti08wVl7BC3+BE2ImClNyC23D/GKnnbN9XEDKgP7Yap4HGq
         0ZsD4GyvbChSHcc/iUhJFAmDUOpQ4/Q6I60kPuS/jCWiKy/PK02UKHqCST66sy/xu8
         qgIXBg7S80ikYSAgDr7JEOL4VXwJ17CKkYmOupoxyxyPyJtyqoCxS1XfpnuyM9UXbf
         6lxSLvEEdADp3C+kDmXZYzBOeVLiz0x1LlrD0cASArqnuQB3+XikoPz6bHMRwc311Z
         0usEBtrsJjzPPQW8rXdiL2Jxp61qSpNQ1bdGLnV3uaK5uXKK82jnkLXSv6s33xAn+b
         zR6MitfZSZ38w==
Date:   Tue, 7 Jul 2020 10:27:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>
Subject: linux-next: build failure after merge of the xfs tree
Message-ID: <20200707102754.65254f1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/78vVcTgeuWwIZD/fb3c.Pgv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/78vVcTgeuWwIZD/fb3c.Pgv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ld: fs/xfs/xfs_buf_item.o: in function `.xfs_buf_dquot_iodone':
xfs_buf_item.c:(.text+0x21a0): undefined reference to `.xfs_dquot_done'

Caused by commit

  018dc1667913 ("xfs: use direct calls for dquot IO completion")

# CONFIG_XFS_QUOTA is not set

I have used the xfs tree from next-20200706 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/78vVcTgeuWwIZD/fb3c.Pgv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8DwYoACgkQAVBC80lX
0GyqUwgAkHSU+O1kJckMqxnfPa+2Y888f5hB/g8zdGEN1ejvnpd/9B0aYagn66cA
f0p6g5Btnjd7NnngBAq6RHuKigV6wWcoXlmhw0O0j0X9j0+8Z987W9WxrwdPrixl
eZfklF694lQn9jHPxxTNm0nbG+PVyadVSy1poFZddRXxwVR7G3o/l57J/m2Y7R6s
7XVFyNB5en3kXzHknviZmsGl+usg+vih9TaZE3mWGuwj1yL9bujmjJS1F/zdLe8t
gz5gmc10jMMvul8D4qyxQvXLHgXAxZTa2Xu6DAKEtxIEO5A8tigLDcwSuDxUJXe+
znBY29Y1pqNty1E4GSr1NIkQRX4ySA==
=XvtZ
-----END PGP SIGNATURE-----

--Sig_/78vVcTgeuWwIZD/fb3c.Pgv--
