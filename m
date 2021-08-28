Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE053FA441
	for <lists+linux-next@lfdr.de>; Sat, 28 Aug 2021 09:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233382AbhH1H2b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 28 Aug 2021 03:28:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43536 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233348AbhH1H2b (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 28 Aug 2021 03:28:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630135661; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=wqrl8mhhp9XRltqpiFq3Q66knEYEdoXiO60FIxmteRg=; b=rVPA8UgNTWOKFjyMXGXcGSevLAq6w2LBI4LjOJ8nkTEVH/KFRgNWhg1H+nWfxm+QnXHcQPp8
 UA/FRP9+HOOxKEKNhJHngnVPyfFcnvNAkXF7B6S/ZEz5Eg6yXcJnis/9CkwN/tY4CFS4WAsD
 /4WmOTrGQmgydkL78UtBVSXctd0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6129e5666fc2cf7ad9c550ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 28 Aug 2021 07:27:34
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43417C43617; Sat, 28 Aug 2021 07:27:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 555AFC4338F;
        Sat, 28 Aug 2021 07:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 555AFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Greg KH <greg@kroah.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
References: <20210827164904.6b1d1f0e@canb.auug.org.au>
        <YSjkosA6yMrMmaNk@kroah.com> <20210827175852.GB15018@thinkpad>
        <YSk82+XbcRoBf37v@kroah.com>
Date:   Sat, 28 Aug 2021 10:27:27 +0300
In-Reply-To: <YSk82+XbcRoBf37v@kroah.com> (Greg KH's message of "Fri, 27 Aug
        2021 21:28:27 +0200")
Message-ID: <877dg658rk.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Greg KH <greg@kroah.com> writes:

> On Fri, Aug 27, 2021 at 11:28:52PM +0530, Manivannan Sadhasivam wrote:
>> Hi Greg,
>> 
>> On Fri, Aug 27, 2021 at 03:12:02PM +0200, Greg KH wrote:
>> > On Fri, Aug 27, 2021 at 04:49:04PM +1000, Stephen Rothwell wrote:
>> > > Hi all,
>> > > 
>> > > Today's linux-next merge of the char-misc tree got conflicts in:
>> > > 
>> > >   drivers/bus/mhi/core/main.c
>> > >   net/qrtr/mhi.c
>> > > 
>> > > between commit:
>> > > 
>> > >   9ebc2758d0bb ("Revert "net: really fix the build..."")
>> > > 
>> > > from the origin tree and commit:
>> > > 
>> > >   0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
>> > > 
>> > > from the char-misc tree.
>> > > 
>> > > I fixed it up (the commit in Linus' tree is basically a revert of the
>> > > char-misc tree, so I effectively reverted the latter) and can carry the
>> > > fix as necessary. This is now fixed as far as linux-next is concerned,
>> > > but any non trivial conflicts should be mentioned to your upstream
>> > > maintainer when your tree is submitted for merging.  You may also want
>> > > to consider cooperating with the maintainer of the conflicting tree to
>> > > minimise any particularly complex conflicts.
>> > 
>> > Hm, what should I do in my tree here?
>> > 
>> > Kalle, what commit should I make in the char-misc tree now to handle
>> > this issue, and make the merge with Linus's tree "simple"?  Or any other
>> > ideas?
>> > 
>> 
>> For making the merge simpler, I'd suggest we revert below commit in char-misc:
>> 
>> 0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
>
> Reverting that works for me, I've done that in my tree and that allows
> it to be merged cleanly with Linus's tree.

Unfortunately this now breaks the build in char-misc-next (commit
0dc3ad3f859d):

net/qrtr/mhi.c: In function 'qcom_mhi_qrtr_probe':
net/qrtr/mhi.c:105:48: error: 'MHI_CH_INBOUND_ALLOC_BUFS' undeclared (first use in this function)
  105 |         rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
      |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
net/qrtr/mhi.c:105:48: note: each undeclared identifier is reported only once for each function it appears in
net/qrtr/mhi.c:105:14: error: too many arguments to function 'mhi_prepare_for_transfer'
  105 |         rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
      |              ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from net/qrtr/mhi.c:6:
./include/linux/mhi.h:725:5: note: declared here
  725 | int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~

To see this error make sure CONFIG_QRTR and CONFIG_QRTR_MHI are enabled.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
