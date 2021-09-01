Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777F23FDD55
	for <lists+linux-next@lfdr.de>; Wed,  1 Sep 2021 15:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244220AbhIANhT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 09:37:19 -0400
Received: from verein.lst.de ([213.95.11.211]:47951 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244227AbhIANhS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Sep 2021 09:37:18 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A57EC6736F; Wed,  1 Sep 2021 15:36:18 +0200 (CEST)
Date:   Wed, 1 Sep 2021 15:36:18 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-next <linux-next@vger.kernel.org>, hch@lst.de,
        jack@suse.cz, axboe@kernel.dk,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        dm-devel@redhat.com, sachinp <sachinp@linux.vnet.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>, dougmill@us.ibm.com
Subject: Re: [next-20210827][ppc][multipathd] INFO: task hung in
 dm_table_add_target
Message-ID: <20210901133618.GA16687@lst.de>
References: <68dde454-965a-0c44-374a-a0ca277150ee@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68dde454-965a-0c44-374a-a0ca277150ee@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 01, 2021 at 04:47:26PM +0530, Abdul Haleem wrote:
> Greeting's
>
> multiple task hung while adding the vfc disk back to the multipath on my 
> powerpc box running linux-next kernel

Can you retry to reproduce this with lockdep enabled to see if there
is anything interesting holding this lock?
