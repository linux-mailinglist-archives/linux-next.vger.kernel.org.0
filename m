Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D97B189769
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 09:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgCRIu3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 04:50:29 -0400
Received: from foss.arm.com ([217.140.110.172]:46972 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgCRIu3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 04:50:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2B1B31B;
        Wed, 18 Mar 2020 01:50:28 -0700 (PDT)
Received: from mbp (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E0DC3F52E;
        Wed, 18 Mar 2020 01:50:27 -0700 (PDT)
Date:   Wed, 18 Mar 2020 08:50:24 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Message-ID: <20200318085024.GP3005@mbp>
References: <20200318152731.0114975c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318152731.0114975c@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 03:27:31PM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/Kconfig
> index fdfdc77c5067,c6c32fb7f546..000000000000
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@@ -9,8 -9,6 +9,7 @@@ config ARM6
>   	select ACPI_MCFG if (ACPI && PCI)
>   	select ACPI_SPCR_TABLE if ACPI
>   	select ACPI_PPTT if ACPI
>  +	select ARCH_BINFMT_ELF_STATE
> - 	select ARCH_CLOCKSOURCE_DATA
>   	select ARCH_HAS_DEBUG_VIRTUAL
>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
>   	select ARCH_HAS_DMA_PREP_COHERENT

It looks fine. Thanks.

-- 
Catalin
