Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A24280F1C
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 10:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387687AbgJBIkz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 04:40:55 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3825 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387680AbgJBIku (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 04:40:50 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76e75e0001>; Fri, 02 Oct 2020 01:39:58 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
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
Subject: [PATCH v2 2/2] selftests/vm: fix run_vmtest.sh: restore executable bits, and "s" in name
Date:   Fri, 2 Oct 2020 01:40:49 -0700
Message-ID: <20201002084049.556824-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002084049.556824-1-jhubbard@nvidia.com>
References: <20201002084049.556824-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601627998; bh=sLW1NmIain7VcL393VHibP/0YfWKAtBQhR2AcJQQwXI=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=JqBFYC56bV1VH6/J6NSMKJ9QGb1LwwetP1bxAL+Wj9lsPt5QBJJXgllYItJHNMHCj
         UA7ig8vMjD6VAgRDaEGnsJIh532YQuM1f1ku9/ENn6uMDpyZMQijMJYsqiQ1mvbp0m
         T2MjGJMld36DHWzJRsAtRLIni53dAIa4LujGPaniC86ne5g02Vzqn0pt4xz6ZPzevg
         HEzXJr64siYqNn78sgBwiPNlZjWobaxvzGIIx6gZ8Z5qSYyFQ2pbmV3hjYZ7n5fsJ+
         cUBzA1b8PXwqllks4q9WdOwOvyqp1dgD1ONggWiNSjIXHJKlVWDIsRi5VQYHzy3x7h
         4CHe+wpUzNngw==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

commit cb2ab76685d7 ("selftests/vm: rename run_vmtests -->
run_vmtests.sh") changed the name of run_vmtests to run_vmtest.sh, but
inadvertently dropped the executable bits.

Somehow the name is missing an "s", too. Fix both of these problems by
renaming, and restoring the executable bits.

Fixes: cb2ab76685d7 ("selftests/vm: rename run_vmtests --> run_vmtests.sh")
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 tools/testing/selftests/vm/{run_vmtest.sh =3D> run_vmtests.sh} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tools/testing/selftests/vm/{run_vmtest.sh =3D> run_vmtests.sh} (100=
%)
 mode change 100644 =3D> 100755

diff --git a/tools/testing/selftests/vm/run_vmtest.sh b/tools/testing/selft=
ests/vm/run_vmtests.sh
old mode 100644
new mode 100755
similarity index 100%
rename from tools/testing/selftests/vm/run_vmtest.sh
rename to tools/testing/selftests/vm/run_vmtests.sh
--=20
2.28.0

