Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34D9797586
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 11:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfHUJC5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 05:02:57 -0400
Received: from foss.arm.com ([217.140.110.172]:54808 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfHUJC5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 05:02:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA5E337;
        Wed, 21 Aug 2019 02:02:56 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1BF13F246;
        Wed, 21 Aug 2019 02:02:55 -0700 (PDT)
Date:   Wed, 21 Aug 2019 10:02:49 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Haiyang Zhang <haiyangz@microsoft.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20190821090249.GA28112@e121166-lin.cambridge.arm.com>
References: <20190821071939.11382b44@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821071939.11382b44@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 21, 2019 at 07:19:39AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   c4a29fbba415 ("PCI: hv: Use bytes 4 and 5 from instance ID as the PCI domain numbers")
> 
> is missing a Signed-off-by from its committer.
> 
> Also, all the tags should be kept together, please.

Fixed it up in my pci/hv branch, apologies.

Lorenzo
