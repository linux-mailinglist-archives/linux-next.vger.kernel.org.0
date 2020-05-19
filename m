Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F731D9293
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 10:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgESIwq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 04:52:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37683 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726466AbgESIwq (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 May 2020 04:52:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589878365; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Z/E0ZmgxBQcE9X4XQLy1um81tXBq5a1MLjRGgd52grY=; b=XGFMKMtjMH1lGJBX7ZC/23vDF+rZhA5vu18z+7Okhn06qmjXjUwI9HXW5pw2J4gAw6ZJAHOh
 yCrNGX0e/lY/yBp5LirdipUUpjO5lfKoRE8mQ04fOxcue5W/d+QNZfTG8tGn6E8YZz84hoyG
 zvjW+EVbLZz3cx/kWBGFWRx25YQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ec39e5661db07dc42de97b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 May 2020 08:52:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29AF5C432C2; Tue, 19 May 2020 08:52:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 65DC9C433D2;
        Tue, 19 May 2020 08:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 65DC9C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wireless <linux-wireless@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felix Fietkau <nbd@nbd.name>
Subject: Re: linux-next: Signed-off-by missing for commit in the wireless-drivers-next tree
References: <20200518230311.08df60cc@canb.auug.org.au>
Date:   Tue, 19 May 2020 11:52:32 +0300
In-Reply-To: <20200518230311.08df60cc@canb.auug.org.au> (Stephen Rothwell's
        message of "Mon, 18 May 2020 23:03:11 +1000")
Message-ID: <874kscfgrz.fsf@kamboji.qca.qualcomm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Commits
>
>   89829c9e65ab ("mt76: mt7663: fix DMA unmap length")
>   c0f8055b3986 ("mt76: mt7622: fix DMA unmap length")
>
> are missing a Signed-off-by from their committer.

Darn, missed that. It's quite difficult to fix this one (there's a
signed tag etc) so I'll leave it be. But I definitely need to add some
automatic checking also for s-o-b.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
