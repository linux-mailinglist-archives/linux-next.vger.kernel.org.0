Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA281BB5C1
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 07:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgD1FSJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 01:18:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:37262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgD1FSJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 01:18:09 -0400
Received: from localhost (unknown [106.51.110.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 094B2206A1;
        Tue, 28 Apr 2020 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588051089;
        bh=7fQtyv0sJdMk8KaFRz/LIegQuDI2xdySVTwl0CmQsbM=;
        h=Date:From:To:Cc:Subject:From;
        b=TPXh1nmZI5Eysmc1EAetaCn+fvzcHyFAK6lnN9gh6c+qmFJD83k0FZ3uUUHQxc0Py
         ED6ELzzpBodLRQvHWavfsDieZHBvGWB2whO4ci3O9WSBYKCqWkZ+Z6znr2zQGxSS2X
         BX3/zxM3hcgkABEnorMXxQEwHUWwkz6ldGObg2aY=
Date:   Tue, 28 Apr 2020 10:48:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Moving linux-phy tree
Message-ID: <20200428051804.GZ56386@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Stephen,

Kishon has asked me to co-maintain the linux-phy subsystem [1], so can
you please switch the linux-phy tree to new location [2] and list both
of us as as contacts for this tree.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=fixes&id=c31cd5a5b2f2e5c645f90a788ca6961a8dbbb2fb
[2]: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

Thanks
-- 
~Vinod
