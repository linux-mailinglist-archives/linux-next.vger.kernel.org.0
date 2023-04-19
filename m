Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FA36E8216
	for <lists+linux-next@lfdr.de>; Wed, 19 Apr 2023 21:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjDSTrb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Apr 2023 15:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjDSTrZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Apr 2023 15:47:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0174030EA;
        Wed, 19 Apr 2023 12:47:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 904EB616BC;
        Wed, 19 Apr 2023 19:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421A2C433EF;
        Wed, 19 Apr 2023 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681933642;
        bh=l1Q7oCF14DVP3ipcVSVnQEnQCTmxyt6/pkIzHmBixoA=;
        h=From:To:Cc:Subject:Date:From;
        b=s7mt1ay9Kzr2mcYDOJysoGdPUbofsZkzhymvlGzCBYTrhhImBGqS0KbAHL/yeY7cB
         zC5O9T3YuZDoFZy3DgcMCh7iv1pJuij0d9g/TxoO7f7S8V+tzS681d1o7QiTXSxYnY
         NmHtpRj+FnSSofD/iJwsjGUyB2B9/FDDtbcMluTxkgliM35jBu3Ur8aIE+FUufL+hG
         G8E2RX9+Ng5WebWwf3KZ2WLPwSO3LqH8AyOINmtys4AXiqSizJWiQvQz+uSWkZyqJs
         t27bimDNF/K6s+UPjx9+IGfXUj7hmJHuDmmf0vd+D7pzumTKyLYnOJq1kwMb7G+U9Y
         HcbNLygcKO12g==
From:   broonie@kernel.org
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 19
Date:   Wed, 19 Apr 2023 20:47:18 +0100
Message-Id: <20230419194718.194843-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        LOCALPART_IN_SUBJECT,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Changes since 20230418:

The net-next tree gained a conflict against the clock tree.

The block tree gained a conflict against the origin tree.

The tip tree gained a build failure through interaction with the mm tree
which I fixed up.

The cxl tree gained a conflict against the pci tree.

A merge fixup for an issue between mm and ext4 that was found in testing
was applied.

Non-merge commits (relative to Linus' tree): 11893
 12145 files changed, 794577 insertions(+), 411773 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a ppc64_defconfig
for powerpc, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf. After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
and pseries_le_defconfig and i386, arm64, s390, sparc and sparc64
defconfig and htmldocs. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 357 trees (counting Linus' and 102 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.
