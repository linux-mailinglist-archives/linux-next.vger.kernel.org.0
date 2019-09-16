Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7957FB3C23
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 16:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbfIPOFa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 10:05:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728169AbfIPOFa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Sep 2019 10:05:30 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CD172067D;
        Mon, 16 Sep 2019 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568642729;
        bh=pvzXzAzOUN3AfGkTTFGYBzBxwdHiMGRy4EYeWF51Yz4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YmcQ2NLRcrWBYF0hM6OW9vwln79t6I7HtaivS95ykSi1oR+aOj/1Dy9mvyv3eYtaR
         XfyikylXiNMLPUOLbrC9w1ud0yINyjQmfXSLk5LO5coN4JTVYoafd3MmXSBxzkQoE7
         qcRVjipB2XdlSND99Op1irrrAd9Wm28JWSbbV9KI=
Subject: Re: linux-next: manual merge of the kselftest tree with the tpmdd
 tree
To:     Mark Brown <broonie@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Petr Vorel <pvorel@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        shuah <shuah@kernel.org>
References: <20190916014535.GU4352@sirena.co.uk>
 <CADYN=9JntrniMnmEMd9igVSovEQjLV9q006cCATLHWrtBhWWHQ@mail.gmail.com>
 <20190916134203.GG4352@sirena.co.uk>
From:   shuah <shuah@kernel.org>
Message-ID: <bcade47f-b7cd-9be5-e443-e4eb90da6b3a@kernel.org>
Date:   Mon, 16 Sep 2019 08:05:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916134203.GG4352@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/16/19 7:42 AM, Mark Brown wrote:
> On Mon, Sep 16, 2019 at 03:16:54PM +0200, Anders Roxell wrote:
> 
>> If I re-read the Documentation/dev-tools/kselftest.rst
>> I think the patch from the kselftest tree should be dropped.
> 
>> I saw that I didn't send an email to the tpm maintainers or the tpm
>> list when I sent the
>> patch, I'm sorry.
> 
> If the change is fine that might be more trouble than it's worth, it's a
> trivial add/add conflict.  Up to those concerned though.
> 


I usually handle these with sending a note to Linus in my pull request
and request him to pick the one from next. Dropping patch doesn't work
very well.

No worries I will handle this in my pull request.

thanks,
-- Shuah
