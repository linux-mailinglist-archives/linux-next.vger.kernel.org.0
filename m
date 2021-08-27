Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1FC3F9C5E
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 18:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbhH0Q0F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 12:26:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52628 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234108AbhH0Q0F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Aug 2021 12:26:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630081516; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=iJshbTfn89uxIYVt4Jwk7Wz36RK17S/gIKsiIWm5UAI=; b=hWB36AuYjUDSJAWahsrzR+6ucXYejiM0JZgaduF6c7tMr1c6nNql+J6K6Af2PciwxJyDGV4j
 TBTsqjxUeJqSRbtfxHa20GxZ6tIEQMlOcTa3x1LYXkI4HEy5N/VqREAR91cBHtOijBiCRBsC
 E2BquvGI/Fro58Aj9msCLCmF72g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 612911d8d15f4d68a27675bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 16:24:56
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A541BC43617; Fri, 27 Aug 2021 16:24:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F018C4338F;
        Fri, 27 Aug 2021 16:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5F018C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
References: <20210827164904.6b1d1f0e@canb.auug.org.au>
        <YSjkosA6yMrMmaNk@kroah.com>
Date:   Fri, 27 Aug 2021 19:24:49 +0300
In-Reply-To: <YSjkosA6yMrMmaNk@kroah.com> (Greg KH's message of "Fri, 27 Aug
        2021 15:12:02 +0200")
Message-ID: <87bl5i6ejy.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Greg KH <greg@kroah.com> writes:

> On Fri, Aug 27, 2021 at 04:49:04PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Today's linux-next merge of the char-misc tree got conflicts in:
>> 
>>   drivers/bus/mhi/core/main.c
>>   net/qrtr/mhi.c
>> 
>> between commit:
>> 
>>   9ebc2758d0bb ("Revert "net: really fix the build..."")
>> 
>> from the origin tree and commit:
>> 
>>   0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
>> 
>> from the char-misc tree.
>> 
>> I fixed it up (the commit in Linus' tree is basically a revert of the
>> char-misc tree, so I effectively reverted the latter) and can carry the
>> fix as necessary. This is now fixed as far as linux-next is concerned,
>> but any non trivial conflicts should be mentioned to your upstream
>> maintainer when your tree is submitted for merging.  You may also want
>> to consider cooperating with the maintainer of the conflicting tree to
>> minimise any particularly complex conflicts.
>
> Hm, what should I do in my tree here?
>
> Kalle, what commit should I make in the char-misc tree now to handle
> this issue, and make the merge with Linus's tree "simple"?  Or any other
> ideas?

Good news first, I tested next-20210827 with ath11k (using QCA6390) and
it's working fine. So Stephen solved the conflict correctly, at least
from ath11k point of view. And my suggestion is that Linus should do the
same resolution when merging char-misc-next (after he has merged
net-next).

I'll explain that in detail below. But do note that I'm not familiar
with the MHI subsystem and the MHI folks really should look at this in
detail to make sure no new bugs are introduced! I did the conflict
resolution myself and at least ath11k works after this resolution.

In my test merge I first used Linus' tree as of today as the baseline.
I first merged net-next and it went without conflicts. After that I
merged char-misc-next and got conflicts in two files:

$ git merge char-misc/char-misc-next
Auto-merging net/qrtr/mhi.c
CONFLICT (content): Merge conflict in net/qrtr/mhi.c
Auto-merging include/linux/mhi.h
Auto-merging drivers/bus/mhi/pci_generic.c
Auto-merging drivers/bus/mhi/core/main.c
CONFLICT (content): Merge conflict in drivers/bus/mhi/core/main.c
Auto-merging drivers/bus/mhi/core/internal.h
Auto-merging drivers/bus/fsl-mc/fsl-mc-bus.c
Removing Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.txt
Removing Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
Removing Documentation/devicetree/bindings/misc/ge-achc.txt
Removing Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
Recorded preimage for 'drivers/bus/mhi/core/main.c'
Recorded preimage for 'net/qrtr/mhi.c'
Automatic merge failed; fix conflicts and then commit the result.

Luckily the conflicts are simple:

diff --cc drivers/bus/mhi/core/main.c
index fc9196f11cb7,c01ec2fef02c..000000000000
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@@ -1455,6 -1455,9 +1455,12 @@@ int mhi_prepare_channel(struct mhi_cont
        if (ret)
                goto error_pm_state;
  
++<<<<<<< HEAD
++=======
+       if (mhi_chan->dir == DMA_FROM_DEVICE)
+               mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
+ 
++>>>>>>> char-misc/char-misc-next
        /* Pre-allocate buffer for xfer ring */
        if (mhi_chan->pre_alloc) {
                int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
diff --cc net/qrtr/mhi.c
index fa611678af05,c609cb724c25..000000000000
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@@ -79,7 -84,7 +79,11 @@@ static int qcom_mhi_qrtr_probe(struct m
        int rc;
  
        /* start channels */
++<<<<<<< HEAD
 +      rc = mhi_prepare_for_transfer(mhi_dev);
++=======
+       rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
++>>>>>>> char-misc/char-misc-next
        if (rc)
                return rc;

In both cases just take the first hunk from HEAD and remove the second
hunk from char-misc-next. After the conflict resolution 'git diff'
should show:

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 88dba230f406..b15c5bc37dd4 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1455,9 +1455,6 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
        if (ret)
                goto error_pm_state;
 
-       if (mhi_chan->dir == DMA_FROM_DEVICE)
-               mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
-
        /* Pre-allocate buffer for xfer ring */
        if (mhi_chan->pre_alloc) {
                int nr_el = get_nr_avail_ring_elements(mhi_cntrl,

Greg, does this help? Stephen, do you have any advice how to handle
this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
