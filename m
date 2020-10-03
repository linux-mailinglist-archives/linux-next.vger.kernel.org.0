Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E7C281FB2
	for <lists+linux-next@lfdr.de>; Sat,  3 Oct 2020 02:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJCAVo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 20:21:44 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2470 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgJCAVn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 20:21:43 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f77c3e30000>; Fri, 02 Oct 2020 17:20:51 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Oct
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
Subject: [PATCH v3 2/2] selftests/vm: fix a rename typo: run_vmtest.sh --> run_vmtests.sh
Date:   Fri, 2 Oct 2020 17:21:42 -0700
Message-ID: <20201003002142.32671-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201003002142.32671-1-jhubbard@nvidia.com>
References: <20201003002142.32671-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601684451; bh=7649XB784jdtUWB6zIb9HMx3JPfJ1MQk7wdl4wK+r0c=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=SfTatwCkGJWpCz0D7Gn283XAxrCthD3te5CvJDL3unDOhblMYyQtIF+7i/sSl8NJN
         w7taLfG6w810x6ljmnH3xtAIVMHGxbQhAg0dN+u0vm9WfiT5+DS8OxHU8F3Ki+0av6
         nePduIw3MkV4IrzK9v0eFLF/uXK10rLOKR9msplWUwolMftPqJm0jTGxL9U1ZAQtCr
         pPECrqPRQG2ZiOHz1c0UhGmZ4Rb1zV0nfeF028i4gaQpCXDZ4dywSvR21dJwOssP1f
         Ig7zeQcdlYdlfS834BnfT+yRaq338gwi/X2lgoFzx6Om5pXpR9fyex97GZnRx3pOAZ
         uUsJTH0kBprGg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

commit cb2ab76685d7 ("selftests/vm: rename run_vmtests -->
run_vmtests.sh") claims to rename this file to run_vmtests.sh, but the
actual commit botched the job and left out an "s". We all miss the "s",
so let's restore it. :)

This patch also restores the executable bit on that same file, as a
nice touch if it sticks. (Which it won't, if someone uses patch(1) to
apply this, but it's worth setting it for everyone else.)

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

