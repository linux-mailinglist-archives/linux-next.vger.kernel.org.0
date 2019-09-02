Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46653A5393
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbfIBKFi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 06:05:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729560AbfIBKFi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 06:05:38 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A03E2217D7;
        Mon,  2 Sep 2019 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567418737;
        bh=iQNOaVNIibG/E83RsQu3zxq0uZKqXIRDYCf4g6iBZyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g8wXqV6M5/b7tJLpLO0LrEhkHhwlyEquHOPeA+/io757PMkko1gtYUssOXg4jAA0/
         UbiaoH21sH6/l23tq67ad74j98GVtopkkKLTlVPPUkFh99VWz8Mr+LGdjETDGcMSFK
         hPvz+YDNRxP8GrEmsu+JhtwTSGQcnIrLjlI4mbdc=
Date:   Mon, 2 Sep 2019 11:05:32 +0100
From:   Will Deacon <will@kernel.org>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Peter Collingbourne <pcc@google.com>
Subject: Re: linux-next: manual merge of the powerpc tree with the arm64 tree
Message-ID: <20190902100531.45bwfll4fmjrkmhp@willie-the-truck>
References: <20190902094711.2625ba31@canb.auug.org.au>
 <87lfv7tqt0.fsf@mpe.ellerman.id.au>
 <20190902090846.GA15118@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902090846.GA15118@arrakis.emea.arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 02, 2019 at 10:08:46AM +0100, Catalin Marinas wrote:
> On Mon, Sep 02, 2019 at 11:44:43AM +1000, Michael Ellerman wrote:
> > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > > Hi all,
> > >
> > > Today's linux-next merge of the powerpc tree got a conflict in:
> > >
> > >   arch/Kconfig
> > >
> > > between commit:
> > >
> > >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
> > >
> > > from the arm64 tree and commit:
> > >
> > >   0c9c1d563975 ("x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig")
> > >
> > > from the powerpc tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > 
> > Thanks.
> > 
> > That conflict seems entirely trivial, but Catalin/Will if it bothers you
> > I have the conflicting commit in a topic branch based on rc2 which you
> > could merge to resolve it:
> 
> It's a trivial conflict, easy to resolve. I don't think it's worth
> trying to avoid it (Linus normally doesn't mind such conflicts).

Agreed, we can live with this one :)

Will
