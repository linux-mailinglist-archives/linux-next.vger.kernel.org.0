Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91086287D2B
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 22:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbgJHUbF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 16:31:05 -0400
Received: from verein.lst.de ([213.95.11.211]:41591 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730288AbgJHUbD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Oct 2020 16:31:03 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id CC4F868B02; Thu,  8 Oct 2020 22:30:58 +0200 (CEST)
Date:   Thu, 8 Oct 2020 22:30:58 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com,
        open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        drbd-dev@lists.linbit.com,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, linux-raid@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Song Liu <song@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        martin.petersen@oracle.com, Hannes Reinecke <hare@suse.de>
Subject: Re: [ Regressions ] linux next 20201008: blk_update_request: I/O
 error, dev sda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio
 class 0
Message-ID: <20201008203058.GA27821@lst.de>
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com> <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com> <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 08, 2020 at 02:17:41PM -0600, Jens Axboe wrote:
> Just for everyones edification, that would be these 9 patches from the
> SCSI tree:

I sent the fixes out a bit ago and Cced the reporters..
