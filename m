Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1A73DBCF4
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 18:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhG3QSx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 12:18:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229642AbhG3QSx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 12:18:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2A9D60F3A;
        Fri, 30 Jul 2021 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627661928;
        bh=hQE6gbx4LgbZV6pc80hDOAhyrN7Bxl6zdfsL7Y+PSjQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Gkpg/TV0UWsTcJ/roncELjGh+CCosWsq7vjaEseb4SeKel6LB8xSq0WrN5iTD2Hn/
         M6RmtsQxpU6QTefoAcGiKZuUQIam2ne2rE6MDxfGagyzZ+scOVQp8BJQJTaqIrsGEl
         4GapPY/C7w6esHpyFY2LD5qYD1glsTHXc49NxkSlnQeRCJP3eckrIC7fmB+JDho6j1
         Vq/zCnnSf4HWAKu/A6DERtuOZdywgHl5RYmxkWT8iICeuH795LlqLEyrhhw49l3S2Y
         F2cJ9c6IrzevWQzUY6jNMsuYLgR119b+eLBvGG2Mp7Azxl+SjMhnp0h1gVJePM9K8E
         R0dSh/0YfELUQ==
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 30
Date:   Fri, 30 Jul 2021 17:18:32 +0100
Message-Id: <20210730161833.50960-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Changes since 20210729:

The staging tree has a build failure so I used the tree from
20210728.

Non-merge commits (relative to Linus' tree): 4035
 4303 files changed, 213175 insertions(+), 76890 deletions(-)

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
