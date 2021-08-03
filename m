Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0573DE3F3
	for <lists+linux-next@lfdr.de>; Tue,  3 Aug 2021 03:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhHCBZF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 21:25:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233073AbhHCBZE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Aug 2021 21:25:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07E9F60FC4;
        Tue,  3 Aug 2021 01:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627953894;
        bh=QrFoksWYIiAlKdefpChb6q8SDLrES7NeHLRULsZxfe8=;
        h=From:To:Cc:Subject:Date:From;
        b=WTOVv0CEP605/NeLE3rYNNevXWfB6oBoTaz93XSVSDE/JZguC+8ZdRHjomS7mpiwf
         qE378TmvQG3LLQu39o0ldRWWWKwwoAlyeQPVgn5QFCjs2ggAn8Q8g35VTo9rd0N7Cn
         IVHWdQG7aNtfyLOAvfJvxvooXpV+jx6BCuQTotpycx4WY9A+BZH+e7I46pFcygmXVz
         ji+PEbaF91NVGzB1JaCfu4c6eWVTAbTnnMKaWGr6CFd70W0wvh5sVIeftVtM1ym1zO
         4/GlPSZ0HCZom8ljiww01SA/JtpL7TDI2UeZaGXDVpTlb1p5rX6PlBZq4VjWaF5gjz
         Me4BAP61ku20Q==
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 2
Date:   Tue,  3 Aug 2021 02:24:40 +0100
Message-Id: <20210803012440.49513-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Changes since 20210730:

The staging tree has a build failure so I used the tree from
20210728.

Non-merge commits (relative to Linus' tree): 4430
 4902 files changed, 326250 insertions(+), 126481 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with an arm64 defconfig, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, arm64 allnoconfig and i386, and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 333 trees (counting Linus' and 90 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.
