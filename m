Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679632D2C18
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 14:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729461AbgLHNiy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 08:38:54 -0500
Received: from mx2.suse.de ([195.135.220.15]:37250 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728318AbgLHNiy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 08:38:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D7F11AD41;
        Tue,  8 Dec 2020 13:38:11 +0000 (UTC)
Date:   Tue, 8 Dec 2020 14:38:11 +0100
From:   Daniel Wagner <dwagner@suse.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Qian Cai <qcai@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Tejun Heo <tj@kernel.org>, Coly Li <colyli@suse.de>,
        Song Liu <song@kernel.org>, dm-devel@redhat.com,
        linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: store a pointer to the block_device in struct bio (again)
Message-ID: <20201208133811.5versqznlcqvmkro@beryllium.lan>
References: <20201201165424.2030647-1-hch@lst.de>
 <920899710c9e8dcce16e561c6d832e4e9c03cd73.camel@redhat.com>
 <20201208110403.GA22179@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208110403.GA22179@lst.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 08, 2020 at 12:04:03PM +0100, Christoph Hellwig wrote:
> can you send me details of your device mapper setup, e.g. which targets
> are used, are they used on top of whole device or partitions.  Do you
> use partitions on top of the dm devices?  Are any other stacking devices
> involved?

FWIW, I tried linux-next yesterday and got the root fs (btrfs)
corrupted. It is a very simple setup, just plain FS on SCSI device.
