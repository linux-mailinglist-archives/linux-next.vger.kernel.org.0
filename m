Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E74220733B
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 14:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390545AbgFXMWr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 08:22:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390537AbgFXMWr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 08:22:47 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D78DE20707;
        Wed, 24 Jun 2020 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593001367;
        bh=llsEnXOBdDldUYmEyO0zoXemSr+7CRN/czVZ0wtPt98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vq8pa5speUnvVEor4+UxiuzoF0QDSc88FgivHmWNqRFNYftWS8EVzdyvfXRcVHSfq
         rkiU9Q0jRaitl6/pPya2DCCkV29BuUICj7LboiTxyoK1wm/VgjqmNbdeWytFFuIeeQ
         nTxkwhmLIxlrIEENeizswb7Q37sY1PE+GtYeJ8oY=
Date:   Wed, 24 Jun 2020 13:22:42 +0100
From:   Will Deacon <will@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 24 [build failure on arm64]
Message-ID: <20200624122242.GA6270@willie-the-truck>
References: <20200624165323.3dffcde5@canb.auug.org.au>
 <7a7e31a8-9a7b-2428-ad83-2264f20bdc2d@hisilicon.com>
 <20200624105528.GB6134@willie-the-truck>
 <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b561e663-a9aa-d600-e23b-09793199141e@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 24, 2020 at 12:57:23PM +0100, Jon Hunter wrote:
> On 24/06/2020 11:55, Will Deacon wrote:
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> > index 1e5a940532da..97d3d3632093 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -23,8 +23,9 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
> >  # potential future proofing if we end up with internal calls to the exported
> >  # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
> >  # preparation in build-time C")).
> > -ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv \
> > -               -Bsymbolic --no-eh-frame-hdr --build-id -n $(btildflags-y) -T
> > +ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1 --hash-style=sysv       \
> > +            -Bsymbolic $(call ld-option, --no-eh-frame-hdr) --build-id -n      \
> > +            $(btildflags-y) -T
> >  
> >  ccflags-y := -fno-common -fno-builtin -fno-stack-protector -ffixed-x18
> >  ccflags-y += -DDISABLE_BRANCH_PROFILING
> > 
> 
> 
> I am seeing the same build failure and the above does fix it for me.

Cheers, Jon. I'll get this into -next with your Tested-by.

Will
