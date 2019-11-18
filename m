Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8DAEFFEB6
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 07:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfKRGvv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 01:51:51 -0500
Received: from verein.lst.de ([213.95.11.211]:55015 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbfKRGvv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 01:51:51 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3EFC068B05; Mon, 18 Nov 2019 07:51:49 +0100 (CET)
Date:   Mon, 18 Nov 2019 07:51:49 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 risc-v tree
Message-ID: <20191118065149.GA4850@lst.de>
References: <20191118174501.73050c78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118174501.73050c78@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 18, 2019 at 05:45:01PM +1100, Stephen Rothwell wrote:
>   0c3ac28931d5 ("riscv: separate MMIO functions into their own header file")

As already mentioned in reply to this patch when it was posted I think
this kinda of split is a very bad idea.  
