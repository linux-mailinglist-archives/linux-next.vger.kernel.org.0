Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733E134A371
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 09:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhCZIxT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 04:53:19 -0400
Received: from ozlabs.org ([203.11.71.1]:47957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhCZIwo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Mar 2021 04:52:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6G2J5vQYz9sS8;
        Fri, 26 Mar 2021 19:52:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616748762;
        bh=g09iU8hR/lAv9pnKVSRRWFYJQmCD/sDHaaa1nfzr3Kg=;
        h=Date:From:To:Cc:Subject:From;
        b=NUwuxVmTnprNkytMDu7We7whdOv9p8mqSXN76vvT9DspgqCQDD0/iIo9WXXwzUOmT
         tEp8F7vIRkrVyfuFfEy28Xfsprno80Ji/ZuGr8lpAgDubmL4zHAGkFOO0kEmAdjykG
         ZN8v4TBn921FQFCnWp/bsmzj9Hi8aH0tUCfvCMTBmCihFZcwAidZ3a1iYu+HVdPZHv
         8AIq5kzXMOMnq747wu9sZqD8VKVGrxGtr6YCf2JfvPiryJMRUqf+0OKaI7IqnI49x5
         4PAS0Xj7bwH4CjOLbyeqj/n3VOO0yfoVs4KKY0ioAR9alkAB83Z37Q78Pms+Io7ZsE
         wNN7Z6BbaYvHg==
Date:   Fri, 26 Mar 2021 19:52:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Will Deacon <will@kernel.org>
Cc:     Qi Liu <liuqi115@huawei.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the arm-perf tree
Message-ID: <20210326195240.7b937560@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5fJIKHBOWq+C8_hbA/zUxi0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5fJIKHBOWq+C8_hbA/zUxi0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-perf tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/admin-guide/perf/hisi-pmu.rst:61: WARNING: Unexpected indenta=
tion.
Documentation/admin-guide/perf/hisi-pmu.rst:62: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent.
Documentation/admin-guide/perf/hisi-pmu.rst:69: WARNING: Unexpected indenta=
tion.
Documentation/admin-guide/perf/hisi-pmu.rst:70: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent.
Documentation/admin-guide/perf/hisi-pmu.rst:83: WARNING: Unexpected indenta=
tion.

Introduced by commit

  9b86b1b41e0f ("docs: perf: Add new description on HiSilicon uncore PMU v2=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/5fJIKHBOWq+C8_hbA/zUxi0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBdoNgACgkQAVBC80lX
0GyFyAf/bGlTBxPfl3UbcX+uBELL6v+S9/rnnLcXk4hmlvVXc2oZmLb2rZd4vbTO
zeQa/r8TVqeaj78LdrPtqIWOmkQj+gV8aETATdDjOus35U/BD/F7uLocbDSn+UzF
BzReiJhWUfvwzTbCMTGY5yjX9cXVDjuLB6weiIPugE8U7oqM9TcVMkLD/EWAsFVy
gTphNCqCMiFAIcrrLRZpfzlEAr4FqHt3rKJf7dAbAD+yGvR/aECkiusiDiE9u0fv
fVY4NRNRnyJ9UnqWnA0adVlW24CmElOSb7Xh/DXhfSktwUCgoZfjhoU4XAPEJJfo
ZihpidhNCqvHH8EoFjse03DSyXXxbA==
=IKy+
-----END PGP SIGNATURE-----

--Sig_/5fJIKHBOWq+C8_hbA/zUxi0--
