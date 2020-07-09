Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C458219AAE
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 10:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgGIIVx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 04:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgGIIVx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2020 04:21:53 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E653AC061A0B;
        Thu,  9 Jul 2020 01:21:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2Tfk6mp2z9sQt;
        Thu,  9 Jul 2020 18:21:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594282911;
        bh=6sOJKfDwmE7Jn5G6OLei4DX+ptf+cUQ41BI/efYMaIA=;
        h=Date:From:To:Cc:Subject:From;
        b=Mh/D2sGVXeCV5N+8AITVBW0Uz0iNns7KjhlqqW9qaruLbnYw0GxHsCBPbtT6V5wDP
         zEgB3pLtbay3nnSVxbtaCdOn4SSRinnyfkFQUkFuttLSkZWea73XFOWduvfy5QbsiJ
         4olU1u4W2+xaokbO3dyK6vNI8rC04O62/YEy3XKJvsrtpNSpRLlD5JUhpo+w6xOzVJ
         yo0cdX8J0hdc9pI5bpXce/8lY9ghXtDKix9/0r90PBHyxJDwqlzWWqr1q63yPsHiL1
         THlz1HpXrOy024ALO4KvqlGhGQ/Rbx8PDrTWFzwybk1N8287aNLpF/RjBKgRHmBIRd
         b/WDVwYDzQ/eQ==
Date:   Thu, 9 Jul 2020 18:21:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Zi Yan <ziy@nvidia.com>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200709182150.7b49e5e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oPePH06xgxjaR/xhTtaHRel";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oPePH06xgxjaR/xhTtaHRel
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Also reported by Randy Dunlap.]

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/migrate.c: In function 'migrate_pages':
mm/migrate.c:1528:19: error: 'THP_MIGRATION_SUCCESS' undeclared (first use =
in this function); did you mean 'PGMIGRATE_SUCCESS'?
 1528 |   count_vm_events(THP_MIGRATION_SUCCESS, nr_thp_succeeded);
      |                   ^~~~~~~~~~~~~~~~~~~~~
      |                   PGMIGRATE_SUCCESS
mm/migrate.c:1528:19: note: each undeclared identifier is reported only onc=
e for each function it appears in
mm/migrate.c:1530:19: error: 'THP_MIGRATION_FAILURE' undeclared (first use =
in this function); did you mean 'SWP_MIGRATION_WRITE'?
 1530 |   count_vm_events(THP_MIGRATION_FAILURE, nr_thp_failed);
      |                   ^~~~~~~~~~~~~~~~~~~~~
      |                   SWP_MIGRATION_WRITE
mm/migrate.c:1532:19: error: 'THP_MIGRATION_SPLIT' undeclared (first use in=
 this function); did you mean 'SWP_MIGRATION_WRITE'?
 1532 |   count_vm_events(THP_MIGRATION_SPLIT, nr_thp_split);
      |                   ^~~~~~~~~~~~~~~~~~~
      |                   SWP_MIGRATION_WRITE

Caused by commit

  f85bb1e35327 ("mm/vmstat: add events for THP migration without split")

I have reverted that commit (and its followup fix) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/oPePH06xgxjaR/xhTtaHRel
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8G054ACgkQAVBC80lX
0GwVLQf/cGAtV7AheHUa9iOA7qFUbRuujsdMvbSeVRMTjILn3FASLq6lsUIN6597
HyfaK/0Xmyx1FG+9PrcVzA++mDmz5ZKfzvP5ym+TVO1FENvkuSw1s/9i/I1Z3gDX
DIuPsSCe2dlHAna8EqFKvhyR4wTwphGUg/tNbqPjz54FkLr2MwOqNb/AxsSbqq6+
+94/FFVNl/hsSQuaAui7zDl7dbdCzLbGt1N3le8mY+tlGv8RQfjBNrvL1sGk5S3U
Ht/9vgLGfkJ7gtzN/vl3kHXMuyaiYVV4QBKeCzAKuJ3mfWAAilrQBW63u0dkZS35
OuzS61+SiaAjiFnVAIO1AoqIx2gA7Q==
=dEXq
-----END PGP SIGNATURE-----

--Sig_/oPePH06xgxjaR/xhTtaHRel--
