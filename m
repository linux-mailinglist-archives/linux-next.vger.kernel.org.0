Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367D33F2915
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 11:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236483AbhHTJ2D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 05:28:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234754AbhHTJ2C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Aug 2021 05:28:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28CAB60C3E;
        Fri, 20 Aug 2021 09:27:24 +0000 (UTC)
Date:   Fri, 20 Aug 2021 10:27:21 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20210820092721.GA23080@arm.com>
References: <20210819140544.5acbcf21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819140544.5acbcf21@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 19, 2021 at 02:05:44PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   arch/arm64/include/asm/sysreg.h
> 
> between commit:
> 
>   79d82cbcbb3d ("arm64/kexec: Test page size support with new TGRAN range values")
> 
> from the arm64 tree and commit:
> 
>   504c6295b998 ("arm64/mm: Add remaining ID_AA64MMFR0_PARANGE_ macros")
> 
> from the kvm-arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This looks fine. Thanks Stephen.

-- 
Catalin
