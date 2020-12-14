Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE512DA29B
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 22:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbgLNVie (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 16:38:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:33808 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbgLNVid (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 16:38:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3059DAC7F;
        Mon, 14 Dec 2020 21:37:52 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 28C83DA7C3; Mon, 14 Dec 2020 22:36:13 +0100 (CET)
Date:   Mon, 14 Dec 2020 22:36:12 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20201214213612.GS6430@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201202150149.42543862@canb.auug.org.au>
 <20201215070956.6852e939@canb.auug.org.au>
 <25c43226-f937-0866-9c0b-46867bd04cc7@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c43226-f937-0866-9c0b-46867bd04cc7@kernel.dk>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 14, 2020 at 01:12:46PM -0700, Jens Axboe wrote:
> On 12/14/20 1:09 PM, Stephen Rothwell wrote:
> > Just a reminder that I am still applying the above merge fix.
> 
> I sent in my core changes, but they haven't been pulled yet. So I guess
> we're dealing with a timing situation... David, did you send in the btrfs
> pull yet?

Yes
https://lore.kernel.org/lkml/cover.1607955523.git.dsterba@suse.com/
