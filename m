Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93347280D9C
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 08:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgJBGsN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 02:48:13 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17874 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBGsN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 02:48:13 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76ccc50000>; Thu, 01 Oct 2020 23:46:29 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 06:48:12 +0000
Received: from sandstorm.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 2 Oct 2020 06:48:12 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH] selftests/vm: fix: make check_config.sh executable
Date:   Thu, 1 Oct 2020 23:48:11 -0700
Message-ID: <20201002064811.435769-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601621189; bh=YxVI9lNPw6FH2PZxFouloQcRzoKxiMmyEXc7wrpbuJQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=Z3AyhWXZ2oH7XePndDjhqsSYxssrS2nU5h9mErdEXbV0/5qDdTQYacp7AnXgBJneC
         9ybJDAzUNXETcfQhre5r0LcsnLtWta+bnJXc6bd9mevvvIy23NYp5ZNmxnwGrD/oyg
         A8X1gmqDcoZNGi2X+EM37hJWPn1NZTS+/4AZyI670cIcG5qolh0x2FSWgslx7ng84d
         gvQ0LXcADLiBbbsQGfX9D3HvDWV3Wl2MqR5sDv08tUuaQOM4r/DQSDbaSIG9va6fw2
         fONlkzLmRhDV9wU1y3UhPNL9jaL6LP3NVgeUfhwJvXITuoE3q5r+NaTXSo+EaQTlsm
         altdnvWrfwA2w==
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

Hi,

This applies to today's 20201001) linux-next. I forgot if this needs to
be a separate patch or if it can be fixed up in Andrew's tree.

thanks,
John Hubbard
NVIDIA


 tools/testing/selftests/vm/check_config.sh | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 =3D> 100755 tools/testing/selftests/vm/check_config.sh

diff --git a/tools/testing/selftests/vm/check_config.sh b/tools/testing/sel=
ftests/vm/check_config.sh
old mode 100644
new mode 100755
--=20
2.28.0

