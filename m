Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81AF219970
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 09:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgGIHJe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 03:09:34 -0400
Received: from foss.arm.com ([217.140.110.172]:38520 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgGIHJe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Jul 2020 03:09:34 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D55551FB;
        Thu,  9 Jul 2020 00:09:33 -0700 (PDT)
Received: from bogus (unknown [10.37.8.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72E753F71E;
        Thu,  9 Jul 2020 00:09:32 -0700 (PDT)
Date:   Thu, 9 Jul 2020 08:09:29 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: linux-next: build warning after merge of the scmi tree
Message-ID: <20200709070929.GE31671@bogus>
References: <20200709095412.051d96ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709095412.051d96ef@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 09, 2020 at 09:54:12AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scmi tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/firmware/arm_scmi/clock.c: In function 'rate_cmp_func':
> drivers/firmware/arm_scmi/clock.c:128:12: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   128 |  u64 *r1 = _r1, *r2 = _r2;
>       |            ^~~
> drivers/firmware/arm_scmi/clock.c:128:23: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   128 |  u64 *r1 = _r1, *r2 = _r2;
>       |                       ^~~
> 
> Introduced by commit
> 
>   f0a2500a2a05 ("firmware: arm_scmi: Keep the discrete clock rates sorted")
> 

Sorry for both the issues, I will update the tree with proper patch.

-- 
Regards,
Sudeep
