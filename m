Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3583DB9A7
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 15:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhG3NxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 09:53:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:46398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231137AbhG3NxS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 09:53:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2C3360F12;
        Fri, 30 Jul 2021 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627653193;
        bh=asftvaqZKAxKgDpzEbphWN/AE9bWu70isAH4OxawG3E=;
        h=From:To:Cc:Subject:Date:From;
        b=T64AgJ7IAYiJOHBy6phjGd+g1drkO5fP1Eu/N6B+dJR0pW7KH3sO62N1rgezy3d97
         BQQGu+MopkRGSjokW9hWGG/uCmQBtlVlm6La+3+zR8XSQdabZXpluMr14ZXKXDtPtR
         GKKcgvMBOA0UTJ+x5pHDPV6PS2inHBd1HSPPY4EVcbe3zn6KpcVc9HEA2hNhAdQL3+
         7y8wYL6B1cbIdOlxH633ym6cFcdvOCG8/fhGdEdwcZhrgYxDZ8sof/OHi/WLeZcmA8
         ngELEFQdA4D7//BuFcqZuMrAn6DPVtemqSiuSBsAYqM23wz7YYYitWQiLVXklzBsJI
         p6zH4XcBE3lZg==
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: build failure after merge of the staging tree
Date:   Fri, 30 Jul 2021 14:52:19 +0100
Message-Id: <20210730135219.21723-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

After merging the staging tree, today's linux-next build (x86
allmodconfig) failed like this:

/tmp/next/build/drivers/staging/r8188eu/core/rtw_ap.c:22:10: fatal error: osdep_service.h: No such file or directory
 #include <osdep_service.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: *** [/tmp/next/build/scripts/Makefile.build:271: drivers/staging/r8188eu/core/rtw_ap.o] Error 1
make[4]: *** Waiting for unfinished jobs....
/tmp/next/build/drivers/staging/r8188eu/core/rtw_br_ext.c:29:10: fatal error: drv_types.h: No such file or directory
 #include <drv_types.h>
          ^~~~~~~~~~~~~
compilation terminated.

Caused by commit

  15865124feed880978b7 ("staging: r8188eu: introduce new core dir for RTL8188eu driver")

I've used the staging tree from yesterday instead.
