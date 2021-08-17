Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707A83EF06E
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 18:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhHQQu4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 12:50:56 -0400
Received: from verein.lst.de ([213.95.11.211]:59132 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230354AbhHQQu4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 12:50:56 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9F86367357; Tue, 17 Aug 2021 18:50:20 +0200 (CEST)
Date:   Tue, 17 Aug 2021 18:50:20 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Tejun Heo <tj@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20210817165020.GA18069@lst.de>
References: <20210817152547.70af4cfe@canb.auug.org.au> <YRvmZ77w6zeG4BrU@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRvmZ77w6zeG4BrU@slm.duckdns.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 17, 2021 at 06:40:07AM -1000, Tejun Heo wrote:
> Ah, that probably isn't the right resolution. The seq_get_buf change needs
> to be applied to the original mq-deadline.c file. Jens, how do you wanna
> proceed?

Unless I'm missing something the pd_stat_fn that is affected was purely
in the cgroup addition, so this resolution looks fine to me.
