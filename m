Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613DFA4D26
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 03:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbfIBBor (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 21:44:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48783 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728856AbfIBBor (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Sep 2019 21:44:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MCZ41XWlz9s7T;
        Mon,  2 Sep 2019 11:44:44 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Peter Collingbourne <pcc@google.com>
Subject: Re: linux-next: manual merge of the powerpc tree with the arm64 tree
In-Reply-To: <20190902094711.2625ba31@canb.auug.org.au>
References: <20190902094711.2625ba31@canb.auug.org.au>
Date:   Mon, 02 Sep 2019 11:44:43 +1000
Message-ID: <87lfv7tqt0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/Kconfig
>
> between commit:
>
>   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
>
> from the arm64 tree and commit:
>
>   0c9c1d563975 ("x86, s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig")
>
> from the powerpc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

That conflict seems entirely trivial, but Catalin/Will if it bothers you
I have the conflicting commit in a topic branch based on rc2 which you
could merge to resolve it:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=topic/mem-encrypt&id=0c9c1d56397518eb823d458b00b06bcccd956794


cheers

> -- 
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/Kconfig
> index 6f4d3e9bf486,89e2e3f64f79..000000000000
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@@ -932,20 -925,9 +932,23 @@@ config LOCK_EVENT_COUNT
>   	  the chance of application behavior change because of timing
>   	  differences. The counts are reported via debugfs.
>   
>  +# Select if the architecture has support for applying RELR relocations.
>  +config ARCH_HAS_RELR
>  +	bool
>  +
>  +config RELR
>  +	bool "Use RELR relocation packing"
>  +	depends on ARCH_HAS_RELR && TOOLS_SUPPORT_RELR
>  +	default y
>  +	help
>  +	  Store the kernel's dynamic relocations in the RELR relocation packing
>  +	  format. Requires a compatible linker (LLD supports this feature), as
>  +	  well as compatible NM and OBJCOPY utilities (llvm-nm and llvm-objcopy
>  +	  are compatible).
>  +
> + config ARCH_HAS_MEM_ENCRYPT
> + 	bool
> + 
>   source "kernel/gcov/Kconfig"
>   
>   source "scripts/gcc-plugins/Kconfig"
