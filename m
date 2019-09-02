Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F84CA5554
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 13:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731216AbfIBLws (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 07:52:48 -0400
Received: from verein.lst.de ([213.95.11.211]:49614 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729918AbfIBLwr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 07:52:47 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8704768AFE; Mon,  2 Sep 2019 13:52:43 +0200 (CEST)
Date:   Mon, 2 Sep 2019 13:52:43 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Message-ID: <20190902115243.GA1011@lst.de>
References: <20190902214011.2a5400c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902214011.2a5400c9@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 02, 2019 at 09:40:11PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:

Yes, this conflict is expected and we dicussed it before.  I'll make
sure Linus is in the loop when sending the pull request.
