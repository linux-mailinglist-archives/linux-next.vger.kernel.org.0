Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88873DE320
	for <lists+linux-next@lfdr.de>; Tue,  3 Aug 2021 01:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbhHBXeE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 19:34:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:39000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232425AbhHBXeE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Aug 2021 19:34:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C844E60EE3;
        Mon,  2 Aug 2021 23:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627947234;
        bh=If1yeB9VyPsxqmUxvfXAT+JCq88OWvDz4Dr+ju8lsSU=;
        h=From:To:Cc:Subject:Date:From;
        b=A0oW1ts0mJva2mE09w+aJBC0k6VK6bAgAp9PuQUMm5XeWWPIFHiIzWIXyYi2hP1Gi
         VK8ZVyTlK9PoN6ENl3hYj8EB54HvVJTW1fvMaxH8ZZTphwV9HQHLxe613Z/Zw11KG4
         GIjhmJ2dsqzvfp/AOK/tNxD5yY29QvEwZOHitrkuiGfGngSMz4fMhYGA1N/A7o3hbD
         4F4crtfLJ/iy04VVcXJBhOwhfGJ4zFt/Gv9OIgHrwPz5XP7S3Fhqrmk1Nhb+U5M4qa
         wz1qsbPzLXmXYj5oTPHeXojPeu5rMEA212qBztA9fUoKYOScjgmO1brbjU84F7vGfK
         ZcSuthtaq6Y+Q==
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Phillip Potter <phil@philpotter.co.uk>
Subject: linux-next: manual merge of the staging tree with the net-next tree
Date:   Tue,  3 Aug 2021 00:33:39 +0100
Message-Id: <20210802233339.25285-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/r8188eu/include/rtw_android.h
  drivers/staging/r8188eu/os_dep/rtw_android.c

between commit:

  89939e890605 ("staging: rtlwifi: use siocdevprivate")

from the net-next tree and commit:

  2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")

from the staging tree.

I fixed it up using the net-next version and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.
