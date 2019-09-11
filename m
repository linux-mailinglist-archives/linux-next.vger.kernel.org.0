Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B45AFABA
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2019 12:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfIKKq1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Sep 2019 06:46:27 -0400
Received: from verein.lst.de ([213.95.11.211]:38180 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbfIKKq1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Sep 2019 06:46:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 86B3468B02; Wed, 11 Sep 2019 12:46:24 +0200 (CEST)
Date:   Wed, 11 Sep 2019 12:46:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the configfs
 tree
Message-ID: <20190911104624.GB28423@lst.de>
References: <20190911204500.69590946@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911204500.69590946@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 11, 2019 at 08:45:00PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   c84493bbf7ae ("configfs: fix a deadlock in configfs_symlink()")
> 
> is missing a Signed-off-by from its committer.

Fixed.
