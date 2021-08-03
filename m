Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995E43DF215
	for <lists+linux-next@lfdr.de>; Tue,  3 Aug 2021 18:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhHCQFM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Aug 2021 12:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:51266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231410AbhHCQFM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Aug 2021 12:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AB4F61078;
        Tue,  3 Aug 2021 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628006701;
        bh=ChOrB3CPLBJVhPiQkbuSn1ArNPEzKoeGUjX+n3TXo5g=;
        h=From:To:Cc:Subject:Date:From;
        b=VBZMvvmIWB5Ddyrebf1dgYRpzzt3wrxaVS92W9vqG+Migtd90Ap/V60TOLNDUBjRF
         OYczL/lkmhA6R/cFRmcp2IPVKawEE22zzbr9twJZPbign1OqbGTBgkukjX9mZXbLUk
         Cm+RiPsRtBAhXMGclWrmkldogpH11A751IdjR7p89Mp0mqQo4JmqpZqfR21VC3e3jy
         WLIU16cHsVTp3mdYpvkU5OF6trMMsp6VV1MwRRKmQtYWzIBmCwN4G7qK73B98Gbzww
         hmNWOO9MFGjhhpU0Nb3Ghq4EOz4jR86TzidUhIRWSwtJBf0tv5r66ZMbfMjU6aFtGn
         rgS3QRmMGx/ng==
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 3
Date:   Tue,  3 Aug 2021 17:04:45 +0100
Message-Id: <20210803160445.22331-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Changes since 20210802:

The staging tree has a build failure so I used the tree from
20210728.

Non-merge commits (relative to Linus' tree): 4499
 4999 files changed, 327140 insertions(+), 124203 deletions(-)

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
