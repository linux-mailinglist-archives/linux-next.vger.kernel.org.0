Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80447100B5E
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 19:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfKRSTT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 13:19:19 -0500
Received: from mga02.intel.com ([134.134.136.20]:54651 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbfKRSTS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 13:19:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 10:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; 
   d="scan'208";a="407480031"
Received: from asimomai-mobl1.amr.corp.intel.com (HELO [10.251.156.191]) ([10.251.156.191])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2019 10:19:17 -0800
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191113081035.7e7f9bc2@canb.auug.org.au>
 <20191115093410.4a7938f5@canb.auug.org.au>
 <20191118155852.GG9761@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a0e6089b-b5a3-f9e3-fc2c-5b433553e154@linux.intel.com>
Date:   Mon, 18 Nov 2019 10:47:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191118155852.GG9761@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 11/18/19 9:58 AM, Mark Brown wrote:
> On Fri, Nov 15, 2019 at 09:34:10AM +1100, Stephen Rothwell wrote:
>> On Wed, 13 Nov 2019 08:10:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>>> Caused by commit
> 
>>>    1d3e9077307f ("ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary names.")
> 
>>> I have reverted that commit for today.
> 
>> I am still reverting that commit.
> 
> I've reverted the commit, I was a bit disappointed that none of the
> Intel people responded but I see you didn't CC Pierre who sent the
> commit so he won't have seen your report - I missed that due to the CC
> to Liam who was also in the chain.

Sorry about that, the use of 'Fix' in the commit message might have 
misled Mark.
If you CC: me and also CC: alsa-devel you should get an answer without 
delay. I only noticed the issue this morning with kbuild reports.
