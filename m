Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AF63FB1A8
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 09:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbhH3HLj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 03:11:39 -0400
Received: from verein.lst.de ([213.95.11.211]:39493 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232855AbhH3HLi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 03:11:38 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id D698568AFE; Mon, 30 Aug 2021 09:10:42 +0200 (CEST)
Date:   Mon, 30 Aug 2021 09:10:42 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Gao Xiang <xiang@kernel.org>,
        Gao Xiang <hsiangkao@linux.alibaba.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvdimm tree
Message-ID: <20210830071042.GA2498@lst.de>
References: <20210830170938.6fd8813d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830170938.6fd8813d@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Stephen,

the fixup looks good to me.
