Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743C12F752A
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 10:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbhAOJXg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jan 2021 04:23:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:38858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727128AbhAOJXg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Jan 2021 04:23:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1148A2339D;
        Fri, 15 Jan 2021 09:22:54 +0000 (UTC)
Date:   Fri, 15 Jan 2021 09:22:52 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64-fixes
 tree
Message-ID: <20210115092250.GA16707@gaia>
References: <20210115062448.484390ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115062448.484390ab@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 15, 2021 at 06:24:48AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   b5639879902a ("arm64: syscall: include prototype for EL0 SVC functions")
> 
> is missing a Signed-off-by from its author.

Thanks Stephen. Fixed.

-- 
Catalin
