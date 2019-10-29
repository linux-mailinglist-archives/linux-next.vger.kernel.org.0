Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202A0E92EB
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 23:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfJ2WOB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 18:14:01 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:55014 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfJ2WOB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 18:14:01 -0400
Received: from cust-east-parth2-46-193-72-114.wb.wifirst.net (46.193.72.114) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id f51bf1077fadacd6; Tue, 29 Oct 2019 23:13:57 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yin Fengwei <fengwei.yin@intel.com>
Subject: Re: linux-next: manual merge of the vhost tree with the pm tree
Date:   Tue, 29 Oct 2019 23:13:57 +0100
Message-ID: <2535052.Q9mzRWFaI7@kreacher>
In-Reply-To: <20191029151928.780c8ede@canb.auug.org.au>
References: <20191029151928.780c8ede@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tuesday, October 29, 2019 5:19:28 AM CET Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vhost tree got a conflict in:
> 
>   drivers/acpi/processor_idle.c
> 
> between commit:
> 
>   fa583f71a99c ("ACPI: processor_idle: Skip dummy wait if kernel is in guest")
> 
> from the pm tree and commit:
> 
>   a04c0533b07c ("ACPI: disable extra P_LVLx access on KVM")

Well, if this touches code under drivers/acpi/, it should have been CCed to
linux-acpi@vger.kernel.org, but I don't recall seeing it.

> from the vhost tree.
> 
> I fixed it up (I just used the pm tree version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> 




