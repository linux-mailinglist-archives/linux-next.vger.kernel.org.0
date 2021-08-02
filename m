Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A043DDC36
	for <lists+linux-next@lfdr.de>; Mon,  2 Aug 2021 17:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbhHBPTB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 11:19:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:36928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234614AbhHBPTA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Aug 2021 11:19:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6591D60FD8;
        Mon,  2 Aug 2021 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627917530;
        bh=U6CN0PhWEJhWY3mV7ebsRA4d/EhmRmKPYW5M7ZP0IqU=;
        h=From:To:Cc:Subject:Date:From;
        b=oAG6QRU1mp4M9hZ76rOLUQTdQ/mnDwzPJFMq+gmb9NwA56dXwlGuhA5wcD4PM7OHg
         Ifi+oFvKc04+Q8LjeRz6sqynMF+9C1+dPQlcJQVesxk+gqPClhHi7UaW5LPSCElRDn
         4mil4a7cEetd/XkDKLNgDFGX3eUA4X5eesJ+pmX3t+DW5ucXyUHKhi8GHt9DVP09oV
         76pFsqOBjbIfk2un7U9F4H8D9/7svDeMlrnb62q6vJRnddd92qDDTr39HUoKFCr8YU
         NLEacPhsxaWgGC+Ckwvfi1r9xoW33TnZNbq9FqS/f8lYWpNpp3QHFbPh9Vi+NttNiq
         xrLE4r0IY0J0A==
From:   Mark Brown <broonie@kernel.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm-intel-fixes tree
Date:   Mon,  2 Aug 2021 16:18:33 +0100
Message-Id: <20210802151833.15348-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_device_info.c

between commit:

  0f9ed3b2c9ec ("drm/i915/display/cnl+: Handle fused off DSC")

from the drm-intel-fixes tree and commit:

  a4d082fc194a ("drm/i915: rename/remove CNL registers")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/intel_device_info.c
index e0a10f36acc1,305facedd284..000000000000
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
