Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FB11EBB5D
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 14:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFBMPN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 08:15:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47772 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgFBMPM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 08:15:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591100112; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=6aoCLmbhav5CL/lS7P/VV6KjhJoQcYui0Q86IrjJk7c=; b=jUuOXCUiK38oFS9fIdaHtBIzH7HBVyCcHOcp15Zhz4DHXM3WwGkZKVvr3SD4+3Katbzw+k34
 OW2DhRalrrOzui2mHkgSJZdV5xGR9UnoUMmyWyYXim+I/bS3R/Xzyo4uIrY+ALqnEJkpqpoP
 w1eu1RPaHROLXb22htfKXRTUc6k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ed642cd76fccbb4c8a4c15c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Jun 2020 12:15:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65AC9C433CA; Tue,  2 Jun 2020 12:15:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBDBDC433C9;
        Tue,  2 Jun 2020 12:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBDBDC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
        Wright Feng <wright.feng@cypress.com>,
        Chi-hsien Lin <chi-hsien.lin@cypress.com>
Subject: Re: linux-next: build failure after merge of the mmc tree
References: <20200602134402.24c19488@canb.auug.org.au>
Date:   Tue, 02 Jun 2020 15:15:03 +0300
In-Reply-To: <20200602134402.24c19488@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 2 Jun 2020 13:44:02 +1000")
Message-ID: <87a71lll4o.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the mmc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c: In function
> 'brcmf_sdiod_probe':
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c:915:7:
> error: 'SDIO_DEVICE_ID_CYPRESS_4373' undeclared (first use in this
> function); did you mean 'SDIO_DEVICE_ID_BROADCOM_CYPRESS_4373'?
>   915 |  case SDIO_DEVICE_ID_CYPRESS_4373:
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |       SDIO_DEVICE_ID_BROADCOM_CYPRESS_4373
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c:915:7: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   1eb911258805 ("mmc: sdio: Fix Cypress SDIO IDs macros in common include file")
>
> interacting with commit
>
>   2a7621ded321 ("brcmfmac: set F2 blocksize for 4373")
>
> from the net-next tree.
>
> I have applied the following merge fix patch.

Looks good to me, thanks. Ulf, I guess you will notify Linus about the
conflict in your pull request?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
