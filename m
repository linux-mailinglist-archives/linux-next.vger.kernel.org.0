Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B1712E58E
	for <lists+linux-next@lfdr.de>; Thu,  2 Jan 2020 12:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgABLPO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jan 2020 06:15:14 -0500
Received: from foss.arm.com ([217.140.110.172]:46458 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgABLPO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Jan 2020 06:15:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8226731B;
        Thu,  2 Jan 2020 03:15:13 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D361B3F703;
        Thu,  2 Jan 2020 03:15:12 -0800 (PST)
Date:   Thu, 2 Jan 2020 11:15:10 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the scmi tree
Message-ID: <20200102111510.GB4864@bogus>
References: <20200101173801.2e9a1758@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101173801.2e9a1758@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 01, 2020 at 05:38:01PM +1100, Stephen Rothwell wrote:
> Hi all,
>
> Commits
>
>   75ee475c4018 ("drivers: firmware: scmi: Extend SCMI transport layer by trace events")
>   60542ecbce11 ("include: trace: Add SCMI header with trace events")

Thanks for the report, I noticed this before I sent PR to ARM SoC but
forgot to update for-linux-next branch, now fixed.

--
Regards,
Sudeep
