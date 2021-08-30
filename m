Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D80D3FB1BA
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 09:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhH3HQM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 03:16:12 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:59382 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232321AbhH3HQM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 03:16:12 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UmWxlnG_1630307715;
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0UmWxlnG_1630307715)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 30 Aug 2021 15:15:17 +0800
Date:   Mon, 30 Aug 2021 15:15:15 +0800
From:   Gao Xiang <hsiangkao@linux.alibaba.com>
To:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Gao Xiang <xiang@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Message-ID: <YSyFg6hv3FnttuxM@B-P7TQMD6M-0146.local>
References: <20210830170938.6fd8813d@canb.auug.org.au>
 <20210830071042.GA2498@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210830071042.GA2498@lst.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 30, 2021 at 09:10:42AM +0200, Christoph Hellwig wrote:
> Thanks Stephen,
> 
> the fixup looks good to me.

Yeah, thanks all. fsdax is useful to our new container use cases.
I'll mention this when sending pull request as well.

Thanks,
Gao Xiang
