Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFFFA5289
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 11:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbfIBJIu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 05:08:50 -0400
Received: from foss.arm.com ([217.140.110.172]:50774 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729804AbfIBJIu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 05:08:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED91028;
        Mon,  2 Sep 2019 02:08:49 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7C33F246;
        Mon,  2 Sep 2019 02:08:48 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:08:46 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Peter Collingbourne <pcc@google.com>
Subject: Re: linux-next: manual merge of the powerpc tree with the arm64 tree
Message-ID: <20190902090846.GA15118@arrakis.emea.arm.com>
References: <20190902094711.2625ba31@canb.auug.org.au>
 <87lfv7tqt0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfv7tqt0.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 02, 2019 at 11:44:43AM +1000, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the powerpc tree got a conflict in:
> >
> >   arch/Kconfig
> >
> > between commit:
> >
> >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
> >
> > from the arm64 tree and commit:
> >
> >   0c9c1d563975 ("x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig")
> >
> > from the powerpc tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks.
> 
> That conflict seems entirely trivial, but Catalin/Will if it bothers you
> I have the conflicting commit in a topic branch based on rc2 which you
> could merge to resolve it:

It's a trivial conflict, easy to resolve. I don't think it's worth
trying to avoid it (Linus normally doesn't mind such conflicts).

-- 
Catalin
