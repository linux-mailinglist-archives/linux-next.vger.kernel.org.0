Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D366247E9B
	for <lists+linux-next@lfdr.de>; Tue, 18 Aug 2020 08:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHRGqZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 02:46:25 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:19043 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726616AbgHRGqY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Aug 2020 02:46:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597733184; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LCwYY7J5nzK2HScV8TXx1KsJyzo6BdO8RWIyTWsbD0E=;
 b=lK53Runyu5iZx1b+cxEUJ1rfmoask/yLBbUiP1jVcmOVJfgs7cWSZanFp1RglWfhEfwPHLbU
 NH2rvD6U1ozVdisze6z6x1BLRNo3z8sqVpt6gZjhtF1Q4Vfn+wO5p0tiZWJdqsJB7W5C+PvV
 LFukL6mLnVyj35MO47q795n91nc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f3b792a668ab3fef6e40e78 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 06:46:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8B0BC433C6; Tue, 18 Aug 2020 06:46:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93314C433CA;
        Tue, 18 Aug 2020 06:46:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 18 Aug 2020 14:46:01 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-mkp tree
In-Reply-To: <20200818161121.77559bee@canb.auug.org.au>
References: <20200818161121.77559bee@canb.auug.org.au>
Message-ID: <1ac7e6465cb70a74866cd5f5595af29e@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2020-08-18 14:11, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   35afe60929ab ("scsi: ufs: Properly release resources if a task is
> aborted successfully")
> 
> Fixes tag
> 
>   Fixes: 5a0b0cb9bee7 ("ufs: Add support for clock gating")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> Did you mean
> 
> Fixes: 5a0b0cb9bee7 ("[SCSI] ufs: Add support for sending NOP OUT 
> UPIU")
> 
> or
> 
> Fixes: 1ab27c9cf8b6 ("ufs: Add support for clock gating")

Thanks for pointing it out, it should be below one, something
might go wrong with my copy-paste.

Fixes: 1ab27c9cf8b6 ("ufs: Add support for clock gating")

Regards,

Can Guo.
