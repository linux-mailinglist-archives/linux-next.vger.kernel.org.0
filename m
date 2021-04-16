Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDB6361D5D
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 12:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbhDPJtb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 05:49:31 -0400
Received: from foss.arm.com ([217.140.110.172]:37536 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232022AbhDPJta (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Apr 2021 05:49:30 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26B1E12FC;
        Fri, 16 Apr 2021 02:49:06 -0700 (PDT)
Received: from bogus (unknown [10.57.52.142])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8725C3FA35;
        Fri, 16 Apr 2021 02:49:05 -0700 (PDT)
Date:   Fri, 16 Apr 2021 10:49:03 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error trying to fetch the scmi tree
Message-ID: <20210416094903.naf2uqknkk3bkqqr@bogus>
References: <20210416090341.25d9fca6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416090341.25d9fca6@canb.auug.org.au>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Fri, Apr 16, 2021 at 09:03:41AM +1000, Stephen Rothwell wrote:
> Hi all,
>
> Fetching the scmi tree produces this error:
>
> fatal: couldn't find remote ref refs/heads/for-linux-next
>

Thanks for letting me know. No idea how, but I have messed up and managed
to push it as tag and also deleted the branch. It must be fixed now.

> I will use the scmi tree from next-20210415 for today.
>

Thanks.

--
Regards,
Sudeep
