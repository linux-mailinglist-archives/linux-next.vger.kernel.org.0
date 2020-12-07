Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAFC2D18EE
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 20:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgLGTCd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 14:02:33 -0500
Received: from verein.lst.de ([213.95.11.211]:43165 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgLGTCd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Dec 2020 14:02:33 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 92C6168B02; Mon,  7 Dec 2020 20:01:49 +0100 (CET)
Date:   Mon, 7 Dec 2020 20:01:49 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Qian Cai <qcai@redhat.com>
Cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Tejun Heo <tj@kernel.org>, Coly Li <colyli@suse.de>,
        Song Liu <song@kernel.org>, dm-devel@redhat.com,
        linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: store a pointer to the block_device in struct bio (again)
Message-ID: <20201207190149.GA22524@lst.de>
References: <20201201165424.2030647-1-hch@lst.de> <920899710c9e8dcce16e561c6d832e4e9c03cd73.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <920899710c9e8dcce16e561c6d832e4e9c03cd73.camel@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for the report.

Jens, can you revert the series for now?  I think waiting any longer
with a report like this is not helpful.  I'll look into it with
Qian in the meantime.
