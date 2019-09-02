Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7D6A53F3
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 12:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbfIBKZR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 06:25:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34889 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729999AbfIBKZR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 06:25:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MR6c6x1gz9sDB;
        Mon,  2 Sep 2019 20:25:12 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Peter Collingbourne <pcc@google.com>
Subject: Re: linux-next: manual merge of the powerpc tree with the arm64 tree
In-Reply-To: <20190902090846.GA15118@arrakis.emea.arm.com>
References: <20190902094711.2625ba31@canb.auug.org.au> <87lfv7tqt0.fsf@mpe.ellerman.id.au> <20190902090846.GA15118@arrakis.emea.arm.com>
Date:   Mon, 02 Sep 2019 20:25:12 +1000
Message-ID: <87y2z7ro53.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Catalin Marinas <catalin.marinas@arm.com> writes:
> On Mon, Sep 02, 2019 at 11:44:43AM +1000, Michael Ellerman wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> > Hi all,
>> >
>> > Today's linux-next merge of the powerpc tree got a conflict in:
>> >
>> >   arch/Kconfig
>> >
>> > between commit:
>> >
>> >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
>> >
>> > from the arm64 tree and commit:
>> >
>> >   0c9c1d563975 ("x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig")
>> >
>> > from the powerpc tree.
>> >
>> > I fixed it up (see below) and can carry the fix as necessary. This
>> > is now fixed as far as linux-next is concerned, but any non trivial
>> > conflicts should be mentioned to your upstream maintainer when your tree
>> > is submitted for merging.  You may also want to consider cooperating
>> > with the maintainer of the conflicting tree to minimise any particularly
>> > complex conflicts.
>> 
>> Thanks.
>> 
>> That conflict seems entirely trivial, but Catalin/Will if it bothers you
>> I have the conflicting commit in a topic branch based on rc2 which you
>> could merge to resolve it:
>
> It's a trivial conflict, easy to resolve. I don't think it's worth
> trying to avoid it (Linus normally doesn't mind such conflicts).

Yep, I agree.

cheers
