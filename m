Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8F1B78D3
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 14:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387757AbfISMCW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 08:02:22 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:44518 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390084AbfISMCW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Sep 2019 08:02:22 -0400
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
        by Forcepoint Email with ESMTP id C5D9BCFA814BF962E099;
        Thu, 19 Sep 2019 20:02:19 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 19 Sep 2019 20:02:19 +0800
Received: from architecture4 (10.140.130.215) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 19 Sep 2019 20:02:18 +0800
Date:   Thu, 19 Sep 2019 20:01:10 +0800
From:   Gao Xiang <gaoxiang25@huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>, <linux-next@vger.kernel.org>
CC:     <linux-erofs@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Chao Yu" <yuchao0@huawei.com>, Miao Xie <miaoxie@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: erofs -next tree inclusion request
Message-ID: <20190919120110.GA48697@architecture4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.140.130.215]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Linux-next maintainers,

Could you kindly help add the erofs -next tree to linux-next?

git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev

This can test all erofs patches with the latest linux-next tree
and make erofs better...


Thank you very much,
Gao Xiang

