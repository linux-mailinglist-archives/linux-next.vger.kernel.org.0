Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FC42CECD3
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 12:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbgLDLNN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 06:13:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:56274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbgLDLNN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Dec 2020 06:13:13 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52608227BF;
        Fri,  4 Dec 2020 11:12:32 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kl90o-00Fxre-2h; Fri, 04 Dec 2020 11:12:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Dec 2020 11:12:29 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoffer Dall <cdall@cs.columbia.edu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        David Brazdil <dbrazdil@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
In-Reply-To: <20201204164445.6f0cdfc3@canb.auug.org.au>
References: <20201204164445.6f0cdfc3@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <0ccca763055617d85f0f36d229eee4d1@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, cdall@cs.columbia.edu, catalin.marinas@arm.com, will@kernel.org, dbrazdil@google.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2020-12-04 05:44, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   arch/arm64/kernel/head.S
> 
> between commits:
> 
>   2ffac9e3fdbd ("arm64: head.S: cleanup SCTLR_ELx initialization")
>   d87a8e65b510 ("arm64: head.S: always initialize PSTATE")
> 
> from the arm64 tree and commit:
> 
>   9c322020286c ("arm64: Extract parts of el2_setup into a macro")
> 
> from the kvm-arm tree.
> 
> I have no idea how to fix this up, so I just used the kvm-arm tree from
> next-20201203 instead for today.

Oops, my bad. I was planning to merge Mark's branch in before pushing 
the
whole thing out, and obviously forgot. Apologies for the mess.

I've now rebased David'd series on top of arm64/for-next/uaccess and 
pushed
the result out in the kvmarm/next branch.

Mark, David: I'd appreciate if you could have a look at the rebase 
result,
and let me know if you spot anything that would require fixing.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
