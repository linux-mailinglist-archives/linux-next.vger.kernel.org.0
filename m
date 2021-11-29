Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6664611AC
	for <lists+linux-next@lfdr.de>; Mon, 29 Nov 2021 11:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345873AbhK2KFI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Nov 2021 05:05:08 -0500
Received: from verein.lst.de ([213.95.11.211]:53219 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239028AbhK2KDH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Nov 2021 05:03:07 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 45CB168AA6; Mon, 29 Nov 2021 10:59:47 +0100 (CET)
Date:   Mon, 29 Nov 2021 10:59:47 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: [linux-next] Read-only file system after boot (powerpc)
Message-ID: <20211129095947.GA32642@lst.de>
References: <87F94FF1-5D9D-475B-B083-C101DDB7A108@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87F94FF1-5D9D-475B-B083-C101DDB7A108@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Can you check if your tree already includes this commit:

https://git.kernel.dk/cgit/linux-block/commit/?h=for-5.17/block&id=3f39d47d7ad858c024bd777f5f2a86fa7f6a9f14

and if not see if that fixes the problem?
