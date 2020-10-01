Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79076280387
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 18:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732107AbgJAQG1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 12:06:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:36352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732026AbgJAQGN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 12:06:13 -0400
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5902C20759;
        Thu,  1 Oct 2020 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601568372;
        bh=L/YtuZPUMMSPRWZ99pIdHDDw4x+7yKzv/vOzp4gl8oY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Uvu4pcAFy5q0LOTPi5wb/RreOS2gnBN6WwsVaIZL0jnXZjw64OBlugttrGMUKpwG3
         68VWkEq81byo1v3DwkIeVwHhhZsVgliIZJ8TC+XlV0CUhXw+ci0HVgzEdz1VEpFFnW
         kk0LoMEsN4pw0+Qur4bqwJ8vJ269J5dOi74x/nd8=
Date:   Thu, 1 Oct 2020 11:06:11 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Li Heng <liheng40@huawei.com>
Subject: Re: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20201001160611.GA2696105@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001163827.20ea7bf9@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 01, 2020 at 04:38:27PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/pci/xen.c
> 
> between commit:
> 
>   b0623566c2e9 ("x86/xen: Fix xen_msi_init() missing prototype warning")

I dropped this from my tree, thanks for the heads-up.

> from the pci tree and commit:
> 
>   2905c50b7d3e ("x86/xen: Make xen_msi_init() static and rename it to xen_hvm_msi_init()")
> 
> from the tip tree.
> 
> I fixed it up (I just used the latter since it incorporated the change
> from the former) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted
> for merging.  You may also want to consider cooperating with the
> maintainer of the conflicting tree to minimise any particularly complex
> conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell


