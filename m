Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6050634CD9A
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 12:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhC2KGw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 06:06:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:37798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231675AbhC2KGl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Mar 2021 06:06:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79D7E61554;
        Mon, 29 Mar 2021 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617012401;
        bh=TX+dBDssX2scGJUAHdzIamXLrzHGNoRFTz3j3uVr0pE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MvbvgNpibm+Tj+tOYN3mOZz+Mw4n5xeuLvNmEzpIYJICEjZSPYxuYkM0S73rIy+kf
         vp8U+fKPMchZ6faTtX8FGjV8PgkwdgohoUYJDy1lSK0lLL4LEQNqN+bWh8djb58lnK
         TSS0UQJZ3ZYz1lscpv0XkhNMFXwS1A+9fdKqkdQFnDAB2hGTXHKtbXmhFAYibPif1t
         xsdvw9rH6t8ZaElU/e6PG5kT/YZ/x0RTiSN62B8Ty3R6QOWUX78pyMi3+VPVBAWJ9m
         XBYmr6j+3SPgA0l4+3ZbVsnobF4h0thCpX+/ihLg3urBwvXGRk8+bSxVlLpg5r58Bx
         f7qzQ6/Fh5uTw==
Date:   Mon, 29 Mar 2021 11:06:37 +0100
From:   Will Deacon <will@kernel.org>
To:     "liuqi (BA)" <liuqi115@huawei.com>
Cc:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the arm-perf tree
Message-ID: <20210329100636.GA3207@willie-the-truck>
References: <20210326195240.7b937560@canb.auug.org.au>
 <c39fe821-3eee-9f2a-3539-6a1f2f415414@hisilicon.com>
 <20210329084751.GA2965@willie-the-truck>
 <57d692c4-8469-c3d0-4e8a-3f01953ac5e4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57d692c4-8469-c3d0-4e8a-3f01953ac5e4@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 29, 2021 at 05:06:20PM +0800, liuqi (BA) wrote:
> 
> 
> On 2021/3/29 16:47, Will Deacon wrote:
> > On Fri, Mar 26, 2021 at 05:07:41PM +0800, Shaokun Zhang wrote:
> > > Apologies for the mistake.
> > > 
> > > Will, shall I send a new version v5 to fix this issue or other?
> > 
> > Please send additional patches on top now that these are queued.
> > 
> > Thanks,
> > 
> > Will
> > 
> > .
> > 
> We'll send a new patch to fix these warnings today, apologies for the
> mistake again.

Really no need to apologise; we're fixing things before they land in Linus'
tree -- that's exactly how it's supposed to work!

Will
