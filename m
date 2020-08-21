Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A92424D85C
	for <lists+linux-next@lfdr.de>; Fri, 21 Aug 2020 17:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgHUPSr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Aug 2020 11:18:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:23078 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728138AbgHUPSp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Aug 2020 11:18:45 -0400
IronPort-SDR: fP8f1ggq03EuJug80Y3VbE6v7kz4FNNqrjPwvjF6r4XK0XI8CUsJlt2CbLssY7+OIKqMKRe1sR
 ckkiSKG9Q1/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="143189859"
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="143189859"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 08:18:44 -0700
IronPort-SDR: FJIys1zxUr3lpFWnV+S5O1Rp2UPO2bWnG7U26JT7b1MQ3tcSzM51ZPJ7d9nYmMV0TwTaq3MqvO
 VaSd+7S8e6Iw==
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="442377824"
Received: from pcmiller-mobl1.amr.corp.intel.com (HELO [10.209.120.121]) ([10.209.120.121])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 08:18:43 -0700
Subject: Re: linux-next: build warnings after merge of the sound-asoc-fixes
 tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bard liao <yung-chuan.liao@linux.intel.com>
References: <20200821093901.4257afdc@canb.auug.org.au>
 <a8b47ba9-7b45-bef1-08a2-820fe48c4cc4@linux.intel.com>
 <20200821110117.GC4870@sirena.org.uk>
 <a982589b-9bc1-6439-99de-3ce6efdab469@linux.intel.com>
 <20200821144801.GI4870@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dc0c73f8-9218-9725-2eed-17c874d39d5f@linux.intel.com>
Date:   Fri, 21 Aug 2020 10:18:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821144801.GI4870@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 8/21/20 9:48 AM, Mark Brown wrote:
> On Fri, Aug 21, 2020 at 09:25:53AM -0500, Pierre-Louis Bossart wrote:
>> On 8/21/20 6:01 AM, Mark Brown wrote:
> 
>>> A patch which was not sent as part of the same series and where no
>>> dependency was mentioned :(
> 
>> yes, sorry about that, i just noticed the two patches were sent one after
>> the other but without the dependency.
>> Do you have a means to fix this on your side or do you need Bard/I to resend
>> it?
> 
> I've just moved the patch to for-5.10, it seemed like the functionality
> is only half there in Linus' tree anyway and it's a bit late to be
> enabling new stuff for 5.9.

That's fine, thanks Mark.
