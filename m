Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E593140F82F
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 14:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbhIQMpf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Sep 2021 08:45:35 -0400
Received: from foss.arm.com ([217.140.110.172]:52736 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232332AbhIQMpf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Sep 2021 08:45:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3090331B;
        Fri, 17 Sep 2021 05:44:13 -0700 (PDT)
Received: from bogus (unknown [10.57.23.241])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA5653F719;
        Fri, 17 Sep 2021 05:44:11 -0700 (PDT)
Date:   Fri, 17 Sep 2021 13:43:53 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the scmi tree
Message-ID: <20210917124353.d7plkoagiv2pqzo3@bogus>
References: <20210917090954.18071850@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917090954.18071850@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 17, 2021 at 09:09:54AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scmi tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> arch/arm/boot/dts/vexpress-v2m-rs1.dtsi:107.3-49: Warning (ranges_format): /bus@8000000:ranges: "ranges" property has invalid length (20 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)
> 

Thanks for the report, it is now fixed. You must not see this in next
integrated linux-next build.

-- 
Regards,
Sudeep
