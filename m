Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E1D275ACF
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 16:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgIWOyP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 10:54:15 -0400
Received: from verein.lst.de ([213.95.11.211]:48769 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWOyO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Sep 2020 10:54:14 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id D27F86736F; Wed, 23 Sep 2020 16:54:11 +0200 (CEST)
Date:   Wed, 23 Sep 2020 16:54:11 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Marc Hartmayer <mhartmay@linux.ibm.com>
Cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Block Mailing List <linux-block@vger.kernel.org>,
        Linux SCSI Mailing List <linux-scsi@vger.kernel.org>
Subject: Re: linux-next: possible bug in 'block: remove the BIO_NULL_MAPPED
 flag'
Message-ID: <20200923145411.GA15735@lst.de>
References: <87tuvo8xjo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuvo8xjo.fsf@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I've reproduced this on x86 and am looking into the issue now.
