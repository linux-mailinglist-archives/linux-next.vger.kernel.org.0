Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFFB3245EF
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 22:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbhBXVqB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 16:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhBXVqA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 16:46:00 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CEBC06174A;
        Wed, 24 Feb 2021 13:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=f5MvGQ9h7v+gu1XhkqDkVeiKkmQMplOoeaeo3utQaM8=; b=ABWEpq8WCXN8DH7SYCdLFXejje
        xA9PZMvwyVMQbNrvUmpQjXXofyLb6Em5oVZPvRLc7IJsJw1Fa6e0qTtoKO7q3mqc3FzR6GL7Wezf9
        EmTGsh9OFtLYuORJQJLm/IEuJRjtZWv6pgqD+wtdBXAPXxkHaQCmE1x+jBD5TEH5+7o2TM8aYSo9h
        1L2wC33TOvrY6ySOJ5oo2Rg+tJt5bPbfbtX3ggFwCCzHk4pixZgiLf+5nPHy2eQ1+BU9yBwdRXDkV
        8Tp8stAL+oCR7EnfFWcR2Cb2XNS9ZGXTCqomxz+146dnU3BJ/fucC/hg8R5nQAJq8AyBSNvUOfS9x
        4RfNjLbw==;
Received: from [2601:1c0:6280:3f0::d05b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lF1y8-0001l4-PN; Wed, 24 Feb 2021 21:45:17 +0000
Subject: Re: linux-next: build warning after merge of the block tree
To:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
 <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224163320.2d8d810b@canb.auug.org.au>
 <BYAPR04MB49657DFD56D260A9D58F9E9A869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224214254.1e5e35f4@canb.auug.org.au>
 <BYAPR04MB49653C5807D8EF047E3DED10869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6985bb92-88cf-8e1f-97a6-c42caa3b63af@infradead.org>
Date:   Wed, 24 Feb 2021 13:45:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB49653C5807D8EF047E3DED10869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/24/21 1:41 PM, Chaitanya Kulkarni wrote:
> On 2/24/21 02:43, Stephen Rothwell wrote:
>>> I'll setup doc generation using sphinx on my machine, is there
>>> a particular command line that you have used for these warnings ?
>> I just do a "make htmldocs"
> I did that, please have a look at the test log.
> 

Hi,

Where is the test log?

-- 
~Randy

