Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C75C28814E
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 06:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731012AbgJIE1b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 00:27:31 -0400
Received: from ozlabs.org ([203.11.71.1]:49575 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731008AbgJIE1b (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 00:27:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6w5r33RDz9sRk;
        Fri,  9 Oct 2020 15:27:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1602217648;
        bh=H2YLiXuGkBSqOqzwg+471E2SZ2wWV5jW7UmnJSOd8cc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XDFEAlcD3LRDwyj46ai4x6PWqZs9fNY9RjyeaHa9fWQwwC/fE63SuWxqpth0o5crN
         7gPntlBH9UKer+B2CFkJrewrzuUAHjd9tfBbLdDHmhTHWQnQaSB82BZD60XJZ6WID4
         yi/0Bb8iKeDd+Z5UPwSBu98qHkoITNoJRGaus3+TRigIHbZfUm07NW/FXZJbkQfygM
         bnNJoYvV+aAaateddOfQvrfPeaiYcTjY/caxHEqaORlIw+h2nBMFe+xqyzHZj739Rt
         9Sq2USsaTcy/eC8wb8AMiXOJDpA7qbtxBlJJiK+P539Ow6tejrjbUn4wvzZo2D0Swn
         pJvVSPA57aTfA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the powerpc tree
In-Reply-To: <20201009075816.0cb5a86f@canb.auug.org.au>
References: <20201009075816.0cb5a86f@canb.auug.org.au>
Date:   Fri, 09 Oct 2020 15:27:25 +1100
Message-ID: <87ft6o10sy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> In commit
>
>   a2d0230b91f7 ("cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_reboot_notifier")
>
> Fixes tag
>
>   Fixes: cf30af76 ("cpufreq: powernv: Set the cpus to nominal frequency during reboot/kexec")

Gah.

I've changed my scripts to make this a hard error when I'm applying
patches.

cheers
