Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE31281FB7
	for <lists+linux-next@lfdr.de>; Sat,  3 Oct 2020 02:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgJCAVn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 20:21:43 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2211 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJCAVn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 20:21:43 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f77c40a0000>; Fri, 02 Oct 2020 17:21:30 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Oct
 2020 00:21:42 +0000
Received: from sandstorm.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Sat, 3 Oct 2020 00:21:42 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 0/2] selftests/vm: fix a rename typo, fix executable issues
Date:   Fri, 2 Oct 2020 17:21:40 -0700
Message-ID: <20201003002142.32671-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601684490; bh=HpvkrjIH4D7JuPefHr68FctndBJzyW8K9H8sXqLzGPs=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=XorK8uCnIsLdlEabrY6hcpp8rko+CBeQkIyqQFTXdzKOgLZs/nEDk7Ujp5vRaE0x5
         NzwJAWLzcE6Fphrvw60dNVkElzadzTMn/1Sm3NJyGHt9JabwKRoYERP00Z+zfbBi7q
         Oyle2phWF1of3ozsO63hmcyzcEYBXxzYwclDrl7eRcMfeYbPUPSAdNJNRS1T5Oki0t
         OdFFvYI0O3Q7eqLWbjGG9Bow2ANm3hLcNMJfJKs3wo8XXypoGktO6qKfdWA4l4gmpW
         wjKeqPI3z8VV89SJMhSsSRC8ex16fVEZZRlUtCddaFzbolQYUiyC4pG/iGml7dzcvI
         8oCxcerENh+Cw==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Here's v3, which treats the executable permissions of the two scripts here =
as
optional nice-to-have features.

It fixes the rename as well.

Again, I've put in commit hashes that are only valid in linux-next, so thos=
e
will need adjustment if these patches remain as distinct patches.


John Hubbard (2):
  selftests/vm: fix an improper dependency upon executable script
    permissions
  selftests/vm: fix a rename typo: run_vmtest.sh --> run_vmtests.sh

 tools/testing/selftests/vm/Makefile                          | 2 +-
 tools/testing/selftests/vm/check_config.sh                   | 0
 tools/testing/selftests/vm/{run_vmtest.sh =3D> run_vmtests.sh} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 =3D> 100755 tools/testing/selftests/vm/check_config.sh
 rename tools/testing/selftests/vm/{run_vmtest.sh =3D> run_vmtests.sh} (100=
%)
 mode change 100644 =3D> 100755

--=20
2.28.0

