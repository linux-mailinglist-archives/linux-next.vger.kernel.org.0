Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F812200143
	for <lists+linux-next@lfdr.de>; Fri, 19 Jun 2020 06:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgFSEdY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Jun 2020 00:33:24 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:58094 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728855AbgFSEdW (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Jun 2020 00:33:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592541202; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xL8WRZW5X1FjpBOjpJn9kEbJZJS8WhjJ0iTqxhL7V7A=; b=r6DEtPGblJmzWkCHRBnKgTNvZw/B1vQ7CJh7li70Z3A+JZDo82veQhP4gv0FeSeirnTcEqx8
 t9lMy47n1VW323ZMd657Y7P/PlFsPBU+lA+su26VdZ0OuaeGKaHvo8MEiU0BA0IlVe8RLrut
 871SsMpCHO25EMncmJz5OyWcXz8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5eec4006e144dd5115a8f501 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Jun 2020 04:33:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10506C433C8; Fri, 19 Jun 2020 04:33:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [49.207.137.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7538CC433CA;
        Fri, 19 Jun 2020 04:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7538CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200616211214.7cc1f1a6@canb.auug.org.au>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <9fdfd0fc-5bc9-1e7d-3955-a95535b32995@codeaurora.org>
Date:   Fri, 19 Jun 2020 10:03:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616211214.7cc1f1a6@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Linus,

I just sent version2 of this patch with correct fixes tag. please pick 
it up.

Thanks,

Siva

On 6/16/2020 4:42 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>    912f25eca000 ("pinctrl: qcom: ipq6018 Add missing pins in qpic pin group")
>
> Fixes tag
>
>    Fixes: ef1ea54 (pinctrl: qcom: Add ipq6018 pinctrl driver)
>
> has these problem(s):
>
>    - SHA1 should be at least 12 digits long
>      Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>      or later) just making sure it is not set (or set to "auto").
>
