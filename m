Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6471D7087
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 07:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgERFyg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 01:54:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:30951 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgERFyg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 01:54:36 -0400
IronPort-SDR: dtH13p3NVYAhuj2dYUIND2xANb5a0hb8SIl+nCt3NAZKcr4B/+6XDu9OhXSOeuQoxdPKEkU8lP
 EqpPHAL66VlQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2020 22:54:35 -0700
IronPort-SDR: ejyi4xJ0RNdgmh84jww5CqsEMq5fUCfoxTz3lNpMxC1Z+wSMv8Lxxx0+cNAnfwotYb8g5GBUNn
 lH9LD2vjHavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; 
   d="scan'208";a="263843818"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
  by orsmga003.jf.intel.com with ESMTP; 17 May 2020 22:54:32 -0700
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
To:     paulmck@kernel.org, Qian Cai <cai@lca.pw>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>, philip.li@intel.com,
        lkp@intel.com, fengguang.wu@intel.com
References: <20200514181305.GT2869@paulmck-ThinkPad-P72>
 <CA610F47-290E-4826-B1D9-7CE09D7CEA6D@lca.pw>
 <20200517214716.GT2869@paulmck-ThinkPad-P72>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <659206f4-d326-4fd6-3091-085c7eabf280@intel.com>
Date:   Mon, 18 May 2020 13:54:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200517214716.GT2869@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 5/18/20 5:47 AM, Paul E. McKenney wrote:
> On Fri, May 15, 2020 at 02:36:26PM -0400, Qian Cai wrote:
>>
>>> On May 14, 2020, at 2:13 PM, Paul E. McKenney <paulmck@kernel.org> wrote:
>>>
>>> Fair enough!  And yes, the Linux kernel is quite large, so I certainly am
>>> not asking you to test the whole thing yourself.
>> Ok, I saw 0day bot also started to report those which is good. For example,
>>
>> lkml.org/lkml/2020/5/12/1358
>>
>> which so far is nit blocking 0day on linux-next since it does not use panic_on_warn yet (while syzbot does).
>>
>> Thus, I am more convinced that we should not revert the commit just for syzbot until someone could also convince 0day to select RCU_EXPERT and then DEBUG_RCU_LIST?
> Let's ask the 0day people, now CCed, if they would be willing to
> build with CONFIG_RCU_EXPERT=y and CONFIG_DEBUG_RCU_LIST=y on some
> fraction of their testing.  ;-)
>
> 							Thanx, Paul

Hi,

Thanks for your advice, we'll support it in the near future.

Best Regards,
Rong Chen
