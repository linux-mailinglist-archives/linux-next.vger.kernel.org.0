Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846CE280F18
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 10:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387681AbgJBIkz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 04:40:55 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3822 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBIku (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 04:40:50 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76e75e0000>; Fri, 02 Oct 2020 01:39:58 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 08:40:50 +0000
Received: from sandstorm.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 2 Oct 2020 08:40:50 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 1/2] selftests/vm: fix: make check_config.sh executable
Date:   Fri, 2 Oct 2020 01:40:48 -0700
Message-ID: <20201002084049.556824-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002084049.556824-1-jhubbard@nvidia.com>
References: <20201002084049.556824-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601627998; bh=2c1rESw+DwJTg5O2isLQ/PB/pSyBX7EQpiDns9fBvMM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Ey0GdtH8vTlp5i2Zc9G0Xw1s2znFHzSHc/1mG0bFGeoB6KxqUfahj/CxSVO1nzGEk
         fNgA6OnNiKS1Eay3NkECjLeJ7R58DxaRhneDbBjVDAU9G+ecVRnca23Ig1i3P0356r
         XsZgR7E86AyQhh9YxkGhU292QI9+l4xawVnqj0FmMOmNH2B3rfwkvdl4l/RIbtMwRs
         26kVS52fwxW+o+sd4Fk+g1CMLkBF1P5NE+bFTjlyySMeJ3mLyvl3ulwzWtiYEpcSat
         sIw90fCLwbUSrL8/WAdB63taVEFpH74L04RVVpZ28qZIqbCsjl1SxOL/4jbXNd37rr
         u0tu0qOCCL8DA==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs
dependency") created the new check_config.sh file without the execute
bits set. This is a problem because the Makefile runs it with "./", so
now "make" is failing in that directory.

The posted patch [1] does seem to have it as an executable file, so I'm
not sure how this happened. But in any case, make check_config.sh
executable again, so that "make" in selftests/vm works once again.

[1] https://lore.kernel.org/linux-doc/20200929212747.251804-9-jhubbard@nvid=
ia.com/

Fixes: commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlb=
fs dependency")
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 tools/testing/selftests/vm/check_config.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 =3D> 100755 tools/testing/selftests/vm/check_config.sh

diff --git a/tools/testing/selftests/vm/check_config.sh b/tools/testing/sel=
ftests/vm/check_config.sh
old mode 100644
new mode 100755
--=20
2.28.0

