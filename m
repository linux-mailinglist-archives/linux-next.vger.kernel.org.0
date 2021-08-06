Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F320A3E2E9E
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 18:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbhHFQyY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 12:54:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236878AbhHFQyY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 12:54:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5B1560EBC;
        Fri,  6 Aug 2021 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628268848;
        bh=orPZ5AgBkaGsuEXI7ykCPkca837ZQrhZ4NKxQ/scOxM=;
        h=From:To:Cc:Subject:Date:From;
        b=tu+7dJONfzgi79h78xxwQ/bpXn+CLVQGBGPftks9XBB4699WogScIIDWo3bI///30
         +M+aOJZ1GoJ3fdegtC0lB9gS7ALHdJjjW4JykoizEI4logN7lbt6EH0GQ8WzsI00MZ
         GEZmWt1GLTJrBPc5SN/UPKRYQZwNpNZ1P5/QhTQ80+OICrvG/0p0O/KGmpJt0ZHd2g
         1hc9PoukPfQQiw0wRt0ZAPm9XPofxV+2PfFTi5lC3xGvQ/91qmLVDETAgnjexfpmIy
         ZWOirktT5MBdFbBi2rD5MwFC0LICudyvFEK/0cZD60sVsySrQ2yE44f4u9xgfzoC16
         OT/XkBKVKSeNQ==
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 6
Date:   Fri,  6 Aug 2021 17:53:51 +0100
Message-Id: <20210806165351.10621-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Stephen should be back on Monday and normal service resumed.

Changes since 20210805:

The qcom tree gained a conflict with the usb-fixes tree.

The bluetooth tree gained a conflict with the net tree.

The drm tree gained a conflict with the drm-fixes tree.

The usb tree gained multiple conflicts with the usb tree.

Non-merge commits (relative to Linus' tree): 5276
 5749 files changed, 365137 insertions(+), 140581 deletions(-)

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
