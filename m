Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4D78CEE7
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 11:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfHNJA4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 05:00:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:43604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbfHNJA4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Aug 2019 05:00:56 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C2D4205F4;
        Wed, 14 Aug 2019 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565773255;
        bh=fv/ZdU246p/5qy812w3lXY0nGq8ygs2Wu6GV4nOHlOA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kIx/eLPGVFxMcw7npmnquDzvRi55iR7TqmtRsPDLZ0K5D3Y7f6OzDI5B2LIp0Yn1T
         RE2++kH938do7pDBu/P5eFkucJogf8EAeIeJ57FhmsfZ+xw//Z9AbXSuR8hbYxVSfj
         XLL5/0Q9uUQLXEiiPSJWA1KaE26t+O2RoYSB8Y+Y=
Date:   Wed, 14 Aug 2019 10:00:51 +0100
From:   Will Deacon <will@kernel.org>
To:     Paul Walmsley <paul@pwsan.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Atish Patra <atish.patra@wdc.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm64 tree
Message-ID: <20190814090051.2qzhglnz4452avdc@willie-the-truck>
References: <20190813093447.747a5853@canb.auug.org.au>
 <20190813082422.lecgqtknnn5g4dyj@willie-the-truck>
 <alpine.DEB.2.21.999.1908132220450.13287@utopia.booyaka.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.999.1908132220450.13287@utopia.booyaka.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 10:24:30PM +0000, Paul Walmsley wrote:
> On Tue, 13 Aug 2019, Will Deacon wrote:
> > On Tue, Aug 13, 2019 at 09:34:47AM +1000, Stephen Rothwell wrote:
> > > Today's linux-next merge of the risc-v tree got a conflict in:
> > > 
> > >   arch/arm64/kernel/topology.c
> > > 
> > > between commit:
> > > 
> > >   98dc19902a0b ("arm64: topology: Use PPTT to determine if PE is a thread")
> > > 
> > > from the arm64 tree and commit:
> > > 
> > >   60c1b220d8bc ("cpu-topology: Move cpu topology code to common code.")
> > > 
> > > from the risc-v tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > 
> > Thanks, Stephen.
> > 
> > Paul, Palmer -- If it's not too late, then it would probably be best to
> > stick this commit (60c1b220d8bc) and any dependencies on their own stable
> > branch so that we can both pull it into our respective trees and I can
> > resolve this conflict in the arm64 tree, which I'll send early during the
> > merge window.
> > 
> > Looking at your tree, I guess I could just pull in
> > common/for-v5.4-rc1/cpu-topology if you promise never to rebase it. Failing
> > that, you could fork a new branch from 60c1b220d8bc and I could just pull
> > that part instead.
> 
> How about if we treat common/for-v5.4-rc1/cpu-topology as a stable branch?  
> I wasn't planning to rebase it.  Then both of us can just merge it into 
> our for-next branches for the merge window?  (It looks like I will need to 
> rebuild the riscv for-next branch on top of v5.3-rc5, for unrelated 
> reasons.)
> 
> Sound reasonable?

Cheers, Paul. Sounds good to me.

Will
