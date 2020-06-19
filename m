Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83015200ADC
	for <lists+linux-next@lfdr.de>; Fri, 19 Jun 2020 16:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732663AbgFSOC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Jun 2020 10:02:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37119 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgFSOC1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Jun 2020 10:02:27 -0400
Received: from ip-109-41-0-196.web.vodafone.de ([109.41.0.196] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jmHau-0002Hs-LG; Fri, 19 Jun 2020 14:02:15 +0000
Date:   Fri, 19 Jun 2020 16:01:48 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christian Brauner <christian@brauner.io>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the
 powerpc-fixes tree
Message-ID: <20200619140148.4ytme4wsvtw2oyrg@wittgenstein>
References: <20200618121131.4ad29150@canb.auug.org.au>
 <878sgjcnjp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878sgjcnjp.fsf@mpe.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 19, 2020 at 09:17:30PM +1000, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the pidfd tree got a conflict in:
> >
> >   arch/powerpc/kernel/syscalls/syscall.tbl
> >
> > between commit:
> >
> >   35e32a6cb5f6 ("powerpc/syscalls: Split SPU-ness out of ABI")
> >
> > from the powerpc-fixes tree and commit:
> >
> >   9b4feb630e8e ("arch: wire-up close_range()")
> >
> > from the pidfd tree.
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
> I thought the week between rc1 and rc2 would be a safe time to do that
> conversion of the syscall table, but I guess I was wrong :)

:)

> 
> I'm planning to send those changes to Linus for rc2, so the conflict
> will then be vs mainline. But I guess it's pretty trivial so it doesn't
> really matter.

close_range() is targeted for the v5.9 merge window. I always do
test-merges with mainline at the time I'm creating a pr and I'll just
mention to Linus that there's conflict with ppc. :)

Thanks!
Christian
