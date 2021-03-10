Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08AB3333B9
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 04:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhCJDQX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 22:16:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230458AbhCJDQJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Mar 2021 22:16:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwHKM2w0vz9sVS;
        Wed, 10 Mar 2021 14:16:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615346167;
        bh=fH8d75kMKDuL+wTwiHzzw8rRtEl4DPmfTt6KY51I6FA=;
        h=Date:From:To:Cc:Subject:From;
        b=gtChtimYrCAawvP7MZpYbcTI/qw/sNQAk6fB5eeS6/pYxuy89f435EzjIo+15FyYN
         iUQz9zGZG6EmlNXdnERDiG91un8TfK+ghWOqrxPZhsFKtKosET84nuv/WvppbwPRvI
         h3dXDQOqhYEkNjCkuVvT73/1q6T2KM0arDKpz3mqNYb1gLx2KSUrE6CtMsQdGEGy+R
         gAiIgMlru4Yy+iA9049C1YUb3qaVgTXgEceVkvEgKLplzIr3vG9AaHFGpF8wYNvMBO
         au3eenT/3pZzsGod/mCQ8Q6cYm24j39EAluDeIC28yrasBm9+6fbvr2RP+ZOxA73O0
         px1o661NdLvew==
Date:   Wed, 10 Mar 2021 14:16:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Axel Rasmussen <axelrasmussen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210310141606.75e990d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c3HZeuph4x_ZDng=57vtXe.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/c3HZeuph4x_ZDng=57vtXe.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/shmem.c:2365:12: warning: 'enum mcopy_atomic_mode' declared inside param=
eter list will not be visible outside of this definition or declaration
 2365 |       enum mcopy_atomic_mode mode, struct page **pagep)
      |            ^~~~~~~~~~~~~~~~~
mm/shmem.c:2365:30: error: parameter 6 ('mode') has incomplete type
 2365 |       enum mcopy_atomic_mode mode, struct page **pagep)
      |       ~~~~~~~~~~~~~~~~~~~~~~~^~~~
mm/shmem.c:2362:5: error: function declaration isn't a prototype [-Werror=
=3Dstrict-prototypes]
 2362 | int shmem_mcopy_atomic_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
      |     ^~~~~~~~~~~~~~~~~~~~~~
mm/shmem.c: In function 'shmem_mcopy_atomic_pte':
mm/shmem.c:2367:30: error: 'MCOPY_ATOMIC_CONTINUE' undeclared (first use in=
 this function)
 2367 |  bool is_continue =3D (mode =3D=3D MCOPY_ATOMIC_CONTINUE);
      |                              ^~~~~~~~~~~~~~~~~~~~~
mm/shmem.c:2367:30: note: each undeclared identifier is reported only once =
for each function it appears in
mm/shmem.c:2394:15: error: 'MCOPY_ATOMIC_NORMAL' undeclared (first use in t=
his function)
 2394 |   if (mode =3D=3D MCOPY_ATOMIC_NORMAL) { /* mcopy_atomic */
      |               ^~~~~~~~~~~~~~~~~~~

Caused by commit

  3407bec05d6d ("userfaultfd: support minor fault handling for shmem")

# CONFIG_USERFAULTFD is not set

I have reverted that commit (and the following 4 as well).
--=20
Cheers,
Stephen Rothwell

--Sig_/c3HZeuph4x_ZDng=57vtXe.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBIOfYACgkQAVBC80lX
0GyeNAf/atQ7fN6HN+er47OPnt/eOqRzzDhzr3Ln1CWnNUMmg5ZthHCnL5rSLY0P
yKiZxXG/agYemxIB8DvtjWtih7cN4Zztn4v5eTOol2e1B/VUmCS3mMj1yQA3NWQF
tUgZa/segYSYEzYrZNCoUOm6D3fulji+dkohL0RjlwfsYlDAqwluNAKwBJ6iDJcQ
TFgc+Uwj7yhwp/4DhA4prxBxX4csRcpoOvWiIoGLFbq5AJ/pCndNIckp6WtF6bTR
M7nHPieVe+rxsxiPghLDLlZiJ5iALG+S36wgUxrPjTq3vvPxQa6+wmpumN0c+mkZ
y7I+EVoVyJ3Lf1fTTVhDixdP90Fe4A==
=jxbS
-----END PGP SIGNATURE-----

--Sig_/c3HZeuph4x_ZDng=57vtXe.--
