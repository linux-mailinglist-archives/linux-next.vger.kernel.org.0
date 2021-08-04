Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82743E06F2
	for <lists+linux-next@lfdr.de>; Wed,  4 Aug 2021 19:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239838AbhHDRuY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Aug 2021 13:50:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:47162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239814AbhHDRuW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Aug 2021 13:50:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92AFC60E78;
        Wed,  4 Aug 2021 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628099409;
        bh=rdy4S4sZbf0DPHSO2IvenRzSVBGX7wTwS/OKrB9xBUA=;
        h=From:To:Cc:Subject:Date:From;
        b=WE7Hv3KlEeQhOHAUwL3Qci6y1hyarwe3I1B8vZR4KCzUt7sq1K1DbpnGTQrAch12h
         aZ++PGv0vrhTdA74Uuou/Bd1rIGAfaBAZW73ptuYqNW1jGrm2mxTXlqw7vaISvjti7
         8Ei4cHVjE67xKVFLOZhsHeu5j0BIQ+UV4OQdfTaoaldk6IxPhgfCQvP+dJ94qTjepP
         0roN6zYEjcOLMYo2hlOwKsHLMj7Ur4tVcjrKKUWQiRk+27D2MNVIf2bOmYIzLzWGC2
         1kR8USxRj8A+J4hY8cRxLwgMv/enSPiuc4qDFYNcfA/SXzSwrOWB0cupo11zGU97MR
         7Nn4ikOm8gwMg==
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 4
Date:   Wed,  4 Aug 2021 18:49:53 +0100
Message-Id: <20210804174953.16143-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Changes since 20210803:

The mhi tree gained two conflicts with the net tree.

Non-merge commits (relative to Linus' tree): 4709
 5212 files changed, 333430 insertions(+), 133424 deletions(-)

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
