Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2863924E615
	for <lists+linux-next@lfdr.de>; Sat, 22 Aug 2020 09:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgHVH3L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 22 Aug 2020 03:29:11 -0400
Received: from elvis.franken.de ([193.175.24.41]:56090 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgHVH3L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 22 Aug 2020 03:29:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k9Nxc-0001FX-00; Sat, 22 Aug 2020 09:29:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 93687C0D90; Sat, 22 Aug 2020 09:25:10 +0200 (CEST)
Date:   Sat, 22 Aug 2020 09:25:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the mips-fixes
 tree
Message-ID: <20200822072510.GA4657@alpha.franken.de>
References: <20200822101706.6cb19f1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822101706.6cb19f1f@canb.auug.org.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Aug 22, 2020 at 10:17:06AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1697ee6e540a ("Revert "MIPS: op_model_mipsxx: Fix non-executable code bug"")
> 
> is missing a Signed-off-by from its author and committer.
> 
> Reverts are commits too.

d'oh, it's fixed now.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
