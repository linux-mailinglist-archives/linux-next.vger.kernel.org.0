Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFED031E9BF
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 13:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhBRMZT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 07:25:19 -0500
Received: from ozlabs.org ([203.11.71.1]:60105 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231817AbhBRKpm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Feb 2021 05:45:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhBD64vFvz9sBJ;
        Thu, 18 Feb 2021 21:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1613645079;
        bh=ZsNlPzRZrmg4PFm+VJmNAO7Irdgz1Plpmx+SNgFPZsc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=OHvydnjHKxgHMLUHcND78HFYkWD+xm92BEqIiAhEdc7OJ6TiViZv4g7xrWsiyp+7w
         kBWgxU4fI565Am8ML/cW78MpEwSWxgfWl3mJhalmuJ6QRn7GyqbMH/4orAq+Uo94TK
         TG79AOyTlFWpeTnfBBzDIJlqb/cn83/FIzNPNrtIm2HTcKHU5dvhTRJdy3YwKkFCnF
         RXWK2Sy8wfF4ouZfctD3X2Sa+681bn8Z4F5d6iaeJB8je7D/xdFGI7yvbGRoJStC9X
         r/Txz5Ije+ogYpJRw2IDcNjxKN2YnFlQny3pHD8S9UF2tlc1hBqx75oJZO94PxwXlM
         OsvrGFBDcMWoA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Herring <robherring2@gmail.com>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Hari Bathini <hbathini@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 powerpc tree
In-Reply-To: <20210218144815.5673ae6f@canb.auug.org.au>
References: <20210218144815.5673ae6f@canb.auug.org.au>
Date:   Thu, 18 Feb 2021 21:44:37 +1100
Message-ID: <874ki9vene.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   arch/powerpc/kexec/elf_64.c
>
> between commit:
>
>   2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
>
> from the powerpc tree and commit:
>
>   130b2d59cec0 ("powerpc: Use common of_kexec_alloc_and_setup_fdt()")
>
> from the devicetree tree.
>
> I can't easily see how to resolve these, so for now I have just used
> the latter' changes to this file.

I think it just needs this?

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 87e34611f93d..0492ca6003f3 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
 					   initrd_len, cmdline,
-					   fdt_totalsize(initial_boot_params));
+					   kexec_fdt_totalsize_ppc64(image));
 	if (!fdt) {
 		pr_err("Error setting up the new device tree.\n");
 		ret = -EINVAL;


cheers
