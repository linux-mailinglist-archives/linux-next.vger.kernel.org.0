Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AEE2CB5BF
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 08:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387640AbgLBHUf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 02:20:35 -0500
Received: from verein.lst.de ([213.95.11.211]:52736 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387639AbgLBHUf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Dec 2020 02:20:35 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 409FA67373; Wed,  2 Dec 2020 08:19:53 +0100 (CET)
Date:   Wed, 2 Dec 2020 08:19:53 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20201202071953.GA1022@lst.de>
References: <20201202150149.42543862@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202150149.42543862@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 02, 2020 at 03:01:49PM +1100, Stephen Rothwell wrote:
> I applied the following merge fix patch (which may, or may not, be
> correct but fixes the build).

The fixes are exactly what I would have done.  Thanks!
