Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6E02C6193
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 10:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgK0JVj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 04:21:39 -0500
Received: from verein.lst.de ([213.95.11.211]:36960 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727107AbgK0JVj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Nov 2020 04:21:39 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 46C6F68B05; Fri, 27 Nov 2020 10:21:37 +0100 (CET)
Date:   Fri, 27 Nov 2020 10:21:37 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20201127092137.GA14170@lst.de>
References: <20201127175801.538fbb30@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127175801.538fbb30@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 27, 2020 at 05:58:01PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dma-mapping tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:

I'm looking into fixing this now, but how do you generate a powerpc64
allnoconfig?  My attempts so far either create a ppc32 one or fail entirely.
