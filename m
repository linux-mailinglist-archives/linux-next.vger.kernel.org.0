Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE192B5912
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 06:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgKQFVq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 00:21:46 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:7647 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgKQFVp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2020 00:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1605590505; x=1637126505;
  h=from:to:cc:references:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=vHpNoShI7LbC3muKG5w8nt5MVX3+Fnn0Z+E1/h5TXO8=;
  b=EupYrJrv7p7eTxZlJqf+EjiRA7+7THf3IZvYa9HOdkXyn0v81x7DmKli
   yaPzJFirDUPo5qfixbHersh+F6NKvHGn850ChbiXnBaxct0tyW+x4ble+
   DOas4iHlTowVgoIbxThdYCgjZBqRlrtcRixEGHje1vaqqeEObg1y0YrA3
   I=;
X-IronPort-AV: E=Sophos;i="5.77,484,1596499200"; 
   d="scan'208";a="94769631"
Subject: Re: linux-next: build warning after merge of the tip tree
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1e-42f764a0.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 17 Nov 2020 05:21:38 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-1e-42f764a0.us-east-1.amazon.com (Postfix) with ESMTPS id ECF44B2C30;
        Tue, 17 Nov 2020 05:21:35 +0000 (UTC)
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 17 Nov 2020 05:21:35 +0000
Received: from uc18d6cc16d755e.ant.amazon.com (10.43.161.237) by
 EX13d01UWB002.ant.amazon.com (10.43.161.136) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 17 Nov 2020 05:21:33 +0000
From:   Balbir Singh <sblbir@amazon.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
References: <20201028142300.34ed89b1@canb.auug.org.au>
 <4614a858-3719-f8c0-3543-faab3524b8b8@amazon.com>
Message-ID: <7590a38a-12f1-3648-f5c0-6bc9773e7a9a@amazon.com>
Date:   Tue, 17 Nov 2020 16:21:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4614a858-3719-f8c0-3543-faab3524b8b8@amazon.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D49UWC003.ant.amazon.com (10.43.162.10) To
 EX13d01UWB002.ant.amazon.com (10.43.161.136)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 11/16/20 9:23 AM, Balbir Singh wrote:
> 
> 
> On 10/28/20 2:23 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the tip tree, today's linux-next build (htmldocs) produced
>> this warning:
>>
>> Documentation/admin-guide/hw-vuln/l1d_flush.rst:25: WARNING: undefined label: documentation/userspace-api/spec_ctrl.rst (if the link has no caption the label must precede a section header)
>>
>> Introduced by commit
>>
>>   767d46ab566d ("Documentation: Add L1D flushing Documentation")
>>
> 
> Looking at it thanks, I am no expert with sphinx, but it seems like I need angular braces around the link
> 
> Balbir Singh.
> 

I am testing a fix by pointing the ref to a label, will send it out (hopefully soon), seems to work at my end.

Balbir Singh.
