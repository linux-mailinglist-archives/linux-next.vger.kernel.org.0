Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEDD27ACB4
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 13:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgI1L3g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 07:29:36 -0400
Received: from verein.lst.de ([213.95.11.211]:35238 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgI1L3g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 07:29:36 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7EFF468AFE; Mon, 28 Sep 2020 13:29:33 +0200 (CEST)
Date:   Mon, 28 Sep 2020 13:29:33 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Minchan Kim <minchan@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200928112933.GA433@lst.de>
References: <20200928212542.468e1fef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928212542.468e1fef@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks,

the fix looks correct.
