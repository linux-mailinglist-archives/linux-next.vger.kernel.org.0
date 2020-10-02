Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB249280F1D
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 10:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgJBIk4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 04:40:56 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5304 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBIku (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 04:40:50 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f76e7850000>; Fri, 02 Oct 2020 01:40:37 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 08:40:50 +0000
Received: from sandstorm.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 2 Oct 2020 08:40:49 +0000
From:   John Hubbard <jhubbard@nvidia.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 0/2] selftests/vm: fix up executable bits, and a file name
Date:   Fri, 2 Oct 2020 01:40:47 -0700
Message-ID: <20201002084049.556824-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601628037; bh=wX6PBUxi+cfgGQA7Wn5zIWp09S3sVVAodBAfNg/09+g=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=Zc9cvHTjtB9dL7ltG9EprEFV9c5FSmfwCiZB/IqEfvPX8DuEiFAglI1ngL/zwf8GX
         Z4D67LCi39DulH0ZFjS5f7hxrMtnFcdsE4Y1mTPVgbnR3aosJnztITMqXgmknqGb+E
         eq3NpnM79ANvnuDzYgmyydtY3YTY8SCa9jbwxnsfRHdGBJCcukpin9dg2y/bR2+EMK
         UX69N/Yr39cbCIn0JSwJF+S4eIPJvAEGpjfTWXiwfxdcMCFPk3TmOyXX2gJpK0C24j
         qbYGWI4b5xG39v4bnUNbhv7eUjPrbqVgr7/lEShGIS9t1Yo3zBDsEEovumBnYr51DO
         H2B7UOhvazaFA==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Here's v2. I can't use $(CONFIG_SHELL) from the Makefile, because
unfortunately this is not kbuild. So this is my proposed fix for these
two glitches.

(Actually, the "Fixes:" tags in each refer to linux-next commits, so
those commit hashes would ultimately need changing. But I suspect these
patches will actually be merged back into Andrew's tree?)

thanks,
John Hubbard
NVIDIA

John Hubbard (2):
  selftests/vm: fix: make check_config.sh executable
  selftests/vm: fix run_vmtest.sh: restore executable bits, and "s" in
    name

 tools/testing/selftests/vm/check_config.sh                   | 0
 tools/testing/selftests/vm/{run_vmtest.sh =3D> run_vmtests.sh} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 =3D> 100755 tools/testing/selftests/vm/check_config.sh
 rename tools/testing/selftests/vm/{run_vmtest.sh =3D> run_vmtests.sh} (100=
%)
 mode change 100644 =3D> 100755

--=20
2.28.0

