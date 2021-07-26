Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5853D649E
	for <lists+linux-next@lfdr.de>; Mon, 26 Jul 2021 18:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239550AbhGZP76 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jul 2021 11:59:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:43820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239785AbhGZP6I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Jul 2021 11:58:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80EAE60EB2;
        Mon, 26 Jul 2021 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627317517;
        bh=T5gtnG56UyEdqLhML5SDWuzR5PbDuAxCfdJhsOmPVLM=;
        h=From:To:Cc:Subject:Date:From;
        b=QYyePFs2iFNe9oEF6vt+NZWww3yixpMeY2poxxc25XMmRSjbC3Y7NHdESTrCiUQe3
         BJwAUeiF/Im+GvXihQfOWCFTzIXGJbNAxzQVm8RO3zPl18ZzQFKzCNLrFCICkXbg1h
         +5CG7EIJIyuiccyHxek8+1gZi0H1pJqZeOh0wdsOIn96EnEFpNPNh+aycoezwHT20X
         iGCBKJT6J+kVzdza6hhGDA5j7SjJ+mb2/knM93sPhcwIVwhhXMrLkNEPhm3J5qn7a+
         u1D1V/0ZJrd5BQ81AZHIANdKFBbnUcKa5HqjyyDgwrRWU4pnFXq9cWgzxvMUMF8Ivm
         DsVOrXIh+fi4w==
From:   Mark Brown <broonie@kernel.org>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        John Stultz <john.stultz@linaro.org>
Subject: linux-next: manual merge of the drm tree with the qcom/for-next tree
Date:   Mon, 26 Jul 2021 17:38:14 +0100
Message-Id: <20210726163814.6483-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/firmware/Makefile

between commit:

  b42000e4b874 ("firmware: qcom_scm: Allow qcom_scm driver to be loadable as a permenent module")

from the qcom/for-next tree and commits:

  8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
  d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 3c2af2e98def..5ced0673d94b 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -19,6 +19,8 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
 qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_SYSFB)		+= sysfb.o
+obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
