Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4903D68BE
	for <lists+linux-next@lfdr.de>; Mon, 26 Jul 2021 23:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhGZUzp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jul 2021 16:55:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231207AbhGZUzp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Jul 2021 16:55:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E850860F8F;
        Mon, 26 Jul 2021 21:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627335373;
        bh=Vubfk8aM5cW2938KL+upVnHES3wmu9lPf2Qpjd4nZJY=;
        h=From:To:Cc:Subject:Date:From;
        b=HalJUibZZEm7Sc2D9CCA3tQKU/Eysjjyg5E8ZM5bYWWkTs7468YXXxeZt25QXG6nx
         tYgEGjbuqKSEcbQ1JQve/X0/4RWS5zRsBDT5irWo1yzgVPcMePStRPgmJAItqPjfKz
         KV3fQ6hIcqjj+3EtbEpwVe2MQiDHYHhP7iZV7MNNAmXMJYr2Iwk+h6PQs2bbumgdLL
         1a0M8fmwDle9QMQhHNCR39s/MLg4W4K95CEQIEjvB+/pTQ25wzS0wVxJ3LuhXDoiY0
         2zKXDJwO/pGkGAdtVlPZ4+ukIYMK0LWBGcb+NBff/ni99uUrzXVWO18EanRryx8OWV
         7J8YgSs/dDS0A==
From:   Mark Brown <broonie@kernel.org>
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Borislav Petkov <bp@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org
Subject: linux-next: build failure due to the drm tree
Date:   Mon, 26 Jul 2021 22:36:00 +0100
Message-Id: <20210726213600.4054-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's -next fails to build an arm64 allnoconfig:

aarch64-none-linux-gnu-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
sysfb.c:(.init.text+0xc): undefined reference to `screen_info'
aarch64-none-linux-gnu-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
sysfb.c:(.init.text+0xc): dangerous relocation: unsupported relocation
aarch64-none-linux-gnu-ld: sysfb.c:(.init.text+0x10): undefined reference to `screen_info'
make[1]: *** [/tmp/next/build/Makefile:1276: vmlinux] Error 1

Caused by

  d391c58271072d0b0f ("drivers/firmware: move x86 Generic System Framebuffers support")

or one of the related commits.
