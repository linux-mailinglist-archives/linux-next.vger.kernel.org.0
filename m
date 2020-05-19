Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A741D927A
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 10:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgESIuT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 04:50:19 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:51089 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727987AbgESIuS (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 May 2020 04:50:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589878218; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=TV5is+ixJ3k8UBd8dM0S/Km+ajiZwRN756XVColVRwY=; b=ZxuHF3O1j8lXBAUulSjEYgh4l2CiM1S9rKxjdKGstfp1SCuGtZCbCss8sfWEOPXZ1U2LYdND
 JP/4iAwJv9T0y+TtGdmQJo8nFrvVWrIUOGLlJ/ASMJMU41Z8VxwUn5lhu71Rt7CwdRPeffcP
 gJ7k6mzPMH5+RIWEMZ0MMnLM+ts=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ec39dc8aefa5a01ccb75a30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 May 2020 08:50:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 198FCC4478C; Tue, 19 May 2020 08:50:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA502C433F2;
        Tue, 19 May 2020 08:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EA502C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wireless <linux-wireless@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Felix Fietkau <nbd@nbd.name>,
        Soul Huang <Soul.Huang@mediatek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the wireless-drivers-next tree
References: <20200518230120.7b4c6074@canb.auug.org.au>
Date:   Tue, 19 May 2020 11:50:05 +0300
In-Reply-To: <20200518230120.7b4c6074@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 18 May 2020 23:01:20 +1000")
Message-ID: <878shofgw2.fsf@kamboji.qca.qualcomm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> In commit
>
>   f8d6379932dd ("mt76: mt7663: fix the usage WoW with net detect support")
>
> Fixes tag
>
>   Fixes: bd39bd2f00c3 ("mt76: mt7663: introduce WoW with net detect support")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: a72ad451e704 ("mt76: mt7663: introduce WoW with net detect support")

Thanks for the report. I don't think this is bad enough to start
rebasing wireless-drivers-next so I'll leave it as is. But I'll try to
implement some kind of checking of Fixes tags in the future.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
