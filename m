Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D5E3DA216
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 13:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhG2L3J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 07:29:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232149AbhG2L3J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 07:29:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3CFC60F43;
        Thu, 29 Jul 2021 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627558146;
        bh=icxEwSjMTHv3CON8vUmROyC8jFVjg0qU6lG9QmBuK6E=;
        h=From:To:Cc:Subject:Date:From;
        b=aLAqDBas9BWyyZ7wL234QbxTQzfVAosFW8hmOa2DrGv7tvzWc8Nmm7JaA0wFMoBWQ
         t34dMK169/LKyTiyRLQ81dN1y450azYg2EAwb9h7Y1RdulJuacrQopM1iPgbrTBZPk
         HwobiSD9YlNf9HHOMNkKIPZHB+rlM22rUF0WlLTZb+pMGz94fkAy3JSXMGVYXXHA90
         1edzgAbNrJrx+s6qOc9Z3qoG38qg4phbLrbA6EQ+WblFsoO3kjUoQnV0JQUVzFEwUX
         A+nm1MzpfDg0E/wBSOUb1PySE/fqIBCI/2i7wskX+xnnrG2aBu8g2wy5F/ulgB7nGH
         cBU0VfCE7wHOg==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-msm tree
Date:   Thu, 29 Jul 2021 12:28:54 +0100
Message-Id: <20210729112854.40281-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

After merging the drm-msm tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/msm/msm_ringbuffer.c: In function 'msm_ringbuffer_new':
/tmp/next/build/drivers/gpu/drm/msm/msm_ringbuffer.c:104:29: error: passing argument 7 of 'drm_sched_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
  104 |    NULL, to_msm_bo(ring->bo)->name);
In file included from /tmp/next/build/drivers/gpu/drm/msm/msm_ringbuffer.h:10,
                 from /tmp/next/build/drivers/gpu/drm/msm/msm_ringbuffer.c:7:
/tmp/next/build/include/drm/gpu_scheduler.h:345:16: note: expected 'atomic_t *' {aka 'struct <anonymous> *'} but argument is of type 'char *'
  345 |      atomic_t *score, const char *name);
      |      ~~~~~~~~~~^~~~~
/tmp/next/build/drivers/gpu/drm/msm/msm_ringbuffer.c:102:8: error: too few arguments to function 'drm_sched_init'
  102 |  ret = drm_sched_init(&ring->sched, &msm_sched_ops,
      |        ^~~~~~~~~~~~~~
In file included from /tmp/next/build/drivers/gpu/drm/msm/msm_ringbuffer.h:10,
                 from /tmp/next/build/drivers/gpu/drm/msm/msm_ringbuffer.c:7:
/tmp/next/build/include/drm/gpu_scheduler.h:341:5: note: declared here
  341 | int drm_sched_init(struct drm_gpu_scheduler *sched,
      |     ^~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Probably caused by commit

  1d8a5ca436ee4a28ee ("drm/msm: Conversion to drm scheduler")

Since there was previously nothing in the drm-msm tree I've just dropped
the branch.
