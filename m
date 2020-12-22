Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5687D2E0A85
	for <lists+linux-next@lfdr.de>; Tue, 22 Dec 2020 14:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgLVNQM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Dec 2020 08:16:12 -0500
Received: from verein.lst.de ([213.95.11.211]:59002 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgLVNQM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Dec 2020 08:16:12 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id AC1B267373; Tue, 22 Dec 2020 14:15:28 +0100 (CET)
Date:   Tue, 22 Dec 2020 14:15:28 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>,
        Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the device-mapper tree with Linus'
 tree
Message-ID: <20201222131528.GA29822@lst.de>
References: <20201222095056.7a5ac0a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222095056.7a5ac0a0@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Mike, Hannes,

I think this patch is rather harmful.  Why does device mapper even
mix file system path with a dev_t and all the other weird forms
parsed by name_to_dev_t, which was supposed to be be for the early
init code where no file system is available.

Can we please kick off a proper discussion for this on the linux-block
list?
