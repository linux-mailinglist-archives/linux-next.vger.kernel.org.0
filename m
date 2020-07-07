Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC1F216875
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 10:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgGGIjT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 04:39:19 -0400
Received: from verein.lst.de ([213.95.11.211]:57781 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725825AbgGGIjT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jul 2020 04:39:19 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 561B068AFE; Tue,  7 Jul 2020 10:39:17 +0200 (CEST)
Date:   Tue, 7 Jul 2020 10:39:17 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 generic-ioremap tree
Message-ID: <20200707083917.GA26906@lst.de>
References: <20200707183035.56420aaa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707183035.56420aaa@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 07, 2020 at 06:30:35PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   2ee080ecf668 ("wip")
> 
> is missing a Signed-off-by from its author and comitter.
> 
> Not much of a commit message either :-)

This commit should have never made it into the for-next tree, sorry.
Please drop it if you can - I'll fix it up ASAP.
