Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4BEE6E5F
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 09:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387575AbfJ1Ijo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 04:39:44 -0400
Received: from foss.arm.com ([217.140.110.172]:37410 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731611AbfJ1Ijo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 04:39:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C56E11FB;
        Mon, 28 Oct 2019 01:39:43 -0700 (PDT)
Received: from iMac-3.local (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4B293F71E;
        Mon, 28 Oct 2019 01:39:42 -0700 (PDT)
Date:   Mon, 28 Oct 2019 08:39:40 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20191028083939.GA10942@iMac-3.local>
References: <20191028083914.4735554b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028083914.4735554b@canb.auug.org.au>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Oct 28, 2019 at 08:39:14AM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the arm64 tree got conflicts in:
> 
>   arch/arm64/include/asm/cpucaps.h
>   arch/arm64/kernel/cpu_errata.c
> 
> between commits:
> 
>   d3ec3a08fa70 ("arm64: KVM: Trap VM ops when ARM64_WORKAROUND_CAVIUM_TX2_219_TVM is set")
>   93916beb7014 ("arm64: Enable workaround for Cavium TX2 erratum 219 when running SMT")
>   9405447ef79b ("arm64: Avoid Cavium TX2 erratum 219 when switching TTBR")
> 
> from Linus' tree and commit:
> 
>   05460849c3b5 ("arm64: errata: Hide CTR_EL0.DIC on systems affected by Neoverse-N1 #1542419")
> 
> from the arm64 tree.

Thanks for this. The conflict resolution is correct.

-- 
Catalin
