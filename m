Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78ECF401B4F
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 14:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239993AbhIFMmN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 08:42:13 -0400
Received: from verein.lst.de ([213.95.11.211]:33004 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236388AbhIFMmM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Sep 2021 08:42:12 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id ED1F367373; Mon,  6 Sep 2021 14:41:05 +0200 (CEST)
Date:   Mon, 6 Sep 2021 14:41:05 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the dma-mapping tree
Message-ID: <20210906124105.GA13782@lst.de>
References: <20210813171134.4ad7d640@canb.auug.org.au> <20210903164557.24569a83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903164557.24569a83@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks,

I've commited a fix.
