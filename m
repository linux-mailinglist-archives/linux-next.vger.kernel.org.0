Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52421281FB6
	for <lists+linux-next@lfdr.de>; Sat,  3 Oct 2020 02:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgJCAVo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 20:21:44 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2214 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJCAVn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 20:21:43 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f77c40a0002>; Fri, 02 Oct 2020 17:21:30 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Oct
 2020 00:21:43 +0000
Received: from sandstorm.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Sat, 3 Oct 2020 00:21:43 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 1/2] selftests/vm: fix an improper dependency upon executable script permissions
Date:   Fri, 2 Oct 2020 17:21:41 -0700
Message-ID: <20201003002142.32671-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201003002142.32671-1-jhubbard@nvidia.com>
References: <20201003002142.32671-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601684490; bh=WuyiYWjWPWYyIxLJ4cAt9mzxpJiZtrYrsXWo+nyO5Dw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=pW53dv/u8yw4i/CUrfXGZr76nPQNAoVZAaigSWV8j48+P9aJDTxYtG0RUrQxB6u+b
         /+6v2EGqxGcGYdkRap4cxnhbeqdPqkfoolwDqKrOIqTdM0h+e5kxZRo0w7joB3RyE2
         ygIWyz0B4scLOf4Ybb3chRKxbrqRFwPs7DoHum3Y0C0QGXG4ZwEyK+BNxXAq6bWfUJ
         LZWS92LEYouNXJrAOP7eFuPUDuGSTsrua/QhT3iHOu2LHrd7oDy0E6JRl0oiDrIO1y
         AsG5Z3k62zP1H0LpMuMAUnnmHzuiUQFqwhoID2BlsbdG11QMStWZKRxnfeHe5d1y5o
         cUXeToPlXaRgg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs
dependency") created the new check_config.sh file without the execute
bit set. This is a problem because that same commit caused the Makefile
to invoke it "./check_config.sh", so now "make" is failing in that
directory.

Scripts are not supposed to depend on the executable bit being set,
because patch(1) doesn't set it, and using patch to install a kernel is
supported. Therefore, this fix involves two parts:

1) Invoke the new script via /bin/sh, to fix the problem, and

2) As an nice touch, make check_config.sh executable as well.

Fixes: commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlb=
fs dependency")
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 tools/testing/selftests/vm/Makefile        | 2 +-
 tools/testing/selftests/vm/check_config.sh | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 =3D> 100755 tools/testing/selftests/vm/check_config.sh

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/=
vm/Makefile
index 019cbb7f3cf8..a9332a7cf33f 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -138,7 +138,7 @@ $(OUTPUT)/hmm-tests: local_config.h
 $(OUTPUT)/hmm-tests: LDLIBS +=3D $(HMM_EXTRA_LIBS)
=20
 local_config.mk local_config.h: check_config.sh
-	./check_config.sh $(CC)
+	/bin/sh ./check_config.sh $(CC)
=20
 EXTRA_CLEAN +=3D local_config.mk local_config.h
=20
diff --git a/tools/testing/selftests/vm/check_config.sh b/tools/testing/sel=
ftests/vm/check_config.sh
old mode 100644
new mode 100755
--=20
2.28.0

